Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5134D353A24
	for <lists+linux-input@lfdr.de>; Mon,  5 Apr 2021 01:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbhDDX0a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 19:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231303AbhDDX03 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Apr 2021 19:26:29 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AC8C061756
        for <linux-input@vger.kernel.org>; Sun,  4 Apr 2021 16:26:24 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b4so15066500lfi.6
        for <linux-input@vger.kernel.org>; Sun, 04 Apr 2021 16:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JLMJvpaqwK9gSk8S0S0Fo7mII0l0I9N45qdCbnOT3yM=;
        b=UM93bVKNtoXuLhyIT7oNUjqC5GPqrjGLaA+laa7BQX8hHX1btcOTaq6VyTGsv2d73M
         EpJOlRmN63e40Kq1oL+XY4sBCieap5+SSpmegSIuG9QCMWnr9prctPvRuuKRldk580V4
         ekogcI+Iaf3KRwx/PRn/cazarGuIxdh+jh21oUbHjsywHM3m6Ax4OXczuDOx8A3gpPoe
         w+RRKAYSD7SBdYiYDQyPkiSVThmGO64UNnt1rWYFwvF0Zehk+yBgqDTeOvzAPsHc7iKl
         i3GoE2owWyGwRdmhqvXUnPUxfem8NtcZa4fuXTSdLgTtGgw+7IYISBE0kGK/k9eXMD4u
         xG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JLMJvpaqwK9gSk8S0S0Fo7mII0l0I9N45qdCbnOT3yM=;
        b=Ls96+UhLTpfQApF+1jaUfxTUlHrls37jk8xuv3tXuXHmMmg7j41lYH8EE/GLNN+hIA
         9045zsPBfSC28jJ7QccF5yHAO8ifhpRhdDl9YG9LE6qrEpFUP1TyWukPXoYsJgaYTFBq
         H19u2GMWxCfXj7IhTdgjrMADWFCAbvIwsD9JUmLRjKUTPUOCvPn7TwFsaJky8FPPXEVk
         939DckzWIiQR4QdLoeTX8VKntCDPayouePpJ5CtblWrYVlyEBWRgY3cc6yOBMPWEgouD
         Ejlh80Qhn+QliKpY2XgFt7voYzawSKfhUuyYmrzNOOS6KEZJNW7RqDsK48tNOo95aZSm
         TKow==
X-Gm-Message-State: AOAM531xLSBd/WRjKD4aGu4Ev1hLAtYYtDydSx3FcVWz4AwTlYSCQeKa
        g5MG9PlMmyoXS6cNYfWOehHEBA==
X-Google-Smtp-Source: ABdhPJzuALbAtnfgEQI6CRD5jFAztrXVNCRF9UuidsVGeJSCfI2l0jM3age86GMBk12MGBEW4JVKOw==
X-Received: by 2002:ac2:5a48:: with SMTP id r8mr5404708lfn.656.1617578781836;
        Sun, 04 Apr 2021 16:26:21 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z22sm1577651lfu.28.2021.04.04.16.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 16:26:21 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Simon Shields <simon@lineageos.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] Input: mms114 - Support MMS136
Date:   Mon,  5 Apr 2021 01:26:19 +0200
Message-Id: <20210404232619.3092682-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Melfas MMS136 is similar to the other MMS variants but
has event packages of 6 bytes rather than 8 as the others.

The define is named FINGER_EVENT_SZ in the vendor drivers
so I renamed it from MMS*_PACKET_SZ to MMS*_EVENT_SZ.

After this patch, the touchscreen on the Samsung GT-I8530
works fine with PostmarketOS.

Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Simon Shields <simon@lineageos.org>
Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This uses the new compatible string from the YAML
conversion patch that was sent separately.
---
 drivers/input/touchscreen/mms114.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 16557f51b09d..131c1136d01c 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-// Melfas MMS114/MMS152 touchscreen device driver
+// Melfas MMS114/MMS136/MMS152 touchscreen device driver
 //
 // Copyright (c) 2012 Samsung Electronics Co., Ltd.
 // Author: Joonyoung Shim <jy0922.shim@samsung.com>
@@ -44,7 +44,8 @@
 #define MMS114_MAX_AREA			0xff
 
 #define MMS114_MAX_TOUCH		10
-#define MMS114_PACKET_NUM		8
+#define MMS114_EVENT_SIZE		8
+#define MMS136_EVENT_SIZE		6
 
 /* Touch type */
 #define MMS114_TYPE_NONE		0
@@ -53,6 +54,7 @@
 
 enum mms_type {
 	TYPE_MMS114	= 114,
+	TYPE_MMS136	= 136,
 	TYPE_MMS152	= 152,
 	TYPE_MMS345L	= 345,
 };
@@ -209,7 +211,11 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
 	if (packet_size <= 0)
 		goto out;
 
-	touch_size = packet_size / MMS114_PACKET_NUM;
+	/* MMS136 has slightly different event size */
+	if (data->type == TYPE_MMS136)
+		touch_size = packet_size / MMS136_EVENT_SIZE;
+	else
+		touch_size = packet_size / MMS114_EVENT_SIZE;
 
 	error = __mms114_read_reg(data, MMS114_INFORMATION, packet_size,
 			(u8 *)touch);
@@ -275,6 +281,7 @@ static int mms114_get_version(struct mms114_data *data)
 		break;
 
 	case TYPE_MMS114:
+	case TYPE_MMS136:
 		error = __mms114_read_reg(data, MMS114_TSP_REV, 6, buf);
 		if (error)
 			return error;
@@ -297,8 +304,9 @@ static int mms114_setup_regs(struct mms114_data *data)
 	if (error < 0)
 		return error;
 
-	/* Only MMS114 has configuration and power on registers */
-	if (data->type != TYPE_MMS114)
+	/* Only MMS114 and MMS136 have configuration and power on registers */
+	if (data->type != TYPE_MMS114 &&
+	    data->type != TYPE_MMS136)
 		return 0;
 
 	error = mms114_set_active(data, true);
@@ -480,7 +488,8 @@ static int mms114_probe(struct i2c_client *client,
 				     0, data->props.max_y, 0, 0);
 	}
 
-	if (data->type == TYPE_MMS114) {
+	if ((data->type == TYPE_MMS114) ||
+	    (data->type == TYPE_MMS136)) {
 		/*
 		 * The firmware handles movement and pressure fuzz, so
 		 * don't duplicate that in software.
@@ -604,6 +613,9 @@ static const struct of_device_id mms114_dt_match[] = {
 	{
 		.compatible = "melfas,mms114",
 		.data = (void *)TYPE_MMS114,
+	}, {
+		.compatible = "melfas,mms136",
+		.data = (void *)TYPE_MMS136,
 	}, {
 		.compatible = "melfas,mms152",
 		.data = (void *)TYPE_MMS152,
-- 
2.29.2

