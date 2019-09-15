Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC4FB32AA
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 01:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbfIOXcL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 19:32:11 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45652 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIOXcK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 19:32:10 -0400
Received: by mail-io1-f66.google.com with SMTP id f12so74548995iog.12
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 16:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=egNwgnUOQAz+WaO0qzF1UAjPezVMUjJEgCEVwL/orts=;
        b=FfV5Ciz+Hz/7HtQH5z74z+gi07sOql3VSHQA9KJPinCaHDNBRX29lEk/hT4TJLSZFa
         8Z9CAXZ+g5wGkbzfxgd+Cg5wYK701QiaxxBLzqqSSzAgp+c9o3HKClnoJTo5oeALl9IJ
         KGnuP5X/2DlrRbocEuJAmO3LRv1Q75FTma50uvYWu9MjNWknhK9i+iDue27A/u4PZlxE
         gKPaREZ3KAhao+QahRii5bT2f/AdtPu4sMdi7rYd+9AdSzuFJkcW2+7FbCgjNBn17roj
         MMWQ8YAJmjz31y0yUBgue9/fsUcNuz1ksa/r1Fa0ZLjg++mv3QyVXG1ip9bY8xd54xiR
         GRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=egNwgnUOQAz+WaO0qzF1UAjPezVMUjJEgCEVwL/orts=;
        b=CXdV46qEv0vChEuuMJ/OZ0uryIGLGiurDUEdKwH6Ll/SD/mxrQl0DlAXQpgsuJhJ/Y
         FtFKxce3YlcQzDGT4dZSskTZWQGeSs1/2QjF3Eh7pvxLMgkREkNu142Hp9Rppf1hCpYv
         tPQx4RcI6wmq9xeKTp3DZ9mTs+7MpyAdPexPFxg/GYhwND0afwNduTRM6Jrig24OdyId
         toUKd85hBCNqOOBe7t7rWtuJwJFhY+rDYBw7jkzuGOTUPvishUI4b4fC1KxHVm0IQVyv
         1Yb7QcYZo7bMwUBFZGMfOzOCbEMwbahGndZni9eaNfb1R0qiIGw9ow70FnzeyCMQxSqR
         aPqQ==
X-Gm-Message-State: APjAAAXmSw+JSbosjKJNpTot5uLX8jBIBYEgPEthNYAONGDSfusIOdeS
        zv37ex11oecvMg1cU7RhgyS5p1yI4cc=
X-Google-Smtp-Source: APXvYqwbed7w6yqQER0rE/EfWZ9bomMIkKE8lAnGQaT22HobFrboFHujWn6avF6nBB820tT4G3PAuQ==
X-Received: by 2002:a02:c943:: with SMTP id u3mr10523390jao.143.1568590329371;
        Sun, 15 Sep 2019 16:32:09 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.81])
        by smtp.gmail.com with ESMTPSA id c12sm22620245ioo.67.2019.09.15.16.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 16:32:08 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v6 4/6] HID: joycon: add home led support
Date:   Sun, 15 Sep 2019 18:31:38 -0500
Message-Id: <20190915233140.244347-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915233140.244347-1-djogorchock@gmail.com>
References: <20190915233140.244347-1-djogorchock@gmail.com>
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
 drivers/hid/hid-joycon.c | 72 +++++++++++++++++++++++++++++++++++++---
 1 file changed, 67 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
index 45289cd97aba..920a1894b6ce 100644
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
 
@@ -668,6 +669,40 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
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
@@ -676,7 +711,7 @@ static const char * const joycon_player_led_names[] = {
 };
 
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct device *dev = &hdev->dev;
@@ -701,7 +736,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 				      joycon_player_led_names[i]);
 		if (!name) {
 			ret = -ENOMEM;
-			break;
+			goto err;
 		}
 
 		led = &ctlr->leds[i];
@@ -715,7 +750,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			goto err;
 		}
 	}
 
@@ -723,6 +758,33 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
 
+	/* configure the home LED */
+	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
+		if (!name) {
+			ret = -ENOMEM;
+			goto err;
+		}
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
 
@@ -978,7 +1040,7 @@ static int joycon_hid_probe(struct hid_device *hdev,
 	}
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.23.0

