Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EF706E7119
	for <lists+linux-input@lfdr.de>; Wed, 19 Apr 2023 04:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjDSCYa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Apr 2023 22:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjDSCYa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Apr 2023 22:24:30 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09E68273C
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 19:24:28 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id E9997A1E7;
        Tue, 18 Apr 2023 19:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1681871068; bh=EkJOknbHYiVjGVWokOskzaOaxzYQHSEcZkh7Y2biQ/g=;
        h=From:To:Cc:Subject:Date:From;
        b=ar+GMBaJfMvDfN3moZOA971vPAAWq6C+7p9OSj0DZMP50V8+R7WJugI+u84dyqfp1
         meCjMT5nxKz5BTjSzkqZKFZo/NBu/g/Rl/eUKVddFe4QaXYc6BH7IPjLtM8gPPDOt3
         fom0fWrzYjH1WF1AOH/D/KSDvrkp7XvR3Vo37P9Lk9ku/ee6tq/cTaZ7o1CKyWp7eN
         7HExMKN+mWoKokb1n8Q+BA0yD+397mqpYMRogSMO9o3VfcKKLQCe5AYNy+IEgh+j5M
         jtssMuJmYQnGLYFS9I1UIKnBAHvZRncacKcsvFjuLIw0ZvRpzPzKJVyb0j7UDOVfDf
         h3IT4CfREAtEg==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-input@vger.kernel.org
Cc:     Dan Carpenter <error27@gmail.com>, Vicki Pfau <vi@endrift.com>
Subject: [PATCH] Input: xpad - Move Xbox 360 magic packet sending
Date:   Tue, 18 Apr 2023 19:24:14 -0700
Message-Id: <20230419022414.1790979-1-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This moves the sending of the magic packet introduced in db7220c48d8d from
xpad_probe to xpad_start_input to ensure that xpad->dev->dev exists in the
event that an error occurs. This should also fix issues with suspend that may
occur with some controllers.

Fixes: db7220c48d8d ("Input: xpad - fix support for some third-party controllers")
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 43 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 138e4a9f341f..3eab76b2c8fc 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1721,6 +1721,27 @@ static int xpad_start_input(struct usb_xpad *xpad)
 			return error;
 		}
 	}
+	if (xpad->xtype == XTYPE_XBOX360) {
+		/*
+		 * Some third-party controllers Xbox 360-style controllers
+		 * require this message to finish initialization.
+		*/
+		u8 dummy[20];
+
+		error = usb_control_msg_recv(udev, 0,
+					     /* bRequest */ 0x01,
+					     /* bmRequestType */
+					     USB_TYPE_VENDOR | USB_DIR_IN |
+						USB_RECIP_INTERFACE,
+					     /* wValue */ 0x100,
+					     /* wIndex */ 0x00,
+					     dummy, sizeof(dummy),
+					     25, GFP_KERNEL);
+		if (error)
+			dev_warn(&xpad->dev->dev,
+				 "unable to receive magic message: %d\n",
+				 error);
+	}
 
 	return 0;
 }
@@ -2032,28 +2053,6 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		goto err_free_in_urb;
 	}
 
-	if (xpad->xtype == XTYPE_XBOX360) {
-		/*
-		 * Some third-party controllers Xbox 360-style controllers
-		 * require this message to finish initialization.
-		*/
-		u8 dummy[20];
-
-		error = usb_control_msg_recv(udev, 0,
-					     /* bRequest */ 0x01,
-					     /* bmRequestType */
-					     USB_TYPE_VENDOR | USB_DIR_IN |
-						USB_RECIP_INTERFACE,
-					     /* wValue */ 0x100,
-					     /* wIndex */ 0x00,
-					     dummy, sizeof(dummy),
-					     25, GFP_KERNEL);
-		if (error)
-			dev_warn(&xpad->dev->dev,
-				 "unable to receive magic message: %d\n",
-				 error);
-	}
-
 	ep_irq_in = ep_irq_out = NULL;
 
 	for (i = 0; i < 2; i++) {
-- 
2.40.0

