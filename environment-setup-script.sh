#!/usr/bin/env bash
# ╔══════════════════════════════════════════════════════════════════════════╗
# ║  DÁN TOÀN BỘ NỘI DUNG NÀY VÀO "Setup script" CỦA ENVIRONMENT (web UI).     ║
# ║  Và đặt Environment variable:  CLAUDE_SKILLS_REPO=<url kho skills của bạn> ║
# ╚══════════════════════════════════════════════════════════════════════════╝
#
# Vì sao thiết kế thế này:
#   • Setup script bị CACHE (chỉ chạy lại khi đổi script / ~7 ngày) → KHÔNG hợp
#     để "pull mỗi session". Nên ở đây nó chỉ CÀI MỘT LẦN: (1) script pull và
#     (2) đăng ký SessionStart hook ở ~/.claude/settings.json (settings CÁ NHÂN).
#   • SessionStart hook cá nhân chạy MỖI session, MỌI repo trong environment này
#     → pull skills MỚI NHẤT mỗi lần. Vừa cross-repo (cấp environment) vừa fresh.
set -uo pipefail
mkdir -p "$HOME/.claude/hooks"

# 1) Script pull — chạy mỗi SessionStart, luôn clone bản mới nhất.
cat > "$HOME/.claude/hooks/pull-skills.sh" <<'SH'
#!/usr/bin/env bash
set -uo pipefail
REPO="${CLAUDE_SKILLS_REPO:-}"; [ -z "$REPO" ] && exit 0
DEST="$HOME/.claude/skills"; mkdir -p "$DEST"
PROJ="${CLAUDE_PROJECT_DIR:-$PWD}/.claude/skills"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
git clone --depth 1 ${CLAUDE_SKILLS_BRANCH:+--branch "$CLAUDE_SKILLS_BRANCH"} "$REPO" "$tmp" 2>/dev/null \
  || { echo "[skills] không pull được kho ($REPO) → bỏ qua, session vẫn chạy"; exit 0; }
src="$tmp/skills"; [ -d "$src" ] || src="$tmp"
n=0
for d in "$src"/*/; do
  [ -f "${d}SKILL.md" ] || continue
  name="$(basename "$d")"
  [ -d "$PROJ/$name" ] && continue          # project skill cùng tên THẮNG (chống trùng)
  rm -rf "$DEST/$name"; cp -a "$d" "$DEST/$name"; n=$((n+1))
done
echo "[skills] đã đồng bộ $n skill vào $DEST"
SH
chmod +x "$HOME/.claude/hooks/pull-skills.sh"

# 2) Đăng ký SessionStart hook ở settings CÁ NHÂN (~/.claude/settings.json)
#    → áp dụng cho MỌI repo mở trong environment này (không cần commit vào từng repo).
python3 - <<'PY'
import json, os
p = os.path.expanduser("~/.claude/settings.json")
d = json.load(open(p)) if os.path.exists(p) else {}
arr = d.setdefault("hooks", {}).setdefault("SessionStart", [])
cmd = "$HOME/.claude/hooks/pull-skills.sh"
if not any(h.get("command") == cmd for e in arr for h in e.get("hooks", [])):
    arr.append({"hooks": [{"type": "command", "command": cmd}]})
json.dump(d, open(p, "w"), indent=2)
print("[skills] đã đăng ký SessionStart hook cá nhân")
PY

# 3) Pull ngay cho session đầu tiên (các session sau do hook lo).
"$HOME/.claude/hooks/pull-skills.sh" || true
