Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3CF12CB9D
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfL3B1d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:33 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:38991 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfL3B1d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:33 -0500
Received: by mail-yb1-f195.google.com with SMTP id b12so13567079ybg.6
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6TW/W6qWLMXLuvZH9ziAyrGJ4gwh8Ad00+jD2z5xG1g=;
        b=rdIJbACwE6+Em+c/uU5aGxW0AMiwv6ZcxYahEasu+0S94ghokSTWQNJ1VZpeDAnInz
         WBVcWVF5JuGbGqyF6HABKrQW2dUrw2O9uwBScjbZbdtFZ6h/dCOLhggMQO8l0XdYqVaB
         3DktV8Gb8zJYPLOuN5hgqjrlSyovNMkOYFeIXntnNg7AB2oFkOhA4nnhKtrm+qgeuLSF
         n37hiqe9kphEn93ADskGDDCqQGca0WvAT4chlB/VCTCRcJKGD+yq5yRMQ1nOLC8BxVUg
         JGtyZ/fmIRxq1Avv5qLyc4xazszzdiqexUcFUHyFkQKzAOKytBzkJVU1Ye2dPxq2zYk6
         0SZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6TW/W6qWLMXLuvZH9ziAyrGJ4gwh8Ad00+jD2z5xG1g=;
        b=LfmNdn4y3zylgMR+MIyU7k5JgBjtTn5k41YBwWghECAjhk1G7OtYpKp95Dj+zBnJzx
         o8WKPjB/flsJ1v5Gw7BWCuVHxTExi5f3TL42amA48DJkcrX+NYiMwzuP53aGNpNktqws
         ex27RwRGXzwg9YFMbxwOYUWAlXg0ELcLkMr2Y8Zz4Q0g4euGq1iglGXmYApk+TVTknPc
         xcfGORgJ/L6QpATl8CaEALIUwJZa+Rn5oDCafpjvg3YIavZS8Pg4a2z5c5MBbKEhaEHU
         qaUaMLFnIcObc4bxxcTVJ3GlP18BTITeHkA+ziwn7NH0I7YjitVYbn7EVFudt2BYL6K5
         oMwA==
X-Gm-Message-State: APjAAAWtnSUAHL3c3Jmf2xWfNdUUq1l6wkT7EhA88Q3+V/4AKNd9J1aC
        aZiUvy4W2EWEmqxGmWxASwGKs9PeEQ0=
X-Google-Smtp-Source: APXvYqyDLnLR7tjCmWPLXSyV3Y8qjRnhnCniBl5oXPX9PcA/fOsOg3bflsvlPrbVIViKvZqO/k157A==
X-Received: by 2002:a25:e616:: with SMTP id d22mr46009274ybh.220.1577669251850;
        Sun, 29 Dec 2019 17:27:31 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:31 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 04/12] HID: nintendo: add home led support
Date:   Sun, 29 Dec 2019 19:27:12 -0600
Message-Id: <20191230012720.2368987-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
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
index be494f421b02..02178ab9619e 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -187,7 +187,8 @@ struct joycon_input_report {
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
-	struct led_classdev leds[JC_NUM_LEDS];
+	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
+	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
 
@@ -675,6 +676,40 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
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
@@ -683,7 +718,7 @@ static const char * const joycon_player_led_names[] = {
 };
 
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct device *dev = &hdev->dev;
@@ -720,7 +755,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			return ret;
 		}
 	}
 
@@ -728,6 +763,32 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
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
 
@@ -975,7 +1036,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	mutex_unlock(&ctlr->output_mutex);
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.24.1

