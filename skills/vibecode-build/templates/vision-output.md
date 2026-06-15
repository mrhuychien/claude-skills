# Template — Vision Output

Dùng template này khi xuất kết quả bước 1 (VISION). Fill theo loại project đã detect.

---

```markdown
Chào Chủ nhà! 👋

Tôi detect đây là **[LOẠI PROJECT]**. Đây là VISION tôi đề xuất:

═══════════════════════════════════════════════════════════════
🎯 PROJECT TYPE: [Loại — Landing / SaaS / Dashboard / Blog / Docs / Portfolio / E-commerce / Hybrid]
═══════════════════════════════════════════════════════════════

📐 LAYOUT ĐỀ XUẤT
[Layout diagram phù hợp với loại project — copy từ references/project-types.md]

🎨 STYLE ĐỀ XUẤT
- Tone: [Modern / Bold / Minimal / Editorial / Friendly / Premium]
- Typography: [Heading font] + [Body font] (xem references/design-system.md)
- Color: [Primary] + [Accent], [light/dark mode]
- Animation: [Subtle / Bold / None]

💻 TECH STACK
- Frontend: [Next.js 14 / Astro / Vite SPA / khác]
- Styling: [Tailwind CSS / shadcn-ui / khác]
- [Auth, DB, Payments — nếu cần]
- Deployment: [Vercel / Cloudflare Pages / khác]

═══════════════════════════════════════════════════════════════

Đây là template TỐT cho ~80% projects loại này.

Để CUSTOMIZE, tôi cần CONTEXT của bạn:

**Universal questions:**
1. Sản phẩm/dịch vụ là gì? (1-2 câu mô tả)
2. Khách hàng mục tiêu là ai? (tuổi, nghề nghiệp, pain point)
3. Brand guidelines: đã có hay cần tôi đề xuất?
4. Có gì khác so với vision tôi đề xuất phía trên không?

**Type-specific questions:**
[1-2 câu hỏi theo loại — xem references/project-types.md]

Reply lại context, tôi sẽ điều chỉnh vision rồi chuyển sang BLUEPRINT.
```

---

## Lưu ý khi dùng template

- Fill **layout diagram** thật bằng ASCII art chứ không chỉ liệt kê tên section — visual giúp user hình dung nhanh hơn
- **Tech stack** phải cụ thể đến version (Next.js 14 không phải Next.js); nếu không rõ về version mới nhất thì search hoặc note
- **Color/typography** không chỉ tên — kèm 1-2 từ mô tả mood (vd "Indigo `#4F46E5` — trust + modern")
- Câu hỏi phải **đúng số lượng** — không hỏi 10 câu một lúc; 4 universal + 1-2 type-specific là sweet spot
