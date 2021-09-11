Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF5E4079F2
	for <lists+linux-input@lfdr.de>; Sat, 11 Sep 2021 19:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232995AbhIKRiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Sep 2021 13:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232985AbhIKRiK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Sep 2021 13:38:10 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E07FCC061574
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:36:56 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id s16so3411541qvt.13
        for <linux-input@vger.kernel.org>; Sat, 11 Sep 2021 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SnhCrzdj+vTHiQFbrgxuFQfOJjT9PpV+x3kmv1TMZj8=;
        b=XRYSYprLA9dNQu1slWtyDAfdyk/S97sCBzhnHeEM0TfFo2AfW7tn9IRi7sYoWJ8D4s
         rbjqPGA2F/IWRVwHLi8sy6RkVNjq58Z8gpCbM9l1l8vrBdDekB1TFuUFLU5DhOqwZ7id
         Q+RHzehHeATOX2UJfBj51QiLCkUjm1MROKgJlObGJpM4K8zNq33UHQbHVf9v2bGsKMIq
         39MfBF0KCFWNyvh5LRFeSA3Q3qAfsVCtWZkzN4pYy2F4Ry5pdmqCWsyzbJHkEt+aAZpI
         tRYyoHw7jCYG2w0pUpcPhr06/cE6x7uT/2gf6YNFPGp66TUJRZ4i9v49CV3ygOygtvRN
         qi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SnhCrzdj+vTHiQFbrgxuFQfOJjT9PpV+x3kmv1TMZj8=;
        b=Ut2VN5A/Ys7iYtboaoxiMhnVoZ24BXb3I+xcdW64eVLApdJQItpePKW5adpMTr56+m
         Otsxu7zlZ9dktdicm5CPr2RdeKhgPpuoxh2fLJbD+vHNATNRQy1gvi2Zjj+mvBh/DcSJ
         bSF4AsA9QSkRSayRInMT3VTWyM6VXlNcttA7HvUvUg0yHhTzXIU6Iqatm2Z14FC6quhh
         VyNZ8E/IMtZl/wNUaV5PmRRmSJvGxvx6hEylBmSpjQ2K7lHAU5n9iisFWJLvk8daShCw
         tbdRjd+D7AuPMe7skXgTos2CN5F2Vv9evGjVfcGVmngaPdwefcTTcLMGOszT+DCsx+LK
         TivQ==
X-Gm-Message-State: AOAM5322lb2QYJ8Tfs+8ggqp4t9e6ELejQZBfzFrzX6IEw3cNxMKxZjj
        GPuBc84CxQ0fft/AWbdfixzX2LFKnxPc7A==
X-Google-Smtp-Source: ABdhPJwo455t1IMBYeeGlh3eQ9BFWkMV+dMx442hFu5OTfPfmCLyqK+IXCqj3WBWxbD28SB9qQHvZw==
X-Received: by 2002:a0c:f010:: with SMTP id z16mr3286135qvk.8.1631381815932;
        Sat, 11 Sep 2021 10:36:55 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id m5sm1594286qkn.33.2021.09.11.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Sep 2021 10:36:55 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v16 04/16] HID: nintendo: add home led support
Date:   Sat, 11 Sep 2021 13:36:27 -0400
Message-Id: <20210911173639.5688-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911173639.5688-1-djogorchock@gmail.com>
References: <20210911173639.5688-1-djogorchock@gmail.com>
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
index c6c715a9ac7cd..59cdb7dfa59c3 100644
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
+				      LED_FUNCTION_PLAYER5);
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
2.33.0

