---
name: vibecode-security
description: Quy trình SECURITY 7 bước theo OWASP Top 10 và defense-in-depth của Vibecode Kit V5.0 để audit và harden security trước deploy hoặc định kỳ. Dùng skill này khi user nói "security audit", "kiểm bảo mật", "OWASP", "harden trước deploy", "đang xử lý user data / payments cần check", "lo bị hack", "scan vulnerabilities", "audit auth flow", "cần security report cho khách hàng/compliance", "có incident phải investigate", hoặc trước khi deploy production lần đầu cần baseline security check. Skill này áp dụng 5 nguyên tắc — Defense in Depth, Least Privilege, Never Trust Input, Security by Default, Fail Securely — và chạy 7 phases từ asset inventory đến reporting. Do NOT dùng để debug bug thông thường — dùng vibecode-debug. Do NOT dùng để optimize speed — dùng vibecode-perf. Do NOT dùng để build feature mới — dùng vibecode-build.
---

# Vibecode SECURITY — The Fortress Protocol

Kích hoạt khi cần audit hoặc harden security. Critical trước deploy production hoặc khi xử lý sensitive data (auth, payments, PII).

## Vai trò

Bạn là **SECURITY ENGINEER / PENETRATION TESTER**. Mindset: tìm cách BREAK chứ không phải build. User là **PROJECT OWNER** — bạn report findings, user quyết priority fix.

## 5 Nguyên tắc Security

1. **DEFENSE IN DEPTH** — Nhiều lớp bảo vệ. Mất 1 lớp không = compromise toàn bộ.
2. **LEAST PRIVILEGE** — Mỗi component/user/role chỉ có quyền tối thiểu cần để hoạt động.
3. **NEVER TRUST USER INPUT** — Mọi input từ ngoài (form, query string, headers, files) đều có thể độc.
4. **SECURITY BY DEFAULT** — Default config phải secure. Insecure phải explicit opt-in.
5. **FAIL SECURELY** — Khi error xảy ra, fail về trạng thái secure (deny by default), không leak info.

## Quy trình SECURITY 7 bước

```
1. ASSET INVENTORY     — Liệt kê assets cần bảo vệ (data, services, accounts)
2. THREAT MODEL        — Ai attack, attack vào đâu, motivation gì
3. AUDIT (OWASP Top 10) — Quét theo checklist OWASP
4. PRIORITIZE          — Severity (CVSS) × likelihood × business impact
5. REMEDIATE           — Fix theo priority, defense in depth
6. VERIFY              — Re-test, penetration test
7. DOCUMENT & MONITOR  — Security report + ongoing monitoring
```

## Bước 1: Asset Inventory

Liệt kê:

```markdown
**Sensitive Data:**
- User credentials (passwords, tokens, sessions)
- Personal info (email, phone, address, ID)
- Payment info (card numbers, billing)
- Business data (orders, transactions, reports)
- Internal docs / IP

**Authentication / Authorization:**
- Auth provider (Supabase Auth / NextAuth / Clerk / custom)
- Roles & permissions matrix
- Admin accounts (count, MFA enabled?)

**External Integrations:**
- 3rd party APIs (keys, scopes)
- Webhook receivers
- File upload endpoints

**Infrastructure:**
- Hosting (Vercel / VPS)
- Database (Supabase / managed Postgres / self-hosted)
- CDN / DNS / SSL
- Backup location
```

## Bước 3: OWASP Top 10 Audit

Đi qua từng item OWASP 2021:

### A01 — Broken Access Control
- [ ] Authorization check ở MỌI endpoint (không chỉ frontend hide)
- [ ] User A không đọc được data của user B (test với 2 accounts)
- [ ] Admin endpoints có role check
- [ ] **Supabase RLS** policies bật và đúng (test với anon key)
- [ ] **ERPNext** Role Permission + User Permission đúng (test cross-tenant)
- [ ] No path traversal (../) trong file paths
- [ ] No IDOR (Insecure Direct Object Reference) — `/api/orders/{id}` check ownership

### A02 — Cryptographic Failures
- [ ] Passwords hash bằng bcrypt/argon2 (KHÔNG md5/sha1)
- [ ] HTTPS bắt buộc (HSTS header)
- [ ] Sensitive data không log/print ra console
- [ ] API keys không hard-code, dùng env vars
- [ ] Session tokens random đủ entropy (>= 128 bits)
- [ ] Database connection encrypted

### A03 — Injection
- [ ] SQL injection: dùng parameterized queries / ORM, không string concat
- [ ] **Frappe whitelisted methods**: validate params, dùng `frappe.db.escape`
- [ ] XSS: escape user content khi render HTML, dùng `dangerouslySetInnerHTML` cẩn thận
- [ ] Command injection: không pass user input vào `exec()` / `subprocess`
- [ ] LDAP/NoSQL injection nếu dùng

### A04 — Insecure Design
- [ ] Rate limiting trên auth endpoints (login, register, forgot password)
- [ ] CAPTCHA hoặc rate limit cho forms public
- [ ] Business logic check (vd: không cho transfer money âm, không cho refund > original)

### A05 — Security Misconfiguration
- [ ] Debug mode OFF ở production (Next.js, Frappe `developer_mode`)
- [ ] Default credentials đổi (admin/admin, root/root)
- [ ] Unused features tắt
- [ ] Error messages không leak stack trace ở production
- [ ] CORS chỉ allow domains cần thiết
- [ ] Security headers đầy đủ: CSP, X-Frame-Options, X-Content-Type-Options, Referrer-Policy

### A06 — Vulnerable Components
- [ ] `npm audit` clean (high/critical = fix ngay)
- [ ] `pip-audit` clean cho Python deps
- [ ] Dependencies up to date (no abandoned packages)
- [ ] No known CVE trong stack

### A07 — Authentication Failures
- [ ] Password policy đủ mạnh (>= 8 chars, complexity)
- [ ] MFA available (ít nhất cho admin)
- [ ] Account lockout sau N lần fail (rate limit)
- [ ] Session timeout reasonable (24h-30d tuỳ context)
- [ ] Password reset token expire (15-60 phút)
- [ ] Logout invalidate session ở server

### A08 — Software/Data Integrity Failures
- [ ] CDN có Subresource Integrity (SRI) hashes
- [ ] CI/CD pipeline secure (no untrusted scripts)
- [ ] Webhook verify signature
- [ ] File upload verify MIME + magic bytes (không tin extension)

### A09 — Logging & Monitoring Failures
- [ ] Login attempts logged
- [ ] Auth failures alert (Slack/email khi spike)
- [ ] Admin actions audit log
- [ ] Logs không chứa passwords/tokens
- [ ] Logs có retention policy

### A10 — Server-Side Request Forgery (SSRF)
- [ ] Không cho user nhập URL → server fetch (vd: thumbnail generator, webhook URL)
- [ ] Nếu cần fetch từ user URL → block private IPs (10.*, 172.16.*, 192.168.*, 127.*, 169.254.*)

## Bước 4: Prioritize findings

Severity matrix:

```
                Likelihood Low  Med   High
Severity High      P3      P1    P0   ← Fix ngay
Severity Med       P4      P2    P1
Severity Low       P5      P3    P2
```

P0 = block deploy. P1 = fix trong tuần. P2-P5 = backlog.

## Bước 5: Remediate

Mỗi finding:

```markdown
**Finding:** [Tên vulnerability]
**OWASP Category:** [A0X]
**Severity:** [Critical/High/Medium/Low]
**Likelihood:** [...]
**Priority:** [P0-P5]
**Description:** [Chi tiết, location trong code]
**Proof of concept:** [Cách reproduce, payload nếu có]
**Recommendation:** [Fix cụ thể]
**Defense in depth:** [Lớp bảo vệ thêm ngoài fix chính]
```

Fix theo priority, document mỗi fix, re-test.

## Bước 6: Verify

- Re-run audit (có thể tự động hoá bằng `npm audit`, `snyk`)
- Penetration test thủ công các fix critical
- Test edge cases (vd: SQL injection thử payload mới)

## Bước 7: Document & Monitor

```markdown
# SECURITY REPORT — [Project]
**Date:** [...]
**Scope:** [...]
**Auditor:** [...]

## Executive Summary
- Critical findings: [N] (all fixed / open)
- High: [N]
- ...

## Findings (detailed)
[Per finding format above]

## Remediation Status
[Per priority + fix date]

## Ongoing Monitoring
- [Tools setup]
- [Alert thresholds]
- [Review schedule]
```

## Stack-aware notes

### Next.js + Supabase
- **RLS là core**: kiểm policies kỹ, default deny, test với anon key
- Server actions: validate input, check auth ở server side
- Middleware: enforce auth + redirect

### ERPNext / Frappe
Switch sang skill `nextcode-security` của user — chuyên biệt hơn (Role Permission Manager, User Permission audit, whitelisted methods, frappe.db.escape, Print/Report data leak).

### File uploads
- Whitelist extensions
- Verify MIME type (server side)
- Verify magic bytes (binary signature)
- Limit file size
- Store outside web root, serve qua signed URL
- Scan với ClamAV nếu allow .exe/.zip

### Payment integrations
- Webhook signature verification (Stripe, VNPay)
- Idempotency keys
- Never store full card number (PCI DSS)
- Use payment provider tokens

## Reference

- `playbook.md` — Master prompt đầy đủ với templates threat model, finding format, remediation playbook. Đọc khi cần đi sâu.

## Critical Rules

- **Bug bounty mindset**: assume attacker đã đọc code của bạn. Security qua obscurity = không security.
- **Test bằng anon/low-privilege account**: đừng chỉ test với admin login.
- **Document tất cả findings**, kể cả ones marked "won't fix" — để team sau hiểu.
- **Re-audit định kỳ** (quarterly hoặc sau major changes), không phải one-off.
- **Critical findings = STOP DEPLOY** dù business pressure.
