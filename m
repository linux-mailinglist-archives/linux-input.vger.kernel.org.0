Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43CEC3284C
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 08:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfFCGHD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 02:07:03 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:35276 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfFCGHD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 02:07:03 -0400
Received: by mail-it1-f194.google.com with SMTP id n189so6371097itd.0
        for <linux-input@vger.kernel.org>; Sun, 02 Jun 2019 23:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K506WMXc8GGSQnicgbYrADYBjppZgWeOHQy4k6qlvlY=;
        b=eTxOx+qc4rQKIk87LPWvncRF8/ncuuuWjLDSlSwEM7+QWm7g4hw2NSsh6gPMzWYsBF
         zFh75/gANA0Wka2Zqd/WntRHwRkAalGAKA87TNG9O5zyjMA0f1R/PJKGCjgFKekim1Vs
         RelzrEUDxjIDrBQRXa0KC2DsJYSYu3Fr+ng5V8qtlzk5cHRWCBmN7plNkiTz/OkCIkBF
         8QrHvZlZpjw3xdUXFmrMvOpL1u+375YEm6IZm2X/eZD583ipojZGtGwZj6DJUpCNwic+
         ttg+fU2uaU/12cybeUcew7gHqK2Wyk5y7W8T5BzD5ftGykR7YbRbmbxMtZatz195fXkL
         JELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K506WMXc8GGSQnicgbYrADYBjppZgWeOHQy4k6qlvlY=;
        b=V6WRu4dxrK4Q9kV3GpKOwXTO2IK8tr/BYZECOGSx+1qYnzJhuN/y97zQlPMH4FVrSC
         hXnth2bGsCif3m0001aJEgKSz/cWK2RJSAqlsMoL+R/MnX3CTr8v0HGGwwoIIwN4bZYh
         lRoAa3dgAKtONxJZa+OWq3OTxBDz2d7P0ZXAqOXNBIXOKsjoa1bKUNa63eO8aZy7s7EJ
         FFQH5q/fAoOJpRkS9W6cu/ESOiSuEg8WzCFjh9RbAKbHWmWklhMWXelUxBb/m8B9644R
         BTGGkX4QY3+am6aWJ3GcHly18P2pyakF8mJPrcGuRWtX1672zAaFAku++Ir1CUyg/1I5
         zybQ==
X-Gm-Message-State: APjAAAUE5DBuKR6ccaR9AxKde3Bpa1FsRwUbbWEULDbxLB25i0lp/LC6
        LiX89sQYLF7lSAIq5sm8b31SdWmHFlgKoQ==
X-Google-Smtp-Source: APXvYqxPn9VFxi+9hTQh+dS4YQ11DJR2h3dRAJsZJc1ZTWIsFBFUgmIIYHQjrhv7zReQ4Ge2+nt6rQ==
X-Received: by 2002:a02:241:: with SMTP id 62mr16179188jau.58.1559542021717;
        Sun, 02 Jun 2019 23:07:01 -0700 (PDT)
Received: from localhost.localdomain ([136.61.179.39])
        by smtp.gmail.com with ESMTPSA id 14sm6124808itl.1.2019.06.02.23.07.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Jun 2019 23:07:01 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v5 2/5] HID: joycon: add player led support
Date:   Mon,  3 Jun 2019 01:06:41 -0500
Message-Id: <20190603060644.10338-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603060644.10338-1-djogorchock@gmail.com>
References: <20190603060644.10338-1-djogorchock@gmail.com>
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
 drivers/hid/Kconfig      |   2 +
 drivers/hid/hid-joycon.c | 111 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 106 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 6f89edd89c55..cf88bbc54208 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -455,6 +455,8 @@ config HID_JABRA
 config HID_JOYCON
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
index d40e5da0e771..a2ae4bbaffcd 100644
--- a/drivers/hid/hid-joycon.c
+++ b/drivers/hid/hid-joycon.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 
@@ -178,11 +179,13 @@ struct joycon_input_report {
 } __packed;
 
 #define JC_MAX_RESP_SIZE (sizeof(struct joycon_input_report) + 35)
+#define JC_NUM_LEDS 4
 
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
+	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
 
 	/* The following members are used for synchronous sends/receives */
@@ -488,11 +491,9 @@ static const unsigned int joycon_button_inputs[] = {
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
@@ -551,6 +552,70 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		goto err_input;
 
+	return 0;
+
+err_input:
+	input_free_device(ctlr->input);
+err:
+	return ret;
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
+	struct led_classdev *led;
+	size_t name_len;
+	char *name;
+	int ret = 0;
+	int i;
+	static int input_num = 1;
+
 	/* Set the default controller player leds based on controller number */
 	mutex_lock(&joycon_input_num_mutex);
 	mutex_lock(&ctlr->output_mutex);
@@ -558,15 +623,40 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		hid_warn(ctlr->hdev, "Failed to set leds; ret=%d\n", ret);
 	mutex_unlock(&ctlr->output_mutex);
+
+	/* configure the player LEDs */
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		name_len = strlen(joycon_player_led_names[i])
+			   + strlen(dev_name(&hdev->dev)) + 2;
+		name = devm_kzalloc(&hdev->dev, name_len, GFP_KERNEL);
+		if (!name) {
+			ret = -ENOMEM;
+			break;
+		}
+		ret = snprintf(name, name_len, "%s:%s", dev_name(&hdev->dev),
+						joycon_player_led_names[i]);
+		if (ret < 0)
+			break;
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
 
-	return 0;
-
-err_input:
-	input_free_device(ctlr->input);
-err:
 	return ret;
 }
 
@@ -735,6 +825,13 @@ static int joycon_hid_probe(struct hid_device *hdev,
 		goto err_close;
 	}
 
+	/* Initialize the leds */
+	ret = joycon_player_leds_create(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
+		goto err_close;
+	}
+
 	ctlr->ctlr_state = JOYCON_CTLR_STATE_READ;
 
 	hid_dbg(hdev, "probe - success\n");
-- 
2.21.0

