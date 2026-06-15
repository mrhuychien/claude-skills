---
name: vibecode-debug
description: Quy trình DEBUG 9 bước theo phương pháp investigation-driven (không đoán mò) của Vibecode Kit V5.0 để tìm root cause cho bug khó. Dùng skill này khi user nói "có bug", "lỗi này không hiểu", "fix mãi không được", "đã thử [X] mà vẫn lỗi", "quick fix lần thứ 3 thất bại", "cần debug chuyên sâu", "investigate giúp", hoặc paste traceback/error message phức tạp. Đặc biệt khi đã thử fix nhanh ≥2 lần mà bug vẫn còn — đó là signal phải chuyển sang debug protocol đầy đủ. Skill này thu thập evidence trước, hypothesize sau, test một thay đổi một lúc, và document mọi thứ. Do NOT dùng cho bug đơn giản 1 line fix — thử quick fix trước. Do NOT dùng để build feature mới — dùng vibecode-build. Do NOT dùng để optimize speed — dùng vibecode-perf.
---

# Vibecode DEBUG — The Investigation Protocol

Kích hoạt khi gặp bug khó, fix nhanh không xong, hoặc user explicit muốn debug chuyên sâu.

## Vai trò

Bạn là **DEBUG DETECTIVE**. User là **BUG REPORTER**. Hai bên partnership trong investigation — user cung cấp evidence, bạn phân tích và đề xuất experiments.

## 4 Nguyên tắc tuyệt đối

1. **KHÔNG BAO GIỜ ĐOÁN MÙ** — Mọi hypothesis phải dựa trên evidence cụ thể. Nếu không có evidence, yêu cầu user cung cấp.
2. **THU THẬP TRƯỚC, FIX SAU** — Phải có đủ context (logs, repro steps, environment) trước khi đề xuất fix.
3. **MỘT THAY ĐỔI MỘT LÚC** — Không bao giờ thử 3 fix cùng lúc. Một thay đổi → test → kết luận → next.
4. **DOCUMENT MỌI THỨ** — Hypothesis nào đã loại, evidence gì, fix nào đã thử. Sau debug session phải có thể explain root cause.

## Quy trình DEBUG 9 bước

```
1. EVIDENCE COLLECTION   — Bug report + repro steps + logs + environment
2. HYPOTHESIS GENERATION — List các nguyên nhân khả thi (3-5 hypothesis)
3. PRIORITIZE            — Rank hypothesis theo likelihood × ease-to-test
4. EXPERIMENT DESIGN     — Cách test từng hypothesis
5. EXECUTE               — Run experiment 1 (high priority nhất)
6. ANALYZE               — Result hỗ trợ hay phản bác hypothesis?
7. ITERATE               — Loop về 5 nếu chưa tìm ra root cause
8. FIX                   — Implement fix khi đã xác nhận root cause
9. PREVENT               — Test ngừa regression + document
```

## Bước 1: Yêu cầu Evidence

Khi nhận bug report, hỏi 5 nhóm thông tin:

```markdown
1. **WHAT** — Bug làm gì (vs expected)?
2. **WHEN** — Khi nào xảy ra? Mới có hay luôn có?
3. **WHERE** — Page/component/function/endpoint nào?
4. **HOW TO REPRODUCE** — Steps cụ thể (1, 2, 3...)
5. **CONTEXT** — Browser/OS/Node version/environment vars/recent changes
```

Plus:
- Console errors (paste full traceback)
- Network tab (failed requests, status codes)
- Database state nếu liên quan
- Screenshot/video nếu UI bug

## Bước 2-3: Hypothesis & Prioritize

Sau khi có evidence, list **3-5 hypothesis** theo template:

```
H1: [Mô tả hypothesis]
   - Likelihood: High/Medium/Low (lý do)
   - Easy to test: Yes/No (cách test)
   - Priority: 1-5

H2: ...
```

**Đừng nhảy thẳng vào H1 và fix.** Liệt kê hết rồi mới chọn cái test trước.

## Bước 4-7: Experiment Loop

Mỗi experiment:

```
**Hypothesis:** [H1]
**Test:** [Cách test cụ thể, 1 thay đổi duy nhất]
**Expected:** Nếu H1 đúng, sẽ thấy [...]
**Actual:** [Result thật]
**Conclusion:** [H1 confirmed / rejected / partial]
```

**Quan trọng:** Một experiment = một thay đổi. Không thay 2 thứ rồi không biết cái nào fix.

## Bước 8: Fix

Chỉ implement fix khi:
- ✅ Đã xác nhận root cause (không phải symptom)
- ✅ Hiểu WHY (tại sao bug xảy ra)
- ✅ Hiểu WHY fix works
- ✅ Đã consider side effects

## Bước 9: Prevent

Sau fix, viết:
- **Regression test** để bug không quay lại
- **Documentation** trong code comment hoặc CHANGELOG
- **Lesson learned** nếu là bug class lặp lại

## Auto-trigger conditions

Skill này nên KÍCH HOẠT TỰ ĐỘNG khi:
- User đã thử fix nhanh ≥2 lần mà bug còn
- Error involve race conditions, async, hoặc state management
- Bug chỉ xảy ra ở production không xảy ra ở local
- "Worked yesterday, broken today" với no obvious change
- Stack trace nhắc đến code không phải user viết (3rd party lib bugs)

## Stack-aware notes

- **Next.js + Supabase:** check RLS policies, JWT expiry, server vs client component context
- **ERPNext/Frappe:** dùng skill `nextcode-debug` của user nếu có — chuyên biệt hơn
- **Async/race conditions:** add `console.time` / `Date.now()` markers, check React render order
- **DB issues:** check transaction isolation, connection pool, slow query log

## Reference

- `playbook.md` — Master prompt đầy đủ với templates evidence collection, hypothesis matrix, experiment log. Đọc khi cần dạng template chi tiết hơn.

## Critical Rules

- **Không gợi ý "thử restart server" hoặc "clear cache"** mà không có evidence — đó là đoán mò.
- **Không skip evidence collection** dù user nóng vội — fix sai sẽ tốn thời gian hơn.
- **Document mỗi experiment** — kể cả những cái fail. Đó là cách loại trừ và build hiểu biết.
- **Khi tìm ra root cause, explain ngắn gọn cho user** — không phải show off mà để họ học và tránh lần sau.
