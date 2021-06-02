Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7B8398595
	for <lists+linux-input@lfdr.de>; Wed,  2 Jun 2021 11:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhFBJte (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Jun 2021 05:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232255AbhFBJtc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Jun 2021 05:49:32 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793B9C061756
        for <linux-input@vger.kernel.org>; Wed,  2 Jun 2021 02:47:49 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id u9so751739plr.1
        for <linux-input@vger.kernel.org>; Wed, 02 Jun 2021 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raydium-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ajTOyjYSJ0oov782itPNsymFCO3cX1BrHaaPfNpFmD8=;
        b=CRyB+GLIUpj3XTXjaTvvk3ZHNpUXeO2ivEtqgy083EHSvoUMzyHOBjSjH3SLfGRB/l
         XlyTMFlxovc2DXIeDXJU6UbffP1E2MsK2kioTnPHQL07Ybew6mYifTh3NZEDHLwl0rVX
         QnMb1tfPNOSiJmrWB4MN74LQchgkJro/6EkuJXZ6WQDrgYZcoYU9oCNPDqKbopnNJa8G
         Vro/VTMPOjqXoXztq+rHTvwbj+lQES2Te0jOQTjIc+rNGvit5G8vBIzvxgu7cKx6bs+y
         Wx1Bku7lQplbCwHvbyGV6i8x78BkPZg56nBAPId3Q6WGDukdn5gR6O8I1FFnTcqnbgwH
         xsMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ajTOyjYSJ0oov782itPNsymFCO3cX1BrHaaPfNpFmD8=;
        b=ajzTMtI4zdxlVGKNPBLITcjzUKX28NEEDgoiiPJaahU7f9nmcbWQkmlKVRFIKxYfwF
         QoOLEbNjFvEZI+2606pT3Pi3pNEkDWefUGrvQk6OubbahNvDAdxX13KLb+1riuwwrEia
         9TJXhDTOn9ysRAYAgZ6Oj063+Qr+EiHTS9Q/C9UqQqh4C9XK/srVvjuHy7wIAGMUj39I
         0HHnJmfped1/YL4IPvVPxUFHOk1m634Y91o50i2nDXTNf3Xkxjvg1UZ/2wCuSNhiZB7u
         2NKKgglN2cq/QWqpoTjjMFz1KwZLto4R61HsqU/YWloCUvODQxnRvZIGfnVjECLdcHfo
         FoXg==
X-Gm-Message-State: AOAM532dc7SqSLLv5e0yDzD+t7e4BwUSy5KTFCMyS3ncJceMcupcKMXV
        8F5yFvSgSXJ4nNeUJHYMQ6MDjg==
X-Google-Smtp-Source: ABdhPJw1MxH/7OPjYMlpMjp9fxC4KJ30bjW5bTQ/ADqpaZxq/03VcVA8zH3uYD9eWIlddAgOvAnpNA==
X-Received: by 2002:a17:902:b713:b029:fd:8738:63cb with SMTP id d19-20020a170902b713b02900fd873863cbmr29797671pls.28.1622627269067;
        Wed, 02 Jun 2021 02:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:586:be69:d084:f1e6:e32b:ba45])
        by smtp.gmail.com with ESMTPSA id l9sm15730491pja.20.2021.06.02.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 02:47:48 -0700 (PDT)
From:   "simba.hsu" <simba.hsu@raydium.corp-partner.google.com>
X-Google-Original-From: "simba.hsu" <simba.hsu@rad-ic.com>
To:     dmitry.torokhov@gmail.com, simba.hsu@rad-ic.com,
        furquan@google.com, seanpaul@chromium.org, rrangle@chromium.org,
        gregkh@linuxfoundation.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        KP.li@rad-ic.com, jeffrey.lin@rad-ic.com
Subject: [PATCH] Input: raydium_i2c_ts - read device version in bootloader mode
Date:   Wed,  2 Jun 2021 17:46:21 +0800
Message-Id: <20210602094621.452943-1-simba.hsu@rad-ic.com>
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

