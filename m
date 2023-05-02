Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB3576F3C46
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 05:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbjEBDMg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 23:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233286AbjEBDMd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 23:12:33 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5AA4232
        for <linux-input@vger.kernel.org>; Mon,  1 May 2023 20:12:28 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id EBB47A26D;
        Mon,  1 May 2023 20:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1682997147; bh=MGACQOMdpDymPQfwaCCy6qRP0ceF+EPI3SASg2giC/c=;
        h=From:To:Cc:Subject:Date:From;
        b=IJCc6a23hCb4PZ9zMfLob1qeWXjBGKjLfaWbjRM0skj9tHR8jThWoELqWwrzrz5Jl
         /1dhVXzskJp7GV7wI/qNen0gQ4RnymYGaqBuvWhbS5fLwI7/Yor4Co98ZwpU0Yx3hs
         OROGlsUMYzzvF90z592Fjtv8wCmNEzGsDl8SGke2/XvWy2/BxR23Zh2CBhBpmYB1S3
         6oZMVAOnijyceL7mdqNjegY2F4Q2bENTuN0qhYstKg7weUjM2tfyoaQnFIhOmZSqS1
         RkpyZvPIFB5hZS2Hkb9heLzCFr+2KMXEq8BiIqJaA8va6t+rknYBZUNrIIE9pppWaI
         Zu2Ui2SBps7hA==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-input@vger.kernel.org
Cc:     Dan Carpenter <error27@gmail.com>, Vicki Pfau <vi@endrift.com>,
        syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
Subject: [PATCH v2] Input: xpad - Move Xbox 360 magic packet sending
Date:   Mon,  1 May 2023 20:12:03 -0700
Message-Id: <20230502031202.1018440-1-vi@endrift.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
Reported-by: syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
Link: https://groups.google.com/g/syzkaller-bugs/c/iMhTgpGuIbM
Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/input/joystick/xpad.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 50ecff681b89..40abea92c393 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1720,6 +1720,27 @@ static int xpad_start_input(struct usb_xpad *xpad)
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
+		error = usb_control_msg_recv(xpad->udev, 0,
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
-- 
2.40.1

