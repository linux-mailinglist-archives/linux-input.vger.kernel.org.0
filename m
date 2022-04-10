Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917FD4FADBC
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 14:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236345AbiDJMFf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Apr 2022 08:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230125AbiDJMFc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Apr 2022 08:05:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC83F515A3
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:20 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r18so1219806ljp.0
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dsoR6g73eC63SWlGERr29fTr25y7gIiBYQZuhqPojTM=;
        b=ULTA1zA7N6zs0820i6Cfi5VJ4dci32sGLNoPrSHkKSLBLQf86IhIOXpBTGLXcvnZUC
         L/pOSr/+QyMaTaGQiLu0tDoapcaoqkJmSsvmTqCwein91neggkx/NFuH/q2Q9H9oUh4o
         yiJMPw8/0dIsm4aXl/ecTcoFjTba507ZtDRjQ/Tyn52wdjt+urbb/XL9TA65BGV3eXei
         +SYCmX5pOIdA4caiHWGW8s8D5EKuhMrxalVTveNT7fI+klTe6sfOnxdyNFjipXtuN4Ek
         LvdgfUWmlzEF1df2msArl8GeGWtNSPdwyQdVSh1q29xzJROsGg2kJjXyqcEsG+I4Dxc2
         YWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dsoR6g73eC63SWlGERr29fTr25y7gIiBYQZuhqPojTM=;
        b=ymBat253d2Jr1FNvMLEsDXR0HGKDENe2hEK4LwTBGXMq8qrK69Mtra8Nr+pcr0YlsP
         14LP1g2D54cLXFBYoJBvjk2ED8RSLjqnDIDqcoW/y9QQcI+tiTt/EO58OlN8WMRc1l5I
         qqU9gwMcHYzBPeR4RtxbZ64XSopyVBrC/ZNSCYndG8O/tcDOXfLZGbee2UVyUigPCgnv
         XT0+drxJ8OQ0ls2ZF8/vj0h8ctudpB6f7ErY1RuzXdGUNKrlRxxp8wWibeWiqQuK0fyD
         /Z78Xd4gmC3IXxrNjTvghursypMQiY3+HiGxuaKvP8RVdP5qFR4MNXnxHaP70PbaeCM0
         brPA==
X-Gm-Message-State: AOAM5326jpR9raAiKSiAIv8vpwkB0u1bCHFnTSoXRZ/d2m/qdyzACpk+
        4oX4hzIv/+AxS/WjIh+crYKNdA==
X-Google-Smtp-Source: ABdhPJyGAaPkcdIl8TJnXHt9leN58ZckkVn56QLGF98Rtb62Jb3tqMGvNb3GfN4RNBewcrYAxwc37g==
X-Received: by 2002:a2e:54e:0:b0:24b:58aa:735f with SMTP id 75-20020a2e054e000000b0024b58aa735fmr4465833ljf.530.1649592199244;
        Sun, 10 Apr 2022 05:03:19 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s10-20020a19ad4a000000b0044826a25a2esm2992216lfd.292.2022.04.10.05.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 05:03:18 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5] Input: zinitix - Read and cache device version numbers
Date:   Sun, 10 Apr 2022 14:00:58 +0200
Message-Id: <20220410120059.2583849-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220410120059.2583849-1-linus.walleij@linaro.org>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The chip hardware revision, firmware version and regdata
revision is useful to know, so read this out and print it
the first time we open the device. Example output from
BT404:

Zinitix-TS 3-0020: chip revision 4040 firmware version 0088
  regdata version 0004

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/zinitix.c | 37 +++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index f89dea49cf1f..ea807b972f26 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -35,6 +35,9 @@
 
 #define ZINITIX_TOUCH_MODE			0x0010
 #define ZINITIX_CHIP_REVISION			0x0011
+#define ZINITIX_CHIP_BT404			0x4040
+#define ZINITIX_CHIP_BT532			0x5320
+#define ZINITIX_CHIP_BT541			0x5410
 #define ZINITIX_FIRMWARE_VERSION		0x0012
 
 #define ZINITIX_USB_DETECT			0x116
@@ -147,6 +150,9 @@ struct bt541_ts_data {
 	struct touchscreen_properties prop;
 	struct regulator_bulk_data supplies[2];
 	u32 zinitix_mode;
+	u16 chip_revision;
+	u16 firmware_version;
+	u16 regdata_version;
 };
 
 static int zinitix_read_data(struct i2c_client *client,
@@ -191,11 +197,24 @@ static int zinitix_write_cmd(struct i2c_client *client, u16 reg)
 	return 0;
 }
 
+static u16 zinitix_get_u16_reg(struct bt541_ts_data *bt541, u16 vreg)
+{
+	struct i2c_client *client = bt541->client;
+	int error;
+	__le16 val;
+
+	error = zinitix_read_data(client, vreg, (void *)&val, 2);
+	if (error)
+		return U8_MAX;
+        return le16_to_cpu(val);
+}
+
 static int zinitix_init_touch(struct bt541_ts_data *bt541)
 {
 	struct i2c_client *client = bt541->client;
 	int i;
 	int error;
+	static bool read_static = false;
 
 	error = zinitix_write_cmd(client, ZINITIX_SWRESET_CMD);
 	if (error) {
@@ -203,6 +222,24 @@ static int zinitix_init_touch(struct bt541_ts_data *bt541)
 		return error;
 	}
 
+	/*
+	 * Read and cache the chip revision and firmware version the first time
+	 * we get here.
+	 */
+	if (!read_static) {
+		bt541->chip_revision = zinitix_get_u16_reg(bt541,
+					ZINITIX_CHIP_REVISION);
+		bt541->firmware_version = zinitix_get_u16_reg(bt541,
+					ZINITIX_FIRMWARE_VERSION);
+		bt541->regdata_version = zinitix_get_u16_reg(bt541,
+					ZINITIX_DATA_VERSION_REG);
+		dev_info(bt541->dev,
+			 "chip revision %04x firmware version %04x regdata version %04x\n",
+			 bt541->chip_revision, bt541->firmware_version,
+			 bt541->regdata_version);
+		read_static = true;
+	}
+
 	error = zinitix_write_u16(client, ZINITIX_INT_ENABLE_FLAG, 0x0);
 	if (error) {
 		dev_err(bt541->dev,
-- 
2.35.1

