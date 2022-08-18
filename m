Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0F05983A4
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244150AbiHRNBh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244904AbiHRNBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:01:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11307D78C
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:01:19 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id a22so1788838edj.5
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=8SDrmIhzrmAJNelmt4SDMm2Yu9CQ0/R9sPqoPNG3qU0=;
        b=QouMjtrm3w42IrRMicyXOLvIV+B2cP4y2qUOeUwIHzk4Xj/JQ1q/ylanWlQUROGz8A
         bc8kt8xI17j+rF3szN7NQZ+LbeO/wMBKqZuqZu2OoSoaBvPcPv4amHLnEXQOpK4ygnGz
         QI/Nvcul3+ZwsjUZXQMyoZ7mk+WPz0ymThGfzZE6nltXOEPKiJLyE2UPWDu2DWj0r9uD
         M13ZoO1NKVvDuGXVbYmIfp7/womvt6k/bTDC6ugJ346VfrQARGytWh9Np4yECO0LMu+6
         5JXQug0bArXL4o7717hna3V//1FHGOg8soCtCwAO84/MVMxG1PxOgp8znCc3zpqfhoD8
         9XcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=8SDrmIhzrmAJNelmt4SDMm2Yu9CQ0/R9sPqoPNG3qU0=;
        b=0DodpEphKRIRnxa3jjWpz+PDfdZluLXY1Cg58Hb4jD2wn0Eh20pWI6nwVnHaZ+DObQ
         0nd2zPFSIAygr6uZ+iWz3o2kJxMEEAoI6WR1OttFk2sSlkMTSNFP6uSE7bUNaJbHEN5T
         o+V4lnEjVhLePr6hzlJaive3PeeobzTmrFiiYjJN60zfloY0pAfAWGVTlc9au5VtosfO
         9EM7+sBcqPO+tZISqJSbSP0XkP2B8tqeLeM0rkxix/DkmfZrhbVo/FFTeCmiYBmodJUX
         OY3EinsKagL7y2ul/BN6I+P2+SOXeusiII9uwnTLJ9u5nh/gBVBJ/xs77gFMsgd2pUbV
         Bp6w==
X-Gm-Message-State: ACgBeo2++mfVZxoCzh2j2IhWEczfao1tUKU76NmtWGPFB4bg8aa11P75
        GmJd0nvJ893pn44KkkA3uzGEcqLtvN4DhA==
X-Google-Smtp-Source: AA6agR4lKz1sFyTT4zNXU7TYvhcHHQ5VEjDDMpkhuBNuQdT4aBS19h8J38c/LOqcsAA6eh9s47cP6g==
X-Received: by 2002:a05:6402:612:b0:43d:5049:4d0f with SMTP id n18-20020a056402061200b0043d50494d0fmr2179472edv.127.1660827678107;
        Thu, 18 Aug 2022 06:01:18 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.gmail.com with ESMTPSA id f4-20020a50ee84000000b0043a2b8ab377sm1093250edr.88.2022.08.18.06.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 06:01:17 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Santosh De Massari <s.demassari@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 3/4] Input: xpad - Poweroff XBOX360W on mode button long press
Date:   Thu, 18 Aug 2022 15:00:20 +0200
Message-Id: <20220818130021.487410-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220818130021.487410-1-rojtberg@gmail.com>
References: <20220818130021.487410-1-rojtberg@gmail.com>
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

