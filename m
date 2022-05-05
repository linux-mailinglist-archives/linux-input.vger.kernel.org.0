Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8FD51C8BD
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 21:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384247AbiEETQ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 15:16:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348852AbiEETQ5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 15:16:57 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB83E1FA79
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 12:13:13 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id l15so3482877ilh.3
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bL5TLGSwt+AHkHwmdO5LLm+IX/xg+ZoznzaXQmuPQGw=;
        b=jJ8/dhi1XPNMY3iY/sIF5/qpP7SS+JJI5kRzDX1Tl3lhtQy4FGJGd4nIEY5tfRfzlh
         zdmbEQlJA4+h5Fp5gAAa73FzbecfJ7/BVe5Hx0lm8jUMxMLzZQl6s8leksIB+xmHPSbJ
         Iv1RRRe1WxGYBVe2xJGIcfkDSHq+KbLE7pPP52rF/k+E+VtP2mBqtYEwfD4ZexL+skYF
         5Au8wgZpaEzuJvPc027cywHBsIfsifMJaAiZ6852zbs2efdHiC9jD6tU88KerqoEDiBZ
         MCf0fscJDkqAxFKucpc2TSuMmiZO4y/zXBicqA+eDPXwYOAU1mMianHBcwJ3FMTuRqDF
         sbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bL5TLGSwt+AHkHwmdO5LLm+IX/xg+ZoznzaXQmuPQGw=;
        b=KIFE73lOjKWDPpCHPAhXXCYjOuUh6AJ+8G268209jqGyYUuPvR3Z7/Wm1/FC/kXeWw
         2Nqs+Op+VK3eSngADaruSF8C1nUreiClXOYhw7EsYEur+8G/QeXQOdIhysyBHWoewqfw
         f1lMzGszCpcLCYoU6KvbZ6jsJHZNt2Q6KcIYExfJB6PvMzvkcr3+kWQKAFK65ChLk59B
         p7uSGSqXMEq2J8Ceje0OyS8jQM/E7tEDdo6+p7qfY8f5GrCNjK7HQoT1B0LFcZsgVl2J
         /4skK1ktLhcFQwmlSURqoPO4AFL4/Cuqx6h0/w68D9Iv3YVs/4ejN/qiZWWuRKdDrCTB
         WMZw==
X-Gm-Message-State: AOAM533sP1h9QRzIVC8YHIQVAjTHFVqv30uoOiyXJ205zHdmMXlDJb7c
        gwrWsLBKGHuhm5cXkz1nIGWfEES/il4=
X-Google-Smtp-Source: ABdhPJwwXC4Vhicbp9smG3WqkOWc9sUeVo/FTHjwbHJF54asNB//GSj3oU7C6vUxNIQ2i7+Bfft41g==
X-Received: by 2002:a05:6e02:12b4:b0:2ca:e755:ee4a with SMTP id f20-20020a056e0212b400b002cae755ee4amr11994334ilr.65.1651777993027;
        Thu, 05 May 2022 12:13:13 -0700 (PDT)
Received: from localhost.localdomain (97-118-108-178.hlrn.qwest.net. [97.118.108.178])
        by smtp.gmail.com with ESMTPSA id u20-20020a02b1d4000000b0032b3a7817bbsm698171jah.127.2022.05.05.12.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 12:13:12 -0700 (PDT)
From:   Bryan Cain <bryancain3@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bryan Cain <bryancain3@gmail.com>
Subject: [PATCH 1/1] HID: apple: Properly handle function keys on Keychron keyboards
Date:   Thu,  5 May 2022 13:12:21 -0600
Message-Id: <20220505191221.36172-2-bryancain3@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505191221.36172-1-bryancain3@gmail.com>
References: <20220505191221.36172-1-bryancain3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Keychron's C-series and K-series of keyboards copy the vendor and
product IDs of an Apple keyboard, but only behave like that device when
set to "Mac" mode. In "Windows" mode, the Fn key doesn't generate a
scancode, so it's impossible to use the F1-F12 keys when fnmode is set
to its default value of 1.

To fix this, make fnmode default to the new value of 3, which behaves
like fnmode=2 for Keychron keyboards and like fnmode=1 for actual Apple
keyboards. This way, Keychron devices are fully usable in both "Windows"
and "Mac" modes, while behavior is unchanged for everything else.

Signed-off-by: Bryan Cain <bryancain3@gmail.com>
---
 drivers/hid/hid-apple.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 0cf35caee9fa..42a568902f49 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/timer.h>
+#include <linux/string.h>
 
 #include "hid-ids.h"
 
@@ -35,16 +36,17 @@
 #define APPLE_NUMLOCK_EMULATION	BIT(8)
 #define APPLE_RDESC_BATTERY	BIT(9)
 #define APPLE_BACKLIGHT_CTL	BIT(10)
+#define APPLE_IS_KEYCHRON	BIT(11)
 
 #define APPLE_FLAG_FKEY		0x01
 
 #define HID_COUNTRY_INTERNATIONAL_ISO	13
 #define APPLE_BATTERY_TIMEOUT_MS	60000
 
-static unsigned int fnmode = 1;
+static unsigned int fnmode = 3;
 module_param(fnmode, uint, 0644);
 MODULE_PARM_DESC(fnmode, "Mode of fn key on Apple keyboards (0 = disabled, "
-		"[1] = fkeyslast, 2 = fkeysfirst)");
+		"1 = fkeyslast, 2 = fkeysfirst, [3] = auto)");
 
 static int iso_layout = -1;
 module_param(iso_layout, int, 0644);
@@ -349,6 +351,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 	const struct apple_key_translation *trans, *table;
 	bool do_translate;
 	u16 code = 0;
+	unsigned int real_fnmode;
 
 	u16 fn_keycode = (swap_fn_leftctrl) ? (KEY_LEFTCTRL) : (KEY_FN);
 
@@ -359,7 +362,13 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		return 1;
 	}
 
-	if (fnmode) {
+	if (fnmode == 3) {
+		real_fnmode = (asc->quirks & APPLE_IS_KEYCHRON) ? 2 : 1;
+	} else {
+		real_fnmode = fnmode;
+	}
+
+	if (real_fnmode) {
 		if (hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
 		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
 		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
@@ -406,7 +415,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 
 			if (!code) {
 				if (trans->flags & APPLE_FLAG_FKEY) {
-					switch (fnmode) {
+					switch (real_fnmode) {
 					case 1:
 						do_translate = !asc->fn_on;
 						break;
@@ -660,6 +669,11 @@ static int apple_input_configured(struct hid_device *hdev,
 		asc->quirks &= ~APPLE_HAS_FN;
 	}
 
+	if (strncmp(hdev->name, "Keychron", 8) == 0) {
+		hid_info(hdev, "Keychron keyboard detected; function keys will default to fnmode=2 behavior\n");
+		asc->quirks |= APPLE_IS_KEYCHRON;
+	}
+
 	return 0;
 }
 
-- 
2.25.1

