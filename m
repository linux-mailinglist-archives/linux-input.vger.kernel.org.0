Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71E7CB32A8
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 01:32:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728820AbfIOXcH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 19:32:07 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:35674 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfIOXcG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 19:32:06 -0400
Received: by mail-io1-f65.google.com with SMTP id q10so2775069iop.2
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 16:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A5upwgkMqiobp2onnSbTufZbgWuuv1+P7qKtEY5+E4o=;
        b=onOb5iNRrUfN7wyamCJh8pV73w30RlbP8P0FoYF2pGNzzrusNE++DTvGLVQueMwRC2
         K6gGsxbbpUVt/mziLrR7uJfOHfEbmgYdXGKQO+xc2zms6wfSZQB62vmU8Lfp14JgF/ad
         SpiBImNhiz8tO/mOdgL4NPyT35a+vXm6HNRGsCzL/GEcvzwDDGAyBM3DbpNhwlBCVxPp
         bPKj02fXa7m2CnWP70SIVCz99/MROVxljB0M/W1cklffmyxnvvvUYqzPMLlraTs9/W02
         XfKxm/EeNTzxBPm10R3ac5EogvEuxLEbUnpr4UVr6Fm0R0CgMSmtOSzGhlM8cFKNdzXP
         t4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A5upwgkMqiobp2onnSbTufZbgWuuv1+P7qKtEY5+E4o=;
        b=jZT/gkfzIuxHsoUkACG4OuE+PEylmXhyFfWLq8T88pmi3H3Nv5YfeKpcHvbPVAm3gZ
         DVkEZoTXD342prakz4lqiJUW9r7DfBJx74cvgdskMyQSG+uXQMgAAR/GN1n3eob2X+0S
         LyzrJQFsQOOn4eAqJ6RSOyTLx+vFmaOqtXf//zk49wMYC4M/6flgYnU22S6+ugbWZLrY
         2Cj09SbzUyXJzBUGBJ5+168jDovUSYHcx0jK7AxYeLvOcICKiuuT2nstK5o2hFfSuMc9
         tk/CKqaNfjs2/7iRnoqC4rZT1vwDHvwykA79lqhlj6t6j6NqH+/AJQ++E9WxLSSrvLbT
         H1Sg==
X-Gm-Message-State: APjAAAV5r74vGZlBYq9u0zn76rjtaZ2fuhLvdOWPsAjgIH9bZqEevNBR
        qHVqNPzPBYr6NDLtnfUATChWqL+4f9I=
X-Google-Smtp-Source: APXvYqwD9Zp3sEcGqyA/MuPAmyS2oedr4P/Kmsjpj06W60TXEXKcQqfXhHw81EHmQ8IzCjikkwcHpA==
X-Received: by 2002:a6b:7503:: with SMTP id l3mr13109550ioh.293.1568590325381;
        Sun, 15 Sep 2019 16:32:05 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.81])
        by smtp.gmail.com with ESMTPSA id c12sm22620245ioo.67.2019.09.15.16.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 16:32:04 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu0, svv@google.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v6 2/6] HID: joycon: add player led support
Date:   Sun, 15 Sep 2019 18:31:36 -0500
Message-Id: <20190915233140.244347-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190915233140.244347-1-djogorchock@gmail.com>
References: <20190915233140.244347-1-djogorchock@gmail.com>
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
 drivers/hid/hid-joycon.c | 103 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 100 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 233e03ac68e2..b306d5fd4ceb 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -466,6 +466,8 @@ config HID_JABRA
 config HID_JOYCON
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-joycon.c b/drivers/hid/hid-joycon.c
index c2715edc1bae..02b7079cb431 100644
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
 
 #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
+#define JC_NUM_LEDS		4
 
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
+	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
 
 	/* The following members are used for synchronous sends/receives */
@@ -519,11 +522,9 @@ static const unsigned int joycon_button_inputs[] = {
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
@@ -582,6 +583,69 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		goto err;
 
+	return 0;
+
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
@@ -589,13 +653,35 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		hid_warn(ctlr->hdev, "Failed to set leds; ret=%d\n", ret);
 	mutex_unlock(&ctlr->output_mutex);
+
+	/* configure the player LEDs */
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name,
+				      joycon_player_led_names[i]);
+		if (!name) {
+			ret = -ENOMEM;
+			break;
+		}
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
-err:
 	return ret;
 }
 
@@ -765,6 +851,13 @@ static int joycon_hid_probe(struct hid_device *hdev,
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

