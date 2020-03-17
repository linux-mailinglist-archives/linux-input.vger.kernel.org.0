Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D0618782D
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 04:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgCQDaD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 23:30:03 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34143 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgCQDaC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 23:30:02 -0400
Received: by mail-qk1-f195.google.com with SMTP id f3so30238248qkh.1
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 20:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GR6efkqNPngclrkGBqzLbxZohiU0wiLL0ybAJHewC+Q=;
        b=sOwJydluF+n36G08kp1fq3ldEqhPxU4OM+P57G9FfgoSURaidFjNg9fBMWMpM22UhF
         oTrm3AxaZyQbaJn90DDZvJV2Jt2+j6H3kvGzaFWdd4QG0rMVCvnp6JWif9tjWA2cditY
         5bFaSUnfCmpAFwdZjJT5TMDHP6dUq5+xu5hzJl7FCSjPfwnik1E29v/tm/80LsuIXco5
         +WzgZj6L8tiFaDiFo2YGtGxG6rcn1gQwukiIvYzXjXIQO3HswA0w/oQc8YhbUR01gyTg
         +BHLYSIETxTCZqZTaaHvdLzoscD63ACysh1b9bFBF2ndU/BZALMAYDAIwqd9oAs/MiaR
         /JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GR6efkqNPngclrkGBqzLbxZohiU0wiLL0ybAJHewC+Q=;
        b=d5tU7grsOlDG9p98wtlv/5Kx2aTEFkC1sbpZfmFNjzutVjBN56MmF2xOHMpc+uZH9s
         Z++Nx13+4fNnJ6FtXeVwAuzICM5jA+59y769INu18aOdSl7BZuJGmLEsyHPiT43fMl9k
         RHw6sJEUHvuFMytLAI62UTrDZgPvxPvs5h3EFUkJVjP495nVuxc5NVCBbMoXWk50Kvdy
         Anj5EJDpxb3eYSbVWsGe8nmov2Zht9pOLzddrB/StuVQpx+w510P/LqyzLXDLxyXRhxb
         hA2f6Wt9ct+0bhINKPzQTMotOiqZJ3sl+KXFQ7esErrm9KNkW7g5R5vgmcOOVNtefH3O
         vyvw==
X-Gm-Message-State: ANhLgQ3IYMikh+kdxI+hjUvAtgJBE0jVGxE6YqnmvWfNEReha6MOGyNL
        OULv7+Uqt/zh9IYEeVkpDIPE+aMtHdo=
X-Google-Smtp-Source: ADFU+vuI6ZqiN6ZmQkRGMLwUfCfk/Syqz5IuZrC0ZPnjMjf355k8XALMRxAih5LA8wHWjE1OgQPrfQ==
X-Received: by 2002:a05:620a:1136:: with SMTP id p22mr2835701qkk.131.1584415801411;
        Mon, 16 Mar 2020 20:30:01 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id t2sm1272264qtp.13.2020.03.16.20.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 20:30:00 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v11 04/11] HID: nintendo: add home led support
Date:   Mon, 16 Mar 2020 22:29:21 -0500
Message-Id: <20200317032928.546172-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200317032928.546172-1-djogorchock@gmail.com>
References: <20200317032928.546172-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds the ability to set the intensity level of the home
button's LED.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 69 +++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index bbce15056c2d..18482f2fe0bf 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -192,7 +192,8 @@ struct joycon_input_report {
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
-	struct led_classdev leds[JC_NUM_LEDS];
+	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
+	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
 
@@ -726,6 +727,40 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
 	return ret;
 }
 
+static int joycon_home_led_brightness_set(struct led_classdev *led,
+					  enum led_brightness brightness)
+{
+	struct device *dev = led->dev->parent;
+	struct hid_device *hdev = to_hid_device(dev);
+	struct joycon_ctlr *ctlr;
+	struct joycon_subcmd_request *req;
+	u8 buffer[sizeof(*req) + 5] = { 0 };
+	u8 *data;
+	int ret;
+
+	ctlr = hid_get_drvdata(hdev);
+	if (!ctlr) {
+		hid_err(hdev, "No controller data\n");
+		return -ENODEV;
+	}
+
+	req = (struct joycon_subcmd_request *)buffer;
+	req->subcmd_id = JC_SUBCMD_SET_HOME_LIGHT;
+	data = req->data;
+	data[0] = 0x01;
+	data[1] = brightness << 4;
+	data[2] = brightness | (brightness << 4);
+	data[3] = 0x11;
+	data[4] = 0x11;
+
+	hid_dbg(hdev, "setting home led brightness\n");
+	mutex_lock(&ctlr->output_mutex);
+	ret = joycon_send_subcmd(ctlr, req, 5);
+	mutex_unlock(&ctlr->output_mutex);
+
+	return ret;
+}
+
 static const char * const joycon_player_led_names[] = {
 	"player1",
 	"player2",
@@ -734,7 +769,7 @@ static const char * const joycon_player_led_names[] = {
 };
 
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct device *dev = &hdev->dev;
@@ -771,7 +806,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			return ret;
 		}
 	}
 
@@ -779,6 +814,32 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
 
+	/* configure the home LED */
+	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
+		if (!name)
+			return ret;
+
+		led = &ctlr->home_led;
+		led->name = name;
+		led->brightness = 0;
+		led->max_brightness = 0xF;
+		led->brightness_set_blocking = joycon_home_led_brightness_set;
+		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
+		ret = devm_led_classdev_register(&hdev->dev, led);
+		if (ret) {
+			hid_err(hdev, "Failed registering home led\n");
+			return ret;
+		}
+		/* Set the home LED to 0 as default state */
+		ret = joycon_home_led_brightness_set(led, 0);
+		if (ret) {
+			hid_err(hdev, "Failed to set home LED dflt; ret=%d\n",
+									ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -1026,7 +1087,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	mutex_unlock(&ctlr->output_mutex);
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.25.1

