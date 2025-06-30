Return-Path: <linux-input+bounces-13248-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6537AEE8E0
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 23:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABAC03E0D73
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 21:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA28C289809;
	Mon, 30 Jun 2025 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ExfHDjCK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103C223DFD;
	Mon, 30 Jun 2025 21:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317211; cv=none; b=XR/OEUb2i5B9NV4R52o6jQWp9CDjO7p/6MPaWO+UhaHIzzjcFJJR0u2EDCO7s9zlgBQKdzgKbOurdSL9P+Yh69yUFBdVvvxpAM3+3CGWq5dKv9X/iEiuk/kexLYde3fOpAdGGJ/a69dN9F+fVnpylVsK/Es4tJxBe3aWTC9hY98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317211; c=relaxed/simple;
	bh=/+kAg0Bao9No42UbchOyKwmpx9pJPInzGmMM3C8YQS4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CXLcvV4hjtihAa5e1IWIWOi6/Wy7/UHs+Or/l9jHwef9gAvf+OLVBruMJ+gYr2JDAhM0S89ZA/HJp7pn5pfpm9WK1nRHB+M2PU7gIGntj/GjNvOoF6QmVp8f5SspHJMB/pKZD9i/UaJ2YGYqAnzZeGWui5m80zsYhCGVKPtJvfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ExfHDjCK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE33C4CEEB;
	Mon, 30 Jun 2025 21:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317211;
	bh=/+kAg0Bao9No42UbchOyKwmpx9pJPInzGmMM3C8YQS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ExfHDjCK5O90T3bFSTPrlRFjjcMiFGmnA77wOjJNpm+p+7eoJBnOCadt7WwpQYos5
	 rvdgJRrXiyWCm9vaWrP1knHc00RJhfFHMjkTKCal3cguUa6g3P0CSJyt6Gu0qA114v
	 Bu0e3jB5PmBnNr2xwncM2S+fXXIepCOq4B/buP46q3BBEmWibNWg3bb7LmizEu6w6J
	 rp5rAYbie+na48AJLs5xUG/XVo5jIyS2XuxlOWotMiSSBrqu9LXfNJHdpBahFtzjG9
	 0pTtYCd43BG+txLpNgMP/Ycj9DhhhSqguX0s8L9f9Y0+w6Je9W/I36Y6zOJovGf0/I
	 aMG6bUzmvkdvg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akira Inoue <niyarium@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 13/21] HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2
Date: Mon, 30 Jun 2025 16:45:28 -0400
Message-Id: <20250630204536.1358327-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630204536.1358327-1-sashal@kernel.org>
References: <20250630204536.1358327-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.35
Content-Transfer-Encoding: 8bit

From: Akira Inoue <niyarium@gmail.com>

[ Upstream commit a8905238c3bbe13db90065ed74682418f23830c3 ]

Add "Thinkpad X1 Tablet Gen 2 Keyboard" PID to hid-lenovo driver to fix trackpoint not working issue.

Signed-off-by: Akira Inoue <niyarium@gmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES**

This commit should be backported to stable kernel trees. Here's my
extensive analysis:

## Commit Analysis

This commit adds support for the ThinkPad X1 Tablet Thin Keyboard Gen2
by adding its USB device ID (0x60a4) to the hid-lenovo driver. The
primary issue being fixed is that the trackpoint (pointing stick) is
non-functional without this patch.

## Code Changes Examination

1. **drivers/hid/hid-ids.h**: Adds `USB_DEVICE_ID_LENOVO_X1_TAB2` with
   value 0x60a4. This follows the existing pattern where X1_TAB is
   0x60a3 and X1_TAB3 is 0x60b5.

2. **drivers/hid/hid-lenovo.c**: The device ID is added to 7 locations:
   - `lenovo_input_mapping()`: Enables X1 tablet keyboard-specific input
     mappings
   - `attr_fn_lock_store()`: Enables FnLock LED control functionality
   - `lenovo_event()`: Handles special key events
   - `lenovo_led_brightness_set()`: Controls mute/micmute LED indicators
   - `lenovo_probe()`: Initializes device with tp10ubkbd infrastructure
   - `lenovo_remove()`: Cleanup handling
   - `lenovo_devices[]`: Device table entry with HID_GROUP_GENERIC

3. **drivers/hid/hid-multitouch.c**: Adds multitouch support with
   `MT_CLS_WIN_8_FORCE_MULTI_INPUT` class, consistent with other X1
   Tablet devices.

## Stable Backport Criteria

This commit meets all the stable kernel backporting criteria:

1. **Fixes a real bug**: The trackpoint is completely non-functional
   without this patch, affecting users who own this hardware.

2. **Small and contained**: The changes are minimal - just adding a
   device ID to existing code paths. No new functionality or
   architectural changes.

3. **Obviously correct**: The pattern is identical to existing X1 Tablet
   support (Gen1 and Gen3). The commit follows established conventions.

4. **Low risk**: Cannot affect any other hardware since it's guarded by
   specific device ID checks.

5. **Hardware enablement**: This is pure hardware enablement for a
   specific device that doesn't work at all without this patch.

## Comparison with Similar Commits

Looking at the provided similar commits:
- Commits adding X1 Tablet Gen3 support (Similar #2) and X12 Tab Gen2
  support (Similar #4) were marked YES for backporting
- Both fixed similar issues (non-working buttons, trackpoint, FnLock)
- This commit follows the exact same pattern

The commit marked NO (Similar #1) only added partial multitouch support
without the full hid-lenovo driver integration, which is why it wasn't
suitable for stable.

## Conclusion

This is a textbook example of a commit that should be backported to
stable kernels. It enables basic functionality (trackpoint) for specific
hardware that is completely broken without it, using minimal, well-
tested code patterns that cannot regress other devices.

 drivers/hid/hid-ids.h        | 1 +
 drivers/hid/hid-lenovo.c     | 8 ++++++++
 drivers/hid/hid-multitouch.c | 8 +++++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index c6424f6259487..49dc86981287a 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -814,6 +814,7 @@
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
+#define USB_DEVICE_ID_LENOVO_X1_TAB2	0x60a4
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
 #define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index f66194fde8912..b7b4c838980c7 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -473,6 +473,7 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 		return lenovo_input_mapping_tp10_ultrabook_kbd(hdev, hi, field,
 							       usage, bit, max);
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
@@ -584,6 +585,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
 		if (ret)
@@ -778,6 +780,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 		return lenovo_event_cptkbd(hdev, field, usage, value);
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
@@ -1059,6 +1062,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
@@ -1290,6 +1294,7 @@ static int lenovo_probe(struct hid_device *hdev,
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
@@ -1377,6 +1382,7 @@ static void lenovo_remove(struct hid_device *hdev)
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
@@ -1427,6 +1433,8 @@ static const struct hid_device_id lenovo_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB2) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
 	{ }
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 93b5c648ef82c..641292cfdaa6f 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2116,12 +2116,18 @@ static const struct hid_device_id mt_devices[] = {
 		HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
 			USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_7010) },
 
-	/* Lenovo X1 TAB Gen 2 */
+	/* Lenovo X1 TAB Gen 1 */
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
 			   USB_VENDOR_ID_LENOVO,
 			   USB_DEVICE_ID_LENOVO_X1_TAB) },
 
+	/* Lenovo X1 TAB Gen 2 */
+	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
+		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
+			   USB_VENDOR_ID_LENOVO,
+			   USB_DEVICE_ID_LENOVO_X1_TAB2) },
+
 	/* Lenovo X1 TAB Gen 3 */
 	{ .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
 		HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH_WIN_8,
-- 
2.39.5


