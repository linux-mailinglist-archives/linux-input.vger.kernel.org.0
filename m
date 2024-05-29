Return-Path: <linux-input+bounces-3929-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 621488D29FC
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 180F82895F8
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0530615B0F6;
	Wed, 29 May 2024 01:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="iBEF5K+l";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KxqS8xZ+"
X-Original-To: linux-input@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821DA15B0EE;
	Wed, 29 May 2024 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716946128; cv=none; b=KfDqJcJZR9lIKWaVL/yVC1xaxnKAJ1T/7jxfqQSxUVbwwGcWcgrEgoEzS8uGhmDC6jegLnNwArvCtS+ld7VqMZII9jSKlirSbB9LG7ASwNuH27yv/AmDFB6laqBhmJijzszJ5y1QyiZlXsOP9KkderJ8da+KFy/EJWQBGPLkbxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716946128; c=relaxed/simple;
	bh=LDZLCHZzuZFdB9MB2gzeXB2ldjxyM30EyBUTBHEphxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEKT+3+leIFDzeuBhREe9efka5+IYVS2f2pc5+7xlsX/+YLVOcxCGuZLUYyoN34CmHlgSchS0mBklIRmrWSiwsSpmLRm8GjqcCd1E3dVMvBp+kvQ3SuQ9ErXZGZwkseXFGzi+4VqjXbwDrEaCo/KBlTDJ9cbLCqpToMN/fDY5wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=iBEF5K+l; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KxqS8xZ+; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.west.internal (Postfix) with ESMTP id 3CD511C000F6;
	Tue, 28 May 2024 21:28:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 28 May 2024 21:28:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1716946125; x=
	1717032525; bh=LNipYAkSRLIdv0+aK0KD7aPesVOUo+kH+La70D2FdvE=; b=i
	BEF5K+lImWFXNvL3XvfT8sdACcTIfn67z9Rrh5LJgkOdTmEKXDXWZS2jZ2dVWybg
	NYU9rvIrW+LYKmzd1OOEizR2xY+jwpBjXHw5oCCzWoGwggY1c83heADkPppOgrjX
	rxKIwkNvY99+9CvX6YvmlL1dG1e4Fq+xCW7WOnxXKCihtpavQeABrc5UNzoiqF0/
	DCiXfQy5d1nyIJ06gl//IUZHLU0X5m6vHzMVxvBFN7q3N7pd0c6UdTLe3fjlfuBf
	XlgqeCq8+kt/VfvHC1tBx4Wm37Ll9hzmTzKEBjuqERShjvfu0QD9TkzdjEN+uo43
	X6yWxZLrgwTzOJ6XFhONw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716946125; x=
	1717032525; bh=LNipYAkSRLIdv0+aK0KD7aPesVOUo+kH+La70D2FdvE=; b=K
	xqS8xZ+x6kb8uQlUJzSWcceRFdI/8pD/sxM61py/i74w3eaGnC3ajekCQVGRN0Cm
	OVF00g9xvv7uVYWSw4u1D0uG2MXzPqJ3kA0jpdsnFV+Ae7q/cqJGyD4u9UX4rX4+
	eArOLYoAnKaYTIKHxJMNCEeBx+DFTOYZ4C2urMKeOfeNHZkMbw2TW6iJrTJ1Jomx
	WzB2zScTng4XK/mI2mnT4t5CmYQUWCPEpYtlb5aNdnSpC+Q+fK13K/TNoFeS1dY+
	fFxQUdNOeqimWkvQ40Hfnw6vd7APxHbQF0fLG+rxl7n6KbZ0fNFxX3RVQIjQiSAe
	21UCFI1rFEn3h+ediL7hg==
X-ME-Sender: <xms:zYRWZm-dKTvbhgh15Lw9szovBr7y3vznXULVD_2jbJyZvhK3eKza-g>
    <xme:zYRWZmvec0CWuUZu66L4ZvlnqOcURDhpptp5DJSzzCZg4XWozFS6mB9usRsz0GTwN
    2J5p4eYIsjIA-PgaiI>
X-ME-Received: <xmr:zYRWZsAtLleBeIH1ydKgxxBgqT8SEkLkKxlsH7H7OuP__cKl00a9RMeOImIv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:zYRWZudmp43GWpHBBr5xezzvyNfKMXZUqmAknmtnXHN6weCAiSfSJA>
    <xmx:zYRWZrMe8iHsGS3qxukmrpA164Vo60o6T__5h8B874j8-dWq0TXokw>
    <xmx:zYRWZomAlgPF0Z3z8ZOQ6O2UzbO1VztHWmZt_MhXBaJGaUZer4MYUg>
    <xmx:zYRWZttheX0b2xCU5SuZW-OHhfiG9Bt7wp-RqCfBn5Fsg9jBNSluaw>
    <xmx:zYRWZkgGxHHuEz06kHeEkah4ZaHVPnd94Oe_d6q08LGmtlPfN_kR8EIt>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 21:28:42 -0400 (EDT)
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
Subject: [PATCH v1 2/2] hid-asus: change the report_id used for HID LED control
Date: Wed, 29 May 2024 13:28:27 +1200
Message-ID: <20240529012827.146005-3-luke@ljones.dev>
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

On some laptops the report_id used for LED brightness control must be
0x5D instead of 0x5A.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/hid/hid-asus.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 4cba8e143031..ec3556cc4eef 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -94,6 +94,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
 
 #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
 
+static const char * const use_alt_led_report_id[] = { "GU605", "GA403" };
+
 struct asus_kbd_leds {
 	struct led_classdev cdev;
 	struct hid_device *hdev;
@@ -101,6 +103,7 @@ struct asus_kbd_leds {
 	unsigned int brightness;
 	spinlock_t lock;
 	bool removed;
+	int report_id;
 };
 
 struct asus_touchpad_info {
@@ -473,7 +476,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
 static void asus_kbd_backlight_work(struct work_struct *work)
 {
 	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
-	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
+	u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
 	int ret;
 	unsigned long flags;
 
@@ -513,6 +516,23 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
 	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
 }
 
+static bool asus_kbd_is_input_led(void)
+{
+	const char *product;
+	int i;
+
+	product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (!product)
+		return false;
+
+	for (i = 0; i < ARRAY_SIZE(use_alt_led_report_id); i++) {
+		if (strstr(product, use_alt_led_report_id[i]))
+			return true;
+	}
+
+	return false;
+}
+
 static int asus_kbd_register_leds(struct hid_device *hdev)
 {
 	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
@@ -555,6 +575,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 	if (!drvdata->kbd_backlight)
 		return -ENOMEM;
 
+	drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
+		drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
+
 	drvdata->kbd_backlight->removed = false;
 	drvdata->kbd_backlight->brightness = 0;
 	drvdata->kbd_backlight->hdev = hdev;
-- 
2.45.1


