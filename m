Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 765F53D4B27
	for <lists+linux-input@lfdr.de>; Sun, 25 Jul 2021 05:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhGYCrR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Jul 2021 22:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbhGYCrR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Jul 2021 22:47:17 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6005EC061757
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:47 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c9so1734193qkc.13
        for <linux-input@vger.kernel.org>; Sat, 24 Jul 2021 20:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=097S/74obSfJb5O5747BOzS3ewGAU/dHMXhy7kRRtKw=;
        b=X4W5ZnKrWsEpHASfX+SWUB+xO8qLEKcDog7ZazQM+Qf6scuvOElBCRLiADr2Jj45/P
         QZorr7SXbAypaJosvrfZyzp5poQrzUjVfT5Frj/fRiP0gw0z7MR/ap26FLdEKH70Yr+w
         nIn3B9UPuB2anfjibB3Pajh0VcArGCPUGu/2FoCRuJphZFd8QKr2WX9QKslw2eL1H4KG
         QIFJiNRj/QT/j3s5ajmUHcCs4h+hNyQbwAe/u3xljURCwPN6egMows4yjTV2mfE6mwex
         gwEY3cldf5sDEWWFWQm/SgabE2+ldiOhV1T6YNh16kFu5jnQF2upzZtCqWaiDnxVSHBh
         wHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=097S/74obSfJb5O5747BOzS3ewGAU/dHMXhy7kRRtKw=;
        b=IAocN/PqKEPf3cY1EnSdT4VjrFNkveAgY2N1bZwpxh3Tnqm4c9Hu3HXAWJ/qMnbRQD
         9pG9GEoT5JuqvrBrkdTq3JRqnp81inY8jhKBf9lSqBiYjiDVSzJCszx2AoINbgtycVt3
         vlyZDjS9bhlHJsA6Y1jpDiZYyRbIBmiCXNfggeEqPhbwxyLz24NDPqrGvT+3n/u8rQOM
         zziXZZ1ShdOk73zuHVvsgdgLmzGmPOja1UpMHqc0tCW9bfugjMDw+WkqawtZGTpGyV1a
         KNd0m8kR4kIMvt/BMRLAASiON0D3PigmcL1bYQSizsl0emG1HXAADrP1MXWJxJ+in5LX
         Rh5g==
X-Gm-Message-State: AOAM530b301h4Z8Vud1KQN3q9zhnyMvZFPIYh61fXW4+yQZQNFXLHl7N
        zDB15ePYxw34dFO+yARD9dko7pRHkONGZPrC
X-Google-Smtp-Source: ABdhPJyDIwxoJxFZfjvhsDgcEvf+tSq2YyS5T5XrYZUqmCorvYcq1VOQk5Xy3Wee6xN5M/52/ebqHQ==
X-Received: by 2002:ae9:f00c:: with SMTP id l12mr12154283qkg.141.1627183666410;
        Sat, 24 Jul 2021 20:27:46 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-98-116-189-238.nycmny.fios.verizon.net. [98.116.189.238])
        by smtp.gmail.com with ESMTPSA id j16sm4843738qkk.132.2021.07.24.20.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 20:27:46 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v14 02/17] HID: nintendo: add player led support
Date:   Sat, 24 Jul 2021 23:26:53 -0400
Message-Id: <20210725032707.440071-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210725032707.440071-1-djogorchock@gmail.com>
References: <20210725032707.440071-1-djogorchock@gmail.com>
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
index a95334b42f68a..142656b030b3e 100644
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
2.32.0

