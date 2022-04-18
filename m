Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE4EB504F74
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 13:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234513AbiDRLoX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 07:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbiDRLoW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 07:44:22 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB2BDFFD
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:41:43 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q3so17647669wrj.7
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N4wLNEikvkbYw1qs8xHnr+uPsOxIOobzb0HAW32iGvA=;
        b=MuSRQBYfxXyCdxF0utiMRDx+UjRBFaEn+aPpinZguHC9rv19xuuJlAwgoQJ7tEYGll
         a/3BUYtg15vTmRkv2exVL5GAoOsXjYr9IR5csQpJgXtgTJO2Qir+FAv3dFoAfMD6stn/
         V6DeqAEl/CuQ8JKaYHPdm8exdQJ9S9MCExK2dSW14GeBjwsFdz9c+LDMtskt1dyGlFsv
         0FbJlUvGvTTrdQ3baAGjBIhki+OVEixG5H9WK7YY7Nr11ODhOAMVCIqnZmehrseJK+v3
         R/Lm8v996rCmFYII6n9Iuw+ScdCLul+gC1xOMYCCCbpuWOmvDVGxjsriR4vozzUBKlTp
         rR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N4wLNEikvkbYw1qs8xHnr+uPsOxIOobzb0HAW32iGvA=;
        b=0B6cK/1VWHvQTsfnCLZWncOyKbvHhtn/0hP14XBKMg2wDggoHzWpjl2rls7x2aMG+S
         GHbh+cf9Ts3BImVZHsoFMXpvNLGHpnYlqoCO8bMDs4iGPInHP+LvIERUBWgjcF1u0zlw
         djzySbs5ZkGIoP/X40dTUuJ2nAeRZbHCDvkRtuwwj1xl+Mwz1gq11NlESRqQ16AvpRdg
         qJdq1PwAv0KAObSIBjMl7osHYFeBNjavU8rQwbGsIFJ+fV/9zqwp5Iexzo16y5xF8QAN
         G/wf41TSFm2ICuC2CAfwwAqoybDaDDGjJLsTvkKubHdXjrsyB9vP2jKiem4twtaf+16K
         PrIg==
X-Gm-Message-State: AOAM5327Ev+nAWRhajmDsxGlQSh+Uyr06ouRxeiM1gFPwQhFjYWjoTia
        A5p4nhB3JaZXjHXkHUHkR3FigRInpKqR9A==
X-Google-Smtp-Source: ABdhPJzZ06t7sD4618vjJ3uMUNSEYDh6XO0SC0dE2v97S+H1Kn685LciG86IXoEnHNoatAag5Cbh+g==
X-Received: by 2002:a5d:59a2:0:b0:204:20d9:a5b9 with SMTP id p2-20020a5d59a2000000b0020420d9a5b9mr7772372wrr.560.1650282101957;
        Mon, 18 Apr 2022 04:41:41 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2205:7500:31a3:8b23:14e3:7ccf])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b00207b49d3023sm10007211wrq.44.2022.04.18.04.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 04:41:41 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>,
        Jasper Poppe <jgpoppe@gmail.com>,
        Jeremy Palmer <jpalmer@linz.govt.nz>,
        Ruineka <ruinairas1992@gmail.com>
Subject: [PATCH v2 1/3] Input: xpad - add supported devices as contributed on github
Date:   Mon, 18 Apr 2022 13:40:20 +0200
Message-Id: <20220418114022.23673-2-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418114022.23673-1-rojtberg@gmail.com>
References: <20220418114022.23673-1-rojtberg@gmail.com>
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

From: Pavel Rojtberg <rojtberg@gmail.com>

This is based on multiple commits at https://github.com/paroj/xpad

Signed-off-by: Jasper Poppe <jgpoppe@gmail.com>
Signed-off-by: Jeremy Palmer <jpalmer@linz.govt.nz>
Signed-off-by: Ruineka <ruinairas1992@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 53126d9..b9c2e58 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -244,6 +244,7 @@ static const struct xpad_device {
 	{ 0x0f0d, 0x0063, "Hori Real Arcade Pro Hayabusa (USA) Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0067, "HORIPAD ONE", 0, XTYPE_XBOXONE },
 	{ 0x0f0d, 0x0078, "Hori Real Arcade Pro V Kai Xbox One", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
+	{ 0x0f0d, 0x00c5, "Hori Fighting Commander ONE", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x0f30, 0x010b, "Philips Recoil", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x0202, "Joytech Advanced Controller", 0, XTYPE_XBOX },
 	{ 0x0f30, 0x8888, "BigBen XBMiniPad Controller", 0, XTYPE_XBOX },
@@ -260,6 +261,7 @@ static const struct xpad_device {
 	{ 0x1430, 0x8888, "TX6500+ Dance Pad (first generation)", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
 	{ 0x1430, 0xf801, "RedOctane Controller", 0, XTYPE_XBOX360 },
 	{ 0x146b, 0x0601, "BigBen Interactive XBOX 360 Controller", 0, XTYPE_XBOX360 },
+	{ 0x146b, 0x0604, "Bigben Interactive DAIJA Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x1532, 0x0037, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x1532, 0x0a00, "Razer Atrox Arcade Stick", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOXONE },
 	{ 0x1532, 0x0a03, "Razer Wildcat", 0, XTYPE_XBOXONE },
@@ -325,6 +327,7 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5502, "Hori Fighting Stick VX Alt", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5503, "Hori Fighting Edge", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5506, "Hori SOULCALIBUR V Stick", 0, XTYPE_XBOX360 },
+	{ 0x24c6, 0x5510, "Hori Fighting Commander ONE (Xbox 360/PC Mode)", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x550d, "Hori GEM Xbox controller", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x550e, "Hori Real Arcade Pro V Kai 360", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
 	{ 0x24c6, 0x551a, "PowerA FUSION Pro Controller", 0, XTYPE_XBOXONE },
@@ -334,6 +337,8 @@ static const struct xpad_device {
 	{ 0x24c6, 0x5b03, "Thrustmaster Ferrari 458 Racing Wheel", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0x5d04, "Razer Sabertooth", 0, XTYPE_XBOX360 },
 	{ 0x24c6, 0xfafe, "Rock Candy Gamepad for Xbox 360", 0, XTYPE_XBOX360 },
+	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
@@ -429,6 +434,7 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
 	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
 	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz GamePad */
+	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f X-Box 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f X-Box One controllers */
 	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
@@ -450,6 +456,8 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x20d6),		/* PowerA Controllers */
 	XPAD_XBOX360_VENDOR(0x24c6),		/* PowerA Controllers */
 	XPAD_XBOXONE_VENDOR(0x24c6),		/* PowerA Controllers */
+	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
+	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
-- 
2.25.1

