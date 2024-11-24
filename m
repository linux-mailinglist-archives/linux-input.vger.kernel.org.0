Return-Path: <linux-input+bounces-8222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FE99D781A
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 21:34:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19FF4B22AE3
	for <lists+linux-input@lfdr.de>; Sun, 24 Nov 2024 20:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CAAF1474DA;
	Sun, 24 Nov 2024 20:33:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (cosgizsys.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B538DDB;
	Sun, 24 Nov 2024 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732480435; cv=none; b=UErNh3c/JfwjekKldjUb4xlv0JqsxFTgfE7ijLCpzzAb5JdMdlVEWTpJwEjksD8IA0iBRAII3aIjU43XE2PW+1zpcr0rLt27LZ7GFr2qf7o4ExCxbYNSVDQaDWQgsN/Xy3l/24CzFN9UqI6EJ3MjonNDD0PBtrFQbFrshoPjOZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732480435; c=relaxed/simple;
	bh=XeMBTLgjU3ggDbdTqqDt7m6PRmLjUNm9VnwdTGLe31s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mVaspvty36NpVpSUnqacJgaSa+hoAj8/YBUtNvb0afOqbK5pfokrqo1gQjOgznntMBL9+IGAYbSDX25duuLd+I/ZWKVZA6OFjL2T2Lp+Qm+SToy5/9AnqA4zIMV0xFJIPxwwPB+6jNRIzFLfihNmunMA+tZBGhsqeiD3mp97+xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from terrys-Precision-M4600.hsd1.wa.comcast.net (c-73-190-111-195.hsd1.wa.comcast.net [73.190.111.195])
	by host11.cruzio.com (Postfix) with ESMTPSA id 5579F24246F4;
	Sun, 24 Nov 2024 12:33:52 -0800 (PST)
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
To: Jiri Kosina <jikos@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Wade Wang <wade.wang@hp.com>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	linux-input@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/2] HID: hid-plantronics: Add mic mute mapping and generalize quirks
Date: Sun, 24 Nov 2024 12:32:40 -0800
Message-ID: <20241124203252.28701-2-linuxhid@cosmicgizmosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
References: <20241124203252.28701-1-linuxhid@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added mapping for headset mute key events.

Removed PLT_QUIRK_DOUBLE_VOLUME_KEYS quirk and made it generic.
The quirk logic did not keep track of the actual previous key
so any key event occurring in less than or equal to 5ms was ignored.

Removed PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS quirk.
It had the same logic issue as the double key quirk and was actually
masking the as designed behavior of most of the headsets.
It's occurrence should be minimized with the ALSA control naming
quirk that is part of the patch set.

Signed-off-by: Terry Junge <linuxhid@cosmicgizmosystems.com>
---
 drivers/hid/hid-plantronics.c | 135 ++++++++++++++++------------------
 1 file changed, 65 insertions(+), 70 deletions(-)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index 25cfd964dc25..06f9f3eef61c 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -23,30 +23,34 @@
 
 #define PLT_VOL_UP		0x00b1
 #define PLT_VOL_DOWN		0x00b2
+#define PLT_MIC_MUTE		0x00b5
 
 #define PLT1_VOL_UP		(PLT_HID_1_0_PAGE | PLT_VOL_UP)
 #define PLT1_VOL_DOWN		(PLT_HID_1_0_PAGE | PLT_VOL_DOWN)
+#define PLT1_MIC_MUTE		(PLT_HID_1_0_PAGE | PLT_MIC_MUTE)
 #define PLT2_VOL_UP		(PLT_HID_2_0_PAGE | PLT_VOL_UP)
 #define PLT2_VOL_DOWN		(PLT_HID_2_0_PAGE | PLT_VOL_DOWN)
+#define PLT2_MIC_MUTE		(PLT_HID_2_0_PAGE | PLT_MIC_MUTE)
+#define HID_TELEPHONY_MUTE	(HID_UP_TELEPHONY | 0x2f)
+#define HID_CONSUMER_MUTE	(HID_UP_CONSUMER | 0xe2)
 
 #define PLT_DA60		0xda60
 #define PLT_BT300_MIN		0x0413
 #define PLT_BT300_MAX		0x0418
 
-
 #define PLT_ALLOW_CONSUMER (field->application == HID_CP_CONSUMERCONTROL && \
-			    (usage->hid & HID_USAGE_PAGE) == HID_UP_CONSUMER)
+			   (usage->hid & HID_USAGE_PAGE) == HID_UP_CONSUMER && \
+			   usage->hid != HID_CONSUMER_MUTE)
 
-#define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
-#define PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS BIT(1)
+#define PLT_ALLOW_MUTE (usage->hid == HID_TELEPHONY_MUTE)
 
 #define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
-#define PLT_FOLLOWED_OPPOSITE_KEY_TIMEOUT 220 /* ms */
 
 struct plt_drv_data {
 	unsigned long device_type;
-	unsigned long last_volume_key_ts;
-	u32 quirks;
+	unsigned long last_key_ts;
+	unsigned long double_key_to;
+	__u16 last_key;
 };
 
 static int plantronics_input_mapping(struct hid_device *hdev,
@@ -63,29 +67,34 @@ static int plantronics_input_mapping(struct hid_device *hdev,
 	if (field->application == HID_GD_JOYSTICK)
 		goto defaulted;
 
-	/* handle volume up/down mapping */
 	/* non-standard types or multi-HID interfaces - plt_type is PID */
 	if (!(plt_type & HID_USAGE_PAGE)) {
 		switch (plt_type) {
 		case PLT_DA60:
 			if (PLT_ALLOW_CONSUMER)
 				goto defaulted;
-			goto ignored;
+			if (usage->hid == HID_CONSUMER_MUTE) {
+				mapped_key = KEY_MICMUTE;
+				goto mapped;
+			}
+			break;
 		default:
-			if (PLT_ALLOW_CONSUMER)
+			if (PLT_ALLOW_CONSUMER || PLT_ALLOW_MUTE)
 				goto defaulted;
 		}
+		goto ignored;
 	}
-	/* handle standard types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
-	/* 'basic telephony compliant' - allow default consumer page map */
-	else if ((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
-		 (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) {
-		if (PLT_ALLOW_CONSUMER)
-			goto defaulted;
-	}
-	/* not 'basic telephony' - apply legacy mapping */
-	/* only map if the field is in the device's primary vendor page */
-	else if (!((field->application ^ plt_type) & HID_USAGE_PAGE)) {
+
+	/* handle standard consumer control mapping */
+	/* and standard telephony mic mute mapping */
+	if (PLT_ALLOW_CONSUMER || PLT_ALLOW_MUTE)
+		goto defaulted;
+
+	/* handle vendor unique types - plt_type is 0xffa0uuuu or 0xffa2uuuu */
+	/* if not 'basic telephony compliant' - map vendor unique controls */
+	if (!((plt_type & HID_USAGE) >= PLT_BASIC_TELEPHONY &&
+	      (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) &&
+	      !((field->application ^ plt_type) & HID_USAGE_PAGE))
 		switch (usage->hid) {
 		case PLT1_VOL_UP:
 		case PLT2_VOL_UP:
@@ -95,8 +104,11 @@ static int plantronics_input_mapping(struct hid_device *hdev,
 		case PLT2_VOL_DOWN:
 			mapped_key = KEY_VOLUMEDOWN;
 			goto mapped;
+		case PLT1_MIC_MUTE:
+		case PLT2_MIC_MUTE:
+			mapped_key = KEY_MICMUTE;
+			goto mapped;
 		}
-	}
 
 /*
  * Future mapping of call control or other usages,
@@ -105,6 +117,8 @@ static int plantronics_input_mapping(struct hid_device *hdev,
  */
 
 ignored:
+	hid_dbg(hdev, "usage: %08x (appl: %08x) - ignored\n",
+		usage->hid, field->application);
 	return -1;
 
 defaulted:
@@ -123,38 +137,26 @@ static int plantronics_event(struct hid_device *hdev, struct hid_field *field,
 			     struct hid_usage *usage, __s32 value)
 {
 	struct plt_drv_data *drv_data = hid_get_drvdata(hdev);
+	unsigned long prev_tsto, cur_ts;
+	__u16 prev_key, cur_key;
 
-	if (drv_data->quirks & PLT_QUIRK_DOUBLE_VOLUME_KEYS) {
-		unsigned long prev_ts, cur_ts;
-
-		/* Usages are filtered in plantronics_usages. */
+	/* Usages are filtered in plantronics_usages. */
 
-		if (!value) /* Handle key presses only. */
-			return 0;
+	/* HZ too low for ms resolution - double key detection disabled */
+	/* or it is a key release - handle key presses only. */
+	if (!drv_data->double_key_to || !value)
+		return 0;
 
-		prev_ts = drv_data->last_volume_key_ts;
-		cur_ts = jiffies;
-		if (jiffies_to_msecs(cur_ts - prev_ts) <= PLT_DOUBLE_KEY_TIMEOUT)
-			return 1; /* Ignore the repeated key. */
+	prev_tsto = drv_data->last_key_ts + drv_data->double_key_to;
+	cur_ts = drv_data->last_key_ts = jiffies;
+	prev_key = drv_data->last_key;
+	cur_key = drv_data->last_key = usage->code;
 
-		drv_data->last_volume_key_ts = cur_ts;
+	/* If the same key occurs in <= double_key_to -- ignore it */
+	if (prev_key == cur_key && time_before_eq(cur_ts, prev_tsto)) {
+		hid_dbg(hdev, "double key %d ignored\n", cur_key);
+		return 1; /* Ignore the repeated key. */
 	}
-	if (drv_data->quirks & PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS) {
-		unsigned long prev_ts, cur_ts;
-
-		/* Usages are filtered in plantronics_usages. */
-
-		if (!value) /* Handle key presses only. */
-			return 0;
-
-		prev_ts = drv_data->last_volume_key_ts;
-		cur_ts = jiffies;
-		if (jiffies_to_msecs(cur_ts - prev_ts) <= PLT_FOLLOWED_OPPOSITE_KEY_TIMEOUT)
-			return 1; /* Ignore the followed opposite volume key. */
-
-		drv_data->last_volume_key_ts = cur_ts;
-	}
-
 	return 0;
 }
 
@@ -196,12 +198,16 @@ static int plantronics_probe(struct hid_device *hdev,
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
-		goto err;
+		return ret;
 	}
 
 	drv_data->device_type = plantronics_device_type(hdev);
-	drv_data->quirks = id->driver_data;
-	drv_data->last_volume_key_ts = jiffies - msecs_to_jiffies(PLT_DOUBLE_KEY_TIMEOUT);
+	drv_data->double_key_to = msecs_to_jiffies(PLT_DOUBLE_KEY_TIMEOUT);
+	drv_data->last_key_ts = jiffies - drv_data->double_key_to;
+
+	/* if HZ does not allow ms resolution - disable double key detection */
+	if (drv_data->double_key_to < PLT_DOUBLE_KEY_TIMEOUT)
+		drv_data->double_key_to = 0;
 
 	hid_set_drvdata(hdev, drv_data);
 
@@ -210,29 +216,10 @@ static int plantronics_probe(struct hid_device *hdev,
 	if (ret)
 		hid_err(hdev, "hw start failed\n");
 
-err:
 	return ret;
 }
 
 static const struct hid_device_id plantronics_devices[] = {
-	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3210_SERIES),
-		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES),
-		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3215_SERIES),
-		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3225_SERIES),
-		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3325_SERIES),
-		.driver_data = PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
-					 USB_DEVICE_ID_PLANTRONICS_ENCOREPRO_500_SERIES),
-		.driver_data = PLT_QUIRK_FOLLOWED_OPPOSITE_VOLUME_KEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
 	{ }
 };
@@ -241,6 +228,14 @@ MODULE_DEVICE_TABLE(hid, plantronics_devices);
 static const struct hid_usage_id plantronics_usages[] = {
 	{ HID_CP_VOLUMEUP, EV_KEY, HID_ANY_ID },
 	{ HID_CP_VOLUMEDOWN, EV_KEY, HID_ANY_ID },
+	{ HID_TELEPHONY_MUTE, EV_KEY, HID_ANY_ID },
+	{ HID_CONSUMER_MUTE, EV_KEY, HID_ANY_ID },
+	{ PLT2_VOL_UP, EV_KEY, HID_ANY_ID },
+	{ PLT2_VOL_DOWN, EV_KEY, HID_ANY_ID },
+	{ PLT2_MIC_MUTE, EV_KEY, HID_ANY_ID },
+	{ PLT1_VOL_UP, EV_KEY, HID_ANY_ID },
+	{ PLT1_VOL_DOWN, EV_KEY, HID_ANY_ID },
+	{ PLT1_MIC_MUTE, EV_KEY, HID_ANY_ID },
 	{ HID_TERMINATOR, HID_TERMINATOR, HID_TERMINATOR }
 };
 
-- 
2.43.0


