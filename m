Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418A13FE65F
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbhIAXns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXns (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:48 -0400
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3309C061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:50 -0700 (PDT)
Received: by mail-qv1-xf2e.google.com with SMTP id p17so142028qvo.8
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=76vWihq3OstXulawkJUmzZCUDDHNCUl6qO5zU7PW0YQ=;
        b=DnAbnQQPsDJpFjYxP8azeis02zaqcdgvvrqsjlaRXLoMk7GNi4A4bqynpNOtDH77Ee
         vXS7DCOffjvdXJ0bVJ59GWYIpryIJHw8oIKPTNmA8LCn7uGkEucq0OzysxZlPz/IAn9q
         F45Qhksq+Fv8T1ycvQhKemJgnU9mVfsFizsa/SpOsn9uTXW8SeQpuBjczAYFwzmRuj23
         k6RKSKQTsKKUht0gH/lzBK5cVFqiiRNQYaw57fkpAS2ghQFj9ppsDps28ronCsIGQ3P/
         s7G+wLBEYN7whgqIddQ0yfQHiAY9eP1x9jLafnRYFkvPvJfMlzFqk0FxL72yEMQ1Amk5
         pSRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=76vWihq3OstXulawkJUmzZCUDDHNCUl6qO5zU7PW0YQ=;
        b=NsXeizTjp1SgOtEKDqvuHxsyW2nTFleEMilftj3+Iv68aPXPGsLj5QwZlcNRiloUnk
         f0r2VZF1NnPMeHxmrmBYzcUbal3Kgl5wcujCLruhDpucKXvQ1kEDOv3cNYAxn0TxXAnD
         cZPtSRyzjDHC0bvOmFNDNUdEQmitFZnpmegQIMe+oFOUc/bBfpoNaymNYN/HlHdUNV3p
         rF3C9oZo7Wm4JvowOWRmKMrDOn6D6SjMrPRcqc5IoLvGuD4xTzn8gigonZn/bbWxO0/s
         Qm/V4/yplQKUlW87aWqy4CN9hDtZGpm9Y9dBBJbr5igHRVhPOsf4v8G4VU18eluew+VH
         w2gA==
X-Gm-Message-State: AOAM530ASL0nlbh4ZKBPEfkne6wwQCXX19y/wpeRDYl8sxAovhnveT/k
        V7XPkEO1aNMBbTyJgUQD1i0z3kfAeko=
X-Google-Smtp-Source: ABdhPJwjmx35hdQCURUWaFNz06Zj97zzkEf57ANu6RDkc0OIk2xFBWFIhXbGpno3mdynWPhjiN+GWQ==
X-Received: by 2002:a05:6214:17d1:: with SMTP id cu17mr170095qvb.34.1630539769923;
        Wed, 01 Sep 2021 16:42:49 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:49 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 04/16] HID: nintendo: add home led support
Date:   Wed,  1 Sep 2021 19:42:24 -0400
Message-Id: <20210901234236.3113-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
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
2.33.0

