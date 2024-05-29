Return-Path: <linux-input+bounces-3928-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9CF8D29FA
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56EDE1F2696A
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC93215ADB1;
	Wed, 29 May 2024 01:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="E4lEuxj9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bXDf8oD/"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5BA15AD96;
	Wed, 29 May 2024 01:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946123; cv=none; b=EqsV14iYkDxnnvYXLMoInSuqur825Z+qQTLGIZe9o5+N3vcE6RlNUP4j9+/vAIQtN0NNyLAj5+NsQbwLPbUzqu4n7hxFkS0h/6GTTs+mMPl/EXEJ42TsEou2/McEWSTn+SKpjRf3G/7iZ9o/0EX6IlBWpv0pwgRNEjvKF/HFp7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946123; c=relaxed/simple;
	bh=EVmfaLLDsfMymrtcoYmdakMrtp5jtmrZeC5/eg/2iAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNRdW4EpaPHwAwvx3W88KRszuBFMXfuYFOmyUhFFyOI2WFLbdYZTuTN3moQj1aPU+Ng3WG9LtKusP1g4xWtcIr9TUSJPhyhSqmfQAKVk0agMfU0W+PFF8ufXGlwrwSFGye7jHhfB0scEG1lcC5lsYXEpjKimQ1e6P0UCC85vFdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=E4lEuxj9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bXDf8oD/; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 242E41800189;
	Tue, 28 May 2024 21:28:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 28 May 2024 21:28:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1716946120; x=
	1717032520; bh=VnB5cSkzbTE+pF/YZXsLRqgiA9IkyhO++Upx0eRciEg=; b=E
	4lEuxj9bOLEeE2Y8OaOFbVJjSm03sKdbVK9fcJCIAoCqhhpeHCeHAadEoL/DNaKw
	OfGzOyfy/NtVWSAL+xYrtNf95ro0XfZ48feWk3c+vA+RCQuWzuMM1T4RIsuuYLDT
	y/KYFqtYNDRDa6QI/7XuWJ6MoreIcKuGKVfSmbE3jxkO8teWe5H6Pggn4gH3NlG3
	bWJjcaOcjGzZjkaaW6AUul+gjbccrAJKO+Pea5fZ9JDdVXWWAHb8/3s68bwkcHR1
	xNKuzSl7CjHDlcKljmPKWrIBSQRCHXCNNscCrb6ibBBXy78Z5Va2Cs4UotGa2jJ8
	+eD2LcLbRyhpw3pYbCuVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716946120; x=
	1717032520; bh=VnB5cSkzbTE+pF/YZXsLRqgiA9IkyhO++Upx0eRciEg=; b=b
	XDf8oD/73qfS/QbF/IGkuRqQL+ajF/saBdKFh/rVdjdbisZkCwQSpsSNGf9jUxmq
	JRF7WFZSLowVkg0MhFXlbSyWpzQQBB+KsCJGKguf9DE9memgoy9VMikRawlQpOdR
	y4dM7poZ3wb9a2LPKk+IOZMebN2WRNVUseArF/cJdbdLF3R6L9BVYBV8Ucme1qo4
	FEcTi7JTnN45HREHtqry96K+mgdT9bAxfzWjHh9N31dhmWFneGXJMve30W771Wkd
	6eUJD01MnLo7+bu9Qk9dI/TDK3ZPVUo7esVoFic9VvR50iBiIzQnAFgFapr56TWT
	NJQ/dX92jrFx3w/9zaPIw==
X-ME-Sender: <xms:yIRWZipA3_BelaQwa0GT6uJKXy10ahEReIe9auq5PBa2tTVvSva0fg>
    <xme:yIRWZgoqYv38MbefYJ7eN_IfSI99WgmNnULCvCBKTxashGwoj7WKsBua7FC2bmJ0w
    udNvkqqiVeCIYIxTKE>
X-ME-Received: <xmr:yIRWZnM6KXlONxxYEi-zl-5Lpfmm34cfpOD_sALeYOMOfPekpLB3t5dYZo3R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgepuden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:yIRWZh6h-IEiw1W93EyD9Y0IkX0f9lfuF7kNFtQHp-uXbcx_27q9Ew>
    <xmx:yIRWZh5SiX9zikx77KEJ2ywio6V9vN9JPZhEdUsco6AO0bv0iJknmw>
    <xmx:yIRWZhiHzeXJnuPCxf-xUzHvJeSjMCZEw1AIyh34TpX9QNkAEf4ycg>
    <xmx:yIRWZr6mn0w8FubSWByNj0sWQSbtVFAZzo4PDMgDWCxKmqRgby7s-w>
    <xmx:yIRWZrult-kTZxzzldJ1NOqvKLgxNRWToPgoARvG2xcoiIjbpTjd3EqW>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 21:28:37 -0400 (EDT)
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
Subject: [PATCH v1 1/2] hid-asus: use hid for brightness control on keyboard
Date: Wed, 29 May 2024 13:28:26 +1200
Message-ID: <20240529012827.146005-2-luke@ljones.dev>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529012827.146005-1-luke@ljones.dev>
References: <20240529012827.146005-1-luke@ljones.dev>
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
 drivers/hid/hid-asus.c                     |  6 ++++
 drivers/platform/x86/asus-wmi.c            | 35 +++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h | 10 +++++++
 3 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 02de2bf4f790..4cba8e143031 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -492,12 +492,18 @@ static void asus_kbd_backlight_work(struct work_struct *work)
  */
 static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 {
+	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
 	u32 value;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ASUS_WMI))
 		return false;
 
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_use_hid_led()) {
+		hid_info(hdev, "using HID for asus::kbd_backlight\n");
+		return false;
+	}
+
 	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
 				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
 	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3f9b6285c9a6..54cb07c79fcf 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -144,6 +144,15 @@ module_param(fnlock_default, bool, 0444);
 
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
+static const char * const use_hid_led_matches[] = {
+	"ROG Zephyrus",
+	"ROG Strix",
+	"ROG Flow",
+	"GA403",
+	"GU605",
+	"RC71L",
+};
+
 static int throttle_thermal_policy_write(struct asus_wmi *);
 
 static bool ashs_present(void)
@@ -1642,6 +1651,29 @@ static int micmute_led_set(struct led_classdev *led_cdev,
 	return err < 0 ? err : 0;
 }
 
+bool asus_use_hid_led(void)
+{
+	const char *product, *board;
+	int i;
+
+	product = dmi_get_system_info(DMI_PRODUCT_FAMILY);
+	if (!product)
+		return false;
+
+	board = dmi_get_system_info(DMI_BOARD_NAME);
+	if (!board)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(use_hid_led_matches); i++) {
+		if (strstr(product, use_hid_led_matches[i]))
+			return true;
+		if (strstr(board, use_hid_led_matches[i]))
+			return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL_GPL(asus_use_hid_led);
+
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
 	led_classdev_unregister(&asus->kbd_led);
@@ -1681,7 +1713,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (!kbd_led_read(asus, &led_val, NULL)) {
+	if (!kbd_led_read(asus, &led_val, NULL) && !asus_use_hid_led()) {
+		pr_info("using asus-wmi for asus::kbd_backlight\n");
 		asus->kbd_led_wk = led_val;
 		asus->kbd_led.name = "asus::kbd_backlight";
 		asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 3eb5cd6773ad..6833035f7006 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -160,4 +160,14 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 }
 #endif
 
+/* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
+#if IS_ENABLED(CONFIG_ASUS_WMI)
+bool asus_use_hid_led(void);
+#else
+static inline bool asus_use_hid_led(void)
+{
+	return true;
+}
+#endif
+
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.45.1


