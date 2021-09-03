Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3E64003BA
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 18:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349893AbhICQ4P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Sep 2021 12:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbhICQ4P (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Sep 2021 12:56:15 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24E9C061575;
        Fri,  3 Sep 2021 09:55:14 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id t190so6434871qke.7;
        Fri, 03 Sep 2021 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=qAhYyk70rRJhellCiiRtT4ZhE4xl1g6Z8JwF20495p0=;
        b=D4/mXOG7IfK/tTNUFN8RQaL3c8EyfpSKjlQs8X/LJOvOwAHrwvC91MSpJaaLytNLRz
         AgkplkQziPR3J07y0HofYz74NOzIm17d8M/n0XSgcMDSUWnFuzbh9NOmIre4Y094gd0p
         f+8OQX4GNn+Myz+VPO+0e2KYXs/6JKGGofSEXJTR1fDtGkC2VB01OvJZO9on+bWT7xqJ
         lVHtm2XFCjY7ghPEEZ5qwKhncMLvfK9veLxAchK3UqR95lV96SphyS00CQkw5kVUdlMQ
         +hg2fXrMb0t44G3h/FNoWbWzRUsEqgfAfpxAIKqOww72D9R8vVW6Ty4D13nPwR4YgyDx
         4OOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=qAhYyk70rRJhellCiiRtT4ZhE4xl1g6Z8JwF20495p0=;
        b=eTC9XOeucsL0hV+m+lESLrFlHFNPlek7auZBKzCmSKvv7/x2I84i6/+ptU9f/bAXnu
         cBLcLdpuo60zRa4tSx8qRqy59DIFuk9zge8c0FSpTUU5J//UW3DB1TH29JG94PSwTdoC
         r6J960r2lZ5QR61JRqSLF+C5xuVW7OL31XSSsISgIoBxwf6cgCsldDPrTlOUg0ahZ//S
         MCpPjUVkBMTUlLRhHBJOMiXvwry9eKzGDOqJ0CpnBbZPtGjQGYLXg2ZhaolvmAI51zzi
         mHGNktUFAqOPmCUI45VoeE0EWqIinoo0veELsNWvPYDylXwblzIBndYKgvXzdRTYfoue
         ZX5g==
X-Gm-Message-State: AOAM531atv7wy6/FoqmPQ6JmzLjCf9APX+PgR9NUM+BGuCHhSFUvtilw
        gAD8FjDCKoChZ9miTGKcE3kU+usMjdX/Witv
X-Google-Smtp-Source: ABdhPJxzSObTtWNiIYoq+wjSIH25hWaq5QL7VWoGsT/Y+Lf9gd+ObmlWfsUfhN9gUwmLfVf0jj85xg==
X-Received: by 2002:a05:620a:1210:: with SMTP id u16mr4214329qkj.390.1630688113927;
        Fri, 03 Sep 2021 09:55:13 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:3b96:107a:ec6b:b3e2:5204:b8f3])
        by smtp.gmail.com with ESMTPSA id b12sm1749765qkk.3.2021.09.03.09.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 09:55:13 -0700 (PDT)
From:   Rogerio Pimentel <rpimentel.silva@gmail.com>
To:     dmitry.torokhov@gmail.com, rpimentel.silva@gmail.com,
        hansemro@outlook.com, marex@denx.de, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] Input: ili210x - Set the device name according to the device model
Date:   Fri,  3 Sep 2021 13:54:48 -0300
Message-Id: <20210903165448.26545-1-rpimentel.silva@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adding the device model into the device name is useful when
applications need to set different parameters according to the
touchscreen being used, e.g. X11 calibration points.

Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
---

Changes since v1: Get the device ID from touchscreen controller
instead of driver's device list.

 drivers/input/touchscreen/ili210x.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 199cf3daec10..7a897a03ed70 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -19,10 +19,14 @@
 #define ILI251X_DATA_SIZE1	31
 #define ILI251X_DATA_SIZE2	20
 
+#define ILI_NAME_LEN		27
+#define ILITEK_TS_NAME "Ilitek ILI%x%x Touchscreen"
+
 /* Touchscreen commands */
 #define REG_TOUCHDATA		0x10
 #define REG_PANEL_INFO		0x20
 #define REG_CALIBRATE		0xcc
+#define REG_TS_MODEL		0x61
 
 struct ili2xxx_chip {
 	int (*read_reg)(struct i2c_client *client, u8 reg,
@@ -384,6 +388,8 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	struct input_dev *input;
 	int error;
 	unsigned int max_xy;
+	unsigned char buf[2];
+	char *model_name;
 
 	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
 
@@ -430,7 +436,10 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, priv);
 
 	/* Setup input device */
-	input->name = "ILI210x Touchscreen";
+	input->name = ILITEK_TS_NAME;
+	model_name = (char *)input->name;
+	priv->chip->read_reg(priv->client, REG_TS_MODEL, buf, 2);
+	snprintf(model_name, ILI_NAME_LEN, input->name, buf[1], buf[0]);
 	input->id.bustype = BUS_I2C;
 
 	/* Multi touch */
-- 
2.17.1

