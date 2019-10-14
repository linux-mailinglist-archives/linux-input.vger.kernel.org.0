Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95363D58F8
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 02:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbfJNAWw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 20:22:52 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:32913 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbfJNAWw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 20:22:52 -0400
Received: by mail-io1-f68.google.com with SMTP id z19so34381512ior.0
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nlDIkazvaugpKz6WcJvgrk6GX70rDz5/xJJw6ajqhtA=;
        b=qWQX7mtHrF/rsOQ49xvqVZHtCLfns6wRpDPmXc/bq30qy0KTH2gSHnAEFaTvwfhPeM
         os+BimAuHtuIxVvrUngGrbWzchddmm1y8cr/9pbl3aLJQDSzoTRhaht08MNfIccfvU58
         3YfsIxhOTRh/W6uvkAp4XKiKmYiezK2/i5LK7jIWNV+bqbwnOqTYrvQwiF1+AatLg+cD
         i4zZ/qDUP0/5nr0e1dZ+ulpPYauBympvBm8KgM+rQxgKx04xM/qF8SjQdt+fHB2MiFlq
         4wJA5on5xVvYfYsD5STLoDom2fdmw10gXagc5IjILJUxC5o8xH6WMbAxsWnRe1TgF8qz
         nSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nlDIkazvaugpKz6WcJvgrk6GX70rDz5/xJJw6ajqhtA=;
        b=IKWvpz0v2KrPgbozXV3E1EQ9mUCgHJnay4wLMpoVJtu7BmF4ierNtvGlFAPR1IdNcK
         HaqeUi9vrVG6yk4ADmzP+KIc0VxX1e9P0Va2XFMMK7LHlIxJ97MMUVRxw+xgTMeA4Obb
         4/Zq7Mj33XPitl/anmhrxlWs6dvXxdp0ME936eo/evaG/vltJ7uYCK7g+SoRe6ymTjPL
         Phjhx9Xm6CPdmg3SN01uz0LyLem1lTQ9XSmQn2H8VuRquN1KcY/YrAJ6YvE3dNSlaitZ
         FgsGRSxp4MUKw2uAwB3mdldtl9Q8UtKAzhoJI5WJlwkCBVy/9luKIgV4pAocpShbPSn8
         U3AQ==
X-Gm-Message-State: APjAAAWqFOURU3V1HrxGBiOVPSIULuhYVh3ckgPYb1DkYmFHS8t44tY+
        aXBch8n9cWU8GXP+NpSUfzqdjQHN948=
X-Google-Smtp-Source: APXvYqzFDsNZeh+n5dAS1cKrhl65M0biiiibL62s6CHiDejIjQFqe/8QvVQcSm2qzbUjoIlpEz9sHw==
X-Received: by 2002:a6b:7e49:: with SMTP id k9mr31841916ioq.280.1571012570152;
        Sun, 13 Oct 2019 17:22:50 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id s201sm22103963ios.83.2019.10.13.17.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 17:22:49 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v8 4/9] HID: nintendo: add home led support
Date:   Sun, 13 Oct 2019 19:22:36 -0500
Message-Id: <20191014002241.2560195-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014002241.2560195-1-djogorchock@gmail.com>
References: <20191014002241.2560195-1-djogorchock@gmail.com>
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
index a53d5d820bcf..e9d61e1a7186 100644
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
 
@@ -659,6 +660,40 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
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
@@ -667,7 +702,7 @@ static const char * const joycon_player_led_names[] = {
 };
 
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct device *dev = &hdev->dev;
@@ -704,7 +739,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			return ret;
 		}
 	}
 
@@ -712,6 +747,32 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
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
 
@@ -970,7 +1031,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	}
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.23.0

