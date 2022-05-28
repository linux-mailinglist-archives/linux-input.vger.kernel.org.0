Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB508536E91
	for <lists+linux-input@lfdr.de>; Sat, 28 May 2022 23:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiE1VXi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 May 2022 17:23:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229524AbiE1VXi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 May 2022 17:23:38 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDDEE5282
        for <linux-input@vger.kernel.org>; Sat, 28 May 2022 14:23:37 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id el14so512970qvb.7
        for <linux-input@vger.kernel.org>; Sat, 28 May 2022 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96pHuHqhBXAeoigWIMlPU/VziwMC1PVDeGlQdUJfPAI=;
        b=m4rOXv361iPQ+ALplHRU0LI9xbj/ZRcYRoGySrJkikEkzL6dJf95spSNxYQZ0IwbT8
         qYCaV36XNBX3g7/CyFUunbiFsK3k1U2Q+gmZD8ZSFNkObHe/IlidaArfbn69WkA0UJFq
         TaORPkH8C0viI4D54VsLdM9hNd0VPuTJNINKzJYzq0hLPDI8/3ER5c3MmNLMOsFfmb0k
         BjFo9A6CUUmh55MhZNW9AR2a40dTyuL89lNrCS50eQbweg9l5dsZOiVbzXM/xVXDHhD4
         Dz6D840PMIAKGFfInnpVicii2HAUNZScdLPEq0aMYKkHzoBObgfmDGKwl44TXi/0znsH
         /i6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96pHuHqhBXAeoigWIMlPU/VziwMC1PVDeGlQdUJfPAI=;
        b=SJNfSIPMut3ScRmydiTWTEzgavPvVFe5ZqEqVBNj6fbBUXqK/r1a+mwWjurgBssQ/2
         hXzwumtoNgIVMoDEEv0juwRHxFvpcV4OxKpJcAQPC+2KUU+VE5coqbBPSPNQdF9OHCbL
         Wwv0facUkF1y6UHvfqCQ4Hh1p1JYH7K5usneAVV8LAuQvoVsjfng4wNc5pyFbDpDNAoV
         PRO9nVv/GEmgnnE6FBp2RIytG9Z/JttxPCdiK9/iMaoZtXqrzxb8eaPg0Pi8mBYT05Fm
         DBBiXSOECQNGUcF1fXMcCrY4XYsemO4kit022srEONbyZ0K9hQREqHe50hj+HgfRUMyo
         B5TQ==
X-Gm-Message-State: AOAM5333xW4ikUij8IJLr+eTUSex1uoI1SBjB8bl2C0P4/CEJhq1adqY
        v1ksTBU7VhR1/gF2r2Tv/RqtFFiTH0k=
X-Google-Smtp-Source: ABdhPJwAkZ6Lly7c1fmNVhRxnIIt7tRIHGh6IXXdH723qV9Ax+UePz/x8g9PrIYhn69RHILga87xlA==
X-Received: by 2002:a05:6214:224f:b0:43f:cd6a:1d6b with SMTP id c15-20020a056214224f00b0043fcd6a1d6bmr40971705qvc.12.1653773016064;
        Sat, 28 May 2022 14:23:36 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-56-36-208.nycmny.fios.verizon.net. [173.56.36.208])
        by smtp.gmail.com with ESMTPSA id b36-20020a05620a272400b0069fc13ce216sm5040830qkp.71.2022.05.28.14.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 May 2022 14:23:34 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH] HID: nintendo: fix unused const warning
Date:   Sat, 28 May 2022 17:23:31 -0400
Message-Id: <20220528212331.3460905-1-djogorchock@gmail.com>
X-Mailer: git-send-email 2.36.1
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

JC_RUMBLE_ZERO_AMP_PKT_CNT is only used when force feedback support in
the driver is enabled. Place the declaration in the CONFIG_NINTENDO_FF
ifdef to avoid a warning when compiling without rumble support.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index 2204de889739f..dcd0f16de7b51 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -292,6 +292,7 @@ static const struct joycon_rumble_amp_data joycon_rumble_amplitudes[] = {
 };
 static const u16 JC_RUMBLE_DFLT_LOW_FREQ = 160;
 static const u16 JC_RUMBLE_DFLT_HIGH_FREQ = 320;
+static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
 #endif /* IS_ENABLED(CONFIG_NINTENDO_FF) */
 static const u16 JC_RUMBLE_PERIOD_MS = 50;
 
@@ -402,8 +403,6 @@ struct joycon_input_report {
 #define JC_RUMBLE_DATA_SIZE	8
 #define JC_RUMBLE_QUEUE_SIZE	8
 
-static const unsigned short JC_RUMBLE_ZERO_AMP_PKT_CNT = 5;
-
 static const char * const joycon_player_led_names[] = {
 	LED_FUNCTION_PLAYER1,
 	LED_FUNCTION_PLAYER2,
-- 
2.36.1

