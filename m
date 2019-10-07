Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0722CE157
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2019 14:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727554AbfJGMP7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Oct 2019 08:15:59 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34919 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfJGMP7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Oct 2019 08:15:59 -0400
Received: by mail-qt1-f194.google.com with SMTP id m15so18801053qtq.2
        for <linux-input@vger.kernel.org>; Mon, 07 Oct 2019 05:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s3He+r/lFUigg0LHAxifBEbSv17+mUg2fQFUyzzUORo=;
        b=u/WiZvF7a8GKjQtTB4WHUGhW+rUlR+1Dt9XAcap1qEc7Dhuiw321jUrcy9CUIL/2j1
         IH0YkprjYQCN0wN9e5BeylAOyNeFSbFJH5PxUZZqTmNoS7OkmqjCWJfY5giFxSbBoYiq
         ki66PCq0JnChEmhUxcFQNKp0AyGqFoTgxUYuirnYrYSzsZG4yin3LuJYl/8R21tX6dIM
         /GC6K39NPcX3q4oYBSDtFgRPAgDeDa+0AKQ6M5d4B2wG9fZeDk89/cTjy8ECrFMA77Kr
         I+Dhr7tsElA0obEb0k1O6BIJYeSOwkLtsLPyW913dMRU+yyAROocsAc5mFWZGaZ/87U8
         aDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s3He+r/lFUigg0LHAxifBEbSv17+mUg2fQFUyzzUORo=;
        b=Fd8zPbEqOylmMoJv1ovEzr+KzQgLMRn7Q8J//GUJdEItpNA4LjymswKH9iRVpUkLfH
         7mrrrMSOkpQ5xBkqHLBqLhj+Crm03jBUfKXEilv0hoh6EAJPRzIJs/T0IUAYBnsdK1Pb
         HbNDknIPkNkqOQooAF13j26nRVwuZEqbKDIebVfMmMmxOWJYTMS0mYDxuWUw2bKxxxbk
         eP6WYvU/XN9lNbrz4Klr+mL+2gxJ6KtNnQTYs+dsr1dpPVgxQLKn8Ey+HO55Z6yE2eiz
         f2QjyvaXLtlYBuF8RinJdXaZMx03m0OWYI0BYiV8DALn2oAod2DhRd8wqk9exaI6EpLi
         UPgQ==
X-Gm-Message-State: APjAAAViWxm6Vf+mV3Oj8N+LzIJxpyyDnlk0AzXC0oSWrzFFztxd5jOb
        UoVOgEoQ/PxCJcmeV4KdBWs7kWDa
X-Google-Smtp-Source: APXvYqwGbF873l4rPyjdSUN8l1UiQv1QsHzVmH9QiO51UZe13DtxGERiY2j11+S7Lcaoj3KFz5WKKw==
X-Received: by 2002:a05:6214:1401:: with SMTP id n1mr27054402qvx.196.1570450558113;
        Mon, 07 Oct 2019 05:15:58 -0700 (PDT)
Received: from fabio-Latitude-E5450.am.freescale.net ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id g194sm8221678qke.46.2019.10.07.05.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 05:15:57 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jcbian@pixcir.com.cn, rogerq@ti.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 5/5] Input: pixcir_i2c_ts: Do not print error on defer probe
Date:   Mon,  7 Oct 2019 09:16:07 -0300
Message-Id: <20191007121607.12545-5-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007121607.12545-1-festevam@gmail.com>
References: <20191007121607.12545-1-festevam@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In the case of defer probe we should not print an error message.

This also aligns with how defer probe is handled in the other GPIOs
used by this driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/input/touchscreen/pixcir_i2c_ts.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index c8a35e97b595..b5d53aaef718 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -567,7 +567,9 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 	tsdata->gpio_attb = devm_gpiod_get(dev, "attb", GPIOD_IN);
 	if (IS_ERR(tsdata->gpio_attb)) {
 		error = PTR_ERR(tsdata->gpio_attb);
-		dev_err(dev, "Failed to request ATTB gpio: %d\n", error);
+		if (error != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request ATTB gpio: %d\n",
+				error);
 		return error;
 	}
 
@@ -575,7 +577,9 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 						     GPIOD_OUT_LOW);
 	if (IS_ERR(tsdata->gpio_reset)) {
 		error = PTR_ERR(tsdata->gpio_reset);
-		dev_err(dev, "Failed to request RESET gpio: %d\n", error);
+		if (error != -EPROBE_DEFER)
+			dev_err(dev, "Failed to request RESET gpio: %d\n",
+				error);
 		return error;
 	}
 
-- 
2.17.1

