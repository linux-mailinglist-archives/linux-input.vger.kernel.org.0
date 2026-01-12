Return-Path: <linux-input+bounces-16978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D8FD138A0
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 16:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A389930787B8
	for <lists+linux-input@lfdr.de>; Mon, 12 Jan 2026 14:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E904326B0A9;
	Mon, 12 Jan 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JyBRhuIK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587D6F2F2;
	Mon, 12 Jan 2026 14:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768229922; cv=none; b=UJrbHQF01cYzElGNbrFkQVeFuQc0OGTF53XT/qdx4vQPGNEJDabUT2lGYWd6pkKp930JME8v/r+J+gF0+HFzy5WXa/4JQaOP5TD6RYCT6RkGF53veqvTxCwjKDoDFlZdBwsFJkcpr4FS/UQ1bkn94Qwa6UpegKRM/B1Lj0/xmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768229922; c=relaxed/simple;
	bh=pSeTVI/h7m3SYpWOadekmI1HoTQT0Tg8wxS5Psnc4rc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WAg/BognY9SqziZ3rjJM76MmOn8edSu1XcsI5+MFHK+eer6tNTbCwivTPXiBPb9E6ZmoHIFb6x5HQMwyalzte92Hsw/O8/Fra8BmUNf1ZPljOmTz5IueP5eTN3qf0OOkaKYprXw8FNzpMadkdmVuSzvJpEGZL2N8BEW5i5d3plw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JyBRhuIK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4C4C19423;
	Mon, 12 Jan 2026 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768229922;
	bh=pSeTVI/h7m3SYpWOadekmI1HoTQT0Tg8wxS5Psnc4rc=;
	h=From:To:Cc:Subject:Date:From;
	b=JyBRhuIK3M4FiG0WmMMMFEBPBf54O22tw/s2SagfoyHq2Xv4f+Yt0KzLt+oh1y5UE
	 zYaobFvQnd1HaXVsgju9hPj57Qb1RCl7AFHg+2RDWiMtTRHzr7XyY9GA9w7G8GOxZr
	 cHAGx6WAS9+Tb3nqkQvndMG8mD98s5xM727FYJuz6pIsJvpusSc65aucK20BrLM0yc
	 h254007B5DJaM34c1iq7BpAIYsF5D5E221HkJRFVuk3BHXeQkEh63e67dYkDDXl3dH
	 PBQ+5iQZ/wgNdbHjsQi5GgSCsH7Z/SSNSBKw+k3bomZnHKZVJiTnCdweuqduzT1qoV
	 DoGlyhdol18yA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Arnoud Willemsen <mail@lynthium.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] HID: Elecom: Add support for ELECOM M-XT3DRBK (018C)
Date: Mon, 12 Jan 2026 09:58:02 -0500
Message-ID: <20260112145840.724774-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
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

From: Arnoud Willemsen <mail@lynthium.com>

[ Upstream commit 12adb969658ec39265eb8c7ea9e1856867fb9ceb ]

Wireless/new version of the Elecom trackball mouse M-XT3DRBK has a
product id that differs from the existing M-XT3DRBK.
The report descriptor format also seems to have changed and matches
other (newer?) models instead (except for six buttons instead of eight).
This patch follows the same format as the patch for the M-XT3URBK (018F)
by Naoki Ueki (Nov 3rd 2025) to enable the sixth mouse button.

dmesg output:
[  292.074664] usb 1-2: new full-speed USB device number 7 using xhci_hcd
[  292.218667] usb 1-2: New USB device found, idVendor=056e, idProduct=018c, bcdDevice= 1.00
[  292.218676] usb 1-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[  292.218679] usb 1-2: Product: ELECOM TrackBall Mouse
[  292.218681] usb 1-2: Manufacturer: ELECOM

usbhid-dump output:
001:006:000:DESCRIPTOR         1765072638.050578
 05 01 09 02 A1 01 09 01 A1 00 85 01 05 09 19 01
 29 05 15 00 25 01 95 08 75 01 81 02 95 01 75 00
 81 01 05 01 09 30 09 31 16 00 80 26 FF 7F 75 10
 95 02 81 06 C0 A1 00 05 01 09 38 15 81 25 7F 75
 08 95 01 81 06 C0 A1 00 05 0C 0A 38 02 95 01 75
 08 15 81 25 7F 81 06 C0 C0 06 01 FF 09 00 A1 01
 85 02 09 00 15 00 26 FF 00 75 08 95 07 81 02 C0
 05 0C 09 01 A1 01 85 05 15 00 26 3C 02 19 00 2A
 3C 02 75 10 95 01 81 00 C0 05 01 09 80 A1 01 85
 03 19 81 29 83 15 00 25 01 95 03 75 01 81 02 95
 01 75 05 81 01 C0 06 BC FF 09 88 A1 01 85 04 95
 01 75 08 15 00 26 FF 00 19 00 2A FF 00 81 00 C0
 06 02 FF 09 02 A1 01 85 06 09 02 15 00 26 FF 00
 75 08 95 07 B1 02 C0

Signed-off-by: Arnoud Willemsen <mail@lynthium.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of HID: Elecom: Add support for ELECOM M-XT3DRBK (018C)

### 1. COMMIT MESSAGE ANALYSIS

The commit adds support for a new USB product ID (0x018c) for a wireless
variant of the ELECOM M-XT3DRBK trackball mouse. The message indicates:
- It's a wireless/new version of an existing supported device
- The report descriptor format differs from the older variant
- The patch enables the sixth mouse button
- dmesg output confirms the device identification

### 2. CODE CHANGE ANALYSIS

**hid-ids.h:**
- Renames `USB_DEVICE_ID_ELECOM_M_XT3DRBK` →
  `USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC` (clarifying the existing ID)
- Adds new `USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C` = 0x018c

**hid-elecom.c:**
- Updates references to use the renamed constant `_00FC`
- Adds a new case in the switch statement for `_018C` calling
  `mouse_button_fixup()` with parameters specific to this device's HID
  report descriptor: `(22, 30, 24, 16, 6)`
- Adds the new device ID to `elecom_devices[]` table

**hid-quirks.c:**
- Updates reference to use renamed constant
- Adds new device ID to `hid_have_special_driver[]`

### 3. CLASSIFICATION

This is a **NEW DEVICE ID** addition to an existing driver - one of the
explicitly allowed categories for stable backports:
- The driver (hid-elecom) already exists in stable trees
- Only adding a USB product ID to enable new hardware
- Uses existing `mouse_button_fixup()` infrastructure

### 4. SCOPE AND RISK ASSESSMENT

- **Size:** ~15 lines added across 3 files
- **Complexity:** Very low - follows identical patterns to existing
  devices
- **Risk:** Minimal - change is isolated to this specific USB device ID
- **Subsystem:** HID drivers are mature and this pattern is well-
  established

### 5. USER IMPACT

- **Affected users:** Owners of wireless ELECOM M-XT3DRBK (018C)
  trackball mouse
- **Without fix:** The sixth mouse button doesn't work
- **With fix:** Full hardware functionality enabled
- **Severity:** Functional hardware issue - extra button is non-
  functional without this fix

### 6. STABILITY INDICATORS

- Signed off by Jiri Kosina (HID subsystem maintainer)
- Follows exact same pattern as other Elecom devices
- Includes device testing evidence (dmesg/usbhid-dump output)

### 7. DEPENDENCY CHECK

- No dependencies on other patches
- All required infrastructure (`mouse_button_fixup()`,
  `elecom_report_fixup()`) exists in stable trees
- Self-contained change

### VERDICT

This commit is a textbook example of what **IS** appropriate for stable
backporting. It adds a new USB device ID to an existing driver to enable
hardware support - explicitly allowed under stable rules. The change is:
- Small and surgical
- Low risk (isolated to specific hardware)
- Uses existing patterns and infrastructure
- Enables real hardware to work correctly
- Has no behavioral changes to existing code paths

The only modification beyond adding the new ID is renaming the existing
`USB_DEVICE_ID_ELECOM_M_XT3DRBK` to
`USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC` for clarity, which is a harmless
naming change that doesn't affect functionality.

**YES**

 drivers/hid/hid-elecom.c | 15 +++++++++++++--
 drivers/hid/hid-ids.h    |  3 ++-
 drivers/hid/hid-quirks.c |  3 ++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-elecom.c b/drivers/hid/hid-elecom.c
index 981d1b6e96589..2003d2dcda7cc 100644
--- a/drivers/hid/hid-elecom.c
+++ b/drivers/hid/hid-elecom.c
@@ -77,7 +77,7 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		break;
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB:
 	case USB_DEVICE_ID_ELECOM_M_XT3URBK_018F:
-	case USB_DEVICE_ID_ELECOM_M_XT3DRBK:
+	case USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC:
 	case USB_DEVICE_ID_ELECOM_M_XT4DRBK:
 		/*
 		 * Report descriptor format:
@@ -102,6 +102,16 @@ static const __u8 *elecom_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		 */
 		mouse_button_fixup(hdev, rdesc, *rsize, 12, 30, 14, 20, 8);
 		break;
+	case USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C:
+		/*
+		 * Report descriptor format:
+		 * 22: button bit count
+		 * 30: padding bit count
+		 * 24: button report size
+		 * 16: button usage maximum
+		 */
+		mouse_button_fixup(hdev, rdesc, *rsize, 22, 30, 24, 16, 6);
+		break;
 	case USB_DEVICE_ID_ELECOM_M_DT2DRBK:
 	case USB_DEVICE_ID_ELECOM_M_HT1DRBK_011C:
 		/*
@@ -122,7 +132,8 @@ static const struct hid_device_id elecom_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XGL20DLBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index bec913a005a5d..b75d9d2f4dc73 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -455,7 +455,8 @@
 #define USB_DEVICE_ID_ELECOM_M_XGL20DLBK	0x00e6
 #define USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB	0x00fb
 #define USB_DEVICE_ID_ELECOM_M_XT3URBK_018F	0x018f
-#define USB_DEVICE_ID_ELECOM_M_XT3DRBK	0x00fc
+#define USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC	0x00fc
+#define USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C	0x018c
 #define USB_DEVICE_ID_ELECOM_M_XT4DRBK	0x00fd
 #define USB_DEVICE_ID_ELECOM_M_DT1URBK	0x00fe
 #define USB_DEVICE_ID_ELECOM_M_DT1DRBK	0x00ff
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index d6e42125d9189..e823661389016 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -413,7 +413,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XGL20DLBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_00FB) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3URBK_018F) },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_00FC) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT3DRBK_018C) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_XT4DRBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1URBK) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELECOM, USB_DEVICE_ID_ELECOM_M_DT1DRBK) },
-- 
2.51.0


