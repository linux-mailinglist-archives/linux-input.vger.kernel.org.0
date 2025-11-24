Return-Path: <linux-input+bounces-16303-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114DC7F56A
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 09:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0FB6E4E3EF2
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 08:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D225E2EBDCB;
	Mon, 24 Nov 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pIsJzjWE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D7D2E7624;
	Mon, 24 Nov 2025 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971623; cv=none; b=tvWM6hzpxR6ZseTdRH1TfVKq8ykKz0wQC9vbvF93OF1IZnUhsItZkA+8tkLJ7+DJHUj3NWXx9MxyexDZmzD2rfq8jon+MsBxL9PbknKnajuGpCXlQPpjfx7QVHC1A5nRwJFlzGACYWT4e6jhXZFzk3dbrjQhChkbtXycfwK+fdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971623; c=relaxed/simple;
	bh=YMXjYRBg/EjzkF26/CUMOvhplMkxp76NrPS+1LUuTo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ygnmqq9ElIuaE/YRkRUE6Y8di2GKUDpUl575Hy84vGNznBWfLXX6skk+onoRhTDaMsgObLaMXlXT+LXrdkt6XWKFG3L+fhBD70zifj2QXCSMxFbWPSnBe2I5LEx1mWDTyzl7hPWd1KngsVxwIVgRrjzNGTwiw4z+nY5zwtokDKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pIsJzjWE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFACC4CEF1;
	Mon, 24 Nov 2025 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763971623;
	bh=YMXjYRBg/EjzkF26/CUMOvhplMkxp76NrPS+1LUuTo4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pIsJzjWE36R8yaF1qCVJtWLWH0qxCr2ncDkdKiE+o5KFByti6AFSqL5M5/xdj9tQP
	 V3Achzahuae8zgrJil82TCBXlXSH9PS/ibZEKFX6MDuFBvz/8MG9McoFCpqmy6XUJR
	 XpEgQZDoWs2ulm0ccXTed3zV7vwVxetmKwzMj63sfcqRuo3mBatOL+YEKCWRsTPxqW
	 PBcTTvlTk5RSftO6zHUlLmNfstQUK8wlPIqQaiDFuO612tYjJFJ16PdRrZQzv0t61h
	 3qVIb5Kz3y/PIauBy/0/TAN4xg2JCpR3r+m3H0MW4EOZ86oNxvU4zYJsQeUKGGfwbb
	 TCCk6O1JkABqA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Lauri Tirkkonen <lauri@hacktheplanet.fi>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17] HID: lenovo: fixup Lenovo Yoga Slim 7x Keyboard rdesc
Date: Mon, 24 Nov 2025 03:06:24 -0500
Message-ID: <20251124080644.3871678-10-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124080644.3871678-1-sashal@kernel.org>
References: <20251124080644.3871678-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.8
Content-Transfer-Encoding: 8bit

From: Lauri Tirkkonen <lauri@hacktheplanet.fi>

[ Upstream commit a45f15808fb753a14c6041fd1e5bef5d552bd2e3 ]

The keyboard of this device has the following in its report description
for Usage (Keyboard) in Collection (Application):

	# 0x15, 0x00,                    //  Logical Minimum (0)                52
	# 0x25, 0x65,                    //  Logical Maximum (101)              54
	# 0x05, 0x07,                    //  Usage Page (Keyboard)              56
	# 0x19, 0x00,                    //  Usage Minimum (0)                  58
	# 0x29, 0xdd,                    //  Usage Maximum (221)                60
	# 0x81, 0x00,                    //  Input (Data,Arr,Abs)               62

Since the Usage Min/Max range exceeds the Logical Min/Max range,
keypresses outside the Logical range are not recognized. This includes,
for example, the Japanese language keyboard variant's keys for |, _ and
\.

Fixup the report description to make the Logical range match the Usage
range, fixing the interpretation of keypresses above 101 on this device.

Signed-off-by: Lauri Tirkkonen <lauri@hacktheplanet.fi>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

HID: lenovo: fixup Lenovo Yoga Slim 7x Keyboard rdesc

**1. COMMIT MESSAGE ANALYSIS**
- **Problem:** The commit addresses a firmware bug in the Lenovo Yoga
  Slim 7x keyboard HID descriptor. The "Logical Maximum" (101) is
  defined incorrectly as smaller than the "Usage Maximum" (221).
- **User Impact:** This causes the OS to ignore keypresses with usage
  codes above 101. This specifically breaks functionality for keys like
  `|`, `_`, and `\` on Japanese keyboard layouts, rendering the device
  partially unusable for those users.
- **Fix:** The patch modifies the report descriptor at runtime to align
  the Logical Maximum with the Usage Maximum.
- **Stable Context:** This is a classic "quirk" or "workaround" for
  broken hardware, which is a standard exception for stable backports.

**2. DEEP CODE RESEARCH**
- **Mechanism:** The commit implements a fixup that intercepts the
  report descriptor before the HID core parses it.
- **Specific Changes:**
  1. Adds a new device ID
     `I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD` (0x8987).
  2. Defines the specific byte sequence of the broken descriptor to
     identify it uniquely:
    ```151:157:drivers/hid/hid-lenovo.c
    static const __u8 lenovo_yoga7x_kbd_need_fixup_collection[] = {
    0x15, 0x00,     // Logical Minimum (0)
    0x25, 0x65,     // Logical Maximum (101)
    0x05, 0x07,     // Usage Page (Keyboard)
    ```
  3. Updates the `lenovo_report_fixup` function to apply the patch only
     when the device ID matches *and* the descriptor content matches:
    ```189:192:drivers/hid/hid-lenovo.c
    case I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD:
    if (*rsize == 176 &&
    memcmp(&rdesc[52], lenovo_yoga7x_kbd_need_fixup_collection,
    sizeof(lenovo_yoga7x_kbd_need_fixup_collection)) == 0) {
    ```
- **Safety:** The fix is defensive. It requires an exact match of the
  device product ID and the descriptor bytes. It uses established
  patterns found elsewhere in the driver (e.g., for the ThinkPad Pro
  Dock).

**3. STABLE KERNEL RULES ASSESSMENT**
- **Obviously correct and tested:** The fix uses standard HID subsystem
  mechanisms for correcting buggy hardware descriptors.
- **Fixes real bug:** Without this patch, specific keys do not function
  on this hardware.
- **Small and contained:** The changes are surgical, affecting only
  `drivers/hid/hid-lenovo.c` and `drivers/hid/hid-ids.h`.
- **Exceptions Applied:**
  - **NEW DEVICE IDs:** Adds support for the Yoga Slim 7x (allowed).
  - **QUIRKS/WORKAROUNDS:** Fixes the broken report descriptor
    (allowed).

**4. RISK VS BENEFIT**
- **Benefit:** High for affected users. It makes the keyboard fully
  functional.
- **Risk:** Very Low. The change is additive and guarded by a specific
  device ID check. It cannot cause regressions for other Lenovo devices
  because the code path is unreachable for them.

**5. CONCLUSION**
This commit is a textbook candidate for stable backporting. It supports
new hardware (Device ID exception) and fixes a firmware bug that breaks
functionality (Quirk exception). It is low-risk, contained, and provides
a necessary fix for users of this specific laptop model.

**YES**

 drivers/hid/hid-ids.h    |  1 +
 drivers/hid/hid-lenovo.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5721b8414bbdf..4b1946eb4e7fc 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -715,6 +715,7 @@
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA2  0x8350
 #define I2C_DEVICE_ID_ITE_LENOVO_LEGION_Y720	0x837a
 #define USB_DEVICE_ID_ITE_LENOVO_YOGA900	0x8396
+#define I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD	0x8987
 #define USB_DEVICE_ID_ITE8595		0x8595
 #define USB_DEVICE_ID_ITE_MEDION_E1239T	0xce50
 
diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 654879814f97a..9cc3e029e9f61 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -148,6 +148,14 @@ static const __u8 lenovo_tpIIbtkbd_need_fixup_collection[] = {
 	0x81, 0x01,		/*   Input (Const,Array,Abs,No Wrap,Linear,Preferred State,No Null Position) */
 };
 
+static const __u8 lenovo_yoga7x_kbd_need_fixup_collection[] = {
+	0x15, 0x00,	// Logical Minimum (0)
+	0x25, 0x65,	// Logical Maximum (101)
+	0x05, 0x07,	// Usage Page (Keyboard)
+	0x19, 0x00,	// Usage Minimum (0)
+	0x29, 0xDD,	// Usage Maximum (221)
+};
+
 static const __u8 *lenovo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 		unsigned int *rsize)
 {
@@ -177,6 +185,13 @@ static const __u8 *lenovo_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 			rdesc[260] = 0x01; /* report count (2) = 0x01 */
 		}
 		break;
+	case I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD:
+		if (*rsize == 176 &&
+		    memcmp(&rdesc[52], lenovo_yoga7x_kbd_need_fixup_collection,
+			  sizeof(lenovo_yoga7x_kbd_need_fixup_collection)) == 0) {
+			rdesc[55] = rdesc[61]; // logical maximum = usage maximum
+		}
+		break;
 	}
 	return rdesc;
 }
@@ -1538,6 +1553,8 @@ static const struct hid_device_id lenovo_devices[] = {
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_X12_TAB2) },
+	{ HID_DEVICE(BUS_I2C, HID_GROUP_GENERIC,
+		     USB_VENDOR_ID_ITE, I2C_DEVICE_ID_ITE_LENOVO_YOGA_SLIM_7X_KEYBOARD) },
 	{ }
 };
 
-- 
2.51.0


