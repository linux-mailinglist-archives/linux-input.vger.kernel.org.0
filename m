Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C8C15987B5
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 17:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343693AbiHRPob (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 11:44:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343889AbiHRPo1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 11:44:27 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375F79A9A2
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 08:44:23 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id dc19so3933762ejb.12
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 08:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8SDrmIhzrmAJNelmt4SDMm2Yu9CQ0/R9sPqoPNG3qU0=;
        b=QS5+twyE0IN8YpXVvlWqHyv/7h6s+RAFLjtyFMwyDRjxH64icsr2/r59QMPijaGfZG
         Jn9P9K/LYomHtVnZoJj4daJKwBy1cntWPosI8Fg/WpHL1n08uCma8n6tZ+dL69oS/UQr
         kQvw/xvzKFNkJlarIw1iuP+ugwMAIbEq3TsO/iyoUNVJyir7PSp+lils0sL6prbMeqW5
         /hglhjtqXyNueSmi6vgntRguHZreAEkwUXjx1W5HxFofS3TrVAjuyNEGZkSposUQ4T2K
         e0Kc4kUxOoCnWlXWK/i8NzSwGzxTGprDojL6fg9NXX2gdLGDu4XpGchrwUNtAJT7YpN6
         llIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8SDrmIhzrmAJNelmt4SDMm2Yu9CQ0/R9sPqoPNG3qU0=;
        b=UnizuebDV1WEHKt/Z6zcAbocfwv5lkP/rvwNrRta8mTL48VVMleZjBny1MRdlqNVer
         7AmQPuZp1IIPTyMLgz7+WcenqlUh8nuMpuXJV2NL0aWK23XW73ASPvRtbq70nFoUqTal
         PNqfYLUEwwDh6AmDLdsVYOw5OmMfF0NzvhBrp2kzDHGydqqVbW0bZuVGiOctyqbRcSLY
         /TRDn3Kc8UXXvO07OjdV0kI4JwFdcjPdFz1vff6dQocQAjf+L6ueZzUrm8baQfEfQenm
         49F1/M6hexnm2Bwq523k0vzTNfaE+hGZstApS4dPQeSj4FXwAz/a1mkSc6vChA4ZQxvJ
         Hbpg==
X-Gm-Message-State: ACgBeo2Zmqn9TvD7Zd1wm31vbSfSl0VRoMQSBFZO7OoDLEQiokMPiWTk
        Gi9n90fxuAH39BKlK6xWiHja4+jXH5Ewig==
X-Google-Smtp-Source: AA6agR6fmvsCYR358OBpuKBJN98I6/7o24DI1PhCeeUJhMZDc96OSyy/pCgblrVnbpvWkQ+DwH3F0w==
X-Received: by 2002:a17:906:9753:b0:732:f809:e539 with SMTP id o19-20020a170906975300b00732f809e539mr2226310ejy.235.1660837461745;
        Thu, 18 Aug 2022 08:44:21 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.gmail.com with ESMTPSA id v1-20020a170906292100b0073a62f3b447sm997486ejd.44.2022.08.18.08.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:44:21 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Santosh De Massari <s.demassari@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 3/4] Input: xpad - Poweroff XBOX360W on mode button long press
Date:   Thu, 18 Aug 2022 17:44:10 +0200
Message-Id: <20220818154411.510308-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818154411.510308-1-rojtberg@gmail.com>
References: <20220818154411.510308-1-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Santosh De Massari <s.demassari@gmail.com>

Newer gamepads turn themselves off when the mode button is held down.
For XBOX360W gamepads we must do this in the driver.

Do not use BIT() macro for consistency within the file.

Signed-off-by: Santosh De Massari <s.demassari@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4e01056..f964219 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -89,6 +89,11 @@
 #define XTYPE_XBOXONE     3
 #define XTYPE_UNKNOWN     4
 
+/* Send power-off packet to xpad360w after holding the mode button for this many
+ * seconds
+ */
+#define XPAD360W_POWEROFF_TIMEOUT 5
+
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
 MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
@@ -630,11 +635,13 @@ struct usb_xpad {
 	int pad_nr;			/* the order x360 pads were attached */
 	const char *name;		/* name of the device */
 	struct work_struct work;	/* init/remove device from callback */
+	time64_t mode_btn_down_ts;
 };
 
 static int xpad_init_input(struct usb_xpad *xpad);
 static void xpad_deinit_input(struct usb_xpad *xpad);
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
+static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
 
 /*
  *	xpad_process_packet
@@ -786,6 +793,23 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	}
 
 	input_sync(dev);
+
+	/* XBOX360W controllers can't be turned off without driver assistance */
+	if (xpad->xtype == XTYPE_XBOX360W) {
+		if (xpad->mode_btn_down_ts > 0 && xpad->pad_present &&
+		    ((ktime_get_seconds() - xpad->mode_btn_down_ts) >=
+		     XPAD360W_POWEROFF_TIMEOUT)) {
+			xpad360w_poweroff_controller(xpad);
+			xpad->mode_btn_down_ts = 0;
+			return;
+		}
+
+		/* mode button down/up */
+		if (data[3] & 0x04)
+			xpad->mode_btn_down_ts = ktime_get_seconds();
+		else
+			xpad->mode_btn_down_ts = 0;
+	}
 }
 
 static void xpad_presence_work(struct work_struct *work)
-- 
2.34.1

