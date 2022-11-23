Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C56446350A0
	for <lists+linux-input@lfdr.de>; Wed, 23 Nov 2022 07:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235612AbiKWGnf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Nov 2022 01:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235464AbiKWGnd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Nov 2022 01:43:33 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6AD9FD14;
        Tue, 22 Nov 2022 22:43:32 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso623882wmo.1;
        Tue, 22 Nov 2022 22:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0Onr3XkLlbM2+edVHYPEJtbFfC8W0qaU8iJvB58mM4=;
        b=l/H0pgpwyQ2LL36uYdrn1RHvVxvp22WGl0gIVz1H6m7t90IsMwVAU5zs7yEN+WwuWd
         8xDLM3MADG6e448gGmpMxZy3oDYgqTJ9LxCc0kkVFdzOal50ma5JXY7Zq9My0aC3fCUZ
         Vvj7x6l8elR3HP9wZ5NULemyJFtLhm7kMiR5Ar5ZhsL5T0RMrhtSktRQDaF4WGQ9y64v
         wiQcYX7c2bvix7b6xRefBSOq3ruvA9rfxPVN0ApN73LrTP3/6gdMHQywO72df8gGR1V1
         M/2AT21TeMWjLkzBqNYoznI3yP+6e7eO9oAKHEP7a2X0QHJnIgUfEsQ8eUG1Tlf5cuXp
         YS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0Onr3XkLlbM2+edVHYPEJtbFfC8W0qaU8iJvB58mM4=;
        b=UL5yYV4FysHAq/VtrHSyfPVjlWkqdeIheJ+kWaNjmI7RalQtUYaitpbNBQHCez9o4B
         78sCSBer1MPg4C1Mvs7dPdom4mTRKTxVBzs4cl7N7eLvDnn7Dw/J/LgbD3JWIts8mYnJ
         ucuc7a91B84ZC3let2r+7wuy1OAg6jE6+DFdQJ4ePm+jqCCM4dJ+bYVt41Hm8RKKacht
         GUJJ60eXp9QQIeshnyAdW7gvG6sThNdWSlfXorBvF7fVFN6tSElGzfcvQQ8E53DrYlu7
         LJw54X7k6LEefFRh0Qcz8YGJ+K5UdAzaeLM5gym1LRmoLUf6SXVNABLbo47j2cSHmMac
         ucfA==
X-Gm-Message-State: ANoB5pk/hjaSVXyTU01euRjF0avQwZqxa4f3n2PuS5C5exyR1+P8aQ9V
        nWv4xWD+Gr8sEgpAHFF7XEw=
X-Google-Smtp-Source: AA0mqf5qeoU2frUPqQJa7asDmBhi818ur+B1Yka3IQ5YiwBgAunPgRtge6G4yaQnVaP+IbPaVwVBYA==
X-Received: by 2002:a05:600c:3b0c:b0:3cf:8df2:63b7 with SMTP id m12-20020a05600c3b0c00b003cf8df263b7mr5574660wms.11.1669185811223;
        Tue, 22 Nov 2022 22:43:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r8-20020adfe688000000b0023662245d3csm6436045wrm.95.2022.11.22.22.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 22:43:30 -0800 (PST)
Date:   Wed, 23 Nov 2022 09:43:27 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Cc:     Dan Carpenter <error27@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] Input: elants_i2c - delete some dead code
Message-ID: <Y33BD9xkRC9euIdO@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We shuffled the error handling around so this condition is dead code
now.  The "error" variable is always zero.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
No Fixes tag because this does not fix a bug but if we were to assign
a tag it would be:

Fixes: a85fbd649844 ("Input: elants_i2c - properly handle the reset GPIO when power is off")

 drivers/input/touchscreen/elants_i2c.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index e1308e179dd6..af1dc43e988c 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1353,8 +1353,6 @@ static int elants_i2c_power_on(struct elants_data *ts)
 	udelay(ELAN_POWERON_DELAY_USEC);
 
 	gpiod_set_value_cansleep(ts->reset_gpio, 0);
-	if (error)
-		return error;
 
 	msleep(ELAN_RESET_DELAY_MSEC);
 
-- 
2.35.1

