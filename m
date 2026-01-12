Return-Path: <linux-input+bounces-16982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58533D13879
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0449130C479B
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A43E2E7BDC;
	Mon, 12 Jan 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AV/6DrBZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267A62D0C8B;
	Mon, 12 Jan 2026 14:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229952; cv=none; b=E699Ifse1ix9Su3XztGQzYCokikV3rSoeZieupKvA5Po/q/BCT47ViBXLoddFIsh+bDBSpa/yLP0ocmwQGmrJIahPZzuY5JpJ9pLur4FG+xcInuA+uG1UoUMH4lTkdCPdOhj0YDfmaZiU0s9bfUYylvEH+49mOdNXc4LXWIEjX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229952; c=relaxed/simple;
	bh=QI4Dk/fAy1RPcU+wvgbT60kZ6bcDr+mN9AtUmOQcTFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/KyyBA5mB5k/KZfA0PHkB30anwM1QLAvtEwPB/6SsCP4Hc88nYK309SHlOVuqoPA+jZGvICP4BhRhqfqL50yoII+MtjPGGkiulvUvIAFooCqerUCyK1vK/FS8tFsvPPF/dqrPjl7d+SjuSKDpYIMGYdfLU0yuqcBmMx3EzBLsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AV/6DrBZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB9BC4AF0B;
	Mon, 12 Jan 2026 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229952;
	bh=QI4Dk/fAy1RPcU+wvgbT60kZ6bcDr+mN9AtUmOQcTFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AV/6DrBZHFHl84B1h/T5jd6ger/rZ9u/MHs6xfuB8yv+0Fdrulps0S/TTbLVNIPqT
	 zi9e2qrixP1czprMPiB8ak/jfwFlGixBU3+CMC8PJ+PVg7cr6/jOCCHwLAr8ZhvEs9
	 FKz6+ZtVY6Pw2ev75gHP7a5Pxg5EwxLc6HtRx6wD58PdremcUflk9xsOp8+KUIZwsw
	 74dmJG4fuNBfNHY+aqNiNiX2R9Vuuw1Lf4FT1cTdjxqo/vcte6DYFxux+D6XfV45BW
	 Y7w+crunKKN2ebnAKRkduGqfJMMRoGP3GHM16WPhFe9ACmo0glH5zgMka3igFVelBd
	 EA8nqAbTBAtyg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Zhang Lixu <lixu.zhang@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] HID: intel-ish-hid: Reset enum_devices_done before enumeration
Date: Mon, 12 Jan 2026 09:58:19 -0500
Message-ID: <20260112145840.724774-18-sashal@kernel.org>
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

From: Zhang Lixu <lixu.zhang@intel.com>

[ Upstream commit 56e230723e3a818373bd62331bccb1c6d2b3881b ]

Some systems have enabled ISH without any sensors. In this case sending
HOSTIF_DM_ENUM_DEVICES results in 0 sensors. This triggers ISH hardware
reset on subsequent enumeration after S3/S4 resume.

The enum_devices_done flag was not reset before sending the
HOSTIF_DM_ENUM_DEVICES command. On subsequent enumeration calls (such as
after S3/S4 resume), this flag retains its previous true value, causing the
wait loop to be skipped and returning prematurely to hid_ishtp_cl_init().
If 0 HID devices are found, hid_ishtp_cl_init() skips getting HID device
descriptors and sets init_done to true. When the delayed enumeration
response arrives with init_done already true, the driver treats it as a bad
packet and triggers an ISH hardware reset.

Set enum_devices_done to false before sending the enumeration command,
consistent with similar functions like ishtp_get_hid_descriptor() and
ishtp_get_report_descriptor() which reset their respective flags.

Signed-off-by: Zhang Lixu <lixu.zhang@intel.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of Commit: HID: intel-ish-hid: Reset enum_devices_done
before enumeration

### 1. COMMIT MESSAGE ANALYSIS

The commit message clearly describes a **bug in suspend/resume (S3/S4)
handling**:
- Systems with ISH enabled but no sensors return 0 devices from
  HOSTIF_DM_ENUM_DEVICES
- The `enum_devices_done` flag wasn't reset before sending enumeration
  commands
- On subsequent enumerations (after resume), the stale `true` value
  causes the wait loop to be skipped
- This leads to a race where delayed responses are treated as bad
  packets
- Result: **ISH hardware reset** during resume

Key indicators:
- "S3/S4 resume" - power management bug affecting real user workflows
- Clear explanation of the timing/race condition
- Acked-by Srinivas Pandruvada (Intel ISH maintainer)

### 2. CODE CHANGE ANALYSIS

The diff shows a **single line addition**:
```c
+       client_data->enum_devices_done = false;
```

Added immediately before the `HOSTIF_DM_ENUM_DEVICES` command is sent.
The logic:
- The function sends an enumeration request and waits for
  `enum_devices_done` to become true
- Without resetting it first, a stale `true` value from a previous call
  causes immediate exit from the wait loop
- This creates a race: the response arrives after `init_done` is already
  set, triggering a hardware reset

The fix follows the **established pattern** in the same driver - the
commit message notes that `ishtp_get_hid_descriptor()` and
`ishtp_get_report_descriptor()` already reset their respective flags
similarly.

### 3. CLASSIFICATION

- **Bug fix**: Yes - fixes incorrect state handling causing hardware
  reset
- **Feature addition**: No
- **API change**: No
- **Hardware quirk**: No - this is a driver logic bug, not a hardware
  workaround

### 4. SCOPE AND RISK ASSESSMENT

| Metric | Value |
|--------|-------|
| Lines changed | 1 |
| Files touched | 1 |
| Complexity | Very low |
| Risk | Minimal |

The change:
- Sets a boolean flag to false before an operation that expects it to
  transition to true
- Follows identical patterns elsewhere in the same file
- Cannot break any existing functionality that works correctly
- Isolated to Intel ISH subsystem

### 5. USER IMPACT

**Affected users:** Laptop users with Intel Sensor Hub hardware (common
in modern Intel laptops)

**Symptom:** ISH hardware reset during S3/S4 resume, which can cause:
- Delays in resume
- Sensor hub functionality issues after resume
- System instability during power transitions

**Severity:** Moderate-High - affects common laptop power management
workflows

### 6. STABILITY INDICATORS

- **Acked-by:** Srinivas Pandruvada (Intel ISH maintainer) - domain
  expert approval
- **Signed-off-by:** Benjamin Tissoires (HID maintainer)
- Pattern-following fix consistent with other similar functions in the
  driver

### 7. DEPENDENCY CHECK

This commit:
- Is self-contained with no dependencies
- Modifies code that has existed in stable trees for years
- The `enum_devices_done` flag, `client_data` structure, and
  `ishtp_enum_enum_devices()` function are all well-established

---

## Summary

**What it fixes:** Race condition during S3/S4 resume where stale
boolean flag causes ISH hardware reset

**Why it matters:** Users with Intel Sensor Hub hardware experience
hardware reset/instability on resume from suspend/hibernate - a common
laptop workflow

**Stable criteria met:**
- ✅ Obviously correct (follows existing pattern in same driver)
- ✅ Fixes real bug (hardware reset during resume)
- ✅ Small and contained (1 line, 1 file)
- ✅ No new features
- ✅ No API changes
- ✅ Has maintainer acknowledgment

**Risk assessment:** Very low - single boolean assignment following
established pattern

**Benefit:** Fixes real user-facing bug affecting laptop power
management

This is an ideal stable candidate: a minimal, surgical fix for a real
bug affecting common hardware in a common usage scenario, with
maintainer review and following established driver patterns.

**YES**

 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index d8c3c54a8c0f2..537145ec50586 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -495,6 +495,7 @@ static int ishtp_enum_enum_devices(struct ishtp_cl *hid_ishtp_cl)
 	int rv;
 
 	/* Send HOSTIF_DM_ENUM_DEVICES */
+	client_data->enum_devices_done = false;
 	memset(&msg, 0, sizeof(struct hostif_msg));
 	msg.hdr.command = HOSTIF_DM_ENUM_DEVICES;
 	rv = ishtp_cl_send(hid_ishtp_cl, (unsigned char *)&msg,
-- 
2.51.0


