Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828133FE65B
	for <lists+linux-input@lfdr.de>; Thu,  2 Sep 2021 02:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbhIAXnq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 19:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232479AbhIAXnp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 19:43:45 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87AFDC061575
        for <linux-input@vger.kernel.org>; Wed,  1 Sep 2021 16:42:48 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id dt3so146213qvb.6
        for <linux-input@vger.kernel.org>; Wed, 01 Sep 2021 16:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccn1Qal+D0M8OCt8jAX047qtJsL3ULujjboNDBqfq2w=;
        b=nUF+siztn4rQbBlp6fUwrwWyvnI7+Ln5zecECa5e6bEVKmliirB5lw6TGnwGD3m75P
         ZtYsJeC1e8nBYXht1FlQOugccNHl7XTOm4BtE7NRIs1Z3wWM8TNJnx2ydQrAl213fefg
         KcxydJGi7IHkIGnfl85ZUYLGZih/E6EaaK/rP9AUcDtGWGXO3iI4/bPbZixnjfbek9xo
         pMJYY0bNClCftiM3ixV2rY1d8ODVBhInsI/EwUTmWNXLE8FcMwLjKi9IkZkoBEHJJ8r9
         gPJP1YGoZfD5WVq++U87YP/TC5gMCsBiM0toUT87ibwaflUSukqw+WlwQuDRpSYmVpc6
         Am+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccn1Qal+D0M8OCt8jAX047qtJsL3ULujjboNDBqfq2w=;
        b=gQR9Wz6FGtr1BiVpxmLbu6jYnerW1UXYD4XlnHoMhWn7nkj1H57P2XPVl/yCNzCyOx
         TNTJVHdjsTG+LKTqBw3URWZlwEvgYVGWEQkVvi1hOyKGyIz1HB51V0Qrn/JBbJ2hJYM1
         ZUf2kT4Fdce5boh4nguFqV3GqCJFcLnXnC4GoU7pnphohdv5QeHb36owPA2tqa/q6ju7
         nFajQ+vDC6GI3H5Aa1nHcjz+f9FxJhNTbn7LBiDoOIuifzUw71JtgalRCLBOyX633yWY
         dICOF3W5YUx4bG834k4WS/OLGj9fOL8aQrDPlgd+KJMobVMxAAYciVE+6ADdwiFPjd5D
         YXmg==
X-Gm-Message-State: AOAM530+jpsmvvsAEysuXh5QrR9jf8kkLTFN4XtfOF8XZBW9yJiwHjkt
        9ECF4A4dU/ehxkeFipEeSZkjXz8bW3Q=
X-Google-Smtp-Source: ABdhPJxU1Pv4C4J9G0oimgaZiAhAWsUxnXrnPy8Hdd85slKhNW6vIn+SE3yRo1zrI27L93um4SPwPg==
X-Received: by 2002:ad4:4f50:: with SMTP id eu16mr236646qvb.27.1630539767556;
        Wed, 01 Sep 2021 16:42:47 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-59-147.nycmny.fios.verizon.net. [173.68.59.147])
        by smtp.gmail.com with ESMTPSA id n5sm13422qtp.35.2021.09.01.16.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 16:42:46 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v15 02/16] HID: nintendo: add player led support
Date:   Wed,  1 Sep 2021 19:42:22 -0400
Message-Id: <20210901234236.3113-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210901234236.3113-1-djogorchock@gmail.com>
References: <20210901234236.3113-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds led_classdev functionality to the switch controller
driver. It adds support for the 4 player LEDs. The Home Button LED still
needs to be supported on the pro controllers and right joy-con.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/Kconfig        |  2 +
 drivers/hid/hid-nintendo.c | 97 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 24df4dc4beaa5..4517e98872fc6 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -733,6 +733,8 @@ config HID_MULTITOUCH
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index b6c0e5e36d8b0..e8f9fb8c3c11b 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 
@@ -184,10 +185,19 @@ struct joycon_input_report {
 
 #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
 
+static const char * const joycon_player_led_names[] = {
+	LED_FUNCTION_PLAYER "-1",
+	LED_FUNCTION_PLAYER "-2",
+	LED_FUNCTION_PLAYER "-3",
+	LED_FUNCTION_PLAYER "-4",
+};
+#define JC_NUM_LEDS		ARRAY_SIZE(joycon_player_led_names)
+
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
+	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
 
 	/* The following members are used for synchronous sends/receives */
@@ -553,11 +563,9 @@ static const unsigned int joycon_dpad_inputs_jc[] = {
 	BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
 };
 
-static DEFINE_MUTEX(joycon_input_num_mutex);
 static int joycon_input_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev;
-	static int input_num = 1;
 	const char *name;
 	int ret;
 	int i;
@@ -643,6 +651,59 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		return ret;
 
+	return 0;
+}
+
+static int joycon_player_led_brightness_set(struct led_classdev *led,
+					    enum led_brightness brightness)
+{
+	struct device *dev = led->dev->parent;
+	struct hid_device *hdev = to_hid_device(dev);
+	struct joycon_ctlr *ctlr;
+	int val = 0;
+	int i;
+	int ret;
+	int num;
+
+	ctlr = hid_get_drvdata(hdev);
+	if (!ctlr) {
+		hid_err(hdev, "No controller data\n");
+		return -ENODEV;
+	}
+
+	/* determine which player led this is */
+	for (num = 0; num < JC_NUM_LEDS; num++) {
+		if (&ctlr->leds[num] == led)
+			break;
+	}
+	if (num >= JC_NUM_LEDS)
+		return -EINVAL;
+
+	mutex_lock(&ctlr->output_mutex);
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		if (i == num)
+			val |= brightness << i;
+		else
+			val |= ctlr->leds[i].brightness << i;
+	}
+	ret = joycon_set_player_leds(ctlr, 0, val);
+	mutex_unlock(&ctlr->output_mutex);
+
+	return ret;
+}
+
+static DEFINE_MUTEX(joycon_input_num_mutex);
+static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+{
+	struct hid_device *hdev = ctlr->hdev;
+	struct device *dev = &hdev->dev;
+	const char *d_name = dev_name(dev);
+	struct led_classdev *led;
+	char *name;
+	int ret = 0;
+	int i;
+	static int input_num = 1;
+
 	/* Set the default controller player leds based on controller number */
 	mutex_lock(&joycon_input_num_mutex);
 	mutex_lock(&ctlr->output_mutex);
@@ -650,6 +711,31 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		hid_warn(ctlr->hdev, "Failed to set leds; ret=%d\n", ret);
 	mutex_unlock(&ctlr->output_mutex);
+
+	/* configure the player LEDs */
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s:%s",
+				      d_name,
+				      "green",
+				      joycon_player_led_names[i]);
+		if (!name)
+			return -ENOMEM;
+
+		led = &ctlr->leds[i];
+		led->name = name;
+		led->brightness = ((i + 1) <= input_num) ? 1 : 0;
+		led->max_brightness = 1;
+		led->brightness_set_blocking =
+					joycon_player_led_brightness_set;
+		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
+
+		ret = devm_led_classdev_register(&hdev->dev, led);
+		if (ret) {
+			hid_err(hdev, "Failed registering %s LED\n", led->name);
+			break;
+		}
+	}
+
 	if (++input_num > 4)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
@@ -813,6 +899,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
 	mutex_unlock(&ctlr->output_mutex);
 
+	/* Initialize the leds */
+	ret = joycon_player_leds_create(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
+		goto err_close;
+	}
+
 	ret = joycon_input_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create input device; ret=%d\n", ret);
-- 
2.33.0

