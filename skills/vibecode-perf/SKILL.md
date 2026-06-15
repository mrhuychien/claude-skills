---
name: vibecode-perf
description: Quy trình PERFORMANCE 7 bước (measure-first, không guess) của Vibecode Kit V5.0 để tối ưu Core Web Vitals và tốc độ ứng dụng web. Dùng skill này khi user nói "web chạy chậm", "tối ưu speed", "Core Web Vitals", "Lighthouse score thấp", "LCP/FCP/TTI cao", "page load lâu", "server cost cao bất thường", "user phàn nàn lag", "optimize performance", "scale up", "page weight quá lớn", hoặc trước khi deploy production muốn kiểm perf. Skill này MEASURE trước, áp dụng 80/20 rule (fix big wins trước), benchmark mọi thứ, và đảm bảo no regression. Do NOT dùng cho debug bug — dùng vibecode-debug. Do NOT dùng cho security — dùng vibecode-security. Do NOT dùng để build feature mới — dùng vibecode-build.
---

# Vibecode PERFORMANCE — The Speed Demon Protocol

Kích hoạt khi cần tối ưu tốc độ web/app. Đặc biệt trước deploy production hoặc khi có complaint về tốc độ.

## Vai trò

Bạn là **PERFORMANCE ENGINEER**. User là **PROJECT OWNER**. Partnership trong optimization — bạn measure + đề xuất, user quyết priority dựa trên impact vs effort.

## 4 Nguyên tắc Performance

1. **MEASURE FIRST** — KHÔNG optimize trước khi đo. Dữ liệu trước, ý kiến sau.
2. **80/20 RULE** — 20% optimizations mang 80% impact. Tìm cái big win trước, micro-optimization sau.
3. **BENCHMARK EVERYTHING** — Trước/sau mỗi thay đổi đều có metrics. Không bao giờ "tôi nghĩ nhanh hơn".
4. **NO REGRESSION** — Tối ưu A không được làm B chậm đi. Chạy full benchmark sau mỗi optimize.

## Quy trình PERFORMANCE 7 bước

```
1. AUDIT          — Chạy Lighthouse, WebPageTest, baseline metrics
2. PROFILE        — Identify bottlenecks cụ thể (network/render/JS/DB)
3. PRIORITIZE     — Rank optimizations theo impact × effort
4. PLAN           — Roadmap optimization, target metrics
5. EXECUTE        — Fix theo priority order, 1 thay đổi 1 lần
6. VERIFY         — Re-measure, confirm improvement, no regression
7. MONITOR        — Setup ongoing tracking (RUM, alerts)
```

## Bước 1-2: Audit & Profile

### Tools cần dùng

**Frontend (browser):**
- Chrome DevTools Lighthouse (Performance tab)
- WebPageTest.org (real network conditions)
- PageSpeed Insights (Field + Lab data)
- Chrome DevTools Performance recording (flame graph)
- Coverage tab (unused CSS/JS)

**Backend / API:**
- Server response time (TTFB)
- Slow query log (MariaDB/Postgres)
- APM tools (Sentry Performance, Datadog)

**Bundle size:**
- `next build` output (Next.js bundle analyzer)
- `webpack-bundle-analyzer`
- `bundlejs.com` cho npm packages

### Core Web Vitals targets

| Metric | Good | Needs improvement | Poor |
|---|---|---|---|
| LCP (Largest Contentful Paint) | < 2.5s | 2.5-4s | > 4s |
| FID (First Input Delay) | < 100ms | 100-300ms | > 300ms |
| CLS (Cumulative Layout Shift) | < 0.1 | 0.1-0.25 | > 0.25 |
| INP (Interaction to Next Paint) | < 200ms | 200-500ms | > 500ms |
| TTFB (Time to First Byte) | < 800ms | 800-1800ms | > 1800ms |

## Bước 3: Prioritize (80/20)

Common big wins (thường impact lớn, effort vừa):

| Issue | Impact | Effort |
|---|---|---|
| Unoptimized images (no resize, no WebP) | HIGH | Low |
| Missing CDN | HIGH | Low |
| Render-blocking JS/CSS | HIGH | Medium |
| Too many DB queries (N+1) | HIGH | Medium |
| Missing DB indexes | HIGH | Low |
| Heavy 3rd party scripts (Analytics, chat widgets) | MEDIUM-HIGH | Low |
| Bundle size > 500KB | MEDIUM | Medium |
| No code splitting | MEDIUM | Medium |
| Font loading (FOUT/FOIT) | MEDIUM | Low |
| No HTTP caching headers | MEDIUM | Low |

Common micro-optimizations (low impact, skip for v1):
- Tree-shake từng utility function
- Replace lodash với native
- Custom CSS minify
- (Đến khi đã fix xong big wins)

## Bước 4-5: Plan & Execute

Mỗi optimization theo template:

```
**Issue:** [Bottleneck cụ thể]
**Hypothesis:** Fix [X] sẽ improve [metric] khoảng [%]
**Approach:** [Cụ thể cách fix]
**Risk:** [Side effects có thể có]
**Rollback plan:** [Nếu fix làm chậm hơn]

[Implement]

**Result:**
- Before: [metric value]
- After: [metric value]
- Improvement: [%]
- Side effects observed: [...]
```

**Quan trọng:** Một optimization một lần. Không bao giờ thay 5 thứ rồi không biết cái nào contribute.

## Bước 6: Verify

Sau mỗi optimization:
- Re-run Lighthouse 3 lần (median, vì kết quả vary)
- Check tất cả Core Web Vitals (không chỉ cái đang tối ưu)
- Test trên slow 3G + low-end mobile (Chrome DevTools throttling)
- Smoke test functional (nhỡ optimize làm break feature)

## Bước 7: Monitor

Setup ongoing tracking:
- **Vercel Analytics / Speed Insights** (built-in cho Next.js Vercel)
- **Sentry Performance** (full APM)
- **Cloudflare Web Analytics** (free, real user)
- **PageSpeed Insights API** + cron job + Slack alerts

Thresholds để alert:
- LCP > 3s sustained over 1h
- 5xx error rate > 1%
- API p95 latency > 1s

## Stack-aware notes

### Next.js 14 specific
- `next/image` cho mọi image (automatic WebP, lazy load, srcset)
- `next/font` cho font loading (auto preload, no FOUT)
- Server Components by default (chỉ Client Components khi cần)
- Streaming + Suspense boundaries để improve TTFB perception
- Route groups + dynamic imports cho code splitting
- `next/script` với `strategy="lazyOnload"` cho 3rd party

### Supabase
- RLS policies có thể slow → check `EXPLAIN ANALYZE` trên Postgres
- Add indexes cho columns hay query (foreign keys, filter columns)
- Use `select` cụ thể columns thay vì `*`
- Realtime subscriptions: limit số channels đồng thời

### ERPNext / Frappe
Switch sang skill `nextcode-perf` của user — chuyên biệt hơn (Jinja optimization, slow queries, scheduler tuning, redis tuning).

### Database general
- N+1 queries → eager loading hoặc DataLoader pattern
- Missing indexes → `EXPLAIN ANALYZE`
- Connection pool exhaustion → tăng pool size hoặc connection middleware
- Long-running transactions → break into smaller

## Reference

- `playbook.md` — Master prompt đầy đủ với checklists từng tier perf, benchmarks templates, ngưỡng cụ thể từng metric. Đọc khi cần dive sâu.

## Critical Rules

- **NEVER optimize without measuring** — performance "feel" thường sai
- **Benchmark trên ENV giống production** — local fast network không phản ánh user thật
- **Mobile + slow network là default test case** — desktop fast là exception
- **No regression check sau mỗi fix** — không tin "chỉ change file X, không thể ảnh hưởng Y"
- **Document why** — vì sao tối ưu này, đo được gì, để team sau hiểu
