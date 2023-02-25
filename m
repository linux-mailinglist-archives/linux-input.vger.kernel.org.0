Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6428B6A267D
	for <lists+linux-input@lfdr.de>; Sat, 25 Feb 2023 02:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbjBYBWW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Feb 2023 20:22:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjBYBWV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Feb 2023 20:22:21 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7863A268F
        for <linux-input@vger.kernel.org>; Fri, 24 Feb 2023 17:22:20 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 3DCACA287;
        Fri, 24 Feb 2023 17:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1677288139; bh=qXiKKWdMYrPQhe+7l0MH5GFPgrW9w+HJp40BLJqp31I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cxDvc+xErqekqLwE/krIQqcUSkDUq/D0LR7rKSMps6p0y2q0e6LKfJH6L1+I2U6E8
         703sMwEVUT1eEG+L/sX8/NLYCK1N5VITs/AODWL5rEV62jV4fW9fzj9IYyXxHaHOvs
         9kO3Fo5cVwD223RQqfJKjCetvtzSeIVfKVEOwqT8ZsH6meoBvr8Z3jep+A9gH0py44
         SFbkjPSqR9agC5QNDDyAfQJ5MKLAxtACUO8GssKkWTUU6yloFs0t8cvP+rX1nda5Ko
         em38Qpz5pHMJJUZ+FpEOnWgIEmuaj4SWE3sUIVa7FOGHuDHJuyiNDK3eWnhJ4WKnA2
         pQX3eU87aOS/g==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>
Cc:     Vicki Pfau <vi@endrift.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 1/3] Input: xpad - fix support for some third-party controllers
Date:   Fri, 24 Feb 2023 17:21:46 -0800
Message-Id: <20230225012147.276489-2-vi@endrift.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225012147.276489-1-vi@endrift.com>
References: <20230225012147.276489-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some third-party controllers, such as the HORPIAD FPS for Nintendo Switch and
Gamesir-G3w, require a specific packet that the first-party XInput driver sends
before it will start sending reports. It's not currently known what this packet
does, but since the first-party driver always sends it's unlikely that this
could cause issues with existing controllers.

Co-authored-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 403b57e8176b..04af2213407f 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -265,6 +265,7 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
@@ -2020,6 +2021,27 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		goto err_free_in_urb;
 	}
 
+	if (xpad->xtype == XTYPE_XBOX360) {
+		/* Some third-party controllers Xbox 360-style controllers
+		 * require this message to finish initialization */
+		uint8_t dummy[20];
+		int ret;
+
+		usb_control_msg_recv(udev, 0,
+				     /* bRequest */ 0x01,
+				     /* bmRequestType */
+				     USB_TYPE_VENDOR | USB_DIR_IN |
+				     USB_RECIP_INTERFACE,
+				     /* wValue */ 0x100,
+				     /* wIndex */ 0x00,
+				     dummy, sizeof(dummy),
+				     25,
+				     GFP_KERNEL);
+		if (ret)
+			dev_warn(&xpad->dev->dev,
+				 "unable to receive magic message: %d\n", ret);
+	}
+
 	ep_irq_in = ep_irq_out = NULL;
 
 	for (i = 0; i < 2; i++) {
-- 
2.39.2

