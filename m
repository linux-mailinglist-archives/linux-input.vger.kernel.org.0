Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 754CA725185
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 03:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbjFGB2p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 21:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240280AbjFGB2o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 21:28:44 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85F9919A2
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 18:28:43 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 88934A285;
        Tue,  6 Jun 2023 18:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1686101323; bh=+M7n4ey9uKv4vHkOJZq6g4KxBpSYAYh7nhSQWjqIJKM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=W9si24tuoZIbyRZVPapg3qqoKAZrLSx02WEkVYBVKAf0FqxopOFiAooUyQKjoveVS
         /fhvZ1M2HeaW6a8wDTpVTyylXwfkhV5JC1NfSFezQbU+CdGMpnex/WAiKkKUH4znCN
         jFXMRZ7yAukEwCtqjtB+TXj5Ng3vYFNBR/rGUeyflx80YA2cCTcLuJGFq9PRc8wme0
         dj/0Ubl80FSFVoYElkAuNvj4sn2r907T4sRfb/79eoSUIq9rcfN2k84jh53Fpp0zvc
         ZFB0V1XTRrXsh3cOuZodged15x4QIbOSZxB2Wivjvmel+7MvT5LFbHoPTBI5k32UiZ
         6i3Tw4tPXYzUA==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 1/2] Input: xpad - fix support for some third-party controllers
Date:   Tue,  6 Jun 2023 18:28:11 -0700
Message-Id: <20230607012812.379640-2-vi@endrift.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607012812.379640-1-vi@endrift.com>
References: <20230607012812.379640-1-vi@endrift.com>
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
index 5d6a25b42bf9..745047215e42 100644
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
@@ -1720,6 +1721,27 @@ static int xpad_start_input(struct usb_xpad *xpad)
 			return error;
 		}
 	}
+	if (xpad->xtype == XTYPE_XBOX360) {
+		/*
+		 * Some third-party controllers Xbox 360-style controllers
+		 * require this message to finish initialization.
+		 */
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

