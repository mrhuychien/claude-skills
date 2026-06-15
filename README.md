# claude-skills — kho skills cá nhân (auto-sync vào Claude Code on the web)

Kho trung tâm chứa skills dùng chung mọi dự án. Vòng đời:

```
        ┌──────────────────────── VÒNG LẶP ────────────────────────┐
        │                                                           │
  (làm việc trong session)                                          │
        │  Claude tổng hợp/cập nhật 1 skill                         │
        ▼                                                           │
  scripts/publish-skill.sh  ──push──►  GitHub: kho claude-skills    │
                                              │                      │
                                              │ (start session mới)  │
                                              ▼                      │
  Environment setup script đã cài SessionStart hook cá nhân         │
  → mỗi session tự `git clone` kho này → copy vào ~/.claude/skills  │
        │                                                           │
        └────────────► skills sẵn sàng ở session kế tiếp ───────────┘
```

## Cấu trúc
```
claude-skills/
  skills/<tên-skill>/SKILL.md      # mỗi skill 1 thư mục (có thể kèm references/)
  scripts/publish-skill.sh         # WRITE: đẩy 1 skill lên kho
  environment-setup-script.sh      # READ: dán vào "Setup script" của environment
  README.md
```

## Cài 1 lần (READ path)
1. Tạo repo này trên GitHub (vd `me/claude-skills`), push nội dung lên.
2. Environment (web) → **Environment variables**: `CLAUDE_SKILLS_REPO=https://github.com/me/claude-skills.git`
   (tuỳ chọn `CLAUDE_SKILLS_BRANCH`).
3. Environment → **Setup script**: dán toàn bộ `environment-setup-script.sh`.
→ Từ đó MỌI session mới (mọi repo) trên environment này tự pull skills mới nhất.

## Cập nhật skills (WRITE path)
Trong bất kỳ session nào, sau khi soạn/sửa skill (ví dụ ở `~/.claude/skills/<tên>`):
```bash
scripts/publish-skill.sh ~/.claude/skills/<tên> "mô tả thay đổi"
```
Hoặc chỉ cần nói với Claude: *"Tổng hợp kinh nghiệm session này thành skill `<tên>` rồi đẩy lên kho skills."*

## Vì sao tách READ thành "setup script cài hook" thay vì pull trực tiếp trong setup script?
Setup script bị **cache** (không chạy lại mỗi session) → nếu pull ngay trong đó, skills sẽ
**cũ** tới khi cache rebuild (~7 ngày). Nên setup script chỉ **cài** một SessionStart hook
cá nhân; hook đó chạy **mỗi session** và clone bản **mới nhất**. Vừa cấp-environment
(cross-repo) vừa luôn fresh.

## Quy ước skill
- Thư mục = tên skill (lowercase, gạch nối). `SKILL.md` có frontmatter `name` + `description`.
- `description` viết rõ "Use when… Triggers… Do NOT use…" để Claude tự kích hoạt đúng lúc.
- Cập nhật = ghi đè cùng thư mục; lịch sử do git giữ.
- Project skill (`.claude/skills/` trong repo đang mở) **cùng tên sẽ thắng** bản cá nhân.
