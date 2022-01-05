Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C560C485210
	for <lists+linux-input@lfdr.de>; Wed,  5 Jan 2022 12:53:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbiAELxe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jan 2022 06:53:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235507AbiAELxO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Jan 2022 06:53:14 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C5EC061785
        for <linux-input@vger.kernel.org>; Wed,  5 Jan 2022 03:53:14 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id l10so1089409wrh.7
        for <linux-input@vger.kernel.org>; Wed, 05 Jan 2022 03:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=msm4RixDwEFMfe+7jyY/ubZlcJMsRCU7XocB5DrglG4=;
        b=J0kzprD8KYjERwmuoa7xxl6eCyd7SvDCsmSlWm68iyU1HJyzJD14I2cu1DmWpTFoP0
         RGs97n66mX1QZxC//cWKAqCC0781P1QVwoW/NWK4pl9T550+Eo5rRxZyQlmZg1DcvK/i
         Zh5sv+NVcw8ppbUf9IC11N8ubJ1V4q0/IVw1bZf2Oi3RZuPS2YERj8aAEy5S81UuHYPP
         KqpSFQ2s1g17smjCCKVT8RBtnhrytMJ4qoLnVthWhKVDxN3aIRDXzytQfyGc/WpF7nYJ
         3FXnnpuxvDko7aN+NHruql1m+x5W4uDsSPOFFFgiyBoOm6WjfpkTVoAW7mw89IeuIt4w
         kXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=msm4RixDwEFMfe+7jyY/ubZlcJMsRCU7XocB5DrglG4=;
        b=ZjbJPXhxifbyDqVxZ3+sII4qmfnlQc/XlfWEFzz9ogzdsHcpHxBgnx0NSdXRbbVnjo
         Y8qyO5vr3d+IGRFBxyrJluBk4L9V9gANaNjhQNGq5QxpwPLsJ4/Gf0PBOXc2fCisrEYJ
         V42Ni1kqxWej2wHlj/yJGHWFJOh0zv6LoL9Y+tYS6KuWDwh2k1zevCnyFektoWCK726j
         +31CmTloYavqI6hyW4avWBO/zsZNHbR/Ux20qGQy0a+h9/LK6RsEAuHUGH+mEw2rsUE7
         6mj3xJm0Y84p7/Q9Y47MQ0cyz7qlDewDbJs6qJuf8pU70GTvGbQW/P9EkH62CD50Pb7E
         I98g==
X-Gm-Message-State: AOAM530tC0tdl++vkCc6hyt20HTfdpqrAGaX1P+2EACELIzILF2TT/mC
        oXut++1HSi6G5xc9ZmXnB/V/DUU5Co8=
X-Google-Smtp-Source: ABdhPJxGuW57C/TPVBlpGzEptvDB5+7EmxqECeWGY5HXouxCpikeN3VyeiWLTZ0HTeZIY9EB167Zuw==
X-Received: by 2002:a5d:64e2:: with SMTP id g2mr16024861wri.690.1641383592504;
        Wed, 05 Jan 2022 03:53:12 -0800 (PST)
Received: from rechenknecht2k11 ([2001:16b8:4562:6f00:2ba5:b93:e9c0:439b])
        by smtp.googlemail.com with ESMTPSA id a3sm5743605wri.89.2022.01.05.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 03:53:12 -0800 (PST)
Date:   Wed, 5 Jan 2022 12:53:10 +0100
From:   Benjamin Valentin <benpicco@googlemail.com>
To:     Cameron Gutman <aicommander@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        lawl <github@dumbinter.net>
Subject: [RESEND][PATCH v2] Input: xpad - Poweroff XBOX360W on mode button
 long press
Message-ID: <20220105125310.1f3328a5@rechenknecht2k11>
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
