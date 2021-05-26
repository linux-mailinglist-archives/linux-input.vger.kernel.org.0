Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3F8390EA7
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 05:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhEZDIo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 23:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230075AbhEZDIo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 23:08:44 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD16C061574
        for <linux-input@vger.kernel.org>; Tue, 25 May 2021 20:07:13 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x188so25150810pfd.7
        for <linux-input@vger.kernel.org>; Tue, 25 May 2021 20:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVaWv7rah9ME2kXB5zbarT4yDB4K5xEKSyGiKfO3Qq8=;
        b=mEjfgml+NNKprzdyyyUzWkkBkUx4YNuwQIBsfKg1QPsaAreU21vnEO0NG8TE1/FTP5
         AJFDbPQSvglWfWq9NkfblP5QYUqnupPkqucR+Mn6uRaeyYIH6GmwEbUjPIFqhEbdLGf9
         syzEHVJKhN8qrrisbY4Zp6haKA71UUp7+0xXJc9KmgiCz17uhuzsWW4GJ3O8CZXpMEYT
         TAxvZi0oN2iOWnGsFKObrMJ8Swg4w0y0O5zIV2SO+h+oxGqsgt4DjvWDZtiAIGvqDi5u
         ptXS2oqMwdJb5EXaP8NSka4J2yQnSwsYQZm51p2Yy17JHAtSSL6XrURCheevGgm/r6m8
         Op3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVaWv7rah9ME2kXB5zbarT4yDB4K5xEKSyGiKfO3Qq8=;
        b=si8vMxTAqkq4YUdrOfNM+0DMa9pPbufC/DqiWdOb1BC6z5TxaTqtIXgDR5wirGHAPe
         eEVIHdDCqv0lSPVnhjye2buyPqTv2mi9k4sXJOTwsK1f1M5MRAuCC2UTGonEmCOdysrK
         X7GZVpXL8/fFfG3+pf1PBBScxSrTQEyqdfDxgouiK/tegbF1O7hpu3MvuvAJh/ndETm4
         MIooExCZA8jg/wM+rFeHxeot1H1c4Htkt8a0A+3e/DagmFvHOzcyJs90QxsNieK172w3
         BcHWzCDMqyM9hVplb21oP/l4pfrk/8QeWVj9qR97dLRF7pwpz8kv6ZxfPvIrBNjPVXU1
         3pyg==
X-Gm-Message-State: AOAM532o3ZojiAyRuJ4QsajEdfxCn5sl5IykF7G1Awu1bHgMR0XlyFod
        Jk/hYyZwwu/vAhaKIkAdU/wR2g==
X-Google-Smtp-Source: ABdhPJwPIUdQAfIrUprU6C1NzHtqnTl7YGli1bhK3pyoAVCmW43IYoRr47JFqbzwSMaLnUtgNiejxA==
X-Received: by 2002:a63:e114:: with SMTP id z20mr22365187pgh.207.1621998432900;
        Tue, 25 May 2021 20:07:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47b:3de6:ff1b:1098:9398:7094])
        by smtp.gmail.com with ESMTPSA id o7sm16099266pgs.45.2021.05.25.20.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 20:07:12 -0700 (PDT)
From:   "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
X-Google-Original-From: "simba.hsu" <simba.hsu@rad-ic.com>
To:     dmitry.torokhov@gmail.com, simba.hsu@rad-ic.com,
        furquan@google.com, seanpaul@chromium.org, rrangle@chromium.org,
        adurbin@chromium.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        KP.li@rad-ic.com, jeffrey.lin@rad-ic.com
Subject: [PATCH] Input:raydium_i2c_ts - improve the mechanism of auto-update
Date:   Wed, 26 May 2021 11:06:51 +0800
Message-Id: <20210526030651.22760-1-simba.hsu@rad-ic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Once auto-update has been interrupted, touch IC will be stuck in
recovery mode forever and it will lead to touch malfunction.
This patch maskes auto-update available when touch IC is in
recovery mode to avoid touch malfunction.

Signed-off-by: simba.hsu <simba.hsu@rad-ic.com>
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 53 ++++++++++++++++++----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 4d2d22a86977..50f6fbbe4775 100644
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
@@ -289,6 +291,44 @@ static int raydium_i2c_sw_reset(struct i2c_client *client)
 
 	return 0;
 }
+static int raydium_i2c_query_ts_BL_info(struct raydium_data *ts)
+{
+	struct i2c_client *client = ts->client;
+	static const u8 get_hwid[7] = {RM_BOOT_CMD_READHWID,
+					 0x10, 0xc0, 0x01, 0x00, 0x04, 0x00};
+	int error;
+	u8 rbuf[5] = {0, 0, 0, 0, 0};
+	u32 tmpdata = 0;
+
+	error = raydium_i2c_send(client,
+				 RM_CMD_BOOT_WRT, get_hwid, sizeof(get_hwid));
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
+	error = raydium_i2c_read(client,
+				 RM_CMD_BOOT_CHK, rbuf, sizeof(rbuf));
+	if (!error) {
+		tmpdata = (rbuf[1]<<24|rbuf[2]<<16|rbuf[3]<<8|rbuf[4]);
+		ts->info.hw_ver = tmpdata;
+		dev_err(&client->dev, "HWID %08X\n", ts->info.hw_ver);
+	} else {
+		ts->info.hw_ver = cpu_to_le32(0xffffffffUL);
+		dev_err(&client->dev, "raydium_i2c_read HWID failed, %X, %X, %X, %X\n",
+					 rbuf[1], rbuf[2], rbuf[3], rbuf[4]);
+	}
+	ts->info.main_ver = 0xff;
+	ts->info.sub_ver = 0xff;
+
+	return error;
+}
 
 static int raydium_i2c_query_ts_info(struct raydium_data *ts)
 {
@@ -388,13 +428,10 @@ static int raydium_i2c_initialize(struct raydium_data *ts)
 	if (error)
 		ts->boot_mode = RAYDIUM_TS_BLDR;
 
-	if (ts->boot_mode == RAYDIUM_TS_BLDR) {
-		ts->info.hw_ver = cpu_to_le32(0xffffffffUL);
-		ts->info.main_ver = 0xff;
-		ts->info.sub_ver = 0xff;
-	} else {
+	if (ts->boot_mode == RAYDIUM_TS_BLDR)
+		raydium_i2c_query_ts_BL_info(ts);
+	else
 		raydium_i2c_query_ts_info(ts);
-	}
 
 	return error;
 }
@@ -1218,7 +1255,7 @@ static SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
 			 raydium_i2c_suspend, raydium_i2c_resume);
 
 static const struct i2c_device_id raydium_i2c_id[] = {
-	{ "raydium_i2c" , 0 },
+	{ "raydium_i2c", 0 },
 	{ "rm32380", 0 },
 	{ /* sentinel */ }
 };
-- 
2.25.1

