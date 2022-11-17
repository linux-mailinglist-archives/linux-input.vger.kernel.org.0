Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F31862E58A
	for <lists+linux-input@lfdr.de>; Thu, 17 Nov 2022 20:59:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiKQT7v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Nov 2022 14:59:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234246AbiKQT7v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Nov 2022 14:59:51 -0500
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFC3D7EC9B
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 11:59:50 -0800 (PST)
Received: by mail-oo1-xc2b.google.com with SMTP id o140-20020a4a2c92000000b0049effb01130so459468ooo.9
        for <linux-input@vger.kernel.org>; Thu, 17 Nov 2022 11:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkZrW+KV2lgTlRyXQCn02KYbLYcMZM2XrspWfi5VO7I=;
        b=b4WAhSJh+P1bEvX0zR5KrO7XnmtoqALOyw/TJdJ7QJOrzAtihZVTLm5Wj6V/DiCl1R
         /deX+jlJGXtB4lerZ07mqng2MzN/wUyV+za480Z+rcQlsjU87ZeTXMZfDWtNWaXC/hJB
         /ecv9eHkWBwonr6GsbeJP/bQuTrtgbRCIj28YdVIcwcvNbGxEtkp8i2/QP/cOqZkIKLx
         MwJq46g8X8Nucvph0lSuC4aYaD1iX66ste/Kl7/hRfbezLyGB+h0OEYkDNGajg5uIIq4
         s3HWnhfeTPnKOsRrQ3+jJ/4y6rGTbXqTuRTD6k2G/FXbJtadCfBio3YRxuKxsSnmcFZD
         XH9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkZrW+KV2lgTlRyXQCn02KYbLYcMZM2XrspWfi5VO7I=;
        b=xufm1SZ1nNSNU4yEaGklYScS2r4aK+Lex0xH4uF/bNW4/p1/TpBWzMjI07O432526B
         RstgQbUyzLJI6CLv7nHyZTdpEtt8fudGYsVkEvhIXfGl9VebZ3++6HAbqbdznN9GXSwB
         X5sP6GM4oUb2bLYwEedtnmABOGi7uBqpbQ51Qf9PI9WguTujHNu/ISRiBof7MkamdDma
         xj/y1SrecFVgFJn3ex3W9ftuzvW03iJPrF3jiYsMFOXoALV7w0DL7NyzM801o/Q3QNzy
         oxC/MwuH6wwFh3PteQZyx2haCQ3h43tKgYSJG2oLvCVM5imeBT9Ejhhgq6NketS51TI8
         SiBw==
X-Gm-Message-State: ANoB5plOW4/xNXFIZ5q3shkTEh37v7q73TIXSjvND48vKpKTzEx8f/xM
        oLJPDPIc9ky3svvCCAIrHwqvD2WP0cE=
X-Google-Smtp-Source: AA0mqf6WgnbMswWW9AZo1nYNz7T8GKAaGfpi/k1fKDcGo5IiVJCult7p8PMC6zGSD5hSwaMFoYDAKA==
X-Received: by 2002:a4a:e1a1:0:b0:49e:1b6a:3c57 with SMTP id 1-20020a4ae1a1000000b0049e1b6a3c57mr2095038ooy.32.1668715189781;
        Thu, 17 Nov 2022 11:59:49 -0800 (PST)
Received: from localhost.localdomain (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
        by smtp.gmail.com with ESMTPSA id y9-20020a4a4509000000b0049fb39100a5sm671289ooa.37.2022.11.17.11.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 11:59:49 -0800 (PST)
From:   Chris Morgan <macroalpha82@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, Chris Morgan <macromorgan@hotmail.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH] hynitron_cstxxx: Initialize tmp to 0 to fix uninitialized variable issue
Date:   Thu, 17 Nov 2022 13:59:21 -0600
Message-Id: <20221117195921.2291-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Chris Morgan <macromorgan@hotmail.com>

In the very unlikely event the cst3xx_i2c_write() fails inside of the
cst3xx_bootloader_enter() function 5 times in a row, the uninitalized
value of tmp will get compared to CST3XX_BOOTLDR_CHK_VAL. Initialize
the value of tmp to 0 so that in this unlikely event we are comparing
0 instead of an uninitalized variable.

Fixes: 66603243f528 ("Input: add driver for Hynitron cstxxx touchscreens")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reported-by: Dan Carpenter <error27@gmail.com>
---
 drivers/input/touchscreen/hynitron_cstxxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/hynitron_cstxxx.c b/drivers/input/touchscreen/hynitron_cstxxx.c
index 333439fedb90..ed9056da786d 100644
--- a/drivers/input/touchscreen/hynitron_cstxxx.c
+++ b/drivers/input/touchscreen/hynitron_cstxxx.c
@@ -208,7 +208,7 @@ static int cst3xx_bootloader_enter(struct i2c_client *client)
 {
 	int ret;
 	u8 retry;
-	u32 tmp;
+	u32 tmp = 0;
 	unsigned char buf[3];
 
 	for (retry = 0; retry < 5; retry++) {
-- 
2.25.1

