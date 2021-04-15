Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68CCB360567
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 11:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhDOJPc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 05:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbhDOJPc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 05:15:32 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4FFC061574
        for <linux-input@vger.kernel.org>; Thu, 15 Apr 2021 02:15:08 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d8so11701128plh.11
        for <linux-input@vger.kernel.org>; Thu, 15 Apr 2021 02:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Lx7lp550nbZTbNEa04UfaUkL45vm+IaJz5waIuGeAo=;
        b=LoVeORfd0p9VjKGkKluZZpS5EzROGEBP+3RPl6eRvzDbbr97mLlz/ZyzQKpwe+Cpbh
         XyVh6+KQwMJbY6+6DfADPXQVXmg6D5epp7PlMk0PInhIbSMp+zlhBunqMyv6VqI3IHDv
         qb7CVxoRwtQYbSIOcLe33OKMrTeWW2xetQwwRsBVjRLKyys9xRbuuYFwMeyVtwKluHPI
         +empEiAqfPC8eJg/QwRj4J0cBg/Nrvel1kTqHqS94Dah3FIPA3HRMyjaVZHJ9KwsM2oc
         v/+G8sPChKj8RC+tr3DofmzcgvGsFz6xlqaPghpab/mb430+isoloLxiozlturRD0FB3
         nAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2Lx7lp550nbZTbNEa04UfaUkL45vm+IaJz5waIuGeAo=;
        b=nL9D3xAZ6jE8Lo6seb6BCsghg7QQ7exr28vAbblq9YEl0iKDqDY9yH0yQPI3D3MDDH
         0N/HnI77Nnb/IV3FkVBGtXsW7q/nTfh3GiS/HjXthMLejAiPr7NicmJiO2UqZ4/YxGP6
         Ar46ChzZrtacqHmQVPWvoETpZLXFkQk239jL0h/oWmbsVR4kk7zdk6agWDd/876hGh5k
         LUfX2gBHYFIBLewalAJ3BoHXXS1VKLpHK8ps5AJvccHn+dbL+Gafo2rL95U+M6OTJbup
         s9OIY9t/h/7KNbR/f39As0UFiFZ4X9o4En3DBo19e79JtPcD6Q45Lx1PvyIDSVi+HsOI
         B6rA==
X-Gm-Message-State: AOAM5301Cg/E0tRCu5eu9kNKqeGJRFRghExi57EELQQakliFSkCs74y3
        6EoBlaQVufFWbkLpEaljhLbrew==
X-Google-Smtp-Source: ABdhPJzSXFx4cpaTiG3Q4+d7Ihyk1fl2vtbWLlfjYpSGQpAOpD5niTY1eLUn7D1UejzeLbOtFj5Xdw==
X-Received: by 2002:a17:902:20a:b029:eb:873d:d73d with SMTP id 10-20020a170902020ab02900eb873dd73dmr214245plc.54.1618478107751;
        Thu, 15 Apr 2021 02:15:07 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:4ad6:bcb:c5d1:c270:7333])
        by smtp.gmail.com with ESMTPSA id b23sm1881004pju.0.2021.04.15.02.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:15:07 -0700 (PDT)
From:   "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
To:     dmitry.torokhov@gmail.com, furquan@google.com,
        seanpaul@chromium.org, rrangel@chromium.org, simba.hsu@rad-ic.com
Cc:     jeffrey.lin@rad-ic.com, KP.li@rad-ic.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
Subject: [PATCH] driver: input: touchscreen: modify Raydium i2c touchscreen driver
Date:   Thu, 15 Apr 2021 17:14:35 +0800
Message-Id: <20210415091435.1419555-1-simba.hsu@raydium.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This path makes auto-update available when IC's status is
Recovery mode

Signed-off-by: simba.hsu <simba.hsu@raydium.corp-partner.google.com>
Change-Id: Icf974d59f7717da0de8bd97a06c496a32dafa1ff
---
 drivers/input/touchscreen/raydium_i2c_ts.c | 53 ++++++++++++++++++----
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c b/drivers/input/touchscreen/raydium_i2c_ts.c
index 4d2d22a86977..a97403c55f75 100644
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
+		ts->info.hw_ver = cpu_to_le32(tmpdata);
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

