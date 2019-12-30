Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE76612CB9A
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2019 02:27:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfL3B1a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Dec 2019 20:27:30 -0500
Received: from mail-yb1-f196.google.com ([209.85.219.196]:40672 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfL3B1a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Dec 2019 20:27:30 -0500
Received: by mail-yb1-f196.google.com with SMTP id a2so13581584ybr.7
        for <linux-input@vger.kernel.org>; Sun, 29 Dec 2019 17:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QTBEglzKDcgECy8/S5WfFKj7lTgE7SChlUyGfdPY2/Q=;
        b=HMRKS9rAMKkoDoJWoOTTu5Gc0IaAgY2LRBo2jG4D6gTT0520vctEgPPJDsuRKbHeIl
         JXgHp2gpjCCckwTVvR1awbithdN6WJYrdCtXtFyhRFhyXfnRMu7T1aXdIIryX3xoQS2A
         e1eohsxRNmXwOgIeGhJSLTbpDp3WLYxwxM4rp1Cl8OycQa/5e06TZ9vMPz4r20+OwGYa
         yr+lGFh3+2HkjOVVGAl3u77hnsw0jq3O3qlRGMwJyLnckxDhAsxVR+ofy28YIhz/YLBM
         B8f9lgQcbc7Cm9adKR5FxHXCpe9AfojxDPQxYZBUs6HXIk+2lnWYpLT2Vfp6jQKeKZf2
         EMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QTBEglzKDcgECy8/S5WfFKj7lTgE7SChlUyGfdPY2/Q=;
        b=TKYP3LJVzGXcZWTnSD1WCKYOFnrznu7RLXhO7asALJMggrgD8Nb2jNBZfSftZNO8B7
         pGCt0WmV1vOZXGCmSdEOr0V2vLwemK1PxmCCzdlaCbASNvMa+SQvJEUEAKv/gbtVHt3D
         5zRFOOjUyENrpHR4Qnz1DmSuabBXxCpxpmAkJVT9Sb6Jl1K5APKgePP6yS/KZ86EgGWJ
         0lMjTI9QQzyplBiy2f/6Me9NSpV3xvE+RCWxJt+hvSKw5MfzGnmEKM3kr4LJiuunhzDQ
         pRdhNr+zKf2Qsa6qoWlrFtvcqD+J1TRcfjLnCh46SttuP9Tk5FV8WuYsG0k6O+r9IfzY
         j6CA==
X-Gm-Message-State: APjAAAUYEr/dMexBGqbsMAkvfABWiSM4trfTnhNnnNrp5SGDJ9oPk1Io
        eaozpOkoemRWQaqQ2wd5GD4R5b2Y6Go=
X-Google-Smtp-Source: APXvYqz0R2u8Z6+XG7RqjGCaXLfqLKZFfLbOKue8GTMazwB8c3lwS9ewSwQoaANqFFzKKt7/Ppr6wg==
X-Received: by 2002:a25:b989:: with SMTP id r9mr42461405ybg.366.1577669249377;
        Sun, 29 Dec 2019 17:27:29 -0800 (PST)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id g11sm17175584ywe.14.2019.12.29.17.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2019 17:27:28 -0800 (PST)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v10 02/12] HID: nintendo: add player led support
Date:   Sun, 29 Dec 2019 19:27:10 -0600
Message-Id: <20191230012720.2368987-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230012720.2368987-1-djogorchock@gmail.com>
References: <20191230012720.2368987-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds led_classdev functionality to the switch controller
driver. It adds support for the 4 player LEDs. The Home Button LED still
needs to be supported on the pro controllers and right joy-con.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/Kconfig        |  2 +
 drivers/hid/hid-nintendo.c | 95 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 018fb7220d71..af5e68d350eb 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -704,6 +704,8 @@ config HID_MULTITOUCH
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index e5ba1153bcf5..2ab3be27f24e 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 
@@ -178,11 +179,13 @@ struct joycon_input_report {
 } __packed;
 
 #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
+#define JC_NUM_LEDS		4
 
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
+	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
 
 	/* The following members are used for synchronous sends/receives */
@@ -521,11 +524,9 @@ static const unsigned int joycon_button_inputs_r[] = {
 	0 /* 0 signals end of array */
 };
 
-static DEFINE_MUTEX(joycon_input_num_mutex);
 static int joycon_input_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev;
-	static int input_num = 1;
 	const char *name;
 	int ret;
 	int i;
@@ -592,6 +593,66 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
+static const char * const joycon_player_led_names[] = {
+	"player1",
+	"player2",
+	"player3",
+	"player4"
+};
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
@@ -599,6 +660,29 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		hid_warn(ctlr->hdev, "Failed to set leds; ret=%d\n", ret);
 	mutex_unlock(&ctlr->output_mutex);
+
+	/* configure the player LEDs */
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name,
+				      joycon_player_led_names[i]);
+		if (!name)
+			return -ENOMEM;
+
+		led = &ctlr->leds[i];
+		led->name = name;
+		led->brightness = ((i + 1) <= input_num) ? LED_ON : LED_OFF;
+		led->max_brightness = LED_ON;
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
@@ -764,6 +848,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
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
2.24.1

