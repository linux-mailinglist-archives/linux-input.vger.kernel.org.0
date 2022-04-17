Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E319A504847
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 18:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234359AbiDQQSO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 12:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiDQQSN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 12:18:13 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEAFEBA
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id c6so15190061edn.8
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+PTCIzUFXMvh4nX+sKRFV4lZmPtgkv+CbjqJ8j1j96Y=;
        b=C9j4GUdW4ulww20rG7zbDMCn2G0/89IuofZg4QQRoem10DgT36lhZFyQdYAZBGQLQW
         CiTB2uu1TZAjqbyzoYWx6MM+2KRzYdBxxupGetvFrCsVWNqdMu7ly39G3kp5Qk5aI3QW
         3Ek89zOCojldtAykI+tfsSdX4+PvKMYYFbctfyFXt9mMw9T/AP9jcrnXm4t/Lfrqoi5/
         wGEKkicluvewC0J5MPlewCdTAwp7XGlIeM1mah4uk4VK8srxMbeu0cwgukpps7YjzpHg
         5M/geM4QfQ6NdG5raHsHzEHVlAJIv0TuVyC/EA7aeU6VkWUf9kdRwgXWez11yZQySG7T
         feeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+PTCIzUFXMvh4nX+sKRFV4lZmPtgkv+CbjqJ8j1j96Y=;
        b=Co/9vFEk27xFnOon63aUxOEOytrITkqITDAIMrffVbafjnl5qZBIwFzFB7IPXvEdQG
         tExkUEvnC95HI3lUY/eueTHwTg8djRHVYXYnZouvRqrznWQ+nQuSi7XFUvnnvX9qXIiJ
         S+1l3jb0bAIrdVuVugBFruG+Cd2nWrwOvr2X4JgOIanKyqKLHI9gDh05H/ksLpTnaxro
         FYRhymbUcvgM3IGB6je5ZVzKoqXlNK1Hx7K8NMkNaxK65AfvWd0oM3et1Sh1gQVeYfqR
         04mYxyyyjElPhUwfjeKcQVbnO+1PWAzHxdc7y7vevo/evDGAo0q0Mgf2/GjbWGTZLGtW
         7GKg==
X-Gm-Message-State: AOAM533y2BovOrTm9KVzOkLR+VE9fKXfzBIMvY8a8iuD3XScofIifjnb
        /YDk3igVGDJYxB/bdc38MRe4MCaKl9m7og==
X-Google-Smtp-Source: ABdhPJyNCR41GpBxI3CdCtpmwFFBIurTDbueh+KAJXQKFfVefcD+wEYiahMNa/dBfAsL+ZX8drLMeg==
X-Received: by 2002:a05:6402:34c7:b0:423:d44a:4c6c with SMTP id w7-20020a05640234c700b00423d44a4c6cmr6266221edc.356.1650212135365;
        Sun, 17 Apr 2022 09:15:35 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2225:cd00:b8d9:eba8:6309:ac66])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b0042062f9f0e1sm5772130edw.15.2022.04.17.09.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 09:15:34 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>,
        Jasper Poppe <jgpoppe@gmail.com>,
        Jeremy Palmer <jpalmer@linz.govt.nz>,
        Ruineka <ruinairas1992@gmail.com>
Subject: [PATCH 1/3] Input: xpad - add supported devices as contributed on github
Date:   Sun, 17 Apr 2022 18:15:24 +0200
Message-Id: <20220417161526.138019-2-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417161526.138019-1-rojtberg@gmail.com>
References: <20220417161526.138019-1-rojtberg@gmail.com>
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
 drivers/input/joystick/xpad.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 53126d9..257fc2c 100644
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
@@ -337,6 +340,8 @@ static const struct xpad_device {
 	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
 	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
+	{ 0x2563, 0x058d, "OneXPlayer Gamepad", 0, XTYPE_XBOX360 },
+	{ 0x2dc8, 0x2000, "8BitDo Pro 2 Wired Controller fox Xbox", 0, XTYPE_XBOXONE },
 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
 };
 
@@ -429,9 +434,11 @@ static const struct usb_device_id xpad_table[] = {
 	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
 	XPAD_XBOXONE_VENDOR(0x0738),		/* Mad Catz FightStick TE 2 */
 	XPAD_XBOX360_VENDOR(0x07ff),		/* Mad Catz GamePad */
+	XPAD_XBOX360_VENDOR(0x0c12),		/* Zeroplus X-Box 360 controllers */
 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f X-Box 360 controllers */
 	XPAD_XBOXONE_VENDOR(0x0e6f),		/* 0x0e6f X-Box One controllers */
 	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
+	XPAD_XBOX360_VENDOR(0x24c6),		/* Hori Controllers */
 	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori Controllers */
 	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries Controllers */
 	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
@@ -453,6 +460,8 @@ static const struct usb_device_id xpad_table[] = {
 	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke X-Box One pad */
 	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir Controllers */
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
+	XPAD_XBOX360_VENDOR(0x2563),		/* OneXPlayer Gamepad */
+	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
 	{ }
 };
 
-- 
2.25.1

