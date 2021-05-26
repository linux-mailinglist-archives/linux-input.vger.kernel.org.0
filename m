Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DDF390E87
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 04:55:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhEZC5M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 22:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhEZC5L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 22:57:11 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CDDC061574
        for <linux-input@vger.kernel.org>; Tue, 25 May 2021 19:55:39 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id 69so17397706plc.5
        for <linux-input@vger.kernel.org>; Tue, 25 May 2021 19:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jpht/8/Fp8Mx3c3AAcQfzzXctquL9RKvRYq4W50Glk=;
        b=qD4/Z8QL6XmCTIQTnjLal+ZiPbGmxQoBXWr2mLxGLzZrp0Gx1AksVsG9vkOIDI0OS8
         wylbQctflsyF492Zl8v1C6sa7z2TpAtigtO77JL00OvElWO5otj1TAyF7hT/7EDcuDSh
         JO1Q/b0bka0JXpWI6JE52QMFhbZJx1055beuX5uo3JhEFtA5rwr6XEBN15BaVJQXqvYM
         eoe1XMGIJ29sf2xjQFeeZ2SGYAnGvxiQQLuBNf8ydZOmGKfFRJO6pYysNSI1g+WtWXEW
         nD1WHb4/bMFWRqu/cimpOWl6PLY+CuHm0UkIpk86J5iECpUxw48CtwZIfibQu46hzzxD
         xVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1jpht/8/Fp8Mx3c3AAcQfzzXctquL9RKvRYq4W50Glk=;
        b=AhB73rD8bJsSaGv7pelBsQnb6qvk6sEzE8czYij3841Lsvjzx+ydmeVRmaBTD5vCX4
         sR5lWXBWLs+a6lFZu3QPrSqtce1PSw1xb/G9/oW5ZiPnabw36w0vjAs657P6YRQebCk9
         xYObAPtrd/Tq6hP5ovecdHUEwNUp48gXIFr+/MWDw5nLmNj1CF3NgTvLiAGYrY4q97V1
         zTQrdiUhUT0DWBftwsEMkLy12W77U8KWsLwuX/zALM4suEwzYuxfc6zHoBI2PTNXPZ6W
         1IUKZBkg+2/cBsjMgeg7dRBpQ52zrcMI9iu78F1g+F8/MQVmyt+iRG53xky0N13MxHVZ
         +RhA==
X-Gm-Message-State: AOAM5308pJMmxPoU5h3ZxmNFkW+xSQfCPvB6MJQWa0sgLd6usDwok7Ab
        +o1Z2MZmDC0VqcvGgbNlP0orYw==
X-Google-Smtp-Source: ABdhPJxmqAXINvTiCite1x13thKZcCPdQcEsdY+IlRaknEy+Lx1IUA5Gs8kWOMYLPnjcR2vtubhGoA==
X-Received: by 2002:a17:90a:6f06:: with SMTP id d6mr33857771pjk.216.1621997738984;
        Tue, 25 May 2021 19:55:38 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47b:3de6:ff1b:1098:9398:7094])
        by smtp.gmail.com with ESMTPSA id c191sm14658641pfc.94.2021.05.25.19.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 19:55:38 -0700 (PDT)
From:   "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
X-Google-Original-From: "simba.hsu" <simba.hsu@rad-ic.com>
To:     dmitry.torokhov@gmail.com, simba.hsu@rad-ic.com,
        furquan@google.com, seanpaul@chromium.org, rrangle@chromium.org,
        adurbin@chromium.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        KP.li@rad-ic.com, jeffrey.lin@rad-ic.com
Subject: [PATCH] driver:input:touchscreen: improve the mechanism of auto-update
Date:   Wed, 26 May 2021 10:53:54 +0800
Message-Id: <20210526025354.22455-1-simba.hsu@rad-ic.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Once auto-update has been interrupted, touch IC will be stuck in
recovery mode forever and it will lead to touch malfunction.
This patch makes auto-update available when touch IC is in
recovery mode to avoid touch malfunction

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

