# Design System — Fonts, Colors, Patterns

Quick reference cho design choices khi đề xuất vision. User có thể override theo brand guidelines.

---

## Font Pairings

| Style | Headings | Body |
|---|---|---|
| Modern Tech | Plus Jakarta Sans | Inter |
| Professional | DM Sans | Source Sans Pro |
| Creative | Playfair Display | Lato |
| Friendly | Poppins | Open Sans |
| Elegant | Cormorant Garamond | Montserrat |
| Startup | Space Grotesk | Work Sans |
| Vietnamese-friendly | Be Vietnam Pro | Be Vietnam Pro / Inter |
| Editorial | Fraunces | Source Sans Pro |
| Code-heavy / Dev tool | Inter | JetBrains Mono cho code blocks |

**Lưu ý font Việt:** Nếu user target VN market hoặc có nhiều tiếng Việt, dùng Be Vietnam Pro hoặc Inter (đầy đủ Vietnamese diacritics). Tránh fonts thiếu glyph Việt (vd: Playfair Display gốc thiếu một số dấu).

---

## Color Psychology

| Mood | Color | Hex |
|---|---|---|
| Trust / Professional | Blue | `#2563EB` |
| Energy / Action | Orange | `#F97316` |
| Growth / Health | Green | `#22C55E` |
| Luxury / Premium | Purple | `#7C3AED` |
| Warning / Urgency | Red | `#EF4444` |
| Neutral / Modern | Gray | `#6B7280` |

### Defaults theo industry

| Industry | Primary suggestion |
|---|---|
| SaaS B2B | Blue (`#2563EB`) hoặc Indigo (`#4F46E5`) |
| Fintech | Blue / Dark navy + Green accent |
| Healthcare | Teal (`#0D9488`) hoặc soft green |
| Education | Orange / Yellow + Blue |
| E-commerce | Brand-driven, thường có 1 accent color rực |
| Creative agency | Black + 1 bold accent (red/yellow/pink) |
| Vietnamese F&B / FMCG | Red/Yellow (auspicious) hoặc Green (organic) |

---

## Common Patterns

### Headlines

```
[Số] + [Timeframe] + [Outcome]
  → "Tăng 3x doanh thu trong 6 tháng"

[Verb] + [Object] + [Benefit]
  → "Tự động hoá báo cáo, tiết kiệm 10 giờ/tuần"

[Question that resonates]
  → "Chán gõ Excel mỗi sáng?"
```

### CTA buttons

```
[Action verb] + [Value]
  → "Dùng thử miễn phí 14 ngày"

[Get] + [Desired outcome]
  → "Nhận báo cáo miễn phí"

[Yes] + [Positive statement]
  → "Đúng rồi, đăng ký ngay"
```

### Social proof formats

- **Logo bar** — 5-7 logos khách hàng (grayscale + low opacity, hover full color)
- **Stats** — 3 con số ấn tượng ("10,000+ users", "99.9% uptime", "4.9/5 rating")
- **Testimonials** — 3 review có ảnh + tên + role + company
- **Press mentions** — "As featured in [logo logo logo]"

---

## Spacing & Typography Scale

### Spacing (Tailwind defaults — work for most projects)

```
gap-2 (8px)   — inline items
gap-4 (16px)  — between related elements
gap-8 (32px)  — between sections within a card
gap-16 (64px) — between major sections
gap-24 (96px) — hero/section breathing room
```

### Typography scale (Modern web defaults)

```
text-xs    12px — labels, captions
text-sm    14px — secondary text
text-base  16px — body (mobile)
text-lg    18px — body (desktop, blog/docs)
text-xl    20px — small headings
text-2xl   24px — H3
text-3xl   30px — H2
text-4xl   36px — H1 (mobile)
text-5xl   48px — H1 (desktop)
text-6xl+  60px+ — Hero headlines
```

**Line height:** body 1.6-1.8, headings 1.1-1.3

---

## Animation Principles

- **Subtle = professional** — hover lift 4-8px, fade-in 200-400ms, easing `cubic-bezier(0.4, 0, 0.2, 1)`
- **Bold = creative** — bigger movements, parallax, scroll-triggered reveals
- **Avoid:** auto-playing video without sound mute, infinite carousel, popup ngay khi load page
- **Default lib:** Framer Motion cho React; CSS transitions cho landing đơn giản

---

## Dark Mode Decision

| Project Type | Dark mode? |
|---|---|
| Dashboard | Yes (default) |
| Developer tool | Yes |
| SaaS B2B | Optional (toggle) |
| Landing page | Light default, dark optional |
| Blog | Light default, toggle nice |
| E-commerce | Light (color của products quan trọng) |
| Vietnamese F&B / FMCG | Light (warm, friendly hơn) |

---

## Vietnamese-Specific Notes

- **Diacritics rendering:** test font với "ặỡẽẵờụ" trước khi commit
- **Number formatting:** dùng `.` cho thousands (Ví dụ: 1.000.000) thay vì `,` như Anh-Mỹ
- **Date format:** `dd/MM/yyyy` mặc định; dùng `Intl.DateTimeFormat('vi-VN')` cho format dài
- **Currency:** `1.000.000 ₫` hoặc `1.000.000 VNĐ` — không dùng `$1,000,000`
- **Tone:** "anh/chị" formal trong B2B, "bạn" friendly cho consumer, "mày/tao" tránh trừ niche audience
