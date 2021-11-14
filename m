Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F76944FA23
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 20:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhKNT0f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Nov 2021 14:26:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236157AbhKNT0a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Nov 2021 14:26:30 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F15C061746
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 11:23:33 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id c8so61617560ede.13
        for <linux-input@vger.kernel.org>; Sun, 14 Nov 2021 11:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=msm4RixDwEFMfe+7jyY/ubZlcJMsRCU7XocB5DrglG4=;
        b=WGR4HMjvoCm4Krb9bPDEX/EwRdcBGcnBSk3pX0WPbUZvRFLdiXT8JUn65nWp5XMzTl
         hk4r2zKlvlPBO7csopT4ME2/CHTgeTG7qrc1AKfYpUabe0LeDJ43RTRjp8878SMhOpO0
         +S1ktknpZ+kXdJtbgHj33CUEgz40reJ7BQzjBIUZutSCABHzxBrgNsGUE2F8S8PPsUM2
         7L+T8XZxPMP9puPV/4SRSB6b7MGgJCFdc09zmG0Cp7y1x+YgTM+e0mrqMoGgUYOc1yBz
         0OKavacF2X2Kuj9ni633FaEBpd08gnSwIkSRt3yBhetsx2EtBcQiGS+flFl29QauZ3d/
         8nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=msm4RixDwEFMfe+7jyY/ubZlcJMsRCU7XocB5DrglG4=;
        b=V69xgRDMEiJvBh2nSljaKuzjHQ1AlSXAWtv0Rwevmz7NT1l8mD6vQ5m4ImumEcg8QO
         od42xp8pQ4QlX1bUitZmzuXJZSm1i0J+Oc6u2glYQdYnnceDA9QQKajAfCkw9/29vAvi
         ynTXzbfhwBEQ73BXQFv663HDa+rS9K3H5GtjX0M9YlFKLD4TMXGZ43PXJqiunoHWLdT4
         JRnq04HPJ1NLw8gr6OLGP9STmfAzxva3MPM6HUtnAZ1XICswOFkUThA2t5PGro0TtkBf
         SIbkmeS6S+hW4kH1I8n3l5Zps2VQoVSx/pdmeePgfAJE+iGE6TIRmHMkWtjwSD79Fbi9
         0rIQ==
X-Gm-Message-State: AOAM532f+weoP/rfi/yltZLSWt+BJphBCgClD5BUgJ+YI4FgiCHjgUf5
        5HDLCWlnJw51lPb/Sn6NmLI=
X-Google-Smtp-Source: ABdhPJyiASH7reQvNA4EfR2HjVC0nMHrXbojU2mu/nYpTbCs4b3hrASHqrlpWLCdrMzdH7taH4BSOg==
X-Received: by 2002:a17:907:7d94:: with SMTP id oz20mr43970093ejc.410.1636917812192;
        Sun, 14 Nov 2021 11:23:32 -0800 (PST)
Received: from rechenknecht2k11 (200116b8456c370014a1cb2603939609.dip.versatel-1u1.de. [2001:16b8:456c:3700:14a1:cb26:393:9609])
        by smtp.googlemail.com with ESMTPSA id u14sm6180078edj.74.2021.11.14.11.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 11:23:32 -0800 (PST)
Date:   Sun, 14 Nov 2021 20:23:29 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        lawl <github@dumbinter.net>
Subject: [PATCH v2] Input: xpad - Poweroff XBOX360W on mode button long
 press
Message-ID: <20211114202329.5745bb26@rechenknecht2k11>
In-Reply-To: <3b25f4b1-3ec0-0878-99bc-0da06ce7c2f2@gmail.com>
References: <20211113141155.26217b44@rechenknecht2k11>
        <3b25f4b1-3ec0-0878-99bc-0da06ce7c2f2@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Newer gamepads turn themselves off when the mode button is held down.
For XBOX360W gamepads we must do this in the driver.

Power off the gamepad after 5s of holding down the button.

Signed-off-by: lawl <github@dumbinter.net>
Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
Changed the timeout back to 5s

 drivers/input/joystick/xpad.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 18caaf436ed4..e36c4b0abd4b 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -619,11 +619,13 @@ struct usb_xpad {
 	int pad_nr;			/* the order x360 pads were attached */
 	const char *name;		/* name of the device */
 	struct work_struct work;	/* init/remove device from callback */
+	time64_t mode_btn_down_ts;	/* timestamp when mode button was pressed */
 };
 
 static int xpad_init_input(struct usb_xpad *xpad);
 static void xpad_deinit_input(struct usb_xpad *xpad);
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
+static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
 
 /*
  *	xpad_process_packet
@@ -775,6 +777,24 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	}
 
 	input_sync(dev);
+
+	/* xbox360w controllers can't be turned off without driver assistance */
+	if (xpad->xtype == XTYPE_XBOX360W) {
+		if (xpad->mode_btn_down_ts > 0
+		    && xpad->pad_present
+		    /* send power off after 5s of holding the button */
+		    && (ktime_get_seconds() - xpad->mode_btn_down_ts) >= 5) {
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
2.32.0
