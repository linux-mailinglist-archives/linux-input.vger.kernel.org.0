Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F7738B9A0
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhETWs4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbhETWs4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:48:56 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70B29C061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:33 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id k4so6852677qkd.0
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9G5vXVhaAjwuE/TnZ8zOM8M2+cjyaSIaMszQtzflk6E=;
        b=CJaLtmFyz6pkCgEoHzLLKO9/R/eAi6iCA2OdaQw4IMFcwQ0AewAzl/ogrSU6RTEttM
         o0XKnXi/9G8pWd5vwpu6ZVOtvRtFN9ZqzLF/1jc4h52izx4F4YQ8abUstmfhSQIMpti+
         Xy4eE2VE96WyfbReW9Ry1oleHQnWS7eOsysY2aZrVbnCv4UluVYhC/AErq4C24XgdDZK
         5jtfVcgUnL9LuJ3FBwu+5hF10lC5WUXGKh3OFr33i5s3Ub1F5sma6yMwfQBeq/4h0Wg4
         nCelGu6rtofSNk3AUJ2mZ+kS366m2oXtHOQVwI5C6OqiQj9ISFfhnoePhxgMZQFjH4xz
         QOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9G5vXVhaAjwuE/TnZ8zOM8M2+cjyaSIaMszQtzflk6E=;
        b=mBW86FHE3ZUHz4arCHys5WaX1eL27yN3gbi7JcCBrBJy2hix2KiyJSDUacwA3XMfKq
         OSbGUlI6xWBS++j+1AaG4WRg375MajejyUPEr+H5ddj9ikNtLhSeaqlJDbNtzj/fYPo6
         sDtnamIP2R1CFZ3IMCn3BdmtE72xJECraFuaJfmXOFAI2Nx24yGKI7VT4Yp8KfXAf4FJ
         WP3gDoJwGmp1/vf8U22h4RNnntAHSm8RsyMD+GFrv/a9eq9ohDXlhynCyOGOOMBZIxHc
         z3WjgAAMxICeaKYIVvXr0YcBVQwAn0ksHI8NrtMkaTSROCLFzwACHIkvmaBRFkOM8I05
         13vg==
X-Gm-Message-State: AOAM532k3NM6uYdWNHMKi1To4zkXPqeZX3qY0dgXabIR4fszp+oQgfv9
        KmQO6SRZkQaqok4AGh14nfdbTZwGoQWOnQ==
X-Google-Smtp-Source: ABdhPJxYsWURI6Y/FHy7UCLVUAR1wBcI9+0N97wowj2zjTkulWy7r4zyJ3R/L9ptM6sF2ptm0vWCbg==
X-Received: by 2002:a05:620a:164f:: with SMTP id c15mr7884817qko.183.1621550852473;
        Thu, 20 May 2021 15:47:32 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:32 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 04/15] HID: nintendo: add home led support
Date:   Thu, 20 May 2021 18:47:04 -0400
Message-Id: <20210520224715.680919-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index c3c7ea81baa66..8e6c7bde91335 100644
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
 
@@ -1025,7 +1086,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	mutex_unlock(&ctlr->output_mutex);
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.31.1

