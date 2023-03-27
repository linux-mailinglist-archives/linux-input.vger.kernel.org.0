Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1664C6CA7CA
	for <lists+linux-input@lfdr.de>; Mon, 27 Mar 2023 16:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbjC0Oeq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Mar 2023 10:34:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjC0Oel (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Mar 2023 10:34:41 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A993FD3
        for <linux-input@vger.kernel.org>; Mon, 27 Mar 2023 07:34:26 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b20so37165402edd.1
        for <linux-input@vger.kernel.org>; Mon, 27 Mar 2023 07:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679927665;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p6S8RyFrt4BO6FyIv0fU5W0gek0a3hrOl5MC8HNRpP4=;
        b=MoTFCwDiuf/djF5k/sazpWVd+uespoBwFdOm8bp7QInvQZQtXBkFP6ID4cq+O78jWW
         C6YyGDuq+2CUpEo+gf8oW3IflgdYVCrFs+nGyH8Nqxy0i4Ru6Nq8mN1Cznn4OPopG0fZ
         U7wjy4AIJK00h5XnBSBJ5rCf+pqIWTgp2Ii2JUXR2DnwHet+bsBEGi7HIu+U8QRy7NKO
         Kk+U25rUaUUyx+XIw27fePJySc2hwVGMLLlPrUhVp8DwCiwE+4smxvPe/bk7mYSzelJS
         ZLNl9GPzCNCOkMyF7ccyDPEvkbYfq14v+SrLlhBehXYu1Zh/ainZXLO4XTQHxZ82pG4E
         lJEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679927665;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6S8RyFrt4BO6FyIv0fU5W0gek0a3hrOl5MC8HNRpP4=;
        b=b+NbDGoNa6TUdOs5MVLu2Kne7kUSAY+miqNGh0/VAVLD1U4d2IVZQL9nZD1jhgcU2c
         Ke8YUzyJi4RB8GpDevMx1lJvpvdK/vWdoci7426dGciltAYl+AV1+fkQbrFi6sm+ILGk
         tMPEGlKSAEZ8pBDj6VZkPnuzsJ60mSiW2gcwTXOVdHvxtsdGhD1ywg1527imelRU2GAM
         EkgUTmFbn4jBTKtDlI/uHhPh20CWLOQPHlEXR8cbeg9HjohgmqYbR8M4DE4AP9UcIU4I
         ndc30RFF1DVk2V7TkfPaOPO5HSklGE2W+lscNewTOuLqyKuqho5KOL5JhjXxJiTPX/ST
         vMdA==
X-Gm-Message-State: AAQBX9dgYWvwZ8Y+xSy6z9EkPNa2fQb4BxwFs242AIjeNLNzwrODPVYb
        MG4z2r90bPOEVvFpqlldGEG63RCh7IJNWw==
X-Google-Smtp-Source: AKy350ZTAzHDgZGNgThpYx5pDqZnotKoRntpzex7AS0kpAQYApC3OgpE1KF+67cvO+83VN0ijDVHEw==
X-Received: by 2002:a50:ef01:0:b0:4fb:de7d:b05a with SMTP id m1-20020a50ef01000000b004fbde7db05amr10378475eds.40.1679927664781;
        Mon, 27 Mar 2023 07:34:24 -0700 (PDT)
Received: from ninja ([2001:9e8:2bd9:4800:ae22:bff:fec3:bbcf])
        by smtp.gmail.com with ESMTPSA id b44-20020a509f2f000000b004c09527d62dsm14735446edf.30.2023.03.27.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 07:34:24 -0700 (PDT)
Date:   Mon, 27 Mar 2023 16:33:46 +0200
From:   Matthias Benkmann <matthias.benkmann@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>,
        Nate Yocom <nate@yocom.org>
Subject: [PATCH] xpad.c: Change MAP_SELECT_BUTTON to MAP_SHARE_BUTTON
Message-ID: <20230327163346.563a298b@ninja>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The button affected by the macro MAP_SELECT_BUTTON is called "Share".
Rename the macro to match the name of the button.

Signed-off-by: Matthias Benkmann <matthias.benkmann@gmail.com>
---
 drivers/input/joystick/xpad.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 49ae963e5f9d..0235e8b4b943 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -80,7 +80,7 @@
 #define MAP_DPAD_TO_BUTTONS		(1 << 0)
 #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
 #define MAP_STICKS_TO_NULL		(1 << 2)
-#define MAP_SELECT_BUTTON		(1 << 3)
+#define MAP_SHARE_BUTTON		(1 << 3)
 #define MAP_PADDLES			(1 << 4)
 #define MAP_PROFILE_BUTTON		(1 << 5)
 
@@ -150,7 +150,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
 	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_PROFILE_BUTTON, XTYPE_XBOXONE },
-	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
+	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
@@ -1003,7 +1003,7 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 		/* menu/view buttons */
 		input_report_key(dev, BTN_START,  data[4] & BIT(2));
 		input_report_key(dev, BTN_SELECT, data[4] & BIT(3));
-		if (xpad->mapping & MAP_SELECT_BUTTON)
+		if (xpad->mapping & MAP_SHARE_BUTTON)
 			input_report_key(dev, KEY_RECORD, data[22] & BIT(0));
 
 		/* buttons A,B,X,Y */
@@ -1869,7 +1869,7 @@ static int xpad_init_input(struct usb_xpad *xpad)
 	    xpad->xtype == XTYPE_XBOXONE) {
 		for (i = 0; xpad360_btn[i] >= 0; i++)
 			input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
-		if (xpad->mapping & MAP_SELECT_BUTTON)
+		if (xpad->mapping & MAP_SHARE_BUTTON)
 			input_set_capability(input_dev, EV_KEY, KEY_RECORD);
 	} else {
 		for (i = 0; xpad_btn[i] >= 0; i++)
-- 
2.25.1

