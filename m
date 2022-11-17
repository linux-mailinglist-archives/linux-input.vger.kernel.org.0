Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A9F62E608
	for <lists+linux-input@lfdr.de>; Thu, 17 Nov 2022 21:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbiKQUio (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Nov 2022 15:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231404AbiKQUim (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Nov 2022 15:38:42 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5792D1144A
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 12:38:41 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso3116629pjc.2
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 12:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SjvIvcadXOdk0//s0f5eSqUtPjdovzzs9vUSgPGddUo=;
        b=jZE6ECZl1zk5iL/4nuf8rhLihmew/+6DR2bHWgiQLbe6aB6lY3Ow3KvwuaNEdu2BqS
         aR2IVDA0gmcJ/rw3ia8R4/DPc/h3cZCIaq7gKtxISFwxyMD3kvdb3Dngu9UgY5uhWiUx
         vn3NiEesBU5P1w3wchxgr56v74ym5NjREJGko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SjvIvcadXOdk0//s0f5eSqUtPjdovzzs9vUSgPGddUo=;
        b=G6NVuJFL9qa5ClTteX95IO8z357KbnzFzyzcvdTIJ9mK6M4a4mT6geT1+IwzuyG5pw
         UH80cIO+HzbFgS+mOij5ORKtxzkKsOyW9ZEE1Ph5FZjWVJCmmySN/eiBcG+k1um1pHtA
         GfRbIPfwGqMgEhr81htz3jsVQJcy0Mh7kXbOeNBbUP8TqNq4P/NOXQb/K2jt+R1cMss/
         fQpPIbc6BrWwi4op8jdJzmvORepyKzmb0Xo8Nac3NfOjgzlh1VprhoF54Po1fbMuKZhO
         KO5/2QxT/8nIrfUd9xJ1wKXBOa3f3ojq0pkCDSWwUmxhJ3tebZ9/f64NsclxD0CzvxPl
         U6Zw==
X-Gm-Message-State: ANoB5pmNrRGyPrJ4NxTYplBKiKW9vVumUMH5hZJG51J4xw8VTSRWVFq4
        YMi/tHSQHvSSW+JLSuf7AmjUbP3p44DB7UUy
X-Google-Smtp-Source: AA0mqf5QjsqZlFeWUMV60fnWDGr67ZzzZwpyvo1KBIyT4IwZqkrTn4Nl/Ud9it0hKfK1fOBm8hxQqQ==
X-Received: by 2002:a17:903:2448:b0:188:f5c7:4d23 with SMTP id l8-20020a170903244800b00188f5c74d23mr2718635pls.125.1668717520846;
        Thu, 17 Nov 2022 12:38:40 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:6069:1273:e67f:93a3])
        by smtp.gmail.com with ESMTPSA id 185-20020a6214c2000000b005618189b0ffsm1578091pfu.104.2022.11.17.12.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 12:38:40 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: elants_i2c: Properly handle the reset GPIO when power is off
Date:   Thu, 17 Nov 2022 12:38:23 -0800
Message-Id: <20221117123805.1.I9959ac561dd6e1e8e1ce7085e4de6167b27c574f@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As can be seen in elants_i2c_power_off(), we want the reset GPIO
asserted when power is off. The reset GPIO is active low so we need
the reset line logic low when power is off to avoid leakage.

We have a problem, though, at probe time. At probe time we haven't
powered the regulators on yet but we have:
  devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);

While that _looks_ right, it turns out that it's not. The
GPIOD_OUT_LOW doesn't mean to init the GPIO to low. It means init the
GPIO to "not asserted". Since this is an active low GPIO that inits it
to be high.

Let's fix this to properly init the GPIO. Now after both probe and
power off the state of the GPIO is consistent (it's "asserted" or
level low).

Once we fix this, we can see that at power on time we no longer to
assert the reset GPIO as the first thing. The reset GPIO is _always_
asserted before powering on. Let's fix powering on to account for
this.

Fixes: afe10358e47a ("Input: elants_i2c - wire up regulator support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This issue was found mostly due to code inspection. A partner was
having issues with power sequencing with this touch screen and I
noticed this issue in the code. Though this patch doesn't seem to
fully address the problems that the partner was having (they are still
debugging), in the very least it seems correct and we should probably
take it.

This problem has been around for a while. Presumably the touchscreen
is tolerant enough to this short period of time at bootup where the
reset line was leaking power into the unpowered touchscreen, though
it's still not great.

 drivers/input/touchscreen/elants_i2c.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 879a4d984c90..e1308e179dd6 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -1329,14 +1329,12 @@ static int elants_i2c_power_on(struct elants_data *ts)
 	if (IS_ERR_OR_NULL(ts->reset_gpio))
 		return 0;
 
-	gpiod_set_value_cansleep(ts->reset_gpio, 1);
-
 	error = regulator_enable(ts->vcc33);
 	if (error) {
 		dev_err(&ts->client->dev,
 			"failed to enable vcc33 regulator: %d\n",
 			error);
-		goto release_reset_gpio;
+		return error;
 	}
 
 	error = regulator_enable(ts->vccio);
@@ -1345,7 +1343,7 @@ static int elants_i2c_power_on(struct elants_data *ts)
 			"failed to enable vccio regulator: %d\n",
 			error);
 		regulator_disable(ts->vcc33);
-		goto release_reset_gpio;
+		return error;
 	}
 
 	/*
@@ -1354,7 +1352,6 @@ static int elants_i2c_power_on(struct elants_data *ts)
 	 */
 	udelay(ELAN_POWERON_DELAY_USEC);
 
-release_reset_gpio:
 	gpiod_set_value_cansleep(ts->reset_gpio, 0);
 	if (error)
 		return error;
@@ -1462,7 +1459,7 @@ static int elants_i2c_probe(struct i2c_client *client)
 		return error;
 	}
 
-	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
+	ts->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
 
-- 
2.38.1.584.g0f3c55d4c2-goog

