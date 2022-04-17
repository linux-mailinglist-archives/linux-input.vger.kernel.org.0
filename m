Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37CA3504848
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 18:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbiDQQSP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 12:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234357AbiDQQSO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 12:18:14 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D2AEB7
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:37 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c64so15173096edf.11
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LHj3AparGalGgxR6slEGd9sJl1ngkHSvFio1a37GdzQ=;
        b=MaBtsSs6ZnNcGRFM1YUcwOTdcAkoE1JCXLilPyeGwACdBcbaQTfgrn/0qRIV0p0E9V
         9cyM4IEqrZ/Z8e6eWQ9QT0bK5vu7EzEztZ3/YkBi8Hom96ieiLDOqTgxVHu+SwPXkcMZ
         47I7C0knm5XNWpmiekaswkCmQnLtPbmt+0sHJBPp1zJcJu9uIUxWKupWuA2SiOrUkFOY
         6kVa1XoSkZgu7y6aY/GksipWRhqgd+y18ZUPz6OJ0tEyDisWYMWmjgMH/k+sfEbrHuRb
         OKuJZkpaGze5lHlJkSnhv30P26M3ck61BrZIahVa3ixtAhLPX3oxWHheczbvQH8U7u1x
         g/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LHj3AparGalGgxR6slEGd9sJl1ngkHSvFio1a37GdzQ=;
        b=oWodaCfx2PRP1ZFjBU61uij4bgAdV4lBueq0uMepRI7/ddEln8pL+ZemsqXKginwYd
         y6UV1lVfUBDbka0B7B8428YBA5Y0lrE7RniB5gGdCnSy2IbSDN37CE1iXeO2K5pK98lo
         uuoS+KOX02YVUskXVIOFM6i3P9Im4mylR6YzFNfJAi891qhEVlOTJ0RbMIcUabMaSPT3
         h56E2fa1pEj0XPJcfE6Oi2EernqazmFxBIJ9f2j8Gjatkxj6npAtlNUln6PS2eePqfwr
         gAmmlV8aayPoiVOGdWXvxKgrt1YzXpKRuYOrY27GhoRDYiVIMp29//w/RYT/K9cHb638
         seuQ==
X-Gm-Message-State: AOAM533KHGuZJLs6KMdhnQZAZiA2gcqFSwyzhk2OpkhfTlFmFJBdS8XP
        LSrY9Eha/wGCyLW4Ds+4vg9h4ufLyJdqoA==
X-Google-Smtp-Source: ABdhPJyO46igvgKExV59BVQU2HzCySeImPbJZZrqZ9peUD1kSWt99qGhYNGqS6CZ+6WkA45Ek8MLJA==
X-Received: by 2002:a05:6402:845:b0:421:fcb5:55de with SMTP id b5-20020a056402084500b00421fcb555demr8468135edz.124.1650212136473;
        Sun, 17 Apr 2022 09:15:36 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2225:cd00:b8d9:eba8:6309:ac66])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b0042062f9f0e1sm5772130edw.15.2022.04.17.09.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 09:15:35 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Cameron Gutman <aicommander@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 2/3] Input: xpad - fix wireless 360 controller breaking after suspend
Date:   Sun, 17 Apr 2022 18:15:25 +0200
Message-Id: <20220417161526.138019-3-rojtberg@gmail.com>
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
index 257fc2c..7640cbb 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1981,7 +1981,6 @@ static struct usb_driver xpad_driver = {
 	.disconnect	= xpad_disconnect,
 	.suspend	= xpad_suspend,
 	.resume		= xpad_resume,
-	.reset_resume	= xpad_resume,
 	.id_table	= xpad_table,
 };
 
-- 
2.25.1

