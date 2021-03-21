Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DAEA34354D
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 23:01:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhCUWBB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 18:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhCUWAs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 18:00:48 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BA6C061574;
        Sun, 21 Mar 2021 15:00:48 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so7509791pjb.2;
        Sun, 21 Mar 2021 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7W0pa9c6/lc5+NUqBizZgIJTST2OMdRIVY4bPA7PVGo=;
        b=VelQUnv3VmAnuR5wBgvALxfXQw8wjltyBjf7cnOGAe4D1/wldApcnIeno/yHQHDoHH
         ym0tJCl3EkAJmDCMB9YDCij+DyO/J8bEnPI1F9mzLqj/k7mGt56X480869171OgiGWk0
         jBN0ZvTjk5DL+GX5pCnnhQc+HQuAqm58fFk0i3Ozi+tgs3mwmBlyAUKvL0l4U1Ykkju5
         otJeBbKSrII/7CTxbISm2xIEro+dOetDI1SQtuBVn9kcHL/L9pnTtypJAoRGxitWyjZg
         QQVY9uwmiXG3vCdpnfnG+Dq/g5Jw9/F7CFogbeU7p7Ontx2epOHe5hIyeP8oakjNVAnS
         eKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7W0pa9c6/lc5+NUqBizZgIJTST2OMdRIVY4bPA7PVGo=;
        b=f9hy768q7qPM+SFYRsg2QRKy7SqfDnkNdOAi/VqpjI+qq7cn5GVn1M92Aed6yG9Tnd
         EiCit5M6vEx2HX4I5RkpzGhUj85pqAkYWazU079nxtFRuXNRDr1gzpNmJ7AOWxGA2qlo
         EOvvUjNDtCaNzYRC04DYkDjjrQlVLqRzN82oJ14k3I73WQe1ONYU+iO1wIsTOueC1GRz
         UcU5U6ufzsd1ABum6tdcpWwlr/6f/GBf3fGMxuKNCuHtJOzjBJBbchW2kgsAsSgTjby7
         caoLbWwHZ3v7xvQcZuzF+jacXrMNIac8peQM2EjxRtoEclHkbehzn/8SXbajIthZJAN6
         9XnA==
X-Gm-Message-State: AOAM530f5U1KBTSGfSy1mP30wxFCFk7or/DcXFWJeVuJmjVcZu0AbVh+
        +K6UZPjqSF1acnM9afav9i2pu8h2OlA=
X-Google-Smtp-Source: ABdhPJz5+tWhcHq28Y30neDW22lGTZetdi0kCLPcuIxrhhzBydIw1jl3eFRfMuWNGeoj1YVMbbCBFw==
X-Received: by 2002:a17:90a:fd89:: with SMTP id cx9mr9828849pjb.93.1616364047334;
        Sun, 21 Mar 2021 15:00:47 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id w17sm10617557pgg.41.2021.03.21.15.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 15:00:46 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 1/2] Input: wacom_i2c - do not force interrupt trigger
Date:   Sun, 21 Mar 2021 15:00:42 -0700
Message-Id: <20210321220043.318239-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Instead of forcing interrupt trigger to "level low" rely on the
platform to set it up according to how it is wired on the given
board.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/wacom_i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
index 1afc6bde2891..609ff84e7693 100644
--- a/drivers/input/touchscreen/wacom_i2c.c
+++ b/drivers/input/touchscreen/wacom_i2c.c
@@ -195,8 +195,7 @@ static int wacom_i2c_probe(struct i2c_client *client,
 	input_set_drvdata(input, wac_i2c);
 
 	error = request_threaded_irq(client->irq, NULL, wacom_i2c_irq,
-				     IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-				     "wacom_i2c", wac_i2c);
+				     IRQF_ONESHOT, "wacom_i2c", wac_i2c);
 	if (error) {
 		dev_err(&client->dev,
 			"Failed to enable IRQ, error: %d\n", error);
-- 
2.31.0.rc2.261.g7f71774620-goog

