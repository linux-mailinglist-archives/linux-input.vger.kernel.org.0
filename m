Return-Path: <linux-input+bounces-12704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51920ACD2AB
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 03:09:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9893A7AB900
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 01:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7B61A3A8A;
	Wed,  4 Jun 2025 00:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1a37Ysp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F691A315D;
	Wed,  4 Jun 2025 00:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998650; cv=none; b=nFFu85eF/reo+SjsMPIgBsp5WnfPn4u5ve9j3EqarCc7U2mHtTxmMhuAcGNfodxnR77REVaHzAk3XSgJPGTSpFYkTdRj8U/xCDOr7xBe2nwV1JugIyGWECKz2A40SQqyfR2om3gqfwTq3NGsk0lnfOXsim78nwoqUobVkjpOJl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998650; c=relaxed/simple;
	bh=OUIKxpvxvbHJeswWtuIxaJc1T6DQhUwdQWQZCP2qinc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=USaV1wvN5nrklX10OdNjEKGk0t8QRPQjLMT7JadqwYk5yzE+P6wmrez1P5mn1A02Gfbg6FIxX4WCPCX3ACrRIMRdr1VXsyu0XACCCvZDZ0LykVXf9ncrQX+Wt/Ta+aJZvZ6kMi6QHs1F9h7gkyN66p9a1Vs7m9eenUbmt4hUj1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1a37Ysp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46FAC4CEED;
	Wed,  4 Jun 2025 00:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998649;
	bh=OUIKxpvxvbHJeswWtuIxaJc1T6DQhUwdQWQZCP2qinc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L1a37Ysp1zxP6KizCxw3uSPkQhQ6ZjRtXHuQ+dzyt3NbOTi0uKuVUxnrt4a6tKHBW
	 fSK8WZZQXKv8PZjssVV07uZDBLosao2Xbi2VdM+oPsbV8nKZqKEcdDmX7V1hXBUWn8
	 FatDO5U6bOzuPSy3A8xgyA2GgrEbaMnDL42U16SvRznYVGL3V5TrY6Dpruva9ywBeE
	 GN8NUywqv0FCWTGF+f6m8bfyv2mQ18PFZpyvIfTYMo8M2sSNM1VbqC1IvMGap4eXNE
	 RGvJ39UkHV95aIideTokZKxY4y8MkjJgTV7cmD8KExLCFKvBnMMpKdNtb934743aJS
	 06zOvlo6s7TmQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Luke D. Jones" <luke@ljones.dev>,
	Mario Limonciello <mario.limonciello@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 057/108] hid-asus: check ROG Ally MCU version and warn
Date: Tue,  3 Jun 2025 20:54:40 -0400
Message-Id: <20250604005531.4178547-57-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005531.4178547-1-sashal@kernel.org>
References: <20250604005531.4178547-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

[ Upstream commit 00e005c952f74f50a3f86af96f56877be4685e14 ]

ASUS have fixed suspend issues arising from a flag not being cleared in
the MCU FW in both the ROG Ally 1 and the ROG Ally X.

Implement a check and a warning to encourage users to update the FW to
a minimum supported version.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Link: https://lore.kernel.org/r/20250323023421.78012-2-luke@ljones.dev
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees for the
following reasons: ## Analysis of Code Changes: ### 1. **Clear Bug Fix
for User-Affecting Issue** The commit addresses a real user-impacting
problem: suspend issues on ROG Ally devices due to firmware bugs in the
MCU (Microcontroller Unit). The commit message explicitly states "ASUS
have fixed suspend issues arising from a flag not being cleared in the
MCU FW" - this is a clear hardware/firmware-related bug that affects
system stability. ### 2. **Minimal and Contained Changes** The code
changes are small and well-contained: - **New constants**:
`ROG_ALLY_REPORT_SIZE`, `ROG_ALLY_X_MIN_MCU`, `ROG_ALLY_MIN_MCU` - **New
quirk bit**: `QUIRK_ROG_ALLY_XPAD BIT(13)` - **Two new functions**:
`mcu_parse_version_string()` and `validate_mcu_fw_version()` - **Updated
device table entries**: Adding the new quirk to existing ROG Ally
devices ### 3. **Conservative Approach - Warning Only** The fix is very
conservative - it only adds **warning messages** to inform users about
firmware issues, without changing any critical kernel behavior. From the
code: ```c if (version < min_version) { hid_warn(hdev, "The MCU firmware
version must be %d or greater to avoid issues with suspend.\n",
min_version); } ``` This approach minimizes regression risk while
providing valuable user feedback. ### 4. **Follows Established
Patterns** The commit follows the same patterns established by similar
commits that were marked for backporting: - **Similar to Commit #1**:
Adds device-specific quirks for ROG Ally devices - **Similar to Commit
#2**: Updates device tables with new quirk flags - **Similar to Commit
#3**: Extends ROG Ally support without architectural changes ### 5.
**Addresses Known Hardware Issue** The version checking specifically
targets known problematic firmware versions: - ROG Ally: requires MCU
version ≥ 319 - ROG Ally X: requires MCU version ≥ 313 This suggests
ASUS has identified and fixed specific firmware bugs in these versions.
### 6. **Low Risk of Regression** The changes are additive and
defensive: - Only triggers on specific hardware (ROG Ally devices with
the new quirk) - Fails gracefully if MCU communication fails (`if
(version < 0) return;`) - No changes to existing code paths for other
devices - All error conditions are properly handled ### 7. **Follows
Stable Tree Criteria** - ✅ Fixes an important bug (suspend issues) - ✅
Small and contained changes - ✅ No new features - just hardware support
improvement - ✅ Minimal regression risk - ✅ Confined to specific
subsystem (HID driver for specific devices) The commit directly improves
user experience for ROG Ally owners who may be experiencing suspend
issues due to outdated MCU firmware, aligning perfectly with stable
kernel tree goals of providing important bug fixes to users.

 drivers/hid/hid-asus.c | 107 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 46e3e42f9eb5f..599c836507ff8 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -52,6 +52,10 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define FEATURE_KBD_LED_REPORT_ID1 0x5d
 #define FEATURE_KBD_LED_REPORT_ID2 0x5e
 
+#define ROG_ALLY_REPORT_SIZE 64
+#define ROG_ALLY_X_MIN_MCU 313
+#define ROG_ALLY_MIN_MCU 319
+
 #define SUPPORT_KBD_BACKLIGHT BIT(0)
 
 #define MAX_TOUCH_MAJOR 8
@@ -84,6 +88,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 #define QUIRK_MEDION_E1239T		BIT(10)
 #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
 #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
+#define QUIRK_ROG_ALLY_XPAD		BIT(13)
 
 #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
 						 QUIRK_NO_INIT_REPORTS | \
@@ -534,9 +539,99 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+/*
+ * We don't care about any other part of the string except the version section.
+ * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
+ * The bytes "5a 05 03 31 00 1a 13" and possibly more come before the version
+ * string, and there may be additional bytes after the version string such as
+ * "75 00 74 00 65 00" or a postfix such as "_T01"
+ */
+static int mcu_parse_version_string(const u8 *response, size_t response_size)
+{
+	const u8 *end = response + response_size;
+	const u8 *p = response;
+	int dots, err, version;
+	char buf[4];
+
+	dots = 0;
+	while (p < end && dots < 2) {
+		if (*p++ == '.')
+			dots++;
+	}
+
+	if (dots != 2 || p >= end || (p + 3) >= end)
+		return -EINVAL;
+
+	memcpy(buf, p, 3);
+	buf[3] = '\0';
+
+	err = kstrtoint(buf, 10, &version);
+	if (err || version < 0)
+		return -EINVAL;
+
+	return version;
+}
+
+static int mcu_request_version(struct hid_device *hdev)
+{
+	u8 *response __free(kfree) = kzalloc(ROG_ALLY_REPORT_SIZE, GFP_KERNEL);
+	const u8 request[] = { 0x5a, 0x05, 0x03, 0x31, 0x00, 0x20 };
+	int ret;
+
+	if (!response)
+		return -ENOMEM;
+
+	ret = asus_kbd_set_report(hdev, request, sizeof(request));
+	if (ret < 0)
+		return ret;
+
+	ret = hid_hw_raw_request(hdev, FEATURE_REPORT_ID, response,
+				ROG_ALLY_REPORT_SIZE, HID_FEATURE_REPORT,
+				HID_REQ_GET_REPORT);
+	if (ret < 0)
+		return ret;
+
+	ret = mcu_parse_version_string(response, ROG_ALLY_REPORT_SIZE);
+	if (ret < 0) {
+		pr_err("Failed to parse MCU version: %d\n", ret);
+		print_hex_dump(KERN_ERR, "MCU: ", DUMP_PREFIX_NONE,
+			      16, 1, response, ROG_ALLY_REPORT_SIZE, false);
+	}
+
+	return ret;
+}
+
+static void validate_mcu_fw_version(struct hid_device *hdev, int idProduct)
+{
+	int min_version, version;
+
+	version = mcu_request_version(hdev);
+	if (version < 0)
+		return;
+
+	switch (idProduct) {
+	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY:
+		min_version = ROG_ALLY_MIN_MCU;
+		break;
+	case USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X:
+		min_version = ROG_ALLY_X_MIN_MCU;
+		break;
+	default:
+		min_version = 0;
+	}
+
+	if (version < min_version) {
+		hid_warn(hdev,
+			"The MCU firmware version must be %d or greater to avoid issues with suspend.\n",
+			min_version);
+	}
+}
+
 static int asus_kbd_register_leds(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
+	struct usb_interface *intf;
+	struct usb_device *udev;
 	unsigned char kbd_func;
 	int ret;
 
@@ -560,6 +655,14 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 			if (ret < 0)
 				return ret;
 		}
+
+		if (drvdata->quirks & QUIRK_ROG_ALLY_XPAD) {
+			intf = to_usb_interface(hdev->dev.parent);
+			udev = interface_to_usbdev(intf);
+			validate_mcu_fw_version(hdev,
+				le16_to_cpu(udev->descriptor.idProduct));
+		}
+
 	} else {
 		/* Initialize keyboard */
 		ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
@@ -1280,10 +1383,10 @@ static const struct hid_device_id asus_devices[] = {
 	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD},
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY_X),
-	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
+	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_ALLY_XPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
 	    USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD),
 	  QUIRK_ROG_CLAYMORE_II_KEYBOARD },
-- 
2.39.5


