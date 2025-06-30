Return-Path: <linux-input+bounces-13244-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FE0AEE8C4
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 22:59:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0797E3E0445
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 20:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88F3725E46A;
	Mon, 30 Jun 2025 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mqy2+A8y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C82417C5;
	Mon, 30 Jun 2025 20:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751317149; cv=none; b=i4R4g42Sm+okoezUT4aobURJJTJzgPL4NqwZxqjKm937EMlT4PpwgCpqyj51IG+ATVBkBtWuBeulqxjgqAB5SRZZNxHM/W7gt6Nt80RISQrYsc0VpJngZVnPQC9W4cMgl0Za64/12fQlADJi/SvSyv48vLOSrLOq7tqqOyMIiaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751317149; c=relaxed/simple;
	bh=GHQy1s9b3WHXhZLvkNYc2R/H3R1R/hFBz4tzwf7xA3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HA20qgDxGQmTZpdWSC4jnX3tlYURYohHe7AoiepW+PK6g5Xq/tXJ2fFuhjdtlrQSZL9Dl9JEvlrNWItxb/pGNHrLxwSRQyoLJ4q68a6JN2t379hRauLMAyTj/KniH+4i/RzsOE2LQ/hwvio0GBwaAYNVcD6N7GMiIBYmOi1SMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mqy2+A8y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E933EC4CEEB;
	Mon, 30 Jun 2025 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751317148;
	bh=GHQy1s9b3WHXhZLvkNYc2R/H3R1R/hFBz4tzwf7xA3Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mqy2+A8yzOXjXXIte2MyoTmjqTymmEFVLt1AcqBA8JtgxrfVd/8ix2bPXt4ljP5/e
	 /L6leA0Cm6Hj9Sot82mkWBnsF5ukwGKwDcSADcGpEFPv5evBJKhMBYl99ZmzSj2GYR
	 XiJ+OPvmjLSVcoVqYPuhsk9t7j2XEricg7w2BaXMm4RKz+ykr4Ucl4DlSTxYRDkjBc
	 RJ5MCFNQ5DYX6lHZpdMIU9l+MthnCWTTdRuWlbwZxLqSDiovam+AezfFzWxWhI1Cpr
	 xY4NZvGKCXSAWhgj3tlGHEYc/cLqVj1C3Z0DtBC90EZWpWH3N6osV+S9h6wkAjNeOq
	 ydcnA9yRpLYNw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Akira Inoue <niyarium@gmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.15 15/23] HID: lenovo: Add support for ThinkPad X1 Tablet Thin Keyboard Gen2
Date: Mon, 30 Jun 2025 16:44:20 -0400
Message-Id: <20250630204429.1357695-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250630204429.1357695-1-sashal@kernel.org>
References: <20250630204429.1357695-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.4
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
index 1062731315a2a..898fe03074c64 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -818,6 +818,7 @@
 #define USB_DEVICE_ID_LENOVO_TPPRODOCK	0x6067
 #define USB_DEVICE_ID_LENOVO_X1_COVER	0x6085
 #define USB_DEVICE_ID_LENOVO_X1_TAB	0x60a3
+#define USB_DEVICE_ID_LENOVO_X1_TAB2	0x60a4
 #define USB_DEVICE_ID_LENOVO_X1_TAB3	0x60b5
 #define USB_DEVICE_ID_LENOVO_X12_TAB	0x60fe
 #define USB_DEVICE_ID_LENOVO_X12_TAB2	0x61ae
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index af29ba840522f..f4a6c506e2dd1 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -492,6 +492,7 @@ static int lenovo_input_mapping(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB:
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_input_mapping_x1_tab_kbd(hdev, hi, field, usage, bit, max);
 	default:
@@ -605,6 +606,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
 		if (ret)
@@ -861,6 +863,7 @@ static int lenovo_event(struct hid_device *hdev, struct hid_field *field,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		return lenovo_event_tp10ubkbd(hdev, field, usage, value);
 	default:
@@ -1144,6 +1147,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
@@ -1384,6 +1388,7 @@ static int lenovo_probe(struct hid_device *hdev,
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		ret = lenovo_probe_tp10ubkbd(hdev);
 		break;
@@ -1473,6 +1478,7 @@ static void lenovo_remove(struct hid_device *hdev)
 	case USB_DEVICE_ID_LENOVO_X12_TAB2:
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
 	case USB_DEVICE_ID_LENOVO_X1_TAB:
+	case USB_DEVICE_ID_LENOVO_X1_TAB2:
 	case USB_DEVICE_ID_LENOVO_X1_TAB3:
 		lenovo_remove_tp10ubkbd(hdev);
 		break;
@@ -1523,6 +1529,8 @@ static const struct hid_device_id lenovo_devices[] = {
 	 */
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB) },
+	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB2) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X1_TAB3) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 7ac8e16e61581..536a0a47518fa 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -2122,12 +2122,18 @@ static const struct hid_device_id mt_devices[] = {
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


