# Template — Contract

Dùng template này ở bước 4 (CONTRACT) sau khi Blueprint đã APPROVED. Contract là cam kết cuối cùng trước khi build.

---

```markdown
# 📜 CONTRACT: [Tên dự án]

## ✅ DELIVERABLES (chốt cuối)

| # | Item | Chi tiết | Ước lượng effort |
|---|---|---|---|
| 1 | [Main deliverable] | [Bullet 1, Bullet 2, Bullet 3] | [S / M / L] |
| 2 | [Secondary] | [...] | [...] |
| ... | ... | ... | ... |

## 🛠️ TECH STACK (đã chốt)

- **Framework:** [Next.js 14 với App Router]
- **Styling:** [Tailwind CSS + shadcn/ui]
- **Database:** [Supabase Postgres + Row Level Security]
- **Auth:** [Supabase Auth, email + Google OAuth]
- **Hosting:** [Vercel free tier]
- **Domain:** [User tự cấu hình DNS sau khi deploy]

## 📐 STRUCTURE (đã chốt)

[Tóm tắt 5-10 dòng về site map + main layout đã APPROVED]

## 🎨 DESIGN SYSTEM (đã chốt)

- Colors: Primary `#______`, Accent `#______`
- Typography: [Font headings] + [Font body]
- Animations: [Subtle / Bold / None]

## ⚠️ KHÔNG BAO GỒM

- [Item ngoài scope, copy từ Blueprint]
- [...]

## 🔒 IMMUTABLE AFTER CONFIRM

Sau khi reply "CONFIRM", không đổi:
- ❌ Tech stack
- ❌ Layout chính / site map
- ❌ Số lượng pages / features chính

Có thể đổi (ở bước REFINE):
- ✅ Text/copy nội dung
- ✅ Màu sắc nhỏ (vd: shade khác cùng family)
- ✅ Microcopy (button text, error messages)
- ✅ Thêm/bớt items trong section có sẵn

## ✅ CONFIRM

Reply **"CONFIRM"** để nhận CODER PACK và bắt đầu build.

Nếu vẫn cần điều chỉnh, ghi rõ điểm nào và quay lại Blueprint.
```

---

## Lưu ý khi soạn Contract

- **Contract ngắn gọn hơn Blueprint** — đây không phải repeat Blueprint, mà là tóm lại điểm chốt cuối cùng. Khoảng 30-50% độ dài Blueprint.
- **"Immutable after Confirm" là phần quan trọng nhất** — đảm bảo user hiểu rõ điểm nào không thể thay đổi sau khi confirm. Đây là cách bảo vệ cả 2 bên khỏi scope creep.
- **Effort estimate (S/M/L)** giúp user hình dung deliverable nào nặng — không cần ước time cụ thể vì context khác nhau, nhưng ranking giúp prioritize.
- **Domain/SSL/hosting setup** thường nằm ngoài scope của AI build — note rõ user phải tự làm phần đó.
