Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58BA392FF1
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 15:41:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236550AbhE0NnK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 09:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236553AbhE0NnH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 09:43:07 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8204C061760;
        Thu, 27 May 2021 06:41:33 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id f11so1417287wrq.1;
        Thu, 27 May 2021 06:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=42av6mzVPz1UHZ76BiA/La0SCJcbWprbyJjdY5KanPk=;
        b=kUjVgGokmyR/Ib90dM14WzCWpEV7Zx3c0rTZxucvYgXc7QLwkioEsIbmMBGrPVVwVy
         lVWyKi1fiwEdpjq2kxoKKg15iH0rw2I6pB4HuEWTMItOdYVmt+268OUmAx0TllC56648
         UCiuaHM8o62B8Ws3uns3P6u5KQ4Szb206fH65cwQLObDG7KGYpVnJFoNGkBq70uyKsje
         wWuQyXSkOzuPec+SVVJjs90oc9/f7+1A6CLCjr2nNVSoUpUor358gnvDZVl/b9LKVc1m
         FC1qGUsnNLYGOCGqa5HCaDKjcEpz8gnT0fuBln9BXV3WT9J9QsZhDl2M1qSHS1lEeB0M
         JMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=42av6mzVPz1UHZ76BiA/La0SCJcbWprbyJjdY5KanPk=;
        b=oE6NMiCrRpdamc7cZT9WgGhR7MZ7hSycc4fskO8m1afUFEZkP1UhdE4x8U9lhR4fUg
         buMxFlPufb+TOXtp5bDQQ5VrN6jgXWebuC1e5Jn3ehL1SGddI3bweHBlziaBZwxP3xum
         4Qi3olYdhXyZmZB3r7tllyeRXx/0yMXIE4NuxWzKRvka04WjSvWu7qqcqid9xDWP6qvT
         lJoEzYUbT62S7cdCgAUdxMjV5cJbgM5Luko7cw7zlg9L9mBk2hvDGplhO2tEvdsaWuWi
         ostnFUJEcwy6mRw1XZ9wqHdEFt0ccsjo2VGJJSq6otsJkRNn0zvIU44Z73wOYXwO+o+K
         mAAw==
X-Gm-Message-State: AOAM533jlD1hmfUq8tkj+eLVpzObPmLqVfv+FWcHY+oMkVNcFLh4XblI
        NxfqebUL2z6K4bKO4cQWbR4Fjo+EYnuHR372
X-Google-Smtp-Source: ABdhPJy556o6tWC0YcIsFt1xTFX6RlPMfpeadDdwGVTqn8HRR1EecOx0zbvwHmzoyMzG22pdOLYu5Q==
X-Received: by 2002:adf:dc88:: with SMTP id r8mr3425987wrj.277.1622122892175;
        Thu, 27 May 2021 06:41:32 -0700 (PDT)
Received: from caroline.lan (233.119.189.80.dyn.plus.net. [80.189.119.233])
        by smtp.gmail.com with ESMTPSA id b10sm3741284wrr.27.2021.05.27.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 06:41:31 -0700 (PDT)
From:   Erica Taylor <rickytaylor26@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Erica Taylor <rickytaylor26@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Matt Reynolds <mattreynolds@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        linux-kernel@vger.kernel.org, Simon Wood <simon@mungewell.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 2/2] Input: xpad - add Logitech G923 Xbox variant
Date:   Thu, 27 May 2021 14:41:04 +0100
Message-Id: <20210527134104.217865-3-rickytaylor26@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210527134104.217865-1-rickytaylor26@gmail.com>
References: <20210527134104.217865-1-rickytaylor26@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This includes device information for the G923 as well as
code to perform a protocol change to HID++.

Many features do not work as-is with the xpad driver. Almost everything
apart from TrueForce works under the logitech-hidpp driver.

What works:
- Face buttons, D-pad, Xbox button, LB, RB, switch and menu
- Paddle shifters
- One pedal axis

What does not work:
- Force feedback
- TrueForce
- Shifter positions
- Dial and centre button
- +/- buttons
- Steering wheel rotation
- The other two pedal axes

Signed-off-by: Erica Taylor <rickytaylor26@gmail.com>
---
 drivers/input/joystick/xpad.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index d69d7657ab12..930283433615 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -79,6 +79,7 @@
 #define MAP_DPAD_TO_BUTTONS		(1 << 0)
 #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
 #define MAP_STICKS_TO_NULL		(1 << 2)
+#define HIDPP_CAPABLE			BIT(3)
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
 
@@ -104,6 +105,10 @@ static bool auto_poweroff = true;
 module_param(auto_poweroff, bool, S_IWUSR | S_IRUGO);
 MODULE_PARM_DESC(auto_poweroff, "Power off wireless controllers on suspend");
 
+static bool switch_to_hidpp = true;
+module_param(switch_to_hidpp, bool, 0444);
+MODULE_PARM_DESC(switch_to_hidpp, "Switch appropriate devices over to the HID++ protocol");
+
 static const struct xpad_device {
 	u16 idVendor;
 	u16 idProduct;
@@ -333,6 +338,8 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
+	{ 0x046d, 0xc262, "Logitech G920 Wheel (Xbox Mode)", HIDPP_CAPABLE, XTYPE_XBOXONE },
+	{ 0x046d, 0xc26d, "Logitech G923 Wheel (Xbox Mode)", HIDPP_CAPABLE, XTYPE_XBOXONE },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
@@ -420,6 +427,7 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft X-Box 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x045e),		/* Microsoft X-Box One controllers */
 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech X-Box 360 style controllers */
+	XPAD_XBOXONE_VENDOR(0x046d),		/* Logitech X-Box One style controllers */
 	XPAD_XBOX360_VENDOR(0x056e),		/* Elecom JC-U3613M */
 	XPAD_XBOX360_VENDOR(0x06a3),		/* Saitek P3600 */
 	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz X-Box 360 controllers */
@@ -558,6 +566,17 @@ static const struct xboxone_init_packet xboxone_init_packets[] = {
 	XBOXONE_INIT_PKT(0x24c6, 0x543a, xboxone_rumbleend_init),
 };
 
+/*
+ * A magic packet sent to Logitech devices to tell them to change to the HID++
+ * protocol. This is preferred when in use on a PC.
+ *
+ * After receiving this packet, the device will disconnect and reappear with
+ * a different productId, which will be picked up by the Logitech HID++ driver.
+ */
+static const u8 switch_to_hidpp_cmd[] = {
+	0x0f, 0x00, 0x01, 0x01, 0x42
+};
+
 struct xpad_output_packet {
 	u8 data[XPAD_PKT_LEN];
 	u8 len;
@@ -998,6 +1017,14 @@ static bool xpad_prepare_next_init_packet(struct usb_xpad *xpad)
 		return true;
 	}
 
+	if (switch_to_hidpp && xpad->mapping & HIDPP_CAPABLE) {
+		dev_dbg(&xpad->intf->dev, "%s - switching to HID++", __func__);
+		memcpy(xpad->odata, g923_hidpp_init, ARRAY_SIZE(g923_hidpp_init));
+		xpad->irq_out->transfer_buffer_length = ARRAY_SIZE(g923_hidpp_init);
+		xpad->odata[2] = xpad->odata_serial++;
+		return true;
+	}
+
 	return false;
 }
 
-- 
2.31.1

