Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABDC0D58F6
	for <lists+linux-input@lfdr.de>; Mon, 14 Oct 2019 02:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728691AbfJNAWv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Oct 2019 20:22:51 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:45721 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbfJNAWu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Oct 2019 20:22:50 -0400
Received: by mail-io1-f68.google.com with SMTP id c25so34191631iot.12
        for <linux-input@vger.kernel.org>; Sun, 13 Oct 2019 17:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ieEIdiRpsEMY/mMuHmOe/akrryTI2NyyBy1vGHyUaCg=;
        b=F9lY+ZajL0ZwzZhmOx5IQg6nap82B8RnucXPShyu2VrUhClkJpftXTOfDttvGFNdTN
         2oAHdzHdfKpxNQZF+alqur1tLmaCNuPgqQFvN5hqDKIXvRhoIE3jf0b0yrUjxw+9XANe
         Ph2HYH2uC0QyN4VEVH7IVah84r/KslFLnTPSlUEJhzatfMeKVTaxUlwLPPX9sykiIONO
         ykuCUs21j+qSAw+0yMSqvtNiqc/EV7xxGoG9voIY75sqanFGQrde7v9bCvtkOyDc21kp
         knDYA0T9holyvBTMeMSzTIsqX6I0d2I9Lb4JAd4RGOZogJ6Y2c+a+ijs5JlKBRi/vL1v
         kGfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ieEIdiRpsEMY/mMuHmOe/akrryTI2NyyBy1vGHyUaCg=;
        b=JeHRiw/R6smaNG+LQ6L0UZ7ZbmA/rnU+RbrNMeC/WFjUPPHIEw7zg04lcn0xSW4qyq
         5k+XOIFbWGeEdYweh92RkU0vDyFGGenxNKbQv0IM7BezAgWr/mzJoej5EPjH1gpxP+Xm
         TWiWi5wmoCbODh0/nPeUZqxeUSdkEJkUoDn2UUIKY2aDy5WG2kdl1gldwUOJt2zGePbs
         ohU9H8H+tVniucgBbMX6t2trXK0CzeTL5EhZlh00YRRpo3xJJ3lfU6DEWUWXvvPBrKx/
         7g2ogS2vdV6koEJRNFwYgSGb0Ql6WSyvSeR20WxFct0nON9WbfVtQlMd1TvJh8h3Ahh9
         dmKg==
X-Gm-Message-State: APjAAAUdbwPy6Yzy4Dj9l+XJdgm3YkRNET89cttkErAKJA9Ke2dosE8K
        DgBr2dvwWwPsuxUN+KadU8IRJhzZcdU=
X-Google-Smtp-Source: APXvYqyGHWYYrWcB0Ue7rfhWBFjqhVibrEzDhozerV0JQF7gWLhKXA+4HZp0iJ8A7arqlEjL7KTnrA==
X-Received: by 2002:a5d:824d:: with SMTP id n13mr15645553ioo.152.1571012567819;
        Sun, 13 Oct 2019 17:22:47 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id s201sm22103963ios.83.2019.10.13.17.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 17:22:47 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v8 2/9] HID: nintendo: add player led support
Date:   Sun, 13 Oct 2019 19:22:34 -0500
Message-Id: <20191014002241.2560195-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014002241.2560195-1-djogorchock@gmail.com>
References: <20191014002241.2560195-1-djogorchock@gmail.com>
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
index 47ec750c2baf..41f7da50896f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -695,6 +695,8 @@ config HID_MULTITOUCH
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 9021d25bf158..083d174dc12d 100644
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
@@ -517,11 +520,9 @@ static const unsigned int joycon_button_inputs[] = {
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
@@ -576,6 +577,66 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -583,6 +644,29 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -759,6 +843,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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
2.23.0

