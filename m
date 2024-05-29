Return-Path: <linux-input+bounces-3925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CA38D29E8
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ADE9285B83
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D7715A850;
	Wed, 29 May 2024 01:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="WghErmoU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G/Duu+4L"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F99632;
	Wed, 29 May 2024 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945899; cv=none; b=h3Llanbiw0AOkQh23whcjdBUenzLcQ9boPojCFWFfXlvtdrHPf4eKmeddGnuhQijIXOMFM9t6vRBORkDM2Dx3smUGjwOxH57b57Qk8AiPe/XppsojEBK6hkvBdQH3ntRsY7dpV0v+vinYXwJOIAj8vFSDTZzmQbNpjIe5cy0XRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945899; c=relaxed/simple;
	bh=EVmfaLLDsfMymrtcoYmdakMrtp5jtmrZeC5/eg/2iAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ax7L6ON4XL5N8n9Q3tgnmYkE7x1IK39iFFwIExEp5VJLfk1wWA1giKmgfvWdoZ9bBPgZ0deN6tZZdHeVhaf6L+cMm05+0bHAKFrhZBK7Wqif4wwDqmflTzl6MLQGUOaz485IXD58LcAzmfDwm2kF1kwdNJoOa5txpyPhwTiLTYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=WghErmoU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G/Duu+4L; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.west.internal (Postfix) with ESMTP id DB308180018D;
	Tue, 28 May 2024 21:24:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 28 May 2024 21:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1716945896; x=1717032296; bh=VnB5cSkzbTE+pF/YZXsLR
	qgiA9IkyhO++Upx0eRciEg=; b=WghErmoUO5OnWBFlnv0okHrkrVGQUExFb7Phi
	dKVRTr0GDSg5REJyfYT1M5KZ3cAYWJISneGdLH8rSJumsrCvy9uh88fGe4MT/CLE
	6K1Bsi1PZx5exAVWFlOmPC6T4B6FG/fQHirawrFsfKOu8y/73+q9la0GLyFGqyG1
	BPtdopstVcTRiTSlAVWrcBNqT7+zzPPzzYzTUlNiT3O0eLCWnrKl66HguhiovyWU
	HQnSM0hVPPVLOBnF25UjuH6pA2nJzxQEvOWoEHKkqiP9s2sHX103VAT4yn2Rh61G
	nY7t/zKh+qWgnZqR+ajlFEX5aKXoN7+qNOe41P0yqVhSh73rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716945896; x=1717032296; bh=VnB5cSkzbTE+pF/YZXsLRqgiA9Ik
	yhO++Upx0eRciEg=; b=G/Duu+4LHTF1BLs8GagnWEk0fbQdmDsmhnL5GzcQPf9V
	yTB2nHY0zvjAuz2yWvqzOmqBtbZgs1AutN7D4q6QBT/B65z0XPo9A13UDBmx4u2y
	TMdmKujWElSvzDYIkSYg3HxCXufF8SomSPKkzydD1QeSYsQFvEcS+gWWnlekgekt
	Fb53Nj8SZpxzbjEISNF6HbAhdG+ugzXeor1DltBADIMU18cqqht4nK8zf4ByccET
	DlNz++cm77FLAAwbraYUKQ+IYVyEASVsPa03j8MKaLlv3PdSV7y3QyRjntSamb7k
	LTDD/sAX2fhL3xeHgsGzLp7BpDxiT9gPXlYVj6HlMQ==
X-ME-Sender: <xms:6INWZmvwAYxE0aRYaMR-Oym6E2rp_ZMPvVyqsXws3YpCv38pF_jN0w>
    <xme:6INWZrebbQ8Wr3ZMe_PeTbBtNx1FeNzhTfnCF3jdUibdS86dpR9zfgOQOWDb4D_xl
    SxRSnnhlRZnQ6IWTYw>
X-ME-Received: <xmr:6INWZhwPpkFxV4L0Lxr6wscSPfldFzO5EjU9ucF34f8X-XSAu6GHknyvcXXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:6INWZhMD-5_dLV6VHikbV4nviiEAPpKPIdnRnFvboP3Dkc9XzR6FHg>
    <xmx:6INWZm8lay5x7XFknHmTohIyu8mEKT6YoqbgDw5Za3b_KWYFybWWaA>
    <xmx:6INWZpVGe0wuwKH9-Y4-xulhlLdk4cY6_pVGaf7ATW2YSArqFkuHcg>
    <xmx:6INWZvd84AvJZh7Wujs2iuE2MCadYlcvw19niUsIZEt_Wu3LqMaw0A>
    <xmx:6INWZqT2poc2frppQFVuSXmdjJN2kyB2yt_o1rKJEBxFANHQvu9188fR>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 21:24:52 -0400 (EDT)
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
Date: Wed, 29 May 2024 13:24:46 +1200
Message-ID: <20240529012447.145088-1-luke@ljones.dev>
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


