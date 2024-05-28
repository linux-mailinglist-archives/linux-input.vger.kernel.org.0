Return-Path: <linux-input+bounces-3889-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EEB8D1187
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 03:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4771A1C22F05
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 01:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4918825;
	Tue, 28 May 2024 01:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="jmxvTzE7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DxPSZSUe"
X-Original-To: linux-input@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4897DF49;
	Tue, 28 May 2024 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716860414; cv=none; b=eYl2vbZ7T11EdMi+bB2iUNK5o0y9t5nhlsf29nAA6mkoAbKrZLPExI3N22hCf18oTnBMuTSkcQyZxsE1dpfEnM5WPeJynWan2QlZI5AESvqOL3ZJZsSHXe+2GE9sSGODJpqKDN95GQtweapWJ+jfS9O5QfTRJn8LmN6LchjYnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716860414; c=relaxed/simple;
	bh=6Zda21Jo8keaOvTrsU69xa03MnSQfCWrWoWucqAQV+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhZsZy5Q3ncLSyPDy1DUTLSD5U6eeNz4y2j9uZbJPuNgPy6zHb41K4Snp20TokZd6un9PDVRytXq3WZko0dB6PJb95cxmjAz+ukXFACVCb22fT+JpPd4TrJSY8MNnCGxSXAFWVF8ZiR+KHNnVvprwIpTggMkhdYK3hJolW8OMKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=jmxvTzE7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DxPSZSUe; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id B5AA71380149;
	Mon, 27 May 2024 21:40:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Mon, 27 May 2024 21:40:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1716860411; x=1716946811; bh=hfv8F1e+/1YTGPoUag9mn
	Dwd8gl58J8C/k+Vg3dKLvM=; b=jmxvTzE7v/CTRheWzJ6QaKn73IjXvyqy+Sgls
	DmqB/CSHo9kgZD+qv/rI33Jq9Eruo38TSAvlCLQWxDixdVqVcrUJa0U+eDZLRQ+U
	AdFxACu3wD8aHKAratNzpxXq1tnzP+Zy85rIkLbMO4CobBL/Ymhqg4jJUtRBFrxu
	E4EixCOy4fjy4+/8pCEGhwAe9ml1DWg05/8e8R372sfiAvH7E5x58DfPQlAUayqh
	76To/XQ9uzicOsSxCNBTcfRSKdvdcCaEqedwmflpjc4k2AAbjT43+rdb3z78NtJG
	5LxSrce/xBSqnETS1IQsyDkby/9yxK2nfcGDn5R6VuPY3rU6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716860411; x=1716946811; bh=hfv8F1e+/1YTGPoUag9mnDwd8gl5
	8J8C/k+Vg3dKLvM=; b=DxPSZSUeqnPC1GmkiHIT+QvdJ3zUImvc5TVCZWkWSREg
	kyBF6l9z2QaODn/cTgx8V6RDBdBSnZa+g+OIytpaCcLkvGutvC4kggiWpbN3Sqkq
	qLQEbYGZBp+D0FKR1Gyuq1lKI5+bkHIouRZtTXFczarzFAldDOah3MrpezVsxPpG
	mDraPw3HjhhUcPjhQ9SXX2FkKK/lSNAcjx/+UZO39GKcItmwovgO9eDlC+EYCUdd
	PnHCmxdFBee4tZXm+3eqQHLzwxHbpf+cGEaheltb7mAnoeVnV73Oo0Yr1Asr6AK0
	iwxpKHnK14C2zkdXjaW6J8CG9KtB4G6OiWxXWckgIQ==
X-ME-Sender: <xms:-zVVZr_kdEvkwVZHm1WqGTbiErXG4VHOnCC-nbXtTWKjfnKoNxjwrQ>
    <xme:-zVVZnsbU_D7AsUWV1uvBH-lAwk9ElmajmH4ghNOM2hCO83Np6zirI4ga5Eiaj8Zr
    wPVmQ6pzPCSGi9FOeA>
X-ME-Received: <xmr:-zVVZpCN1_QCz4XyOc1aW7YKcnRQdV9DzL8r0bAg7WhA25UuIpD6mOP-Ka0G>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejhedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:-zVVZncSmo54-I5NG64Y50FOCL1H8g0wdzeu2OUf7yC9pZqULz5CQA>
    <xmx:-zVVZgOLKJhxROJ_uxF5EM_f-8X8tNYVtEViFK8oUStTo2VxYS64ag>
    <xmx:-zVVZpl-0nfIX8ThnaP5FBN5OgAJf2kh6s7Ob-76qv5pBCAsqk86Kg>
    <xmx:-zVVZqvuBvifBhR__VzfvK9UwPVnskj79u3vcAXLnsDi46Yl3wYyGA>
    <xmx:-zVVZhj6xDbN3qZ1qd2bd3coYnuyecs-Ea9YqhoUMEibBF8rbaN1to4d>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 21:40:07 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: jikos@kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	bentiss@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] hid-asus: use hid for brightness control on keyboard
Date: Tue, 28 May 2024 13:39:59 +1200
Message-ID: <20240528013959.14661-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On almost all ASUS ROG series laptops the MCU used for the USB keyboard
also has a HID packet used for setting the brightness. This is usually
the same as the WMI method. But in some laptops the WMI method either
is missing or doesn't work, so we should default to the HID control.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c                     | 19 ++++++++++++-
 drivers/platform/x86/asus-wmi.c            |  3 ++-
 include/linux/platform_data/x86/asus-wmi.h | 31 ++++++++++++++++++++++
 3 files changed, 51 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 02de2bf4f790..9389a3e733e3 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -101,6 +101,7 @@ struct asus_kbd_leds {
 	unsigned int brightness;
 	spinlock_t lock;
 	bool removed;
+	int report_id;
 };
 
 struct asus_touchpad_info {
@@ -473,7 +474,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
 static void asus_kbd_backlight_work(struct work_struct *work)
 {
 	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
-	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
+	u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
 	int ret;
 	unsigned long flags;
 
@@ -492,12 +493,18 @@ static void asus_kbd_backlight_work(struct work_struct *work)
  */
 static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 {
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 	u32 value;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ASUS_WMI))
 		return false;
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_use_hidraw_led()) {
+		hid_info(hdev, "using hidraw for asus::kbd_backlight\n");
+		return false;
+	}
+
 	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
 				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
 	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
@@ -507,6 +514,12 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+static bool asus_kbd_is_input_led(void)
+{
+	return dmi_match(DMI_PRODUCT_NAME, "GU605")
+	    || dmi_match(DMI_PRODUCT_NAME, "GA403");
+}
+
 static int asus_kbd_register_leds(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
@@ -549,6 +562,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!drvdata->kbd_backlight)
 		return -ENOMEM;
 
+	drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
+		drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
+
 	drvdata->kbd_backlight->removed = false;
 	drvdata->kbd_backlight->brightness = 0;
 	drvdata->kbd_backlight->hdev = hdev;
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3f9b6285c9a6..a58df18a70ad 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1681,7 +1681,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (!kbd_led_read(asus, &led_val, NULL)) {
+	if (!kbd_led_read(asus, &led_val, NULL) && !asus_use_hidraw_led()) {
+		pr_info("using asus-wmi for asus::kbd_backlight\n");
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 3eb5cd6773ad..79a50102440d 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -160,4 +160,35 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 }
 #endif
 
+/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
+#if IS_REACHABLE(CONFIG_ASUS_WMI)
+static bool asus_use_hidraw_led(void)
+{
+	const char *product, *board;
+
+	product = dmi_get_system_info(DMI_PRODUCT_FAMILY);
+	if (!product)
+		return false;
+
+	/* These product ranges should all be using HID for keyboard LED */
+	if (strstr(product, "ROG Zephyrus")
+	|| strstr(product, "ROG Strix")
+	|| strstr(product, "ROG Flow")
+	|| strstr(product, "GA403")
+	|| strstr(product, "GU605"))
+		return true;
+
+	board = dmi_get_system_info(DMI_BOARD_NAME);
+	if (!board)
+		return false;
+
+	return strstr(board, "RC71L"); /* ROG Ally specific */
+}
+#else
+static inline bool asus_use_hidraw_led(void)
+{
+	return true;
+}
+#endif
+
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.45.1


