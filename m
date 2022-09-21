Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D44B95E548C
	for <lists+linux-input@lfdr.de>; Wed, 21 Sep 2022 22:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbiIUUhX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 16:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiIUUhX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 16:37:23 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F82185A90
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 13:37:22 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id l65so7135338pfl.8
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Rvg27nI1F4ouZulmvH/5reAm0D7q6assoJZKMFEcgfs=;
        b=UoYjMHrgSl4dMupzGhiQ6DAQC/QLhsODf5Fu4FrBVNORbKdGygcx6tTgO9xEtJ0oc3
         n2AHJWq1sGAxRHIhitEamWtQhCIBW1H8m4dL249UqJkW7F9CeELYmRSJln78ucr9zzHj
         kXyqAI7xbGVD/Nd1iY5Hb6Pr18j7vktHjjHZ8gS7q1QH79NfAzLjUBV6Nrt4hefq397I
         yqwjBWZSHfVWPsiTMMYzuA/n4GB29Dr75vQ2TL3ZlQcZoPjZiuiHyDudbtLwl0RVRJUU
         F2UcIKV2afa2fJNbsex5tb5B+8r1RHeom88UJXX/pcYr9O1ZbCuqxsPtUKE6YcatLNHQ
         tsUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Rvg27nI1F4ouZulmvH/5reAm0D7q6assoJZKMFEcgfs=;
        b=JuLCPoFgWn7wm1DBbzb987vlDJSGx1ffSB8mhOuQPDaJxWELhgvAvb7zr8t93BTR+N
         vQhsz3637ZW7IVCDX3d1PcH/yuzZFFKW0BH/MQ1yGNAZ6oiWLVwQcv7BP2PKgEE7FqK3
         L+omsAE6KCBJ4shXPfmJwr7F4fJ7um2Hah8WM4EepE6jxYf6K/w+eraOkaIidBJ6DUrI
         C7XkE9ykU7DQXT8PKAuFpwTIISlqesa1z/469evf/mO8JzfAEoatDhgNui4I06GYx7YW
         kkAOE4GcKrdXOxfkjRDDTQUlHiJDTL1sk57iegAZqOHqDZUhlEe0TiU68oLK2CiA7HdX
         s1vQ==
X-Gm-Message-State: ACrzQf0tZdZdl79jjDFcfJKBVw0oInvqj2cwJuAY98yjoD9Xk3gg6zK1
        5c9oBKA7GXnZ8Tj/6m3JlN7sRfM8GPXekg==
X-Google-Smtp-Source: AMsMyM5MM20QchxI/LH2nauq3DDvhNnIEvxWqGXVzoJcLlBcxntYhIvj8g+Ee+dDUuvWw1sBPZgKLw==
X-Received: by 2002:a63:42c7:0:b0:438:e0dc:cc09 with SMTP id p190-20020a6342c7000000b00438e0dccc09mr16164pga.128.1663792641231;
        Wed, 21 Sep 2022 13:37:21 -0700 (PDT)
Received: from localhost.localdomain (lily-optiplex-3070.dynamic.ucsd.edu. [2607:f720:1300:3033::1:4dd])
        by smtp.googlemail.com with ESMTPSA id h10-20020a170902680a00b001769206a766sm2409275plk.307.2022.09.21.13.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 13:37:20 -0700 (PDT)
From:   Li Zhong <floridsleeves@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, Li Zhong <floridsleeves@gmail.com>
Subject: [PATCH v1] touchscreen/88pm860x-ts: check the pm860x_set_bits return value
Date:   Wed, 21 Sep 2022 13:37:06 -0700
Message-Id: <20220921203706.1635298-1-floridsleeves@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

pm860x_touch_close() got the return value of pm860x_set_bits() but
didn't check it. However, pm860x_set_bits() could fail when writing the
reg map fails. Since pm860x_touch_close() cannot return an error value,
we retry the bit setting in the error handling.

Signed-off-by: Li Zhong <floridsleeves@gmail.com>
---
 drivers/input/touchscreen/88pm860x-ts.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/88pm860x-ts.c b/drivers/input/touchscreen/88pm860x-ts.c
index 81a3ea4b9a3d..043520d1ff26 100644
--- a/drivers/input/touchscreen/88pm860x-ts.c
+++ b/drivers/input/touchscreen/88pm860x-ts.c
@@ -106,10 +106,13 @@ static void pm860x_touch_close(struct input_dev *dev)
 {
 	struct pm860x_touch *touch = input_get_drvdata(dev);
 	int data;
+	int ret;
 
 	data = MEAS_PD_EN | MEAS_TSIX_EN | MEAS_TSIY_EN
 		| MEAS_TSIZ1_EN | MEAS_TSIZ2_EN;
-	pm860x_set_bits(touch->i2c, MEAS_EN3, data, 0);
+	ret = pm860x_set_bits(touch->i2c, MEAS_EN3, data, 0);
+	if (ret < 0)
+		pm860x_set_bits(touch->i2c, MEAS_EN3, data, 0);
 }
 
 #ifdef CONFIG_OF
-- 
2.25.1

