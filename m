Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 373446C7670
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 05:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbjCXEFf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 00:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjCXEFd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 00:05:33 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DED5D24CAD
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 21:05:32 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id DE537A2A8;
        Thu, 23 Mar 2023 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1679630732; bh=4EABVI3P/hakpbBSVHVJHk0kQW3rV+r1anVNYp0hThA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JTRjRPhRC2slnkwQ6k3DtfnWnfpgGofLvQntO6G7n2ZJMYPlV062zhmM7PoMfXh/0
         yV1pv9uL+EQiqz+sxYsUfuNkwuJopYNEon3ObJaZGuR9xUqG3/QcDKVrtJKCoBBDdT
         aKMVJ+1xxkFAu7nh0tC+oTKmx8O6wYytL+VOHpBo+Mtz4I6KrRhjJk62zUmf8p7yhz
         EVHIkjMRmb3MRK7pj7CAGLC/LDuhdT+DB8NWA2kLfUH3hSYZpH0w5awAAInYf5+i+A
         pulzFmEyxsZYGvLb71sstkU/isaDuKuYHJjW/rAdTZmilyoVX1dRVxdG5aMB4rVoyh
         St8QHfH360KXA==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lyude Paul <lyude@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v2 2/2] Input: xpad - fix support for some third-party controllers
Date:   Thu, 23 Mar 2023 21:04:46 -0700
Message-Id: <20230324040446.3487725-3-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230324040446.3487725-1-vi@endrift.com>
References: <20230324040446.3487725-1-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
 drivers/input/joystick/xpad.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c2c688156b2e..2d86ca0c1ace 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -264,6 +264,7 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x00dc, "HORIPAD FPS for Nintendo Switch", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
@@ -2013,6 +2014,25 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		goto err_free_in_urb;
 	}
 
+	if (xpad->xtype == XTYPE_XBOX360) {
+		/* Some third-party controllers Xbox 360-style controllers
+		 * require this message to finish initialization */
+		uint8_t dummy[20];
+		int ret = usb_control_msg_recv(udev, 0,
+					       /* bRequest */ 0x01,
+					       /* bmRequestType */
+					       USB_TYPE_VENDOR | USB_DIR_IN |
+					       USB_RECIP_INTERFACE,
+					       /* wValue */ 0x100,
+					       /* wIndex */ 0x00,
+					       dummy, sizeof(dummy),
+					       25,
+					       GFP_KERNEL);
+		if (ret)
+			dev_warn(&xpad->dev->dev,
+				 "unable to receive magic message: %d\n", ret);
+	}
+
 	ep_irq_in = ep_irq_out = NULL;
 
 	for (i = 0; i < 2; i++) {
-- 
2.40.0

