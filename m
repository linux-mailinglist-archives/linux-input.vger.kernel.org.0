Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE050377E50
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 10:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhEJIhF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 04:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbhEJIhE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 04:37:04 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4379CC061573
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 01:36:00 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id b21so8806817plz.0
        for <linux-input@vger.kernel.org>; Mon, 10 May 2021 01:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nti7k0aWmxKKtAKgFMSnvSLPYcjIi1zTilsQciHI1RE=;
        b=EKxSdMlbDaGqkv7cyz9p+w5EQ7gS34Xa4z/sddpGX1NH5xuEbf26dZmekpxAXX70Qf
         SEh7eFXk7lRzB5DWmqp4AVDyciCSi/8JnHlIFANsIIEDUQGAcGMDKe3EfdPzHDdx+ao0
         P1f7n5B9EsVeBLk8Owfh0dXZIWucpKGSN2hFlwS5IFMa0MkZpp3dW7TCEBY7O5j/4KYl
         F/IdIt+EwxwrDMDl/scpj7xlJqwnGFx9QL/CxQcqHzOf8LP0WOyfnXU3S+AUjBnL8SQd
         ApaCSL086VKRYJItn/qF7PlY8QRRvlR9mh3YmJlXZxy7eDUgS/6G+3XfT9/TcXO2N3RV
         4TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nti7k0aWmxKKtAKgFMSnvSLPYcjIi1zTilsQciHI1RE=;
        b=tr8Lu6FmhTjbeyp5Mi1+0mkLcrqZPRnjd5SZHOmUNcUvEFSlfgg5FOUSrgsFWfDUxA
         NZ6D9Bt+p6EduH9Dw8j8f4Ue1a/DdYZtZo6QA48nvbdBUEnfY9tWK1n+GTr2dImLfe63
         kqVPs+Ug2Je7rHxJ8Hl5W9flCBTkIfw8uaBOXlQbF4JpEMv9URwQWoJqXnXIy8ExVTDX
         g/43aVUmJqwaWzve1SlZbDyq0WFcsi7K0iVicb3pCVkIBt9vSW9nJUhjiD16C7pxOW3r
         0ViMPqnamn05G3xSLhc/01wPF5m5RLauZNxbckLmevSVD5ff6YfH5nXx8kj8RejRzm4J
         eudw==
X-Gm-Message-State: AOAM533F8JJAf6osn7LyAA8xZpnRG0RrLXvUeqnNtQxunCCNMC9gqtNR
        87Z5CIlUrLtTTTcABMUjDj2CMFc/A4NKZYG1GKI=
X-Google-Smtp-Source: ABdhPJzBPv4HVGUFeXpNup/nkVlWfjuJ2RCafgwnL+VX9/BVLzrE6OVuMat/o2CuxamJF4Yr+qjmQg==
X-Received: by 2002:a17:90b:1298:: with SMTP id fw24mr25520515pjb.223.1620635759880;
        Mon, 10 May 2021 01:35:59 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:590:a0b:68e6:4109:c7b2:3cc])
        by smtp.gmail.com with ESMTPSA id x10sm11083340pfp.177.2021.05.10.01.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 01:35:59 -0700 (PDT)
From:   "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
X-Google-Original-From: "simba.hsu" <simba.hsu@rad-ic.com>
To:     dmitry.torokhov@gmail.com, simba.hsu@rad-ic.com,
        furquan@google.com, seanpaul@chromium.org, rrangle@chromium.org,
        evgreen@chromium.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        KP.li@rad-ic.com, jeffrey.lin@rad-ic.com,
        "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
Subject: [PATCH] driver:input:touchscreen: improve the mechanism of auto-update
Date:   Mon, 10 May 2021 16:35:36 +0800
Message-Id: <20210510083536.41925-1-simba.hsu@rad-ic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>

Once auto-update has been interrupted, touch IC will be stuck in
recovery mode forever and it will lead to touch malfunction.
This patch makes auto-update available when touch IC is in
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

