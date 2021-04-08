Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4C46358445
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbhDHNMf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhDHNMf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CFAC061761
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id n8so3970109lfh.1
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RTlZrDUTDthiwbBRPHwMeQoWFhgADwLFTg4elxJDyEI=;
        b=M70TMGzdwMSfj86n124ozsQJLfKY0IBqhmzk5aWZHGkTjaY/MGsgs56kwZ8BTJwvAw
         feZ6loEjOPH+HfPeSlwJO/AzxswYNrBobe65V+zarF1uzY1dnHd3BonThI5uXmnYcDk0
         uHVBWBkv1RfS+d7NFDUtFpwxvAxa3ERmNE+KafJx2/lYx27fyjZjvRQ0PrCKC70Aw7Vt
         bF+Oi3tATLdpRKC1jI+v8KQKQfLejc2QBxDO3LNRS84G6xRgOpPzER7X2iwUHV1qVqJf
         uQPcmIcfOXhVhQngUfsViN+bLSns4GmEgCP6/fSB/5Rlq/hPe25kPlMVzkfhaDKJTWTk
         CZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RTlZrDUTDthiwbBRPHwMeQoWFhgADwLFTg4elxJDyEI=;
        b=WKZ4tMRSP3RDyd1UC8avt+ZPlRiufQX0ue4ctzf+NLu60Kw0DVIbQv9gEPG15uHYF5
         uS//dW9VDggxD4qU7Vwbz9T9VTQxH8g2VwRawVi0lGM0n8EjDWBEirvWp3999pK7pKRX
         Mklr2rVwvwU8qny4cdrEqUKvA00Rxqm/rwSS02i92oFml8FZxxnxPDdTrvv04SLNpy5B
         Mp7ojFNKY4fIiEk13EmbRsAta705pbznEpi7Z3Cbz/DcTCid74CZSJr6CxmLjhjVDCXt
         EO0gEBXjYduJGtmjg35AqczGd13S/6xkhh+Uu1k4lAQGvvqkHn69Iuo0L21mAeA7yY5M
         spOg==
X-Gm-Message-State: AOAM533NOKe7IkneyRyYzo4gERo2J/kPas/zDFUj2WVgq8giL/qZZ0bv
        79sBs0bZC5Y6m/XWrdNgT5FqPQ==
X-Google-Smtp-Source: ABdhPJwzAere9PzpRP6pIgktfSWmeCGd/vmHzcXOsJldE5UlpcmepbDROGCatlZiMy1xQ9yOT2NdpQ==
X-Received: by 2002:a19:7dc3:: with SMTP id y186mr6487666lfc.242.1617887542360;
        Thu, 08 Apr 2021 06:12:22 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/8 v3] Input: cyttsp - Error message on boot mode exit error
Date:   Thu,  8 Apr 2021 15:11:49 +0200
Message-Id: <20210408131153.3446138-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Provide a proper error message when attempting to exit
boot loader mode and failing, which is something that
happened to me.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Collect Javier's Reviewed-by
---
 drivers/input/touchscreen/cyttsp_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index a19d7cce95ca..91f8f38b3f06 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -410,8 +410,10 @@ static int cyttsp_power_on(struct cyttsp *ts)
 	if (GET_BOOTLOADERMODE(ts->bl_data.bl_status) &&
 	    IS_VALID_APP(ts->bl_data.bl_status)) {
 		error = cyttsp_exit_bl_mode(ts);
-		if (error)
+		if (error) {
+			dev_err(ts->dev, "failed to exit bootloader mode\n");
 			return error;
+		}
 	}
 
 	if (GET_HSTMODE(ts->bl_data.bl_file) != CY_OPERATE_MODE ||
-- 
2.29.2

