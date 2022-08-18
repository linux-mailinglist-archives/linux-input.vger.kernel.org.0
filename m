Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA5D5983A1
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243934AbiHRNBh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244905AbiHRNBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:01:23 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C4975FF3
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:01:19 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fy5so3119986ejc.3
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=VApWZynyyt2+XHV9p0vxdpOX3U99xE+KNec/vadTTLg=;
        b=dLTExjlT0QlA55IhmrZQyAjyGAGxlk4EVtFRxcBjIo7t7dLBW8a0T/D7qLoBFawtHw
         nw0UX+swrpAmnUddUy+r9NiI+k0xgmuuMrfAktOKbDE1a+9Q55QOtji6uo6Xv5Di7lwK
         dyHUx9WFmEJXI3vq0auJy4vPZLDo6m1nhrmXpsWrilNu9lLfYKwOskj46L9Vi04Tg3yI
         /GNwQ1hSfOP9UbJHnGFRCrB0hNs1ukaR9+nS9Mm0wwINumhh/D0jQ5hHrW+A8dueL8WF
         MhRp6t0v3hzmacbvv9FOefHw9SRW3Tp1JVi9MBNxOoPez+zIvG27BrEkxYEujgfPrMSx
         S6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=VApWZynyyt2+XHV9p0vxdpOX3U99xE+KNec/vadTTLg=;
        b=QsDKyVgb6Lwso3xg7rUQZpmiNSpuqcs0Vb7ghXwpnOKD+9OJoWPQckf94LesNsjEcZ
         oT2dvnNqwRN51LuTbv/PMIVBNEzhmnxZLYh4O99VWWvd3dW/aRsjoSW5WqrlmMEf9cUW
         BsvM1ExEZjxic6h5QfibcwDhoohtRBYs7BSmTTBh9glvd/TV/bp9Zk4abFaOYnfD2ubv
         xJ6DQg6x5rwkRy1/XEVgdsGnLo016FrXlOHEZ1+Xbu5fDNdusawxmFxFXsc15/2SAlfb
         yeURUHqVGVabesKTwMQ3qElNl0EyLahZV5m+1WsyfrxVrZun0+x3ra1X1bm4CxJ58aBs
         S/TQ==
X-Gm-Message-State: ACgBeo2nsORRQeGom6q80fusy+egMEGlNYaERnxEaEs0gfhPsMVpuj8T
        U/H3Rnrka1qaA2ci5Up8Yx5jle9fpmiGOQ==
X-Google-Smtp-Source: AA6agR437p82/ovTHIY0CY39M0d109NGL6nkNgen6b4q/V7/XGSZ+MFav4nuqh7qAjzvIKVYLlA6yQ==
X-Received: by 2002:a17:907:6eaa:b0:730:cae8:3088 with SMTP id sh42-20020a1709076eaa00b00730cae83088mr1936243ejc.27.1660827677422;
        Thu, 18 Aug 2022 06:01:17 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.gmail.com with ESMTPSA id f4-20020a50ee84000000b0043a2b8ab377sm1093250edr.88.2022.08.18.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 06:01:17 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Cameron Gutman <aicommander@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 2/4] Input: xpad - fix wireless 360 controller breaking after suspend
Date:   Thu, 18 Aug 2022 15:00:19 +0200
Message-Id: <20220818130021.487410-3-rojtberg@gmail.com>
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

From: Cameron Gutman <aicommander@gmail.com>

Suspending and resuming the system can sometimes cause the out
URB to get hung after a reset_resume. This causes LED setting
and force feedback to break on resume. To avoid this, just drop
the reset_resume callback so the USB core rebinds xpad to the
wireless pads on resume if a reset happened.

A nice side effect of this change is the LED ring on wireless
controllers is now set correctly on system resume.

Signed-off-by: Cameron Gutman <aicommander@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 629646b..4e01056 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1991,7 +1991,6 @@ static struct usb_driver xpad_driver = {
 	.disconnect	= xpad_disconnect,
 	.suspend	= xpad_suspend,
 	.resume		= xpad_resume,
-	.reset_resume	= xpad_resume,
 	.id_table	= xpad_table,
 };
 
-- 
2.34.1

