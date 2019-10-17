Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03C69DB86F
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502425AbfJQUmh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:37 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36237 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502343AbfJQUmf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:35 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so2382919pfr.3;
        Thu, 17 Oct 2019 13:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PVrYmBoDUzQiiHoNw2A+nCbZJE8bePDfQgT4dijBPRw=;
        b=DNDNpCdFAd9VeiF8CHjBIo/j1+/PJ276Ve7b+Rck3q2D9WkgKlum2WioD8TIZJlWO1
         hrzurCLh+Q4pMxpBRfgqxSHsoxr66e593gDDXUYZO6gxl9LpsA8IMt/rdaCA7Oqo2V2L
         rOEU0OeEHMquodtQeSdBU8xmVrdLnJOVgHFFvB5cOQ6D06KsHNNT1fpXjIzNqIO7+JMz
         S8e0cQGLm9yJD4bPhhcUJHvheXxUEyvAjyMdM2UMfnng6dFve0cXux1NxDnbba8t0zV3
         HzLH1an4pkCtnyBX/ILC9iJlaqcOJ0QczrP4cC2g5pa9wIiiJLbizms+3IADNsxqFpya
         H/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PVrYmBoDUzQiiHoNw2A+nCbZJE8bePDfQgT4dijBPRw=;
        b=qBwnRlz9k9ma/egp0mqbkj8esnW0Vyzja69GuduL6mxHH4VZULiTgt2iJRMXGHr5JT
         0oc/Y6vuGcdwZh4n3Y96VTJKwh7HUTKA8UaFyY1CA4bWQMDF5BR+1N2cVJA5Pnz0LQoH
         8crXijYbF7UCB214SVmm6ixObHe8SXzFZAtCZ6W5O7CLIsZf8LEgisvdzWI8zSGXCmvy
         UEIyiON5ccOZLm9edBDmRIUDPY44v+DyhQPcaTxVg7RySc0NtxxIlv5x65rIgOjNwZuN
         IeN2Ek7HeGK7Pg2bQmIdS61otKiFfckh6Mh7VZ4RqPKWDVff4FQ2usDGo6lqYBarkoIW
         pioA==
X-Gm-Message-State: APjAAAWoEncA/n5Dx76w8lNhxBWlnZ6yWn0kxc7NILD+Ew87c3pMAFF7
        TGGZZn+gPCl71366F+xjaszE5Egb
X-Google-Smtp-Source: APXvYqwWilu0YT8+PBehmdRToprPAd+XGSdWPKVKJygxm7UFO/unONTgu6oIM937o/0QKQdQ2SFSrQ==
X-Received: by 2002:a63:3853:: with SMTP id h19mr2781778pgn.55.1571344953854;
        Thu, 17 Oct 2019 13:42:33 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:33 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Enrico Weigelt <info@metux.net>, Luca Weiss <luca@z3ntu.xyz>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sven Van Asbroeck <TheSven73@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/22] Input: apanel - switch to using polled mode of input devices
Date:   Thu, 17 Oct 2019 13:42:03 -0700
Message-Id: <20191017204217.106453-10-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
References: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We have added polled mode to the normal input devices with the intent of
retiring input_polled_dev. This converts apanel driver to use the polling
mode of standard input devices and removes dependency on INPUT_POLLDEV.

While at it, let's convert the driver to use devm.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

 drivers/input/misc/Kconfig  |   1 -
 drivers/input/misc/apanel.c | 153 +++++++++++++++---------------------
 2 files changed, 64 insertions(+), 90 deletions(-)

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7d9ae394e597..a6b8af69915d 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -257,7 +257,6 @@ config INPUT_MMA8450
 config INPUT_APANEL
 	tristate "Fujitsu Lifebook Application Panel buttons"
 	depends on X86 && I2C && LEDS_CLASS
-	select INPUT_POLLDEV
 	select CHECK_SIGNATURE
 	help
 	 Say Y here for support of the Application Panel buttons, used on
diff --git a/drivers/input/misc/apanel.c b/drivers/input/misc/apanel.c
index 53ec40d1b90d..de0deb432fe3 100644
--- a/drivers/input/misc/apanel.c
+++ b/drivers/input/misc/apanel.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/ioport.h>
 #include <linux/io.h>
-#include <linux/input-polldev.h>
+#include <linux/input.h>
 #include <linux/i2c.h>
 #include <linux/leds.h>
 
@@ -51,19 +51,28 @@ static enum apanel_chip device_chip[APANEL_DEV_MAX];
 #define MAX_PANEL_KEYS	12
 
 struct apanel {
-	struct input_polled_dev *ipdev;
+	struct input_dev *idev;
 	struct i2c_client *client;
 	unsigned short keymap[MAX_PANEL_KEYS];
-	u16    nkeys;
+	u16 nkeys;
 	struct led_classdev mail_led;
 };
 
+static unsigned short apanel_keymap[MAX_PANEL_KEYS] = {
+	[0] = KEY_MAIL,
+	[1] = KEY_WWW,
+	[2] = KEY_PROG2,
+	[3] = KEY_PROG1,
 
-static int apanel_probe(struct i2c_client *, const struct i2c_device_id *);
+	[8] = KEY_FORWARD,
+	[9] = KEY_REWIND,
+	[10] = KEY_STOPCD,
+	[11] = KEY_PLAYPAUSE,
+};
 
 static void report_key(struct input_dev *input, unsigned keycode)
 {
-	pr_debug(APANEL ": report key %#x\n", keycode);
+	dev_dbg(input->dev.parent, "report key %#x\n", keycode);
 	input_report_key(input, keycode, 1);
 	input_sync(input);
 
@@ -79,10 +88,9 @@ static void report_key(struct input_dev *input, unsigned keycode)
  * CD keys:
  * Forward (0x100), Rewind (0x200), Stop (0x400), Pause (0x800)
  */
-static void apanel_poll(struct input_polled_dev *ipdev)
+static void apanel_poll(struct input_dev *idev)
 {
-	struct apanel *ap = ipdev->private;
-	struct input_dev *idev = ipdev->input;
+	struct apanel *ap = input_get_drvdata(idev);
 	u8 cmd = device_chip[APANEL_DEV_APPBTN] == CHIP_OZ992C ? 0 : 8;
 	s32 data;
 	int i;
@@ -112,126 +120,93 @@ static int mail_led_set(struct led_classdev *led,
 	return i2c_smbus_write_word_data(ap->client, 0x10, led_bits);
 }
 
-static int apanel_remove(struct i2c_client *client)
-{
-	struct apanel *ap = i2c_get_clientdata(client);
-
-	if (device_chip[APANEL_DEV_LED] != CHIP_NONE)
-		led_classdev_unregister(&ap->mail_led);
-
-	input_unregister_polled_device(ap->ipdev);
-	input_free_polled_device(ap->ipdev);
-
-	return 0;
-}
-
-static void apanel_shutdown(struct i2c_client *client)
-{
-	apanel_remove(client);
-}
-
-static const struct i2c_device_id apanel_id[] = {
-	{ "fujitsu_apanel", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, apanel_id);
-
-static struct i2c_driver apanel_driver = {
-	.driver = {
-		.name = APANEL,
-	},
-	.probe		= &apanel_probe,
-	.remove		= &apanel_remove,
-	.shutdown	= &apanel_shutdown,
-	.id_table	= apanel_id,
-};
-
-static struct apanel apanel = {
-	.keymap = {
-		[0] = KEY_MAIL,
-		[1] = KEY_WWW,
-		[2] = KEY_PROG2,
-		[3] = KEY_PROG1,
-
-		[8] = KEY_FORWARD,
-		[9] = KEY_REWIND,
-		[10] = KEY_STOPCD,
-		[11] = KEY_PLAYPAUSE,
-
-	},
-	.mail_led = {
-		.name = "mail:blue",
-		.brightness_set_blocking = mail_led_set,
-	},
-};
-
-/* NB: Only one panel on the i2c. */
 static int apanel_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
 	struct apanel *ap;
-	struct input_polled_dev *ipdev;
 	struct input_dev *idev;
 	u8 cmd = device_chip[APANEL_DEV_APPBTN] == CHIP_OZ992C ? 0 : 8;
-	int i, err = -ENOMEM;
+	int i, err;
 
-	ap = &apanel;
+	ap = devm_kzalloc(&client->dev, sizeof(*ap), GFP_KERNEL);
+	if (!ap)
+		return -ENOMEM;
 
-	ipdev = input_allocate_polled_device();
-	if (!ipdev)
-		goto out1;
+	idev = devm_input_allocate_device(&client->dev);
+	if (!idev)
+		return -ENOMEM;
 
-	ap->ipdev = ipdev;
+	ap->idev = idev;
 	ap->client = client;
 
 	i2c_set_clientdata(client, ap);
 
 	err = i2c_smbus_write_word_data(client, cmd, 0);
 	if (err) {
-		dev_warn(&client->dev, APANEL ": smbus write error %d\n",
-			 err);
-		goto out3;
+		dev_warn(&client->dev, "smbus write error %d\n", err);
+		return err;
 	}
 
-	ipdev->poll = apanel_poll;
-	ipdev->poll_interval = POLL_INTERVAL_DEFAULT;
-	ipdev->private = ap;
+	input_set_drvdata(idev, ap);
 
-	idev = ipdev->input;
 	idev->name = APANEL_NAME " buttons";
 	idev->phys = "apanel/input0";
 	idev->id.bustype = BUS_HOST;
-	idev->dev.parent = &client->dev;
-
-	set_bit(EV_KEY, idev->evbit);
 
+	memcpy(ap->keymap, apanel_keymap, sizeof(apanel_keymap));
 	idev->keycode = ap->keymap;
 	idev->keycodesize = sizeof(ap->keymap[0]);
 	idev->keycodemax = (device_chip[APANEL_DEV_CDBTN] != CHIP_NONE) ? 12 : 4;
 
+	set_bit(EV_KEY, idev->evbit);
 	for (i = 0; i < idev->keycodemax; i++)
 		if (ap->keymap[i])
 			set_bit(ap->keymap[i], idev->keybit);
 
-	err = input_register_polled_device(ipdev);
+	err = input_setup_polling(idev, apanel_poll);
+	if (err)
+		return err;
+
+	input_set_poll_interval(idev, POLL_INTERVAL_DEFAULT);
+
+	err = input_register_device(idev);
 	if (err)
-		goto out3;
+		return err;
 
 	if (device_chip[APANEL_DEV_LED] != CHIP_NONE) {
-		err = led_classdev_register(&client->dev, &ap->mail_led);
+		ap->mail_led.name = "mail:blue";
+		ap->mail_led.brightness_set_blocking = mail_led_set;
+		err = devm_led_classdev_register(&client->dev, &ap->mail_led);
 		if (err)
-			goto out4;
+			return err;
 	}
 
 	return 0;
-out4:
-	input_unregister_polled_device(ipdev);
-out3:
-	input_free_polled_device(ipdev);
-out1:
-	return err;
 }
 
+static void apanel_shutdown(struct i2c_client *client)
+{
+	struct apanel *ap = i2c_get_clientdata(client);
+
+	if (device_chip[APANEL_DEV_LED] != CHIP_NONE)
+		led_set_brightness(&ap->mail_led, LED_OFF);
+}
+
+static const struct i2c_device_id apanel_id[] = {
+	{ "fujitsu_apanel", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, apanel_id);
+
+static struct i2c_driver apanel_driver = {
+	.driver = {
+		.name = APANEL,
+	},
+	.probe		= &apanel_probe,
+	.shutdown	= &apanel_shutdown,
+	.id_table	= apanel_id,
+};
+
 /* Scan the system ROM for the signature "FJKEYINF" */
 static __init const void __iomem *bios_signature(const void __iomem *bios)
 {
-- 
2.23.0.866.gb869b98d4c-goog

