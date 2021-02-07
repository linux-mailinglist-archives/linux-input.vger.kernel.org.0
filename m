Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4685D3124D5
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 15:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229752AbhBGOtW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 09:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbhBGOtU (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 7 Feb 2021 09:49:20 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B850C061788;
        Sun,  7 Feb 2021 06:48:40 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id a1so14078661wrq.6;
        Sun, 07 Feb 2021 06:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BqckfrsML2GBf51tQxDktXn1rf1aCAw97+iuGvoYrU=;
        b=ii6+OfbyFYX7w/6SCw9ShkxQRF8j6hEYOL+zdWvUx754o+/X1BWGSPfcu7qkDZbFpY
         jP4zNZnLUX5+YHpknamRWyITZzHzD7LpGH3CRsWZhD1UyCzwUAQIkLEyiBf8oHcysyIj
         CEkkOl/rCXMIQ75Qst0DwAQYyG+657lXR/aZGotRiCv2FOAzwjeOcbaC+eHJLxpgN0nk
         St/vRIcwICGuPq3q9Kno4eL+LR6kIuOobxsOUtVwveVJzXNtFhBl4dsc86d7EuAcOujj
         ZEdyS3UVwTA7AVkWkeamD45hqfzXqa7ijeIl1V/sSUoHuWsWZb6HmONO81gEJDhBlNFA
         WV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7BqckfrsML2GBf51tQxDktXn1rf1aCAw97+iuGvoYrU=;
        b=GKOJc1QrCO/1I4hBMMzsv3GUKbbOHYGUqqtxZF463YgAmTgxKW3mds+iWYtP4UtcnI
         6HrjDxmWepNdT3uxIOHz6QwtByfR/m30u/KTdTdMHqCYJRylc9KMzKeW/K2IdE2f4cS7
         y4GP5qyNaYntnwuoPqo6H8eh9zTMqbrkvJWZRCv5Q4Xxc00nofVBctjdm7/1srNhB1SM
         8nvLTYaQdyVnfwOZ5ljwmqqGKZ+Wgn3N2+qayHfIlTaExDvoX6aa/A3IYEr7Rhj7ye2M
         CQdp9tJWsMDDstiEcj/y5jb4IJC+fTer6kDqflLBLDmjO4U7k13zX026kh+F7vyOcEBA
         6Kog==
X-Gm-Message-State: AOAM5310aJS+lJln4Pw1vqefIiVGBBhMcqf8AUazLouFN7nm8KqlNRZd
        grTD064oV0yJRTBBUMdfh6s=
X-Google-Smtp-Source: ABdhPJzqmUOB0AKWfAYA3ZcJIsBiWGa8CPbn/5V8tqKx7wufmIM1QDbELvpc8CBF9UruRTa5pBf6VA==
X-Received: by 2002:adf:9226:: with SMTP id 35mr15617024wrj.408.1612709318760;
        Sun, 07 Feb 2021 06:48:38 -0800 (PST)
Received: from warrior.lan ([2a03:7380:2407:423c:abcd:a480:34c9:3d94])
        by smtp.gmail.com with ESMTPSA id n15sm21946388wrx.2.2021.02.07.06.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 06:48:37 -0800 (PST)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Terry Junge <terry.junge@plantronics.com>,
        JD Cole <jd.cole@plantronics.com>, JD Cole <jd@jdc.me>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH] HID: plantronics: Workaround for double volume key presses
Date:   Sun,  7 Feb 2021 16:47:40 +0200
Message-Id: <20210207144740.6238-1-maxtram95@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Plantronics Blackwire 3220 Series (047f:c056) sends HID reports twice
for each volume key press. This patch adds a quirk to hid-plantronics
for this product ID, which will ignore the second volume key press if
it happens within 5 ms from the last one that was handled.

The patch was tested on the mentioned model only, it shouldn't affect
other models, however, this quirk might be needed for them too.
Auto-repeat (when a key is held pressed) is not affected, because the
rate is about 3 times per second, which is far less frequent than once
in 5 ms.

Fixes: 81bb773faed7 ("HID: plantronics: Update to map volume up/down controls")
Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
People from Plantronics, maybe you could advise on a better fix than
filtering duplicate events on driver level? Do you happen to know why
they occur in the first place? Are any other headsets affected?

 drivers/hid/hid-ids.h         |  1 +
 drivers/hid/hid-plantronics.c | 60 +++++++++++++++++++++++++++++++++--
 include/linux/hid.h           |  2 ++
 3 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 5ba0aa1d2335..5ac52b4d900d 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -937,6 +937,7 @@
 #define USB_DEVICE_ID_ORTEK_IHOME_IMAC_A210S	0x8003
 
 #define USB_VENDOR_ID_PLANTRONICS	0x047f
+#define USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES	0xc056
 
 #define USB_VENDOR_ID_PANASONIC		0x04da
 #define USB_DEVICE_ID_PANABOARD_UBT780	0x1044
diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index 85b685efc12f..e81b7cec2d12 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -13,6 +13,7 @@
 
 #include <linux/hid.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 
 #define PLT_HID_1_0_PAGE	0xffa00000
 #define PLT_HID_2_0_PAGE	0xffa20000
@@ -36,6 +37,16 @@
 #define PLT_ALLOW_CONSUMER (field->application == HID_CP_CONSUMERCONTROL && \
 			    (usage->hid & HID_USAGE_PAGE) == HID_UP_CONSUMER)
 
+#define PLT_QUIRK_DOUBLE_VOLUME_KEYS BIT(0)
+
+#define PLT_DOUBLE_KEY_TIMEOUT 5 /* ms */
+
+struct plt_drv_data {
+	unsigned long device_type;
+	unsigned long last_volume_key_ts;
+	u32 quirks;
+};
+
 static int plantronics_input_mapping(struct hid_device *hdev,
 				     struct hid_input *hi,
 				     struct hid_field *field,
@@ -43,7 +54,8 @@ static int plantronics_input_mapping(struct hid_device *hdev,
 				     unsigned long **bit, int *max)
 {
 	unsigned short mapped_key;
-	unsigned long plt_type = (unsigned long)hid_get_drvdata(hdev);
+	struct plt_drv_data *drv_data = hid_get_drvdata(hdev);
+	unsigned long plt_type = drv_data->device_type;
 
 	/* special case for PTT products */
 	if (field->application == HID_GD_JOYSTICK)
@@ -105,6 +117,30 @@ static int plantronics_input_mapping(struct hid_device *hdev,
 	return 1;
 }
 
+static int plantronics_event(struct hid_device *hdev, struct hid_field *field,
+			     struct hid_usage *usage, __s32 value)
+{
+	struct plt_drv_data *drv_data = hid_get_drvdata(hdev);
+
+	if (drv_data->quirks & PLT_QUIRK_DOUBLE_VOLUME_KEYS) {
+		unsigned long prev_ts, cur_ts;
+
+		/* Usages are filtered in plantronics_usages. */
+
+		if (!value) /* Handle key presses only. */
+			return 0;
+
+		prev_ts = drv_data->last_volume_key_ts;
+		cur_ts = jiffies;
+		if (jiffies_to_msecs(cur_ts - prev_ts) <= PLT_DOUBLE_KEY_TIMEOUT)
+			return 1; /* Ignore the repeated key. */
+
+		drv_data->last_volume_key_ts = cur_ts;
+	}
+
+	return 0;
+}
+
 static unsigned long plantronics_device_type(struct hid_device *hdev)
 {
 	unsigned i, col_page;
@@ -133,15 +169,24 @@ static unsigned long plantronics_device_type(struct hid_device *hdev)
 static int plantronics_probe(struct hid_device *hdev,
 			     const struct hid_device_id *id)
 {
+	struct plt_drv_data *drv_data;
 	int ret;
 
+	drv_data = devm_kzalloc(&hdev->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
+		return -ENOMEM;
+
 	ret = hid_parse(hdev);
 	if (ret) {
 		hid_err(hdev, "parse failed\n");
 		goto err;
 	}
 
-	hid_set_drvdata(hdev, (void *)plantronics_device_type(hdev));
+	drv_data->device_type = plantronics_device_type(hdev);
+	drv_data->quirks = id->driver_data;
+	drv_data->last_volume_key_ts = jiffies - msecs_to_jiffies(PLT_DOUBLE_KEY_TIMEOUT);
+
+	hid_set_drvdata(hdev, drv_data);
 
 	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT |
 		HID_CONNECT_HIDINPUT_FORCE | HID_CONNECT_HIDDEV_FORCE);
@@ -153,15 +198,26 @@ static int plantronics_probe(struct hid_device *hdev,
 }
 
 static const struct hid_device_id plantronics_devices[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS,
+					 USB_DEVICE_ID_PLANTRONICS_BLACKWIRE_3220_SERIES),
+		.driver_data = PLT_QUIRK_DOUBLE_VOLUME_KEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_PLANTRONICS, HID_ANY_ID) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, plantronics_devices);
 
+static const struct hid_usage_id plantronics_usages[] = {
+	{ HID_CP_VOLUMEUP, EV_KEY, HID_ANY_ID },
+	{ HID_CP_VOLUMEDOWN, EV_KEY, HID_ANY_ID },
+	{ HID_TERMINATOR, HID_TERMINATOR, HID_TERMINATOR }
+};
+
 static struct hid_driver plantronics_driver = {
 	.name = "plantronics",
 	.id_table = plantronics_devices,
+	.usage_table = plantronics_usages,
 	.input_mapping = plantronics_input_mapping,
+	.event = plantronics_event,
 	.probe = plantronics_probe,
 };
 module_hid_driver(plantronics_driver);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index c39d71eb1fd0..6bf6feb3db7c 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -262,6 +262,8 @@ struct hid_item {
 #define HID_CP_SELECTION	0x000c0080
 #define HID_CP_MEDIASELECTION	0x000c0087
 #define HID_CP_SELECTDISC	0x000c00ba
+#define HID_CP_VOLUMEUP		0x000c00e9
+#define HID_CP_VOLUMEDOWN	0x000c00ea
 #define HID_CP_PLAYBACKSPEED	0x000c00f1
 #define HID_CP_PROXIMITY	0x000c0109
 #define HID_CP_SPEAKERSYSTEM	0x000c0160
-- 
2.30.0

