Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBD2D072B
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 08:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfJIG3D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 02:29:03 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39294 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJIG3D (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 02:29:03 -0400
Received: by mail-io1-f68.google.com with SMTP id a1so2489095ioc.6
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 23:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZOnuWCv96WYir9/W9yOQHJZGwqVxavp4RYweH4d8ZeY=;
        b=B4+Aq4le2XAwTgJnq3n7L94mjYjLdi3+T+Cdz/xGGW6n/yBHiCn7FlrcOrhRpKSC3Z
         BfMyG6N6RHFjR97cU1IKc6Fe5t1wWR5QBpdoV/JchwRIFaT05BHlRgxRPIH29ppuNIxt
         8krEXB16ie/FUGC0uCt3/+f/pUuh93hThdxKioc+VNISiVxlMP8/JKhAqNCKcF90WgQN
         cFrtG7xuP9W3sILrzze2xXXo/MG6TaJ23X8Ca+1pwPviYabBhx8vg6HlBqRsRDn4HQCg
         zNo0FeohhKmK5IsTl/VItQEmhrDy0Rdl9vYXm35i+wYdJMcFekJqZpX/3OovwDP6tqfQ
         A2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZOnuWCv96WYir9/W9yOQHJZGwqVxavp4RYweH4d8ZeY=;
        b=bB9VdW9cj1LyLpY4QvkrdoXfNen/S5GUpoFtiWoam7ZhhvO6u8jgP6HKEC/geAezKu
         6++l/yVUsTArduRs12E+g0AeLee/hDePt18z+dj4R5xaLRj/SeMJ+jnL3mbFN0i9TCNH
         MNTLb3Fx02eUDV+aBtEmFpMqXGDPZMPvLamoTAJNYaiIo0H/5e5Gy82jG3o/Vy3lP8xo
         eaVCK/whdD5lfPtwO4fT8BF93MaTMAXsTZCljiEVBx3uoA4OOKABY2W4bOrBknVhrnVB
         0U7zTv2gbII92UGJu1qhn2c7TubEx4wzQuYD0UDOd/MpkJ3bY5IQXgWPoZtf4JKSZFNc
         GEPg==
X-Gm-Message-State: APjAAAUCB6SEvB1Tv4zLW7TVQjYXhary58vidHVjVhh4pNbG1kHQy43m
        E0UGcE8rjCUcpzzuvgr/8UrgQVe8h6A=
X-Google-Smtp-Source: APXvYqzthTblGmpHcTnd8lUk6kBRXldwuUK9HQQJgROx/7raM41qwUdYnjRB0Q1ZkKy9+RVtwFtmhA==
X-Received: by 2002:a5e:850d:: with SMTP id i13mr1212170ioj.101.1570602541904;
        Tue, 08 Oct 2019 23:29:01 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id r22sm880844ilb.85.2019.10.08.23.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 23:29:01 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v7 2/8] HID: nintendo: add player led support
Date:   Wed,  9 Oct 2019 01:28:27 -0500
Message-Id: <20191009062833.3599398-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009062833.3599398-1-djogorchock@gmail.com>
References: <20191009062833.3599398-1-djogorchock@gmail.com>
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
index b7a2d91c98a4..7d98171b514f 100644
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
@@ -577,6 +578,66 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -584,6 +645,29 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -753,6 +837,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
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

