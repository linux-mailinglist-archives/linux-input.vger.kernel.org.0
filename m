Return-Path: <linux-input+bounces-16979-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68036D138A6
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 54AA9306462E
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578C62DF122;
	Mon, 12 Jan 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r2W3EY9l"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3347C2DE718;
	Mon, 12 Jan 2026 14:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229929; cv=none; b=imlasuLHLL3IMubRTYL56Qp4pEF1LVS711qhMSqBvJqyjKIsV84QrHyErhja98I/vN4uJkId7UCFDK+ikvQBZiyGxa4QyLrLRryfZY1sM3pU1e2uv979wSZDRyuq3ABGYxf+Wxb4CSVmYi+CiXPzScLgFPT57XhtUe7I/Oeti7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229929; c=relaxed/simple;
	bh=7qap7nbNmEHsF9VY8Qu2q9YvJE/9zREfCYKeItIGQqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cv6Te/Jy6anVfGeLT5X6Z9lWfEgnpowQopbAbds6oUPJ5u6ageJ2b4zQudrRnaUELjRC6sSxKDco9Nh3xXfrtHrOFHbDvUXT/q2KU6UbckIX7mD1SltEmFhhafup6Fy4JmKVYtkVcLUfKliJpqYafTMfnHctTTsivtNRExNW87k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r2W3EY9l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2C4C19423;
	Mon, 12 Jan 2026 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229929;
	bh=7qap7nbNmEHsF9VY8Qu2q9YvJE/9zREfCYKeItIGQqc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r2W3EY9l//h1IjZOGsgdOyr5WrIFih4E9BMETGnG0qaVbYnON8xsNT6sgeMkneunC
	 2aCt8V8eBc5x9w4DNJPOsGOyNrI3aK26AI1kH2GFjZL+ApkuDlbXTSBJaH+yMHdkxq
	 sStHk1OR8rvDFZifa6SU0nKUd0pPEVDjZFYeADc8add8QtrPznq6FhtgafuytZk0lc
	 g4Du+grLJS6RS3aM00hy3U1XnoFzrKmNVcMeDLh55TFuQmbpc79775qc+WN2E9eNPx
	 T6umUzquAHUMfl6Witb/yL7keuy3Ges64U9BKlEZzikOsiHtqSPNkMC2E1OV8Fylz8
	 WsqywTgk7PhWw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chris Chiu <chris.chiu@canonical.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] HID: quirks: Add another Chicony HP 5MP Cameras to hid_ignore_list
Date: Mon, 12 Jan 2026 09:58:07 -0500
Message-ID: <20260112145840.724774-6-sashal@kernel.org>
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

From: Chris Chiu <chris.chiu@canonical.com>

[ Upstream commit c06bc3557542307b9658fbd43cc946a14250347b ]

Another Chicony Electronics HP 5MP Camera with USB ID 04F2:B882
reports a HID sensor interface that is not actually implemented.

Add the device to the HID ignore list so the bogus sensor is never
exposed to userspace. Then the system won't hang when runtime PM
tries to wake the unresponsive device.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
Signed-off-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Commit Analysis: HID Quirks for Chicony HP 5MP Camera

### 1. COMMIT MESSAGE ANALYSIS

The commit message is clear and explains:
- A specific Chicony HP 5MP Camera (USB ID 04F2:B882) reports a HID
  sensor interface that **is not actually implemented**
- Without this fix, **the system hangs** when runtime PM tries to wake
  the unresponsive device
- Solution: Add to `hid_ignore_list` so the bogus sensor is never
  exposed to userspace

Key phrase: "the system won't hang" - this is a **system hang fix**.

### 2. CODE CHANGE ANALYSIS

The change is minimal and surgical:

**hid-ids.h:** Adds one new device ID define
```c
#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3    0xb882
```

**hid-quirks.c:** Adds device to the ignore list
```c
{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY,
USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3) },
```

This follows an **already-established pattern** - there are already two
similar entries:
- `USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA` (0xb824)
- `USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2` (0xb82c)

### 3. CLASSIFICATION

This falls into **two explicit exception categories** that are allowed
in stable:

1. **Device ID addition:** Adding a USB ID to an existing driver's quirk
   list
2. **Hardware quirk/workaround:** Fixing a broken device that falsely
   advertises a non-functional HID sensor interface

### 4. SCOPE AND RISK ASSESSMENT

| Metric | Assessment |
|--------|------------|
| Lines changed | 2 |
| Files touched | 2 |
| Complexity | Trivial - just adding ID to a list |
| Risk level | **Extremely low** |

The change only affects this specific USB device (04F2:B882). No logic
changes, no control flow modifications. The `hid_ignore_list` mechanism
is mature and proven.

### 5. USER IMPACT

- **Severity:** HIGH - Prevents **system hangs** on affected HP laptops
- **Affected users:** Anyone with an HP laptop containing this specific
  Chicony 5MP camera
- **Real-world evidence:** The author is from Canonical (Ubuntu),
  suggesting this was discovered through real user bug reports

### 6. STABILITY INDICATORS

- Accepted by Benjamin Tissoires (HID maintainer)
- Uses identical mechanism to existing, proven entries
- Canonical developer submission suggests tested on real hardware

### 7. DEPENDENCY CHECK

**No dependencies.** The `hid_ignore_list` infrastructure exists in all
stable kernel versions. This is a completely standalone device ID
addition.

---

## Conclusion

This commit is a **textbook example** of what should be backported to
stable:

✅ **Fixes a real bug:** System hang during runtime PM suspend/resume
✅ **Fixes an important issue:** System hangs are severe user-facing bugs
✅ **Small and contained:** Only 2 lines, no logic changes
✅ **Obviously correct:** Follows exact pattern of existing similar
entries
✅ **Hardware quirk exception:** Explicitly allowed by stable kernel
rules
✅ **No dependencies:** Standalone addition
✅ **Zero risk:** Only affects one specific USB device ID

The bug is severe (system hang), the fix is trivial (add device to
ignore list), and the mechanism is well-proven with existing similar
entries. This is exactly what stable backports are for.

**YES**

 drivers/hid/hid-ids.h    | 1 +
 drivers/hid/hid-quirks.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c4589075a5ed6..3a22129fb7075 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -317,6 +317,7 @@
 #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12	0x1421
 #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA	0xb824
 #define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2	0xb82c
+#define USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3	0xb882
 
 #define USB_VENDOR_ID_CHUNGHWAT		0x2247
 #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index c89a015686c07..3cf7971d49743 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -769,6 +769,7 @@ static const struct hid_device_id hid_ignore_list[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_BERKSHIRE, USB_DEVICE_ID_BERKSHIRE_PCWD) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA2) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_HP_5MP_CAMERA3) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CIDC, 0x0103) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI470X) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_CYGNAL, USB_DEVICE_ID_CYGNAL_RADIO_SI4713) },
-- 
2.51.0


