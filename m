Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D47845ABE9
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 19:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhKWTCO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 14:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235412AbhKWTCL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 14:02:11 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AEDBC061574
        for <linux-input@vger.kernel.org>; Tue, 23 Nov 2021 10:59:02 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id w23so45811693uao.5
        for <linux-input@vger.kernel.org>; Tue, 23 Nov 2021 10:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQVykL1nXJgnXwZXsWu7Sy3NnRWSAmWkZHOvIJzwzIs=;
        b=eWFCNBnRH2mxSyQbL6BpPZz703mcm5KVzcVNBOmUH0FpbGTi8N7E+KAIBDLV++xysj
         4Rcs7w6c+/bFJ/AR55hyELbGJU81D4LMYsuVnRKaW3B+dRyZRPnZSBWY6b3RSg1F3E44
         tj40Qthm0Mhv38xtjXJ8G4in8d8xt8XPpLgo8c0eWXBM7tfmeY+v97lw6fJk+B8oeLA3
         +aN1DtyKie1e6Z1Bo8vG4mMzMYOUjmZoMrj2EpImy9uhd6JBUCBHT7Xpgm4axA5uno30
         fDzbClpvcFjKR79xn0zzRsY8Lx1pX9auwc7riPLZzMnZnt+dknIbjf5vk8OF6sxu7674
         zN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vQVykL1nXJgnXwZXsWu7Sy3NnRWSAmWkZHOvIJzwzIs=;
        b=shY78+ESN+pLmSljCnHKHIzzchl9Zt4XscXFsDt8SFGPn4jf/3CnKKAj+zBWRTHtHG
         l5X9hCwPP5xrpweAK2w+fhOQOMoeAFm9Do/kydquCnIw5KjDgr+U8t5mhRyWVEcaBjbB
         3fryYc6OL93MYZ3NvwkVX5pkcWIQkT/tajYmt7by87o3k6vE226r+m+Nf5ydu29XXRrP
         l7EoIOdJ3DQnV9O+XpV8lOoOlIWXLW5HoTeTK8b7fFOf2kVUaMNtmHT3mbH8noko992I
         gJl6ZDx3oior77WCWkgBy2+FTdL4swbJ6RXsVkUM39Nbg70DpL0uURB1Uhw+cvWaGb8q
         uqQA==
X-Gm-Message-State: AOAM5308RpWBD+HrhsvdUYaeUI65b7ivFsanDPGk6fyzKxGe6q4OOfoc
        gjpSZg2AS9dQQZORl+8Rx60NtoBSv8OvjGDf
X-Google-Smtp-Source: ABdhPJy91A0kIZtuIzBTHDcDluEIDYGGdqq9z+IshylojwmULue79HIkU+q37H4M2/a54xm0utuanA==
X-Received: by 2002:ab0:1c02:: with SMTP id a2mr11774605uaj.115.1637693941027;
        Tue, 23 Nov 2021 10:59:01 -0800 (PST)
Received: from glados.lan ([2804:d51:4967:1d00:dae3:8c4f:7c4a:db00])
        by smtp.gmail.com with ESMTPSA id f7sm6678411vkm.31.2021.11.23.10.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Nov 2021 10:59:00 -0800 (PST)
From:   Marcos Alano <marcoshalano@gmail.com>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     Marcos Alano <marcoshalano@gmail.com>
Subject: [PATCH] Correct the name for Xbox Series S|X controller
Date:   Tue, 23 Nov 2021 15:58:53 -0300
Message-Id: <20211123185853.465461-1-marcoshalano@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change the name of controller to a more meaningful one.

Signed-off-by: Marcos Alano <marcoshalano@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 4c914f75a902..18190b529bca 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -131,7 +131,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
-	{ 0x045e, 0x0b12, "Microsoft Xbox One X pad", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
+	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
-- 
2.34.0

