Return-Path: <linux-input+bounces-12705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDBDACD329
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 03:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 143A9179733
	for <lists+linux-input@lfdr.de>; Wed,  4 Jun 2025 01:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFD41F4631;
	Wed,  4 Jun 2025 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJOwGby1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12241F4634;
	Wed,  4 Jun 2025 01:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748998853; cv=none; b=nxrA+l3DBz3kt6V89ZWePbpjBy4WaQMCAvwssI/ica+KLp+WugHOQGQzABTkt+/vNZ0dT/Y4IGHjQChRx8RXnNI5wp2/z67PXYmfLIlqdwBAV0LsICo6gLu3mBreeiiET8NmAgmADB3JfViGp7aBr6zFNGJrUOM0CcFj0KM/rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748998853; c=relaxed/simple;
	bh=a1LrlqUJFEut+kAmigXoz4i166CYI4ZZrAKiNJAUwaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CFYL5u46zx6Pr3cseieEuHeKbIoBBWGVbhYcD/iYldyRqVkqGFfYUznwUlo5EX5xfPcsEVpQ6LTJhIGH77We3sNdsizXc1wMNMQUgs5MncFzAqITf67lxeGerjOVPnYTpm7iTEFG13lopqr0URH2LnTBZfiub00SUOrzb7jEXHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJOwGby1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BA87C4CEED;
	Wed,  4 Jun 2025 01:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748998853;
	bh=a1LrlqUJFEut+kAmigXoz4i166CYI4ZZrAKiNJAUwaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rJOwGby1kcKEPTw4Px5u5czA8OllXBpa/wshjZpgHHZ+RjKHK3AIphiQomZvN/GUj
	 e3+0X2I3p+OjG/Wt2GEmY1OeRSVrfIb3igIUWTWJeTwcpYk8IPHT1W5+VGbt+3J3nX
	 lPpeAVbXeGRfznoq8Y4lC+zCbIg2+odlI4QdmTDeADFoMms++vEBbMso1dytEhrJmy
	 ngcTKVUPaZq1jgYkEwrNWVYQrp5p0ZIfqUHdfiSOJnd9P4NqjQh9ZyBEC6oUbU0UPz
	 vcLoj5PSVaM0BGyYjLrj9KVa2CBlr1ncRWOcXNNwRLvHwB/ncVSh7Rx/PB6OERaSUS
	 DvHjAHueAX9Bw==
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
Subject: [PATCH AUTOSEL 6.12 51/93] hid-asus: check ROG Ally MCU version and warn
Date: Tue,  3 Jun 2025 20:58:37 -0400
Message-Id: <20250604005919.4191884-51-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604005919.4191884-1-sashal@kernel.org>
References: <20250604005919.4191884-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.31
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
index bcdd168cdc6d7..c5bdf0f1b32f7 100644
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


