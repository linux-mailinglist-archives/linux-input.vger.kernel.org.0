Return-Path: <linux-input+bounces-16980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E2465D1360B
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 15:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B8F1030119AE
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310B22DC344;
	Mon, 12 Jan 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lckl+44M"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D71D2DB7B0;
	Mon, 12 Jan 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229932; cv=none; b=t1zWarNgqtIoYQZ9Gm4Nn7t0wTtRvyYiZBK8fPbG3RyrOQ22FxPeQ46kMIGj7sw8+PrmZ86mjcKqzFfUPVAnlo4ZNWWsy6YXSWzqO5Myxw28W3bym7SzSAEdsKmK96SJLmtl8GXsA4ixNfsoVA3awVrabJttc+10YNwI8hHaTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229932; c=relaxed/simple;
	bh=tmveYG3MYrcIOx8fgo5jQ0uyIL+4rJEKzFawxuWWjgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iXaARuNwsRMGS00IUrVC615xtp9WrsRN0w/lGDZ7CmHIIs+y06jG+SKbGd2KltHBH4W7vy3T1EFVl1Fj495P4dOFb40YH9ZO/DJEmw4o0M5IYUH/ceiS6dshbdyFdvYMHXPEaRAZp4JFK6XiM1te4Qg024dxkZXaW6Gez+kwd6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lckl+44M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231CFC19422;
	Mon, 12 Jan 2026 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229931;
	bh=tmveYG3MYrcIOx8fgo5jQ0uyIL+4rJEKzFawxuWWjgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lckl+44Mbe8FW04Gi084rW/NR2OCxWbFu3Iw4YjwFx/0XA+Cnc+HMPDGrn2XZZ/jB
	 b3jp6VFVcGGTtJ8590pm8xoAHf8fH/j+1RuXYrn8S4H21dBxFbW9qPYyE8UmvihOVT
	 e5ER4SPUC42d4RBMyNht1B9CE+PLy1rIwEJtQUwupP7dQXe+z0/6WEoRkic6s0jYU6
	 4/vKhXxWzrF+oXMqTQtktHGYJH/nVDrIyMws5d0UQ1e8RCLl383rS5YaGR/jzvgtju
	 zG1z2ZpS/TXpzx0YjsAUFt47z0rYtfPUQkj+fzTjggYJWA3lkKcux/Tr5bsBwh581B
	 xmOivLHrlF+eA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: DaytonCL <artem749507@gmail.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] HID: multitouch: add MT_QUIRK_STICKY_FINGERS to MT_CLS_VTL
Date: Mon, 12 Jan 2026 09:58:09 -0500
Message-ID: <20260112145840.724774-8-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260112145840.724774-1-sashal@kernel.org>
References: <20260112145840.724774-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: DaytonCL <artem749507@gmail.com>

[ Upstream commit ff3f234ff1dcd6d626a989151db067a1b7f0f215 ]

Some VTL-class touchpads (e.g. TOPS0102:00 35CC:0104) intermittently
fail to release a finger contact. A previous slot remains logically
active, accompanied by stale BTN_TOOL_DOUBLETAP state, causing
gestures to stay latched and resulting in stuck two-finger
scrolling and false right-clicks.

Apply MT_QUIRK_STICKY_FINGERS to handle the unreleased contact correctly.

Link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/1225
Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Tested-by: DaytonCL <artem749507@gmail.com>
Signed-off-by: DaytonCL <artem749507@gmail.com>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of HID Multitouch Quirk Addition

### 1. COMMIT MESSAGE ANALYSIS

The commit clearly describes a **real user-visible bug**:
- VTL-class touchpads (specifically TOPS0102:00 35CC:0104)
  intermittently fail to release finger contacts
- This causes gestures to stay latched - stuck two-finger scrolling and
  false right-clicks
- Links to a libinput bug report:
  https://gitlab.freedesktop.org/libinput/libinput/-/issues/1225
- Has `Tested-by:` from the reporter and `Suggested-by:` from Benjamin
  Tissoires (HID maintainer)
- Signed off by the maintainer (Benjamin Tissoires)

### 2. CODE CHANGE ANALYSIS

The change is **extremely minimal** - adding one line:
```c
MT_QUIRK_STICKY_FINGERS |
```

to the existing `MT_CLS_VTL` class definition. This enables an already-
existing quirk flag (`MT_QUIRK_STICKY_FINGERS`) for VTL-class devices.

The quirk mechanism handles cases where a touchpad firmware fails to
properly report when a finger has been lifted. Without it, the system
thinks the finger is still touching, causing "sticky" gestures. The
quirk infrastructure already exists and is well-tested - this commit
just enables it for another device class.

### 3. CLASSIFICATION

This falls squarely into the **QUIRKS and WORKAROUNDS exception
category**:
- Hardware-specific quirk for buggy/non-compliant devices
- The quirk code already exists in mainline - only enabling it for VTL
  class
- Fixes real-world hardware behavior issues

This is NOT:
- A new feature or API
- A new driver
- Code refactoring

### 4. SCOPE AND RISK ASSESSMENT

| Factor | Assessment |
|--------|------------|
| Lines changed | 1 |
| Files touched | 1 |
| Complexity | Trivially low |
| Subsystem | HID multitouch (mature, stable) |
| Risk | Very low |

The worst case scenario: if the quirk somehow caused issues on a
specific VTL device, it would only affect that device class. But the
current behavior is already broken for affected users, so this is a
clear improvement.

### 5. USER IMPACT

- **Affected users**: Anyone with VTL-class touchpads
- **Symptoms**: Stuck two-finger scrolling, false right-clicks - these
  are highly disruptive daily-use issues
- **Severity**: Medium-high for affected users (makes touchpad
  unreliable)
- **Evidence of real impact**: Linked bug report from libinput tracker

### 6. STABILITY INDICATORS

- `Tested-by:` tag from the reporter who experienced the issue
- Suggested and signed off by HID subsystem maintainer
- The `MT_QUIRK_STICKY_FINGERS` quirk has existed since ~Linux 3.15
- The `MT_CLS_VTL` class has existed since ~Linux 4.13
- Well-established quirk pattern used by many other device classes
  (FLATFROG, LG, ASUS, etc.)

### 7. DEPENDENCY CHECK

- **No dependencies** on other commits
- Both the quirk flag and VTL class exist in all recent stable trees
- Should apply cleanly without modification

### STABLE KERNEL RULES ASSESSMENT

| Criterion | Met? |
|-----------|------|
| Obviously correct and tested | ✅ Yes - trivial change, has Tested-by |
| Fixes a real bug | ✅ Yes - documented hardware issue with bug report |
| Important issue | ✅ Yes - stuck gestures/false clicks affect daily use
|
| Small and contained | ✅ Yes - 1 line in 1 file |
| No new features | ✅ Yes - uses existing quirk mechanism |
| Applies cleanly | ✅ Yes - no dependencies |

### CONCLUSION

This is an **ideal stable backport candidate**:

1. **Minimal risk**: Single-line addition of an existing, well-tested
   quirk flag
2. **Real user benefit**: Fixes stuck gestures and false clicks on VTL
   touchpads
3. **Proper testing**: Has Tested-by tag and maintainer approval
4. **Falls under hardware quirk exception**: Hardware quirks/workarounds
   are explicitly allowed in stable even though they add code
5. **Self-contained**: No dependencies, applies cleanly to stable trees

The fix is small, surgical, obviously correct, and addresses a real
user-visible hardware issue. This is exactly the type of hardware quirk
addition that stable trees should accept.

**YES**

 drivers/hid/hid-multitouch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 179dc316b4b51..a0c1ad5acb670 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -393,6 +393,7 @@ static const struct mt_class mt_classes[] = {
 	{ .name = MT_CLS_VTL,
 		.quirks = MT_QUIRK_ALWAYS_VALID |
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
+			MT_QUIRK_STICKY_FINGERS |
 			MT_QUIRK_FORCE_GET_FEATURE,
 	},
 	{ .name = MT_CLS_GOOGLE,
-- 
2.51.0


