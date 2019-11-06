Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE9AF0EB7
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 07:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbfKFGHC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 01:07:02 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:46576 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbfKFGHC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 01:07:02 -0500
Received: by mail-yb1-f195.google.com with SMTP id g17so1015646ybd.13
        for <linux-input@vger.kernel.org>; Tue, 05 Nov 2019 22:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mAerNiX3pHNJmZUc5Xvu2jJ4CMv6K63g69YkCxZeZvI=;
        b=qriRfM278IirOVsqkohaPdTEfDH2enPNg+Ia7JDwJI7fMF3R9Vxo0edZI5l5QR1OGx
         wlCbevgqhhJaipuudG18q6Bwd/mjqHFU1ih1zqEQD/CtNLm4OX9Dt/fyFjAUcyJml5LL
         zuEr615yr46kDdwONVYsOkf3G/bmfFav57OdQQFglCSVSXW6MRF6c5WyIkGmy26AEcgd
         9/87V8F4aUyaQa61No59sIHVLx8CoBBC/Kbq7v0GLj0ZUoiufFwU9g3RqRlKRFXwgcbB
         B4o3x888ipTcBnbcD873YiVxT4lSsEXCBRSBgxLEjB7oU8AiBXmNweIgCXrh2X8GT7/m
         4v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mAerNiX3pHNJmZUc5Xvu2jJ4CMv6K63g69YkCxZeZvI=;
        b=jxGBfjoFvmazA5k1ErwY0DAjVL6R2rxodMSROQ+1Y6oMIpsC6DEfops+foMLCdKkIE
         ocN1ZMT02lpBXTGVaO03+1ChyZkIu87zCocKlnQZnzBlpgEskBgv+lPFR/kCQQySBNwD
         9lVZiJfJXdVvl8XgKdIzlsC950m9n1Uu/iEXFrxy+MBBcY703ZBGt9HM1nswN4LGm7d7
         fMkrsOjXmhxplR0w+TU5jANLsqOilnyhY3gxNGy5cczu+JTUbKCQzMIc3ld26cH3TJl+
         5FLden5/xUXVv4JXYJurPntPVGkeZWkX2k4JHrDEdWBqFavgP5L2osat/5Ae9OoM1Pj8
         0buQ==
X-Gm-Message-State: APjAAAVeLCzO1vly6ObdBjcad/8eF6lq1Kf8LUHu26x/2QxUpww7Juf5
        TjzspxLs1pq45D4SNv5u6q4+pn9RadtgcA==
X-Google-Smtp-Source: APXvYqy4ET0AGM3Twc6wsLDEgVhkuob4Pow2k2Tw1I7vOY0ipvrDp0EE8DeQ+5oamoPMNoiqxDn9lg==
X-Received: by 2002:a25:b21f:: with SMTP id i31mr810470ybj.9.1573020420934;
        Tue, 05 Nov 2019 22:07:00 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id e82sm11039596ywb.87.2019.11.05.22.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 22:06:59 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v9 04/10] HID: nintendo: add home led support
Date:   Wed,  6 Nov 2019 00:06:42 -0600
Message-Id: <20191106060648.3018478-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106060648.3018478-1-djogorchock@gmail.com>
References: <20191106060648.3018478-1-djogorchock@gmail.com>
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
index 0caa9e1860ad..18be44214041 100644
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
 
@@ -965,7 +1026,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	}
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.23.0

