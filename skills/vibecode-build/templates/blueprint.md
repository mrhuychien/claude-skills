# Template — Blueprint

Dùng template này ở bước 3-4 (BLUEPRINT). Fill đầy đủ rồi chờ user APPROVED trước khi sang Contract.

---

```markdown
# 📘 BLUEPRINT: [Tên dự án]
## [Loại Project] — Vibecode Kit V5.0

---

### 📋 PROJECT INFO

| Field | Value |
|---|---|
| Dự án | [Tên] |
| Loại | [Landing / SaaS / Dashboard / Blog / Docs / Portfolio] |
| Ngày | [DD/MM/YYYY] |
| Phiên bản | v1.0 |

---

### 🎯 MỤC TIÊU

- **Primary Goal:** [Mục tiêu kinh doanh chính — ví dụ "Thu 100 leads/tháng từ Facebook ads"]
- **Target Audience:** [Mô tả 2-3 dòng — tuổi, nghề, pain point chính]
- **Key Message:** [1 câu duy nhất — value proposition]

---

### 📐 STRUCTURE

#### Site map / Page list

```
/                    — [Landing / Home page]
/about               — [Nếu có]
/[other pages]       — [...]
/login               — [Nếu là SaaS]
/dashboard           — [Nếu là SaaS]
/[feature pages]     — [...]
```

#### Layout chính (page chính)

[ASCII layout diagram chi tiết — copy từ references/project-types.md, customize theo context]

#### Section breakdown (từng section + nội dung dự kiến)

1. **[Section name]** — [Mục đích section] — [Content notes]
2. ...

---

### 🎨 DESIGN SYSTEM

#### Colors
- Primary: `#______`
- Secondary: `#______`
- Accent: `#______`
- Background: `[white / dark / gradient]`
- Text: `[#1a1a1a / #f1f5f9]`

#### Typography
- Headings: `[Font name]` (weight: 600-700)
- Body: `[Font name]` (weight: 400)
- Mono (code blocks if any): `[JetBrains Mono / Fira Code]`

#### Spacing
- Container max-width: `[1200px / 1280px / 1440px]`
- Section padding (desktop): `[64px / 96px / 128px]`
- Section padding (mobile): `[32px / 48px / 64px]`

#### Animations
- [Subtle hover lifts / Fade-in scroll / Bold parallax / None]
- Library: [Framer Motion / CSS only / Lottie]

---

### 💻 TECH STACK

| Layer | Choice | Reason |
|---|---|---|
| Framework | [Next.js 14 / Astro / Vite] | [...] |
| Styling | [Tailwind / shadcn-ui] | [...] |
| Database | [Supabase / Prisma+Postgres / None] | [...] |
| Auth | [Supabase Auth / NextAuth / Clerk / None] | [...] |
| Payments | [Stripe / VNPay / None] | [...] |
| Deployment | [Vercel / Cloudflare Pages / Netlify] | [...] |

---

### 📁 FILE STRUCTURE

```
project-name/
├── app/                        # Next.js App Router
│   ├── page.tsx                # Landing
│   ├── layout.tsx              # Root layout
│   ├── (marketing)/            # Group routes
│   ├── dashboard/              # Authed routes
│   └── api/                    # API routes
├── components/
│   ├── ui/                     # shadcn components
│   ├── sections/               # Page sections
│   └── shared/                 # Cross-page components
├── lib/
│   ├── supabase.ts             # DB client
│   └── utils.ts
├── public/                     # Static assets
├── tailwind.config.ts
├── next.config.js
└── package.json
```

(Adjust theo stack đã chọn)

---

### 📦 DELIVERABLES

| # | Item | Chi tiết |
|---|---|---|
| 1 | [Main deliverable — ví dụ "Landing page 9 sections"] | [Detail] |
| 2 | [Secondary — ví dụ "Email capture form connect Mailchimp"] | [Detail] |
| 3 | [...] | [...] |

---

### ⚠️ KHÔNG BAO GỒM (rõ ràng từ đầu để tránh hiểu lầm)

- [Item ngoài scope 1]
- [Item ngoài scope 2]

---

### ✅ CHECKPOINT

Chủ nhà xác nhận:

- [ ] Structure (site map + layout) đúng mong muốn
- [ ] Design system phù hợp với brand
- [ ] Tech stack hợp lý
- [ ] Deliverables đủ và đúng
- [ ] Không thiếu phần quan trọng nào
- [ ] Hiểu rõ phần "không bao gồm"

**Reply "APPROVED" để chuyển sang CONTRACT.**

Nếu cần điều chỉnh, ghi rõ:
- Điểm cần sửa: [...]
- Lý do: [...]
```

---

## Lưu ý khi soạn Blueprint

- **Đầy đủ nhưng không lan man.** Mỗi section trong template có lý do tồn tại. Nếu skip phần nào, ghi "N/A — [lý do]" thay vì xoá.
- **Tech stack reasoning** rất quan trọng — đừng chỉ liệt kê, ghi cả "tại sao chọn cái này".
- **File structure** giúp user hình dung scale. Nếu là project nhỏ, simplify; nếu lớn, tách rõ feature folders.
- **Không bao gồm** là phần ngừoi mới hay quên — luôn liệt kê những thứ DEV thường implicitly assume nhưng user thì không (vd: "Không bao gồm: hosting domain, SSL cert, logo design, copywriting tiếng Anh nếu cần i18n").
