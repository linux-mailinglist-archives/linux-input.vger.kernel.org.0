Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE74D3284D
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 08:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfFCGHF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 02:07:05 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:36385 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfFCGHF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 02:07:05 -0400
Received: by mail-it1-f193.google.com with SMTP id e184so24817449ite.1
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2019 23:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nO8qlp1xmFDWvWq2hLNpoTlLB8eehpeYZvBpdFW5WME=;
        b=V9MW/smokPzEwD1LwOgMnITsDModbFsqYXf040+/DoTvbXsiiO36dK2nguNDLfLF9K
         WO9z2yyALDYCYD21abuqx4q7ZIzAmbQqAzIHVADx/ghWvOkxPDc/psNoZM5Tq3kUMzxH
         I4TnWvQJSIsobBhmBapT/TM8/b8lG23uxWIhyePUPW7tpSFA8hNHD/FtH+7zXrXXaqx8
         pXYmkGzPNt4VHj6M2/M7rdhrsjvHT55hU0ymIOvaL9VKrseXPzmAOrTBvqJt3wUsO4oT
         HpkVJZ1QJjnI2si/dKZOwUxiRgB8IGqYMIZlsa1Osdx4crbrnOm4JFLUGmTQagmUWtMm
         rEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nO8qlp1xmFDWvWq2hLNpoTlLB8eehpeYZvBpdFW5WME=;
        b=uAgSIbGu75BESEmqhSlvL1WefX8ckg79bt2T7DW1mTCYTch1azKTrsoNdh5roHlRIQ
         OafuNhkYqZNAeRGDVn2PX82X4KdZkuMQWsahZI5/Fzw1OMnHCkP6vpOWGUNIYNXz/msK
         dxlgZWaaxVTpm6ncasPb2kbEY7Qeqt6UjFNO5YSePBiIjXyaWQncJhUlRnW+unVHOmf7
         dmIPWPVhJu2jqhhSKaP7DrCDo/LHypM2OU9tzBaZ8RfFRvkPQR8IwzQLdKSqaer67nfS
         Snbp+QjWVx5VkDLFJs+xOtdZBgXr4MVDuCF5zQjQoYiIjZNEl34MgX9U0Skn2uRWYO3k
         p3qw==
X-Gm-Message-State: APjAAAWbQJDf3qp67kNXeG6UNHakW8wc8G9RaFEkGbYy6yHr38iUm/GL
        PqGdmi54i6NWxQdTGCozn33ZV08lZKfycw==
X-Google-Smtp-Source: APXvYqy//pyrmfZF2wIaSetnxUVJ/TfhUuF94bGPeMbXjTd+EVwtIW379CBhU41TYWTUUTu/1bYINQ==
X-Received: by 2002:a24:4648:: with SMTP id j69mr16922196itb.103.1559542023839;
        Sun, 02 Jun 2019 23:07:03 -0700 (PDT)
Received: from localhost.localdomain ([136.61.179.39])
        by smtp.gmail.com with ESMTPSA id 14sm6124808itl.1.2019.06.02.23.07.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 23:07:03 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v5 4/5] HID: joycon: add home led support
Date:   Mon,  3 Jun 2019 01:06:43 -0500
Message-Id: <20190603060644.10338-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603060644.10338-1-djogorchock@gmail.com>
References: <20190603060644.10338-1-djogorchock@gmail.com>
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
 drivers/hid/hid-joycon.c | 79 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
index 0b2cba2a604c..277d706ce5f8 100644
--- a/drivers/hid/hid-joycon.c
+++ b/drivers/hid/hid-joycon.c
@@ -187,7 +187,8 @@ struct joycon_input_report {
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
-	struct led_classdev leds[JC_NUM_LEDS];
+	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
+	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
 
@@ -639,6 +640,40 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
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
@@ -647,7 +682,7 @@ static const char * const joycon_player_led_names[] = {
 };
 
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct led_classdev *led;
@@ -672,12 +707,12 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		name = devm_kzalloc(&hdev->dev, name_len, GFP_KERNEL);
 		if (!name) {
 			ret = -ENOMEM;
-			break;
+			goto err;
 		}
 		ret = snprintf(name, name_len, "%s:%s", dev_name(&hdev->dev),
 						joycon_player_led_names[i]);
 		if (ret < 0)
-			break;
+			goto err;
 
 		led = &ctlr->leds[i];
 		led->name = name;
@@ -690,7 +725,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			goto err;
 		}
 	}
 
@@ -698,6 +733,38 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
 
+	/* configure the home LED */
+	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+		name_len = strlen("home") + strlen(dev_name(&hdev->dev)) + 2;
+		name = devm_kzalloc(&hdev->dev, name_len, GFP_KERNEL);
+		if (!name) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		ret = snprintf(name, name_len, "%s:%s", dev_name(&hdev->dev),
+									"home");
+		if (ret < 0)
+			goto err;
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
+			goto err;
+		}
+		/* Set the home LED to 0 as default state */
+		ret = joycon_home_led_brightness_set(led, 0);
+		if (ret)
+			hid_err(hdev, "Failed to set home LED dflt; ret=%d\n",
+									ret);
+	}
+
+err:
 	return ret;
 }
 
@@ -951,7 +1018,7 @@ static int joycon_hid_probe(struct hid_device *hdev,
 	}
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.21.0

