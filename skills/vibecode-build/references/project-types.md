# Project Types — 5 Patterns

5 loại project chuẩn của Vibecode Kit V5.0. Khi nhận yêu cầu user, dùng signals dưới đây để detect loại project trước, rồi áp dụng pattern tương ứng.

---

## 🏠 PATTERN A — LANDING PAGE

**Signals:** bán hàng, giới thiệu sản phẩm, thu leads, one-page, quảng cáo, khoá học, dịch vụ
**Keywords trigger:** bán, giới thiệu, landing, quảng cáo, marketing, khoá học, dịch vụ

### Layout chuẩn (9 sections)

```
┌─────────────────────────────────────────────────────────────┐
│  1. HERO — Headline (8-12 từ benefit-focused) + CTA + visual │
├─────────────────────────────────────────────────────────────┤
│  2. SOCIAL PROOF — Logo bar / Stats / Mini testimonial       │
├─────────────────────────────────────────────────────────────┤
│  3. PROBLEM → SOLUTION — Pain points → Your solution        │
├─────────────────────────────────────────────────────────────┤
│  4. FEATURES / BENEFITS — 3-4 key benefits + icons          │
├─────────────────────────────────────────────────────────────┤
│  5. HOW IT WORKS — 3 steps process                          │
├─────────────────────────────────────────────────────────────┤
│  6. TESTIMONIALS — 3 customer reviews + photos              │
├─────────────────────────────────────────────────────────────┤
│  7. PRICING / CTA — Clear offer + CTA                       │
├─────────────────────────────────────────────────────────────┤
│  8. FAQ — 5-7 common questions                              │
├─────────────────────────────────────────────────────────────┤
│  9. FINAL CTA + FOOTER                                       │
└─────────────────────────────────────────────────────────────┘
```

**Style mặc định:** Modern minimalist, conversion-focused
**Tech mặc định:** Next.js 14 + Tailwind + Framer Motion

### Context questions thêm (sau 4 câu universal)
- Mục tiêu chính: thu leads, bán hàng, hay booking?
- Có offer/promotion đặc biệt không?

---

## 💼 PATTERN B — SAAS APPLICATION

**Signals:** đăng nhập, user management, subscription, features, multi-tenant, dashboard cho user
**Keywords trigger:** app, ứng dụng, quản lý, system, platform, SaaS

### Layout chuẩn

```
PUBLIC PAGES                      AUTHENTICATED AREA          ADMIN (optional)
├── Landing Page                  ├── Dashboard (overview)    ├── User Management
├── Pricing                       ├── [Core Feature 1]        └── Analytics
├── Login / Register              ├── [Core Feature 2]
└── Forgot Password               ├── [Core Feature 3]
                                  ├── Settings
                                  └── Profile
```

### Core features điển hình
- CRUD operations
- Search & Filter
- User roles/permissions
- Notifications
- Data export

**Tech mặc định:** Next.js 14 + Tailwind + Supabase/Prisma + NextAuth

### Context questions thêm
- 3 tính năng quan trọng nhất là gì?
- User roles: chỉ 1 hay nhiều loại?

---

## 📊 PATTERN C — DASHBOARD

**Signals:** data visualization, admin panel, analytics, reports, KPI, metrics
**Keywords trigger:** dashboard, thống kê, báo cáo, analytics, admin, KPI

### Layout chuẩn

```
┌──────────┬────────────────────────────────────────┐
│          │  HEADER — Search | Notifications | Profile │
│          ├────────────────────────────────────────┤
│ SIDEBAR  │  ┌────┐ ┌────┐ ┌────┐ ┌────┐         │
│          │  │KPI │ │KPI │ │KPI │ │KPI │         │
│ • Nav 1  │  └────┘ └────┘ └────┘ └────┘         │
│ • Nav 2  │                                        │
│ • Nav 3  │  ┌─────────────┐ ┌─────────────┐      │
│ • Nav 4  │  │   CHART 1   │ │   CHART 2   │      │
│          │  └─────────────┘ └─────────────┘      │
│          │                                        │
│          │  ┌─────────────────────────────┐      │
│          │  │         DATA TABLE          │      │
│          │  └─────────────────────────────┘      │
└──────────┴────────────────────────────────────────┘
```

### Data viz options
- KPI Cards (4-6 metrics)
- Line charts (trends)
- Bar charts (comparisons)
- Pie/Donut (distributions)
- Tables (detailed data)

**Tech mặc định:** Next.js 14 + Tailwind + Recharts/Chart.js + shadcn/ui
**Dark mode:** Recommended

### Context questions thêm
- Data nào cần visualize?
- Ai sẽ xem dashboard này (execs, team, clients)?

---

## 📝 PATTERN D — BLOG / DOCUMENTATION

**Signals:** content-focused, articles, guides, documentation
**Keywords trigger:** blog, bài viết, tài liệu, docs, hướng dẫn

### Blog layout

```
Homepage              Post Page                    Category/Author Pages
├── Featured posts    ├── Title + Meta             (CRUD-style listings)
├── Recent posts      ├── Featured image
└── Categories sidebar├── Content (MDX)
                      ├── Author bio
                      └── Related posts
```

### Docs layout

```
┌──────────┬────────────────────────┬──────────┐
│ Sidebar  │     Main Content       │   TOC    │
│ (nav)    │     (MDX)              │ (right)  │
│          │                        │          │
│ • Guide  │  # Heading             │ • H2     │
│   • P1   │                        │ • H2     │
│ • API    │  Content here...       │   • H3   │
│   • P1   │  ```code```            │          │
└──────────┴────────────────────────┴──────────┘
+ Search (global, ví dụ Algolia DocSearch)
```

**Typography:** 18px body, 1.8 line-height, reading-optimized
**Tech mặc định:** Next.js 14 + MDX + Tailwind (hoặc Docusaurus cho docs)

### Context questions thêm
- Tần suất publish?
- Cần categories/tags phức tạp không?

---

## 🎨 PATTERN E — PORTFOLIO

**Signals:** showcase work, personal brand, agency, freelancer
**Keywords trigger:** portfolio, cá nhân, agency, showcase, works

### Style options (chọn 1)

- **MINIMAL** (developers, writers): clean, whitespace-heavy, typography-driven, subtle animations
- **BOLD** (designers, creatives): strong visual impact, large imagery, expressive animations
- **EDITORIAL** (agencies, studios): magazine-style, case-study focused, professional tone

### Sections điển hình
- Hero (name + tagline + CTA)
- About (story + skills)
- Work (3-6 featured projects)
- Project detail pages
- Services (optional)
- Contact

**Tech mặc định:** Next.js 14 + Tailwind + Framer Motion

### Context questions thêm
- Nghề nghiệp/lĩnh vực?
- Có case studies chi tiết hay chỉ showcase?

---

## 🔧 HYBRID / CUSTOM

Khi yêu cầu không rõ thuộc loại nào hoặc kết hợp nhiều loại (ví dụ: SaaS có blog + landing) → **không đoán mò**. Hỏi clarify:

```
Yêu cầu này có vẻ kết hợp [loại 1] và [loại 2]. Để đề xuất vision phù hợp:
1. Phần [primary purpose] là chính, hay [secondary] là chính?
2. User flow chính: [option A] hay [option B]?
```

Sau khi user chọn → quay lại pattern chính, kèm sub-section của pattern phụ.

---

## Quick reference matrix

| Loại | User flow | Conversion focus | Data heavy? | Dark mode default? |
|---|---|---|---|---|
| Landing | One-page scroll | High | Low | No |
| SaaS | Multi-page authed | Medium | Medium | Optional |
| Dashboard | Multi-page authed | Low | High | Yes |
| Blog | Post listing → detail | Low | Low | Optional |
| Docs | Sidebar nav → content | Low | Low | Optional |
| Portfolio | Scroll + project pages | Medium | Low | Optional |
