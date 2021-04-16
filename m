Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D558E36209C
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 15:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243396AbhDPNOD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 09:14:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28364 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235252AbhDPNOC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 09:14:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618578817;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jb8oIHg0iOx0tAJaAZIEhtCOW5fT/J+mpZA59jYafeg=;
        b=JJseE6BD/pkhZeOKuzo3pY3e/iFqq0sFLOLo5To29YP82B+nYZ5x+x3heh9UyMeQpmLq0O
        cb4MxQZJxlHD/AXeSfoz1b5cyV0WGjb6P9/SQjSbTT2xF+l0QhzQl3hzxeGcCkOymgXYz7
        qJrYOhORRWjM212sHM9n4SaD+m8x0sY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-M0HI8CrbPue5HUuaD1C-JQ-1; Fri, 16 Apr 2021 09:13:34 -0400
X-MC-Unique: M0HI8CrbPue5HUuaD1C-JQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EC52107ACCA;
        Fri, 16 Apr 2021 13:13:33 +0000 (UTC)
Received: from x1.localdomain (ovpn-113-102.ams2.redhat.com [10.36.113.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4A8E15C257;
        Fri, 16 Apr 2021 13:13:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Peter Hoeg <peter@hoeg.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 3/6] HID: lg-g15: Add a lg_g15_init_input_dev() helper function
Date:   Fri, 16 Apr 2021 15:13:20 +0200
Message-Id: <20210416131323.233184-4-hdegoede@redhat.com>
In-Reply-To: <20210416131323.233184-1-hdegoede@redhat.com>
References: <20210416131323.233184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Factor the input-device setup + KEY_KBD_LCD_MENU capability setting out
of lg_g15_probe() into a new lg_g15_init_input_dev() helper function.

This is a preparation patch for adding support for the LCD menu
keys + LCD brightness control on the Logitech Z-10 speakers (with LCD)
which use the same protocol as the G15 keyboards.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lg-g15.c | 42 ++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-lg-g15.c b/drivers/hid/hid-lg-g15.c
index 75a27b48d9c9..eff8c51a8dce 100644
--- a/drivers/hid/hid-lg-g15.c
+++ b/drivers/hid/hid-lg-g15.c
@@ -709,6 +709,28 @@ static int lg_g15_register_led(struct lg_g15_data *g15, int i)
 	return devm_led_classdev_register(&g15->hdev->dev, &g15->leds[i].cdev);
 }
 
+/* Common input device init code shared between keyboards and Z-10 speaker handling */
+static void lg_g15_init_input_dev(struct hid_device *hdev, struct input_dev *input,
+				  const char *name)
+{
+	int i;
+
+	input->name = name;
+	input->phys = hdev->phys;
+	input->uniq = hdev->uniq;
+	input->id.bustype = hdev->bus;
+	input->id.vendor  = hdev->vendor;
+	input->id.product = hdev->product;
+	input->id.version = hdev->version;
+	input->dev.parent = &hdev->dev;
+	input->open = lg_g15_input_open;
+	input->close = lg_g15_input_close;
+
+	/* Keys below the LCD, intended for controlling a menu on the LCD */
+	for (i = 0; i < 5; i++)
+		input_set_capability(input, EV_KEY, KEY_KBD_LCD_MENU1 + i);
+}
+
 static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	u8 gkeys_settings_output_report = 0;
@@ -751,6 +773,8 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	g15->hdev = hdev;
 	g15->model = id->driver_data;
+	g15->input = input;
+	input_set_drvdata(input, hdev);
 	hid_set_drvdata(hdev, (void *)g15);
 
 	switch (g15->model) {
@@ -822,16 +846,7 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto error_hw_stop;
 
 	/* Setup and register input device */
-	input->name = "Logitech Gaming Keyboard Gaming Keys";
-	input->phys = hdev->phys;
-	input->uniq = hdev->uniq;
-	input->id.bustype = hdev->bus;
-	input->id.vendor  = hdev->vendor;
-	input->id.product = hdev->product;
-	input->id.version = hdev->version;
-	input->dev.parent = &hdev->dev;
-	input->open = lg_g15_input_open;
-	input->close = lg_g15_input_close;
+	lg_g15_init_input_dev(hdev, input, "Logitech Gaming Keyboard Gaming Keys");
 
 	/* G-keys */
 	for (i = 0; i < gkeys; i++)
@@ -842,10 +857,6 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		input_set_capability(input, EV_KEY, KEY_MACRO_PRESET1 + i);
 	input_set_capability(input, EV_KEY, KEY_MACRO_RECORD_START);
 
-	/* Keys below the LCD, intended for controlling a menu on the LCD */
-	for (i = 0; i < 5; i++)
-		input_set_capability(input, EV_KEY, KEY_KBD_LCD_MENU1 + i);
-
 	/*
 	 * On the G510 only report headphone and mic mute keys when *not* using
 	 * the builtin USB audio device. When the builtin audio is used these
@@ -857,9 +868,6 @@ static int lg_g15_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		input_set_capability(input, EV_KEY, KEY_F20);
 	}
 
-	g15->input = input;
-	input_set_drvdata(input, hdev);
-
 	ret = input_register_device(input);
 	if (ret)
 		goto error_hw_stop;
-- 
2.31.1

