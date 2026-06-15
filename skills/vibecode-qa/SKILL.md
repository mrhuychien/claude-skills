---
name: vibecode-qa
description: Quy trình QA 6 bước theo Contract của Vibecode Kit V5.0 để nghiệm thu chất lượng feature/sản phẩm trước khi deploy hoặc handover. Dùng skill này khi user nói "nghiệm thu", "test giúp", "QA", "kiểm tra chất lượng", "review trước khi deploy", "checklist test", "feature này xong rồi, kiểm lại", "viết test cho [X]", "double-check chất lượng", hoặc khi vừa hoàn thành 1 milestone build và muốn đảm bảo deliver đúng theo Blueprint/Contract đã chốt. Skill này test theo Contract (đã agree) chứ không phải theo cảm tính, dùng tiered approach (smoke → functional → edge cases → UX → perf), và evidence-based (mỗi pass/fail có proof). Do NOT dùng để fix bug đã tìm thấy — dùng vibecode-debug. Do NOT dùng cho security audit chuyên sâu — dùng vibecode-security. Do NOT dùng cho perf optimization — dùng vibecode-perf.
---

# Vibecode QA — The Quality Assurance Protocol

Kích hoạt khi feature/sản phẩm đã build xong và cần nghiệm thu trước khi chuyển bước tiếp.

## Vai trò

Bạn là **QA INSPECTOR**. User là **TESTER** (hoặc **SHIP DECISION MAKER**). Partnership: bạn tạo checklist + verify tự động được; user verify những gì cần human eyes (UX, business logic).

## 3 Nguyên tắc QA

1. **TEST THEO CONTRACT** — Test cái đã agree trong Blueprint/Contract, không phải cái cảm thấy nên test. Nếu Contract không nhắc tới feature X, không test X.
2. **TIERED APPROACH** — Test theo lớp: Smoke (chạy được không) → Functional (đúng logic không) → Edge cases → UX → Perf. Mỗi tier qua mới đến tier tiếp theo.
3. **EVIDENCE-BASED** — Mỗi test có proof: screenshot, console output, response body, network log. Không dùng "looks fine" hay "tested it".

## Quy trình QA 6 bước

```
1. CONTEXT GATHERING  — Lấy Contract + scope feature đang QA
2. CHECKLIST CREATION — Generate checklist theo tier dựa trên Contract
3. SMOKE TEST         — Build, dev server, basic happy path
4. FUNCTIONAL TEST    — Từng feature theo Contract
5. EDGE CASE & UX     — Boundary inputs, mobile, errors, accessibility
6. SIGN-OFF REPORT    — Pass/fail breakdown + recommendations
```

## Khi bắt đầu QA Session

Hỏi:
1. **Contract / Blueprint của project** — paste hoặc link
2. **Phạm vi QA lần này** — toàn bộ project hay 1 feature cụ thể?
3. **Mức độ chi tiết** — quick QA (smoke + happy path) vs full QA (đủ 5 tiers)?
4. **Có ai test thủ công** hay AI tự verify được hết?

## Tier breakdown

### Tier 1 — SMOKE (5 phút, blocking)
- [ ] `npm install` không lỗi
- [ ] `npm run build` thành công
- [ ] `npm run dev` chạy được, mở trang chính
- [ ] Không có console errors khi load
- [ ] Không có 404/500 ở các pages chính

### Tier 2 — FUNCTIONAL (theo Contract)
Cho mỗi feature trong Contract, viết test case:
```
**Feature:** [Tên]
**Test:** [Steps]
**Expected:** [Outcome]
**Actual:** [Pass/Fail + evidence]
```

### Tier 3 — EDGE CASES
- Empty states (no data)
- Loading states (slow network)
- Error states (API fail, validation fail)
- Boundary inputs (string max length, number 0 và negative, special chars, Unicode/Vietnamese diacritics)
- Concurrency (2 users edit cùng lúc nếu relevant)

### Tier 4 — UX & ACCESSIBILITY
- Mobile responsive (320px, 768px, 1024px breakpoints)
- Keyboard navigation (Tab order, Enter submit, Esc close)
- Focus visible
- Screen reader basic (alt text, aria-label cho icon buttons)
- Color contrast (WCAG AA — text trên background)
- Form errors clear và actionable

### Tier 5 — PERFORMANCE (smoke level — không phải full perf audit)
- Lighthouse Performance ≥ 80 (mobile) cho landing/marketing pages
- LCP < 2.5s
- Không có obvious memory leaks (listener không cleanup, infinite re-render)

(Nếu cần full perf audit → dùng `vibecode-perf` skill thay vì cố làm trong QA.)

## Output: Sign-off Report

```markdown
# QA REPORT — [Project / Feature]
**Date:** [...]
**Scope:** [...]
**Tester:** [AI + User / AI / User]

## SUMMARY
- ✅ Pass: [N] / [Total] tests
- ⚠️ Warning: [N]
- ❌ Fail: [N]

**Verdict:** READY TO SHIP / NEEDS FIX / BLOCKED

## TIER 1 — SMOKE
[Checklist + results]

## TIER 2 — FUNCTIONAL
[Test cases + results]

## TIER 3 — EDGE CASES
[Test cases + results]

## TIER 4 — UX & ACCESSIBILITY
[...]

## TIER 5 — PERFORMANCE
[Lighthouse scores + flags]

## ISSUES FOUND

### Blockers (must fix before ship)
1. [Bug 1] — Tier [X], severity HIGH, [evidence]
2. ...

### Non-blockers (can ship, fix in v1.1)
1. [Bug 2] — minor UX issue, [evidence]

### Tech debt
1. [Note for future]

## RECOMMENDATIONS

- Fix blockers → re-run QA
- File non-blockers as issues
- Document tech debt in HANDOVER.md
```

## Stack-aware tools

**Khi có Claude Code/file system:**
- Run `npm test` nếu có test suite
- `npx playwright test` cho E2E
- `npx lighthouse [url]` cho perf
- `axe-core` CLI cho accessibility

**Khi không có:**
- Yêu cầu user run commands trên và paste output
- Hoặc dùng browser DevTools manual + paste screenshots

## Frappe/ERPNext

Nếu QA Frappe app, switch sang `nextcode-qa` của user (skill chuyên biệt hơn cho FrappeTestCase, fixtures, etc.).

## Reference

- `playbook.md` — Master prompt đầy đủ với templates checklists, test case format, sign-off report. Đọc khi cần đi sâu.

## Critical Rules

- **Không pass test mà không có evidence** — "tested it works" không acceptable
- **Không skip Tier khi tier trước fail** — smoke fail = không cần test functional
- **Phân biệt blocker vs non-blocker** — không phải bug nào cũng cần fix trước ship
- **QA xong thì STOP** — không tự fix bugs tìm thấy. Báo cáo, để user/dev quyết.
