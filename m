Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005E53D4B29
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhGYCrT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhGYCrS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:18 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E908FC061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:48 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id z24so5505344qkz.7
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Aw/C0/TfEe71CQiqX3cxPEsGaWjfwhgzMNA95WDVbyI=;
        b=qhXJdwwmuKl4cMbpClHKJMJRfCQHtZLieLgOESBj7ynCc9mZfTjnsTAsbouBvcng38
         sLa6u0VJJaqp+EBxJ+Yvhp0QwxechUpmWXeMYRsWlHJuSX7y1rViQE+Wn9g032ci0wr5
         mjKZ9/PQyFzyDofHmgZZtXrm6mx/cJY0tr2MMciB+sl5CA529eYWPAHH7f+NmRjBE27M
         H6ykneI2bPwY5U4LXyp/ZrZPmFIAmcU5oFsOuWDEseKxXr+0opv0BeHZ6HvdgocsaZPo
         Ag8BrT5APwmqj1/zgg66BeDpZPxwlYnl2hIKojm/Ow/PCw2vNmXGys8rjzzDtjZ6do6R
         vUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Aw/C0/TfEe71CQiqX3cxPEsGaWjfwhgzMNA95WDVbyI=;
        b=aqmfC3uLcJNCWisdYAPQsALLLYGnGV41GgGg4mJUZrbB1+9sJbyyBmqu05eFDQu64w
         ID5a6AEv+gscIYzvFRYRCj6gwuz/DRPIaPonQlM8wxLCwPcwajXis0SWuOBK4Wr0ol4R
         GN7Hp5+AFaMlo/jXk6jj1pV6a1NuY6i9N9fsHFbN98Q4wjReQgVbcWVgw08TJmhVOPZG
         N/TjNhByKqDLtJyFFJFqgYTjBOkuDPIYUQpWAhptROq9Ga3RcNtS71iUHPynz3ylOT9A
         OLOFqPhBR6xmomxGdUtNNyKPzwkcxWgWwBn0f3vUg+iJSCf2TrsnfmVrJtq/1qcuaZLT
         roMw==
X-Gm-Message-State: AOAM531lHUZ3SrtgK5QYuICxyO5AcH726BjrZamiEICPM3uPn7PIgPZl
        jGRATkqrc4SrL1e4HCwsV2m1FYYaiRW9bykS
X-Google-Smtp-Source: ABdhPJz8b4jjILvBeY31x5CWQh1naEzJEoXaCFd+y+BtvyWc+8pW5s0ZqaR+RZFm1psOXA7j3/n0Sw==
X-Received: by 2002:a37:b7c1:: with SMTP id h184mr11950925qkf.65.1627183667983;
        Sat, 24 Jul 2021 20:27:47 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:47 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 04/17] HID: nintendo: add home led support
Date:   Sat, 24 Jul 2021 23:26:55 -0400
Message-Id: <20210725032707.440071-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds the ability to set the intensity level of the home
button's LED.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 72 +++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index aea64ea8eb092..9e1791c3ee5fa 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -199,7 +199,8 @@ static const char * const joycon_player_led_names[] = {
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
-	struct led_classdev leds[JC_NUM_LEDS];
+	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
+	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
 
@@ -733,8 +734,42 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
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
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct device *dev = &hdev->dev;
@@ -773,7 +808,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			return ret;
 		}
 	}
 
@@ -781,6 +816,35 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
 
+	/* configure the home LED */
+	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
+				      d_name,
+				      "blue",
+				      LED_FUNCTION_PLAYER "-5");
+		if (!name)
+			return -ENOMEM;
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
 
@@ -1027,7 +1091,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	mutex_unlock(&ctlr->output_mutex);
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.32.0

