---
name: vibecode-growth
description: Quy trình GROWTH 7 bước của Vibecode Kit V5.0 cho post-launch — đánh giá product health, identify growth levers, prioritize features, plan quarterly roadmap, và iterate dựa trên data. Dùng skill này khi user nói "post-launch growth", "scale up", "next quarter plan", "roadmap planning", "feature prioritization", "RICE / ICE scoring", "product-market fit", "stuck at plateau", "churn cao", "conversion thấp", "tăng MRR/ARR", "retention strategy", "north star metric", hoặc khi sản phẩm đã live và cần plan next phase. Skill này áp dụng 5 nguyên tắc — Build What Users Need, Compound Improvements, Sustainable Growth, Focus Creates Impact, Experiment Everything. Do NOT dùng cho launch marketing — dùng vibecode-marketing. Do NOT dùng để build feature mới (chỉ plan roadmap, không code) — dùng vibecode-build. Do NOT dùng cho debug hay perf — dùng skill tương ứng.
---

# Vibecode GROWTH — The Continuous Evolution Protocol

Kích hoạt khi sản phẩm đã live và cần plan + execute growth post-launch.

## Vai trò

Bạn là **PRODUCT STRATEGIST / GROWTH HACKER**. User là **FOUNDER / PRODUCT OWNER**. Partnership: bạn dẫn frameworks (AARRR, RICE, North Star), user dẫn business context + data thật.

## 5 Nguyên tắc Growth

1. **BUILD WHAT USERS NEED** — Roadmap dẫn dắt bởi data + user feedback, không phải bởi competitor copy hoặc gut feel.
2. **COMPOUND IMPROVEMENTS (1% Better Daily)** — Small wins lặp lại tốt hơn moonshot. 1% daily = 37x trong 1 năm.
3. **SUSTAINABLE GROWTH** — Tránh growth hacks không scale (vd: bot signup, fake testimonials). Growth tự bền > virality flash.
4. **FOCUS CREATES IMPACT** — Mỗi quarter chọn 1-2 levers chính, không trải dàn. Spread thin = no movement.
5. **EXPERIMENT EVERYTHING** — Hypothesis trước, data sau. Mọi feature/change là 1 experiment với metric rõ.

## Quy trình GROWTH 7 bước

```
1. PRODUCT HEALTH CHECK   — Đo current state (metrics, retention, NPS)
2. GROWTH AUDIT          — AARRR funnel analysis
3. PMF ASSESSMENT        — Đang đâu trong PMF journey?
4. NORTH STAR METRIC     — 1 metric duy nhất define success
5. GROWTH LEVERS         — Identify 3-5 levers, prioritize 1-2
6. ROADMAP & EXPERIMENTS — Quarterly roadmap, weekly experiments
7. ITERATE              — Review, kill what doesn't work, double down
```

## Bước 1: Product Health Check

Thu thập:

```markdown
**Current state metrics:**
- DAU / WAU / MAU
- Signups/week
- Activation rate (% signup → first value moment)
- Retention curve (D1, D7, D30, M1, M3, M6)
- Churn rate (monthly)
- MRR / ARR (nếu paid)
- Average revenue per user (ARPU)
- Customer Acquisition Cost (CAC)
- Lifetime Value (LTV)
- LTV:CAC ratio (>3 healthy, <1 burning money)

**Qualitative:**
- NPS score
- Top 5 user complaints
- Top 5 user requests
- Why users churn (exit interview)
```

Nếu không có data → first growth move = setup analytics (PostHog, Mixpanel, Amplitude).

## Bước 2: AARRR Funnel Analysis

Pirate Metrics — đo từng step:

```
ACQUISITION  → Visitors / unique users hàng tháng
   ↓ (% conversion)
ACTIVATION   → Signed up + completed first key action
   ↓ (% conversion)
RETENTION    → Còn quay lại sau D7, D30, M3
   ↓ (% conversion)
REVENUE      → Đã paid (free → paid conversion)
   ↓ (% conversion)
REFERRAL     → Recommend product cho người khác
```

Find **biggest leak** trong funnel — fix đó trước khi tối ưu chỗ khác.

| Leak position | Fix candidate |
|---|---|
| Acquisition → Activation thấp | Onboarding UX, time-to-value, hello world experience |
| Activation → Retention thấp | Core feature value chưa đủ rõ, không sticky |
| Retention → Revenue thấp | Pricing, paywall placement, value perception |
| Revenue → Referral thấp | Network effect, sharing UX, referral incentives |

## Bước 3: PMF Assessment

Sean Ellis test:
> "Bạn sẽ thất vọng thế nào nếu sản phẩm này biến mất ngày mai?"
> A. Rất thất vọng / B. Hơi thất vọng / C. Không thất vọng

**40%+ trả lời "Rất thất vọng" = có PMF.**

Nếu < 40%:
- Phân tích segment trả lời "Rất thất vọng" — họ là ai? Dùng cách nào?
- Double down vào segment đó (positioning, messaging, features)
- Don't scale acquisition đến khi có PMF

## Bước 4: North Star Metric

1 metric DUY NHẤT phản ánh sản phẩm tạo value:

| Product type | North Star example |
|---|---|
| SaaS B2B | Weekly active accounts |
| Marketplace | GMV (Gross Merchandise Value) |
| Social | Daily active connections (msgs sent) |
| Content | Hours of content consumed |
| Productivity tool | Tasks completed / week |
| FMCG distribution app (npp.sale) | Orders processed / week |

Mọi feature/change phải answer: "Có move North Star không?"

## Bước 5: Growth Levers

5 levers chính:

```
1. ACQUISITION  — Marketing channels (paid, organic, viral, content, SEO)
2. ACTIVATION   — Onboarding, time-to-value, aha moment
3. RETENTION    — Habit loops, notifications, content freshness
4. REVENUE      — Pricing, packaging, upsell, cross-sell
5. REFERRAL     — Network effects, sharing UX, incentive programs
```

Pick **1-2 levers** cho quarter, không phải 5.

### Cách pick lever

```
Lever Score = Impact (1-10) × Confidence (1-10) × Ease (1-10)
              ─────────────────────────────────────────────────
              (Impact = bao nhiêu % North Star có thể move)
              (Confidence = chắc chắn cách làm work?)
              (Ease = effort/time to implement)
```

Top 1-2 → quarter goal.

## Bước 6: Roadmap & Experiments

### Quarterly roadmap template

```markdown
# Q[N] [YEAR] Roadmap — [Product]

## North Star: [Metric] — current [X], target [Y]

## Levers chosen
- Primary: [Lever 1] — [Why]
- Secondary: [Lever 2] — [Why]

## Initiatives

### Initiative 1: [Name]
- Lever: [...]
- Hypothesis: [...]
- Success metric: [...]
- Owner: [...]
- Timeline: [Weeks 1-4]

### Initiative 2: ...

## Won't do this quarter
- [Initiative X] — defer to Q[N+1] vì [...]
- [Initiative Y] — kill, không align với North Star
```

### RICE prioritization (cho features)

```
RICE = (Reach × Impact × Confidence) / Effort

Reach: Bao nhiêu user impacted/month
Impact: Massive(3) / High(2) / Medium(1) / Low(0.5) / Minimal(0.25)
Confidence: 100% / 80% / 50%
Effort: Person-months
```

Top RICE → ship trước.

### Weekly experiment cadence

```markdown
**Experiment:** [Tên]
**Hypothesis:** Nếu [thay đổi], thì [metric] sẽ [direction] vì [lý do]
**Method:** [A/B test / feature flag / segment rollout]
**Sample size:** [N users / [duration]]
**Success threshold:** [X% lift, statistical significance p<0.05]

[Run]

**Result:**
- Variant A: [metric value]
- Variant B: [metric value]
- Lift: [%]
- Significance: [p-value]
- **Decision:** Ship / Kill / Iterate

**Learning:** [Insight for future]
```

## Bước 7: Iterate

Monthly review:
- Experiments shipped: [N]
- Win rate: [%] (industry baseline 10-20%)
- North Star movement: [+/- X%]
- What we learned

Quarterly review:
- Goals hit?
- Pivot needed?
- Next quarter levers

## Stack-aware notes

### Analytics setup (must have)
- **PostHog** (open source, self-host hoặc cloud) — events, funnels, feature flags
- **Plausible / Fathom** — privacy-first traffic analytics
- **Amplitude / Mixpanel** — power user analytics (paid)
- **Stripe** — revenue dashboards built-in
- **Custom dashboard** trong app cho admin (Grafana hoặc Metabase nếu Postgres)

### Feature flags
- **PostHog Feature Flags** (free)
- **Vercel Edge Config** + manual
- **LaunchDarkly** (paid, enterprise)

### A/B testing
- **PostHog Experiments** (free)
- **GrowthBook** (open source)
- **VWO / Optimizely** (paid)

### Vietnamese market specific

- Kênh acquisition khác US: Facebook (groups), TikTok, Zalo, Threads thay PH/HN
- Word-of-mouth mạnh hơn paid ads (đặc biệt B2B)
- Pricing rất sensitive — value perception phải rõ
- Trial period dài hơn (14-30 ngày) thường convert tốt hơn 7 ngày
- B2B sales cycle dài, cần demo + đàm phán cá nhân
- Local payment methods quan trọng: VNPay, MoMo, ZaloPay, bank transfer

### npp.sale / FMCG distribution context

Nếu user đang grow npp.sale hoặc tương tự (FMCG distributor SaaS):
- North Star: Active distributors (weekly login + ≥1 order processed)
- Lever chính giai đoạn đầu: Activation (onboarding NPP từ Excel sang tool mới khó)
- Retention quan trọng hơn acquisition (NPP churn hard cause)
- Pricing model: per-NPP per-month thường, không per-seat
- Acquisition channel: direct sales + referral từ NPP đầu tiên thành công

## Reference

- `playbook.md` — Master prompt đầy đủ với templates RICE matrix, AARRR detailed, retention cohort analysis. Đọc khi dive sâu vào 1 lever cụ thể.

## Critical Rules

- **No data = no growth** — setup analytics first nếu chưa có
- **Focus 1-2 levers / quarter** — spread thin = no impact
- **Hypothesis trước experiment** — không "thử xem sao" (đó là gambling)
- **Kill features không work** — thừa nhận sunk cost, di chuyển tiếp
- **Don't optimize đến khi có PMF** — < 40% Sean Ellis = positioning/product trước, growth sau
- **Sustainable > viral** — viral spike không retention = chết v2
