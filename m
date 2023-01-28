Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9120F67F3E3
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 03:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjA1B76 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Jan 2023 20:59:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjA1B76 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Jan 2023 20:59:58 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2E7FF0D
        for <linux-input@vger.kernel.org>; Fri, 27 Jan 2023 17:59:57 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9so6686362pll.9
        for <linux-input@vger.kernel.org>; Fri, 27 Jan 2023 17:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cloVDGi4HLv1xiAu1u2D1T/QiJ9P2B3cp65a68dcZ6c=;
        b=qhLitawtk+PMudanMWAa62VsSLLbpL+s3KQ4R/I9sR0/t9+5qS38vUIGWMpj7+tbO1
         m45X62MLCBoKNU0d7XntPgWUo5PtWDn9uf3Rlhv0phcPC9lpAZN4MaDsIx+sUXAJJkW2
         zBlXntcKo4ss1JhsIn7wxyJQdqJMpkN325p34xesh2PyQd+saU4I2ePOuxLzpkXS2m2n
         YwCbKIdm5VKrYC1f2yt8WKaAvBeeENCVKXIKkd6ikoXz0ZkiNipmUjGWtyAMSF2Kt2tP
         eDRbN8X2IdSrXYHbmKefTEvrCJmaw7d/5CyBY4lBI8Y6jtte1+Lt273XaR5QB/QsG4Pd
         BcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cloVDGi4HLv1xiAu1u2D1T/QiJ9P2B3cp65a68dcZ6c=;
        b=fbye49lk2J8YiH1eVI4OgTLmpjlf6/1u5g8YP2lKd7pTkMEeDM5bdA5zbEXt08Rdpd
         LPQFHmBVJaUDNGU9wm47kEto8TS+zGYjm3H0oFzpNUHjLQBqaOxWM0mgefjkJUOsSLyC
         QSl9uFTVt38172pNflrh5BzMqPzyvlNU2marDjAvraeN4oLS0BSoqGOh5BA33ERZV1aP
         1SmhXVbiYKDbr6ImGV0IJvHLbomQ6T8q2xJT00fvsTa7wi5iFMLrP65JZ8xx8Fy1nQnU
         IfKo1VrarC1g6USNpt97PDf2kx3Hoj1O22NaNOY7I6NKhE7fvHzbiatIKOr6z4qwwOZt
         vLhw==
X-Gm-Message-State: AFqh2koEEuVt0y0S/FDxJ3jVMFc4bvpd3cM66viKMi8r6f193v3pDk8E
        hUjhVeKfrtFUp0kaF2dEcoxgzSHZPsI=
X-Google-Smtp-Source: AMrXdXvExRI96JSy3Ke5M5OeUXBrb4hfbrTGBPyVayigTfX3E//vFBgXdYrEOnNHj4eJKNsRZLjlOQ==
X-Received: by 2002:a17:90a:4587:b0:229:bc1:7cd1 with SMTP id v7-20020a17090a458700b002290bc17cd1mr44729048pjg.33.1674871196482;
        Fri, 27 Jan 2023 17:59:56 -0800 (PST)
Received: from xavier.lan ([2607:fa18:92fe:92b::2a2])
        by smtp.gmail.com with ESMTPSA id e13-20020a65648d000000b004da5d3a8023sm2911695pgv.79.2023.01.27.17.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 17:59:55 -0800 (PST)
From:   Alex Henrie <alexhenrie24@gmail.com>
To:     linux-input@vger.kernel.org, jkosina@suse.cz
Cc:     Alex Henrie <alexhenrie24@gmail.com>
Subject: [PATCH] HID: apple: Set the tilde quirk flag on the Geyser 4 and later
Date:   Fri, 27 Jan 2023 18:59:33 -0700
Message-Id: <20230128015933.528614-1-alexhenrie24@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I recently tested several old MacBooks and as far as I can tell, all
MacBooks that have an ISO keyboard have the tilde key quirk:

Product    Model  Year  CPU    Shape  Labels     Country  Quirky
================================================================
05ac:021b  A1181  2006  T5600  ISO    British    13       Yes
05ac:021b  A1181  2007  T7200  ISO    Québécois  13       Yes
05ac:0229  A1181  2007  T8300  ANSI   Usonian    33       No
05ac:022a  A1181  2007  T8100  ISO    English    13       Yes
05ac:022a  A1181  2007  P7350  ISO    Québécois  13       Yes
05ac:0237  A1278  2008  P7350  ISO    Dutch      13       Yes
05ac:0237  A1278  2009  P7550  ISO    British    13       Yes

The model number and year are from the laptop case. Since Apple printed
the same model and year on many different laptops, the CPU is a more
precise identifier.

Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
---
 drivers/hid/hid-apple.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 1ccab8aa326c..5c145775482b 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -882,7 +882,8 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
 			APPLE_RDESC_JIS },
@@ -901,7 +902,8 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_HF_ANSI),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_HF_ISO),
-		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
+			APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER4_HF_JIS),
 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN |
 			APPLE_RDESC_JIS },
@@ -942,31 +944,31 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING2_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING3_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING3_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING3_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4A_ANSI),
 		.driver_data = APPLE_HAS_FN },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4A_ISO),
-		.driver_data = APPLE_HAS_FN },
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS),
 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5_ANSI),
-- 
2.39.1

