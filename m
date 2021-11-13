Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A308644F340
	for <lists+linux-input@lfdr.de>; Sat, 13 Nov 2021 14:12:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbhKMNOx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 08:14:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231555AbhKMNOw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 08:14:52 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F37DC061766
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 05:12:00 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id e144so14797637iof.3
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 05:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=elfMLJBiHjBc2KgbdbY7pEpDW9raIzEe/DxylOUOomY=;
        b=AdeeydJwV4Ds0VOA/CgCktwoDNqE/1TgIM73fhHLbl3ib4wpAg+FSo1lQYvElLbGOl
         2KVmrOFek393PQ0w0LJZhuabSc2/N5qxNnJgcRmfhdgIMEMtAVOXwA2KDWD15yIQA9gD
         tKIaveBTOSqZTwIqyTMizXmgxHNYdpnZJ+SwdfmV/m4dwa5MMbas3YhFhnPLXCRodwwJ
         wIFc4AJvclO2tWgVqTx1rfNYRhmtbI6coISeW1Cvph7I3/2d/mO0NDT8M73OO8Fde/fD
         LHBEYPJKiglfQ61od1Gs0ZHjTVDQISVw/o2A3UmEAgM7Nnu7n1sL7+n0ag/tLi+Uzr1W
         QE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=elfMLJBiHjBc2KgbdbY7pEpDW9raIzEe/DxylOUOomY=;
        b=4kyuw54RKha4oadIfrRE4Ft8zCsfLYp3v7lYfG2SKKqLFgViPHceOXoRUI5CYEOHlq
         R3IaCEMM1StSmQaaA+XpMtB/riKzYEBcEx6vCkWCGRqRNHkHJyoYRgF5mqsc6/t2/0Jr
         Pnhc8slc3THDy61DkXiaPOvneeP5q97jj74LXeX9slPnjKJ6uRXNDPmadLmLbLu5vlLy
         FmhdCCWXdMmSERZm5qDgGfI3e8GL2FBUeIZ354StIsmmw5fHT3fmEajoN7mKio+fHCMu
         OABzS5AKF49yKbLwg9osN5C3NxROs/4PKlVUqu8lZ0XPx8qANdcefns903CA3GKBnzVV
         t4dA==
X-Gm-Message-State: AOAM532u2hArcYKsEHWQdO4jlMX5y967FP81vjzyDLDZZNIPapcjgup/
        Zgin9Qe+j7sTZVOQCuH3IS/07Sd5tkReMA==
X-Google-Smtp-Source: ABdhPJzl20vJ/6rQXfh2TVJJEyALruTwORTm3SpR7FcX805M+ZO0ULllmC04MWowGZzvav/2W1fiPQ==
X-Received: by 2002:a05:6638:582:: with SMTP id a2mr17757776jar.141.1636809119554;
        Sat, 13 Nov 2021 05:11:59 -0800 (PST)
Received: from rechenknecht2k11 (200116b845dc28008d9ba50a9af0b814.dip.versatel-1u1.de. [2001:16b8:45dc:2800:8d9b:a50a:9af0:b814])
        by smtp.googlemail.com with ESMTPSA id c22sm4874056ioz.15.2021.11.13.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 05:11:59 -0800 (PST)
Date:   Sat, 13 Nov 2021 14:11:55 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, lawl <github@dumbinter.net>
Subject: [PATCH] Input: xpad - Poweroff XBOX360W on mode button long press
Message-ID: <20211113141155.26217b44@rechenknecht2k11>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Newer gamepads turn themselves off when the mode button is held down.
For XBOX360W gamepads we must do this in the driver.

Power off the gamepad after 2s of holding down the button.

Signed-off-by: lawl <github@dumbinter.net>
Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>
---
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
+		    /* send power off after 2s of holding the button */
+		    && (ktime_get_seconds() - xpad->mode_btn_down_ts) >= 2) {
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
