Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A2F24EB5C
	for <lists+linux-input@lfdr.de>; Sun, 23 Aug 2020 06:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgHWEmX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 23 Aug 2020 00:42:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725139AbgHWEmV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 23 Aug 2020 00:42:21 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F4074C061573
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:20 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id j18so456033oig.5
        for <linux-input@vger.kernel.org>; Sat, 22 Aug 2020 21:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NFqTVUs5L3EcLpY9b87NYhKi/88bk8yTv3cGSYNZo8M=;
        b=QMM+NGtJ7xxJdKGjL5gRSmCbEOrxh19kgJLyMn360JQuwljExHYQjXReiuqeAGigx/
         vizRVHse+BXnAXPgKuOke6j2tRh/dS+8Odbaxyk5aEquWN3zPHScgqBqw4dF+XWR7ZBd
         UXXTa30A2GtWJ0YUR8wZOoLDveDT7S5aLfqI527dilJPs9+uKvfVwI8c3gX5sBSl8CrF
         1xnx/ZqiT+iA5Q9AZHZl8svSKBv+d+KU0Ue1dNSV219qU/9lKIUWDNc6wYEMrW1tAzsn
         z9OjWlC1qHxqP5mVCpEkFFM4uTlIZBfvHXeQFxwOz0mCOhJH4FyAg1tq4SVmzmlasaoP
         Nbzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NFqTVUs5L3EcLpY9b87NYhKi/88bk8yTv3cGSYNZo8M=;
        b=Gx/HB0KSHwgoC7sa1SiyDGq48b9AWgRuB/I/+El1cKpK/LnhGlAUb+sw7xvgAnyaB3
         ViJ8cbvLQLt3uXPCXvwZy4i/p/U0nvsImJjQTYu6IsMsLjUqBMhTkgkambS7U+XMCYgX
         fkgSuipoKVmZm6GK+Qjlm5OaiScvbNf1cvnJzlzvH9zii8GNtrFg6UOUbVdrwL8DXubX
         OUPXjY9KcPJtCQXV7/JkiSuLBobPGG8rqgb3OZ8/vdN+6hDDITgUNTLr2AxvC1arEDSK
         Pzg+Q1fjTpvfoxyiKvjpKM5AxzTEifKUUzj/lRdzwrRACS7DGKz8wM9ypREafWgn23EP
         KcHg==
X-Gm-Message-State: AOAM533Z9qr5E6r8yx6pRUJB9oD60b17NgH719BdD5MkLzZ0evWzMzS6
        RaSPgFX8Inbf+faAtcVUBuwN0J/GtRJVsZ36
X-Google-Smtp-Source: ABdhPJwR5VamJtNcgYTz9ELwE2LJolwn6QDDA90fVcQAdGNGiRkcJOmyWhL0ftMGUo9BjkPBGa+jEA==
X-Received: by 2002:aca:4d48:: with SMTP id a69mr110003oib.39.1598157740068;
        Sat, 22 Aug 2020 21:42:20 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.33.205.58])
        by smtp.gmail.com with ESMTPSA id z10sm1308572otk.6.2020.08.22.21.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 21:42:19 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v12 02/14] HID: nintendo: add player led support
Date:   Sat, 22 Aug 2020 23:41:45 -0500
Message-Id: <20200823044157.339677-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823044157.339677-1-djogorchock@gmail.com>
References: <20200823044157.339677-1-djogorchock@gmail.com>
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
index b5cd42ed3b04..af4d543c0ff9 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -713,6 +713,8 @@ config HID_MULTITOUCH
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 7273ddf033e2..c3eec9b7c99c 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 
@@ -183,11 +184,13 @@ struct joycon_input_report {
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
@@ -553,11 +556,9 @@ static const unsigned int joycon_dpad_inputs_jc[] = {
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
@@ -643,6 +644,66 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -650,6 +711,29 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
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
@@ -815,6 +899,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
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
2.28.0

