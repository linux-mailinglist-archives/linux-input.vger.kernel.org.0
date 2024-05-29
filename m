Return-Path: <linux-input+bounces-3926-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 871D58D29EA
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 03:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0AC71F27445
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 01:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAB4715AD9C;
	Wed, 29 May 2024 01:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="nOadKEtI";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hWb3U2Vd"
X-Original-To: linux-input@vger.kernel.org
Received: from wfhigh7-smtp.messagingengine.com (wfhigh7-smtp.messagingengine.com [64.147.123.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432B215AAD5;
	Wed, 29 May 2024 01:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945904; cv=none; b=dHV6DR86gHvTinC1nfHV23GFrhTP/sN/BxZI8t+TrglKD5i7pDb8LnG59j4IgyO5yqFYAG4AObNJJnFNZH3tDRULQMkQ5XUPMKRrQcemMuUE4TKAeUONrfqUJYYwdkEX60Iy6OV2K7Wr7OnOmowQi3zmq5kAk25M6eB4K2av84M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945904; c=relaxed/simple;
	bh=LDZLCHZzuZFdB9MB2gzeXB2ldjxyM30EyBUTBHEphxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ks297CcRUejt5FCF1YvhR5ixd9OcRSSG9U0bAdwQPYIkY4dkrnOhjOL0eVHr9YqwMFC0u57Et/soM1Enc6KMJEe+DEulQ3Ees37hSaU70vXNUq0ZwNNhRmpiwZ3PGK8vmfGeh0ByDwqj5WtJzhAYYAyO+DHY1+FVKKF3LBYKJq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=nOadKEtI; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hWb3U2Vd; arc=none smtp.client-ip=64.147.123.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 0AA3C180006F;
	Tue, 28 May 2024 21:25:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 28 May 2024 21:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1716945901; x=
	1717032301; bh=LNipYAkSRLIdv0+aK0KD7aPesVOUo+kH+La70D2FdvE=; b=n
	OadKEtI9dfN8TrSk4rPnGFSIm5ymCm0TmEE1vyb/P2ebMW3Z039PTjP0MsyFNWLG
	TgSWgyhlayjTejTYMoK0blm6gEw/dFwqhVTz5JJI5I9t3Hy/fnrRtcCXZmZCxb1y
	dCju55qrNppAJV0OAstM4pygPm2O6+VmLsPyiRIFH/LmevxZJE3hph9BnNKIq7K6
	Qz5CY0PPoo/V8zjORi02PNEXeUwD5Qgu4U85LxAnsmxxqa5RRpiHSTsqstChgA6y
	bw1zqtiMrE1cs7ZIsTRAdHeXohp6Lp4RTahy8F9FFFTke2uIRiZMcAqXFdfTLNnV
	BNo8FSbOMSLJ0fOk3Yh+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716945901; x=
	1717032301; bh=LNipYAkSRLIdv0+aK0KD7aPesVOUo+kH+La70D2FdvE=; b=h
	Wb3U2VdjNW2q4ilXZm6OhRujqENsb1qXu+rKMi9yOsJJwjwr7Lc3bFFgY6cTLNGC
	ORD+Xfds8prs/9MwNdmWvPOlQUJXNInh/z10sFNr+B7gl6Iq7f2/WDugwcmNTscW
	kPS4TMFgTQ2HA/svEpvEfH+I6fqQi/DW5GxUDlaJR2Sah7GCetrUlKVJ86gUV5QS
	4J1C5DtCgzzIJLvgz5HJ6sPAsuPCKsgk8Bcb0DC+amOSgi63uCt1in65sBR+cOgV
	DT8jyGEjSKFh8C1lIqDZaO59BJMP6us3zmPkNs3iJGxS/XgKuQo92dGFJIpmPIdX
	gOC5Qt74h/e8kwT+EFjbQ==
X-ME-Sender: <xms:7YNWZrAzUScn_LHtiIsG15ngo4VlMTPcSO9GejXsj7hrdlbM5-Wo2g>
    <xme:7YNWZhg-OUBQcImYsZp-dyO6_7kbl0CatRkL8rfvsZAhsMd1FBbEv90wjfVp2K9Q4
    K1nBVGph5tWWsFM5nY>
X-ME-Received: <xmr:7YNWZmlYqcuzlqbsTuOlmiP-U9NP3cvT3oLJQoSgokKHaXL6cPtji_muzJsM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejledggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfedugfetudeuheetjefhue
    fggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:7YNWZtxmOLCwM1FADRWkXF0rGS3cf0S0TSJryFWWiNs48uIXPVOCoA>
    <xmx:7YNWZgQ4gYvBSYRYitlXODypwNCpHzwogNRyUF0vV8PsECGvPViZog>
    <xmx:7YNWZgYO7xqQIChca8alO2H8zFZaPq4fTAmb_aruM6KMaxehUn-lQg>
    <xmx:7YNWZhTuh9LTW-3QKA5pTLyKAKWGm5UDFk_xdN71v2Df61M8IiPHxw>
    <xmx:7YNWZjEt86-hcEwH1qtFsIN5oK0JxIcyAHVWNjUjduRZ6McnDh7kk3he>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 May 2024 21:24:57 -0400 (EDT)
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
Date: Wed, 29 May 2024 13:24:47 +1200
Message-ID: <20240529012447.145088-2-luke@ljones.dev>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529012447.145088-1-luke@ljones.dev>
References: <20240529012447.145088-1-luke@ljones.dev>
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


