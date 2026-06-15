# Tech Stack Matrix

Đề xuất stack theo loại project và constraints. Đây là defaults — có thể đổi theo context user.

---

## Defaults theo loại project

| Project Type | Recommended Stack |
|---|---|
| Landing Page | Next.js 14 + Tailwind + Framer Motion |
| SaaS App | Next.js 14 + Tailwind + Supabase + NextAuth |
| Dashboard | Next.js 14 + Tailwind + Recharts + shadcn/ui |
| Blog | Next.js 14 + MDX + Tailwind |
| Docs | Next.js 14 + MDX + Tailwind (hoặc Docusaurus) |
| Portfolio | Next.js 14 + Tailwind + Framer Motion |
| E-commerce | Next.js 14 + Tailwind + Stripe + Supabase |

---

## Khi nào đổi khỏi Next.js?

**Astro** — content-heavy site (blog/docs/portfolio) cần SEO/perf tối đa, ít interactivity. Output static HTML, ship 0 JS by default.

**SvelteKit / Nuxt** — team đã quen Svelte/Vue. Đừng force Next.js nếu user prefer ecosystem khác.

**Remix** — app cần form handling phức tạp + nested routes. Less popular than Next nhưng pattern tốt cho data-heavy SaaS.

**Vite SPA + React Router** — internal tools, không cần SEO, chỉ cần app fast & nhẹ. Ít overhead hơn Next.

**Static HTML + Tailwind CDN** — landing page 1 trang, không có backend, deploy lên Cloudflare Pages/Netlify free tier.

---

## Backend / Data layer

| Constraint | Pick |
|---|---|
| Solo dev, fast MVP, có auth | Supabase (Postgres + Auth + Storage all-in-one) |
| Cần ORM type-safe + flexibility | Prisma + Postgres (Neon/Supabase/Railway) |
| Realtime collaboration | Supabase Realtime hoặc Liveblocks |
| Serverless functions | Vercel Functions / Cloudflare Workers |
| Heavy compute / cron | Railway / Fly.io / VPS thủ công |
| Vietnamese FMCG/ERP nội bộ | ERPNext + custom Frappe app (xem note dưới) |

---

## Auth

| Pick | Khi nào |
|---|---|
| Supabase Auth | Đã dùng Supabase cho data |
| NextAuth.js (Auth.js) | Cần OAuth nhiều providers, custom DB |
| Clerk | Muốn UI/UX auth pre-built, sẵn sàng trả tiền |
| Lucia | Type-safe, tự control hoàn toàn, indie dev |

---

## Payments

| Pick | Khi nào |
|---|---|
| Stripe | International, subscription, enterprise |
| Lemon Squeezy / Paddle | Merchant of record (tự lo VAT/tax) |
| VNPay / MoMo / ZaloPay | Vietnam market only |

---

## Hosting / Deployment

| Pick | Khi nào |
|---|---|
| Vercel | Next.js mặc định, Edge functions tốt |
| Cloudflare Pages | Static + Workers, free tier rộng |
| Netlify | Alternatives Vercel cho non-Next |
| Railway | Long-running Node/Python, Postgres included |
| Fly.io | Cần region cụ thể (vd Singapore cho VN users) |
| VPS (Hetzner/DigitalOcean) | Self-host ERPNext, Frappe, internal tools |

---

## Special cases

### Vietnamese FMCG / ERP nội bộ
Nếu user đang làm sản phẩm cho công ty Việt Nam (ERP, quản lý NPP, kho, kế toán) → cân nhắc:

- **ERPNext + custom Frappe app** thay vì Next.js từ đầu. Có sẵn 80% modules (CRM, Stock, Accounts, HR), chỉ cần extend bằng custom DocType.
- Dùng skill `nextcode-design` của user để thiết kế Frappe v16 custom app, rồi `nextcode-build` để scaffold.

Đừng đề xuất Next.js+Supabase nếu use case đã có ERPNext lo được — sẽ tốn thời gian build lại từ đầu.

### Solo developer, build-in-public
- Stack đơn giản nhất khả thi: Next.js + Tailwind + Supabase + Vercel
- Tránh microservices, k8s, hoặc bất kỳ thứ gì cần >1 người maintain
- Free tier mọi thứ ở giai đoạn MVP

### Vibe code (rapid prototype)
- Single HTML file với Tailwind CDN + vanilla JS / Alpine.js
- Hoặc Next.js 14 với 1 page duy nhất
- Deploy trong 5 phút lên Cloudflare Pages

---

## Anti-patterns (tránh đề xuất)

- **Microservices từ đầu** — overkill cho solo/small team. Monolith đến khi có 100+ users, rồi mới extract.
- **MongoDB cho relational data** — gần như mọi business app đều có quan hệ; Postgres mặc định an toàn hơn.
- **Custom auth từ scratch** — đừng. Dùng provider có sẵn.
- **Server-rendered + Redux + complex state lib cho landing page** — over-engineered. Static + small JS đủ.
- **Build CMS từ scratch cho blog** — dùng MDX hoặc CMS có sẵn (Contentful, Sanity, Strapi).
