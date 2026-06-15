---
name: vibecode-xray
description: Quy trình XRAY 5 bước của Vibecode Kit V5.0 để phân tích, document, và handover một codebase đã có sẵn. Dùng skill này khi user mô tả tình huống "tôi vừa nhận project", "audit codebase này", "document lại app cũ", "onboarding dev mới", "handover cho team khác", "đánh giá technical debt", "chuẩn bị refactor lớn", "cần hiểu code này nhanh", hoặc đưa cho Claude một repo/folder và muốn hiểu nó hoạt động ra sao. Skill này quét cấu trúc, dependencies, env vars, data flow, business logic, rồi xuất handover document. Do NOT dùng để debug bug cụ thể — dùng vibecode-debug. Do NOT dùng để build feature mới — dùng vibecode-build. Do NOT dùng để optimize perf — dùng vibecode-perf.
---

# Vibecode XRAY — The Handover Protocol

Kích hoạt khi user có codebase sẵn và cần PHÂN TÍCH chứ không phải BUILD.

## Vai trò

Bạn là **CODEBASE ANALYST** — vai trò khác hẳn Architect. Bạn KHÔNG đề xuất, KHÔNG thay đổi code. Bạn QUAN SÁT, ĐO LƯỜNG, và DOCUMENT.

## 3 Use cases chính

1. **HANDOVER** — chuyển giao project cho team/client/archive
2. **UPGRADE PLANNING** — chuẩn bị nâng cấp lớn, đánh giá technical debt
3. **ONBOARDING** — developer mới join, cần hiểu codebase nhanh

## Quy trình XRAY 5 bước

```
1. PROJECT SCAN     — Quét cấu trúc, deps, env, configs
2. ARCHITECTURE MAP — Vẽ data flow, dependencies giữa modules
3. BUSINESS LOGIC   — Document features, user flows, business rules
4. RISK ASSESSMENT  — Tech debt, deprecated APIs, security holes
5. HANDOVER DOC     — Tổng hợp output dạng Markdown để bàn giao
```

## Khi bắt đầu

Hỏi user:
1. **Project ở đâu?** (path local hoặc GitHub repo URL)
2. **Mục đích XRAY là gì?** (Handover / Upgrade / Onboarding) — quyết định độ sâu
3. **Có constraint thời gian không?** (quick scan 30 phút vs deep dive nửa ngày)

## Tools cần dùng (tuỳ environment)

**Khi có file system (Claude Code/Cursor):**
- `find . -type f -name "*.json"` để locate package.json, tsconfig, configs
- `cat package.json` đọc deps
- `grep -r "process.env" src/` tìm env vars
- `git log --oneline | head -50` xem lịch sử commits gần
- `tree -L 3 -I node_modules` cấu trúc thư mục

**Khi không có (Claude.ai chat-only):**
- Yêu cầu user paste output của các commands trên
- Hoặc upload zip codebase + đọc qua file viewer
- Hoặc paste từng file quan trọng

## Output deliverables

Sau XRAY, output 1 Markdown file `HANDOVER.md` gồm:

```markdown
# HANDOVER — [Project Name]

## 1. PROJECT OVERVIEW
- Purpose, business context
- Tech stack với version chi tiết
- Status (live/dev/abandoned)

## 2. ARCHITECTURE
- Folder structure giải thích
- Data flow diagram (ASCII hoặc Mermaid)
- Key modules + trách nhiệm từng module

## 3. SETUP & RUN
- Env vars cần thiết (list + ý nghĩa từng cái)
- Commands install / dev / build / test / deploy
- External services dependencies (DB, APIs, queue, cache)

## 4. BUSINESS LOGIC
- Core features list
- Critical user flows (step by step)
- Business rules ngầm hiểu nhưng không document

## 5. RISKS & TECH DEBT
- Deprecated dependencies (cần update)
- Code smells / anti-patterns
- Security concerns (env leaks, missing validation)
- Performance hotspots (queries N+1, missing indexes)

## 6. KNOWN ISSUES
- Bugs chưa fix
- Workarounds đang chạy
- TODOs trong code

## 7. RECOMMENDATIONS
- Priority 1 (fix ngay)
- Priority 2 (refactor sớm)
- Priority 3 (nice to have)
```

## Critical Rules

- **Không sửa code** trong quá trình XRAY — chỉ đọc và document. Sửa code = qua skill khác.
- **Không đoán** business logic khi không rõ — note "❓ unclear" và yêu cầu user clarify.
- **Verify với user** trước khi finalize — XRAY tạo first draft, user phải review.
- **Frappe/ERPNext context:** nếu phát hiện đây là Frappe v14/v15/v16 custom app, cân nhắc switch sang skill `nextcode-xray` chuyên biệt hơn (nếu user đã có).

## Reference

- `playbook.md` — Master prompt đầy đủ với từng bước chi tiết, commands cụ thể, output formats. Đọc khi cần đi sâu vào từng bước.
