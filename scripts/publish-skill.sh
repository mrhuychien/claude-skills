#!/usr/bin/env bash
# Đẩy/cập nhật MỘT skill lên kho trung tâm (CLAUDE_SKILLS_REPO) — "write path".
#
# Dùng:
#   scripts/publish-skill.sh <thư-mục-skill> ["commit message"]
# Ví dụ (sau khi bạn/Claude vừa soạn skill trong session):
#   CLAUDE_SKILLS_REPO=https://github.com/me/claude-skills.git \
#   scripts/publish-skill.sh ~/.claude/skills/frappe-portal-spa "bổ sung note cache"
#
# Auth: session cloud dùng credential của tài khoản GitHub đã kết nối, account-scoped
# → push được sang kho skills (miễn tài khoản có quyền write). Không cần token riêng.
set -euo pipefail
SRC="${1:?cần đường dẫn thư mục skill (chứa SKILL.md)}"
[ -f "$SRC/SKILL.md" ] || { echo "✗ Không thấy SKILL.md trong: $SRC"; exit 1; }
REPO="${CLAUDE_SKILLS_REPO:?✗ đặt biến môi trường CLAUDE_SKILLS_REPO trước}"
name="$(basename "$SRC")"
MSG="${2:-skills: update ${name}}"

tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
git clone --depth 1 ${CLAUDE_SKILLS_BRANCH:+--branch "$CLAUDE_SKILLS_BRANCH"} "$REPO" "$tmp"
rm -rf "$tmp/skills/$name"; mkdir -p "$tmp/skills/$name"
cp -a "$SRC"/. "$tmp/skills/$name"/     # thay nguyên thư mục → bỏ file rác cũ
cd "$tmp"
git add -A
git diff --cached --quiet && { echo "• Không có thay đổi để đẩy."; exit 0; }
git commit -m "$MSG"
git push origin HEAD
echo "✅ Đã đẩy skill '$name' lên $REPO"
