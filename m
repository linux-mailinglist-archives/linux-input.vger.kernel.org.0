Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B12D53EFCF2
	for <lists+linux-input@lfdr.de>; Wed, 18 Aug 2021 08:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbhHRGjj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Aug 2021 02:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238952AbhHRGjV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Aug 2021 02:39:21 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1306CC0613CF
        for <linux-input@vger.kernel.org>; Tue, 17 Aug 2021 23:38:47 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id y11so1131997pfl.13
        for <linux-input@vger.kernel.org>; Tue, 17 Aug 2021 23:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ajTOyjYSJ0oov782itPNsymFCO3cX1BrHaaPfNpFmD8=;
        b=byG1i/f/PhVjFqWLuv5cgFo7RwH81xhoD86ym991Hr9lmSySwIgIKLiE4SZsXil5/x
         tgJmIk1uEOpArWhxkm5OcwY/3UU++NbtrxNESrch670WLNutOQM13485G7UvVN8Qg1gk
         8K9m+xQ54E5ja+VeaaiZf+E1jP3at5RrHdNRI8P4kbrWzROms50K7TIazFcS11QBoJzp
         JZNGQI5eYNbj+RnEa2VReVU+dg+3MAmN4EWUdEreSrlPGAb4Py7gf0AIa9lB5ZVddmF4
         Ec+Dysoi7oc1eH2zuilKgL7cLgUO9mmgk6y+MkEnjHaVC9vbEAG8DYcK0dW5CH8j0iZD
         ppkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ajTOyjYSJ0oov782itPNsymFCO3cX1BrHaaPfNpFmD8=;
        b=G308S7Xp+2mEZyRnvuTJfB112j0ItZn63ruKZ2OcswPl6OtcRRvQ+jvIXeg6+PPePW
         UA9IICXLh7FPVzKNndK/xpMcZf9Zq2F3RBl4VaUPDliw0UZrSHwZmJVZO9o6PL/rT2sV
         +RaKMDrS3nJthJPayGughrYnhik4m7/L6RJrU6/WsjXQMdxhw70aWrCUnXDP1DlxG9vV
         9pd+y3Dr2HCErpvK9cH3XEe0Wsl9kFF9nE+x5KpHPJDDP/UQMniHt84E0Ka+4JyQLkj2
         P37HiU4dV5Eram9FjUzGh3ajbgjlL0sHmW4Xgln5jz6oyePKQE72nnzqm7bcWmAvpK8J
         KTAQ==
X-Gm-Message-State: AOAM530nLSziO4h3uFL2nX0AdL0TChXBPONY7aKMWOAMbNbqQvnwZWQr
        fhcOh4NFZWa4Uq0yQ09dAt+Iog==
X-Google-Smtp-Source: ABdhPJwwW46N2ijNc4EXoOYvMjDbJeYlrqFd41gHYiwxR3vaNtS+xBQjCoQaVBmud7aqXGcQAEsq6A==
X-Received: by 2002:a05:6a00:805:b0:3e2:f682:1b32 with SMTP id m5-20020a056a00080500b003e2f6821b32mr405104pfk.60.1629268726650;
        Tue, 17 Aug 2021 23:38:46 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:2cb0:19b8:bfcd:dea8:b1c5])
        by smtp.gmail.com with ESMTPSA id y12sm4706665pfa.25.2021.08.17.23.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:38:46 -0700 (PDT)
From:   "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
X-Google-Original-From: "simba.hsu" <simba.hsu@rad-ic.com>
To:     dmitry.torokhov@gmail.com, simba.hsu@rad-ic.com,
        furquan@google.com, seanpaul@chromium.org, rrangle@chromium.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        KP.li@rad-ic.com, jeffrey.lin@rad-ic.com
Subject: [PATCH] Input: raydium_i2c_ts - read device version in bootloader mode
Date:   Wed, 18 Aug 2021 14:36:44 +0800
Message-Id: <20210818063644.8654-1-simba.hsu@rad-ic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support reading device ID when controller is in bootloader
mode, which may happen if firmware update has been interrupted.

Signed-off-by: simba.hsu <simba.hsu@rad-ic.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 52 ++++++++++++++++++----
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 4d2d22a86977..d3f8cc3285a2 100644
--- a/drivers/input/touchscreen/raydium_i2c_ts.c
+++ b/drivers/input/touchscreen/raydium_i2c_ts.c
@@ -36,7 +36,8 @@
 #define RM_CMD_BOOT_CHK		0x33		/* send data check */
 #define RM_CMD_BOOT_READ	0x44		/* send wait bl data ready*/
 
-#define RM_BOOT_RDY		0xFF		/* bl data ready */
+#define RM_BOOT_RDY		0xFF			/* bl data ready */
+#define RM_BOOT_CMD_READHWID	0x0E	/* read hwid */
 
 /* I2C main commands */
 #define RM_CMD_QUERY_BANK	0x2B
@@ -155,6 +156,7 @@ static int raydium_i2c_xfer(struct i2c_client *client, u32 addr,
 	 * sent first. Else, skip the header i.e. xfer[0].
 	 */
 	int xfer_start_idx = (addr > 0xff) ? 0 : 1;
+
 	xfer_count -= xfer_start_idx;
 
 	ret = i2c_transfer(client->adapter, &xfer[xfer_start_idx], xfer_count);
@@ -290,6 +292,43 @@ static int raydium_i2c_sw_reset(struct i2c_client *client)
 	return 0;
 }
 
+static int raydium_i2c_query_ts_bootloader_info(struct raydium_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	static const u8 get_hwid[7] = {RM_BOOT_CMD_READHWID,
+				0x10, 0xc0, 0x01, 0x00, 0x04, 0x00};
+	u8 rbuf[5] = {0};
+	u32 hw_ver;
+	int error;
+
+	error = raydium_i2c_send(client, RM_CMD_BOOT_WRT,
+			 get_hwid, sizeof(get_hwid));
+	if (error) {
+		dev_err(&client->dev, "WRT HWID command failed: %d\n", error);
+		return error;
+	}
+
+	error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, rbuf, 1);
+	if (error) {
+		dev_err(&client->dev, "Ack HWID command failed: %d\n", error);
+		return error;
+	}
+
+	error = raydium_i2c_read(client, RM_CMD_BOOT_CHK, rbuf, sizeof(rbuf));
+	if (error) {
+		dev_err(&client->dev, "Read HWID command failed: %d (%4ph)\n",
+			error, rbuf + 1);
+		hw_ver = 0xffffffffUL;
+	} else
+		hw_ver = get_unaligned_be32(rbuf + 1);
+
+	ts->info.hw_ver = cpu_to_le32(hw_ver);
+	ts->info.main_ver = 0xff;
+	ts->info.sub_ver = 0xff;
+
+	return error;
+}
+
 static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 {
 	struct i2c_client *client = ts->client;
@@ -388,13 +427,10 @@ static int raydium_i2c_initialize(struct raydium_data *ts)
 	if (error)
 		ts->boot_mode = RAYDIUM_TS_BLDR;
 
-	if (ts->boot_mode == RAYDIUM_TS_BLDR) {
-		ts->info.hw_ver = cpu_to_le32(0xffffffffUL);
-		ts->info.main_ver = 0xff;
-		ts->info.sub_ver = 0xff;
-	} else {
+	if (ts->boot_mode == RAYDIUM_TS_BLDR)
+		raydium_i2c_query_ts_bootloader_info(ts);
+	else
 		raydium_i2c_query_ts_info(ts);
-	}
 
 	return error;
 }
@@ -1218,7 +1254,7 @@ static SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
 			 raydium_i2c_suspend, raydium_i2c_resume);
 
 static const struct i2c_device_id raydium_i2c_id[] = {
-	{ "raydium_i2c" , 0 },
+	{ "raydium_i2c", 0 },
 	{ "rm32380", 0 },
 	{ /* sentinel */ }
 };
-- 
2.25.1

