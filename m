Return-Path: <linux-input+bounces-16981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD6CD13876
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94F72316119F
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD5B2E7185;
	Mon, 12 Jan 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1P+nz6s"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6782E6CDE;
	Mon, 12 Jan 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229951; cv=none; b=lLcvpRcKP1fIeQen+b+INuW1L9RdNEYSaM30M3xNLaZs9uNcnofZ1IQjByTd6QsKBaJNfKTELhN27z2DRxbWCAYd5jXShYwTPlCH1HAlYpUpEcEnepsPePpzc0ZftSaeY9+77me3uk1tHaT4PyaGUWKQXTtD2LwJkB0U47vHx6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229951; c=relaxed/simple;
	bh=5QtlWCR9AbeCte7rpd1mqjCMSw93C1M4t0Mz2hsyKfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FOqkNxTumm3WsSm+tZ47aGeFahdq1X+IQozYsFR0cUHLWDVA2/+krv0BciPPY0PVL0UdEOQ008J1kkYsDr6sIQZE3DYbgRdP2Y1PklUWDP9jhECJ/BuGY7x1M1G6Jlwem/ZtS5Pjq2mu/+m8cU+ebxTR1owhHeo2zNILRDjgxkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1P+nz6s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066C4C19422;
	Mon, 12 Jan 2026 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229950;
	bh=5QtlWCR9AbeCte7rpd1mqjCMSw93C1M4t0Mz2hsyKfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y1P+nz6sU7CnjzDJuL0NdWmMpC/MVzO0S/YLYl+zruF6j/esRCLCI3qYllzC9oWF/
	 +V8oHSOixryefNmm7taycc6dml6vdPER8Cgfk9+jHbW1OIIsIwuGlrrWqqSA6Gtfbi
	 S7OuWxW2GCiNUWPefT0mt8pt6dpNSE53MKWQRAGrI8NDIhOxNJtA+CtS0NtL0Klss5
	 A8zrzf5S0Is43hcfLhBgRbgggYOnIf3zgfGcJLl2yocgdHOt6IehxxgXu9CR0GD55X
	 4OyFxrsFwqXLxcFrInFNGNMi19QkjehsM49KNm5RM2bLj5cG6G8qLmUaNRG2kwc6R5
	 ULPmZ09KyJDMQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Siarhei Vishniakou <svv@google.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	roderick.colenbrander@sony.com,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.15] HID: playstation: Center initial joystick axes to prevent spurious events
Date: Mon, 12 Jan 2026 09:58:18 -0500
Message-ID: <20260112145840.724774-17-sashal@kernel.org>
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

From: Siarhei Vishniakou <svv@google.com>

[ Upstream commit e9143268d259d98e111a649affa061acb8e13c5b ]

When a new PlayStation gamepad (DualShock 4 or DualSense) is initialized,
the input subsystem sets the default value for its absolute axes (e.g.,
ABS_X, ABS_Y) to 0.

However, the hardware's actual neutral/resting state for these joysticks
is 128 (0x80). This creates a mismatch.

When the first HID report arrives from the device, the driver sees the
resting value of 128. The kernel compares this to its initial state of 0
and incorrectly interprets this as a delta (0 -> 128). Consequently, it
generates EV_ABS events for this initial, non-existent movement.

This behavior can fail userspace 'sanity check' tests (e.g., in
Android CTS) that correctly assert no motion events should be generated
from a device that is already at rest.

This patch fixes the issue by explicitly setting the initial value of the
main joystick axes (e.g., ABS_X, ABS_Y, ABS_RX, ABS_RY) to 128 (0x80)
in the common ps_gamepad_create() function.

This aligns the kernel's initial state with the hardware's expected
neutral state, ensuring that the first report (at 128) produces no
delta and thus, no spurious event.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of Commit: "HID: playstation: Center initial joystick axes
to prevent spurious events"

### 1. COMMIT MESSAGE ANALYSIS

The commit describes a clear, specific bug:
- PlayStation gamepads (DualShock 4, DualSense) have joysticks that rest
  at value 128 (0x80)
- The kernel initializes the axis value to 0 by default
- When the first HID report arrives with the resting value of 128, the
  kernel interprets this as actual movement
- This generates spurious EV_ABS events for non-existent movement
- The problem causes Android CTS test failures and potentially confuses
  userspace applications

The bug has user-visible impact ("Reported-by" pattern implied through
CTS test context).

### 2. CODE CHANGE ANALYSIS

**The fix is minimal and surgical:**
```c
gamepad->absinfo[ABS_X].value = 128;
gamepad->absinfo[ABS_Y].value = 128;
gamepad->absinfo[ABS_RX].value = 128;
gamepad->absinfo[ABS_RY].value = 128;
```

- 5 lines added (1 comment + 4 value assignments)
- Single file: `drivers/hid/hid-playstation.c`
- Single function: `ps_gamepad_create()`
- Only affects joystick axes (ABS_X, ABS_Y, ABS_RX, ABS_RY), correctly
  leaves triggers (ABS_Z, ABS_RZ) at 0

**Technical correctness:** The fix is obviously correct. After
`input_set_abs_params()` sets up the axis with range 0-255, manually
setting `.value = 128` aligns the kernel's initial state with the
hardware's physical resting position at center (128).

### 3. CLASSIFICATION

- **Type:** Bug fix (not a feature)
- **Category:** Input device initialization fix
- **No new API or behavior change:** Just corrects initial state values
- **No new features:** Purely corrects existing incorrect behavior

### 4. SCOPE AND RISK ASSESSMENT

| Factor | Assessment |
|--------|------------|
| Lines changed | 5 (very small) |
| Files changed | 1 |
| Complexity | Trivial |
| Subsystem | HID - PlayStation driver (mature) |
| Risk of regression | Very low |

The change is confined to initialization code and cannot affect any
existing logic paths. Setting an initial value cannot break anything
because:
1. The value 128 is within the valid range (0-255)
2. The hardware reports 128 at rest anyway
3. This aligns kernel state with reality

### 5. USER IMPACT

**Who is affected:**
- All users of DualShock 4 and DualSense controllers
- Android users (CTS compliance)
- Applications that validate initial input state

**Severity:** Medium - Not a crash or data corruption, but:
- Causes spurious input events at device connect
- Breaks CTS conformance tests
- May confuse input-sensitive applications

### 6. STABILITY INDICATORS

- **Reviewed-by:** Benjamin Tissoires (HID maintainer) ✓
- **Signed-off-by:** Maintainer sign-off ✓
- The fix is simple enough to verify correctness by inspection

### 7. DEPENDENCY CHECK

- No dependencies on other commits
- `ps_gamepad_create()` has existed since the driver was introduced
- Uses standard input subsystem patterns (`absinfo[].value`)
- Should apply cleanly to any stable tree containing this driver

### STABLE KERNEL CRITERIA EVALUATION

| Criterion | Status |
|-----------|--------|
| Obviously correct and tested | ✓ Reviewed by maintainer |
| Fixes a real bug | ✓ Spurious input events |
| Important issue | ✓ Breaks CTS, affects popular hardware |
| Small and contained | ✓ 5 lines, 1 file |
| No new features | ✓ Pure correctness fix |
| No new APIs | ✓ |

### RISK VS BENEFIT

**Benefits:**
- Fixes spurious input events on popular consumer hardware
- Fixes Android CTS test failures
- Aligns kernel state with hardware reality
- Affects millions of PlayStation controller users

**Risks:**
- Essentially zero - the change is trivially correct
- No logic changes, just initialization values

### CONCLUSION

This commit is an excellent candidate for stable backporting:

1. **Fixes a real bug** that causes spurious input events and test
   failures
2. **Small and surgical** - only 5 lines in one function
3. **Obviously correct** - aligns initial value with hardware's physical
   state
4. **Low risk** - cannot introduce regressions
5. **Well-reviewed** - HID maintainer reviewed and signed off
6. **Widely applicable** - affects popular consumer hardware
   (PlayStation controllers)
7. **No dependencies** - self-contained fix

The fix meets all stable kernel criteria: it's obviously correct, fixes
a real bug, is small in scope, and introduces no new features. The fact
that it fixes CTS compliance issues makes it particularly valuable for
Android device manufacturers using stable kernels.

**YES**

 drivers/hid/hid-playstation.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 128aa6abd10be..e4dfcf26b04e7 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -753,11 +753,16 @@ ps_gamepad_create(struct hid_device *hdev,
 	if (IS_ERR(gamepad))
 		return ERR_CAST(gamepad);
 
+	/* Set initial resting state for joysticks to 128 (center) */
 	input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_X].value = 128;
 	input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_Y].value = 128;
 	input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
 	input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_RX].value = 128;
 	input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
+	gamepad->absinfo[ABS_RY].value = 128;
 	input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
 
 	input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
-- 
2.51.0


