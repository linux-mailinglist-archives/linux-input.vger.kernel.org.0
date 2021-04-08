Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2E77358446
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbhDHNMi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhDHNMh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:37 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BFCC061761
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:25 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id z8so2168725ljm.12
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n+BE/ls2y9st49pyD89waC8wDozI9Ea/Mpt87FhjcNo=;
        b=kw3NapkTQ27jXn9jWYbeeDpaIVzhbrfRKlcFIYK9shi/Zh1Q5vcXsp1M5LrZMMExJn
         51ezyf91LZ10qeBNOjRwpaedDb+lPG0KIeOF9FWZHh/y8hnKsoagyRkIvVH0XeGdqUXG
         jMobSES+lg2Agzx7FigEA/YAlWAP6MgtiChwscmU8lZwizKPM27IY/Okc4Jsy3wrD08I
         Lov59tMkIemFasjnij2Gqey7fpNSOzNXNIrTeOrpyAxsmP/Cm4LxmBAUbyQUPAwzhXlt
         QE/upTeXhLQGHXUKuoPAUDtR+8qN3JDN3CLM3Q8A9Tcg2jtohI+QuXp7VOozhUwafHPj
         2hCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+BE/ls2y9st49pyD89waC8wDozI9Ea/Mpt87FhjcNo=;
        b=GsXllaGSZHJkHwhXmec0v1jweoGJ0IbzazFXOz9Qg3DHDPBLEYQ1ymzxoIiYwxLbDf
         fDE+pDe+1p9ANXHc495XXHZGGRE5vzVFiyK9GX3VEHrba5E9wejpzBlf6DNr2uF25+KX
         ZeKfSqpi9Q3lu2nCty5wDtcVuSV1h052qTiZwfs+5Cs2emRSNrF2sDXh2roVrQUnh3om
         ASPW8/9KclFzchUVilqpRPIxzYruTBFX23dRn1YWoxR9atzIxRkW7yWkhV5elfJrE8Ca
         KFs0whUZ32XOQKOVjkoLIQGVjk+8zjmxL2yF7OrB14gYv233fUSfKxfjGCAQtfH/MKAg
         dWjQ==
X-Gm-Message-State: AOAM532iFNH4vy3Gpyvh7fwdx6Dn0K4Yyd9KaSMXhY4pK8BL4VcrlDAm
        gm2l3pCCYnCT+6JcI0z9bjZ3vQ==
X-Google-Smtp-Source: ABdhPJygTfMDZ5mheXkfSeujRbvov6DXFah4qDiW9+6Kopcbd7BknAwqzBZBvJPYyCnGHAMn113MLw==
X-Received: by 2002:a05:651c:119b:: with SMTP id w27mr5593776ljo.237.1617887543685;
        Thu, 08 Apr 2021 06:12:23 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:23 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/8 v3] Input: cyttsp - Reduce reset pulse timings
Date:   Thu,  8 Apr 2021 15:11:50 +0200
Message-Id: <20210408131153.3446138-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The data sheet for CY8CTMA340 specifies that the reset pulse
shall be at least 1 ms. Specify 1-2 ms with usleep_range()
to cut some slack for the scheduler.

Curiously the datasheet does not specify how long we have to
wait after a hard reset until the chip is up, but I have found
a vendor tree (Samsung GT-S7710) that has code for this touch
screen and there this is set to 5 ms so I use this with
the same 1 ms fuzz.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Collect Javier's Reviewed-by
---
 drivers/input/touchscreen/cyttsp_core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 91f8f38b3f06..84f4f1c1a220 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -230,10 +230,16 @@ static int cyttsp_set_sysinfo_regs(struct cyttsp *ts)
 static void cyttsp_hard_reset(struct cyttsp *ts)
 {
 	if (ts->reset_gpio) {
+		/*
+		 * According to the CY8CTMA340 datasheet page 21, the external
+		 * reset pulse width should be >= 1 ms. The datasheet does not
+		 * specify how long we have to wait after reset but a vendor
+		 * tree specifies 5 ms here.
+		 */
 		gpiod_set_value_cansleep(ts->reset_gpio, 1);
-		msleep(CY_DELAY_DFLT);
+		usleep_range(1000, 2000);
 		gpiod_set_value_cansleep(ts->reset_gpio, 0);
-		msleep(CY_DELAY_DFLT);
+		usleep_range(5000, 6000);
 	}
 }
 
-- 
2.29.2

