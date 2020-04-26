Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4541B9174
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgDZQLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:11:17 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:45311 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726194AbgDZQLR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:11:17 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CZT60sbz1j1;
        Sun, 26 Apr 2020 18:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917473; bh=bi/H2j6z7/HkBKesn5Ko05oYgKcKrWVbyESP8N26AxY=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=A7VNXdQm/ARuZzl9Os+h65jVGzGyYrOV8Hbi6mEDKLqzXMFz3hCL/UFJiAJc6SZ0E
         NuxO1/Jo+xBtfTfAGGT5OgNhjL//SiAv/wRUxmyi6o40HV0RgxfO44Uu11T7theoFX
         N1cwK7muRx6g5s9BvfUdZWmRtOUVY1z7nBkhH8Y5MYa03cB4Sl5Icht8RomULrk6oB
         62I+hvUwgb8oUFnHC2RVRxo6CgB5UEiEK3y4LSJhLJ4w4mFNNbDYH9Nh966sAbjjMV
         vem2c+bRmrtG7+9/ZuXITgyVeLEIyj89a3Uj+pNbNtYvRX12kk/9JOjnD/f4tBpPfM
         rmO1VQ4qlYDTw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:11:13 +0200
Message-Id: <4e5bf76e695388d6aeefa00552675c0617c044f1.1587916846.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v4 05/10] input: elants: refactor elants_i2c_execute_command()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     David Heidelberg <david@ixit.cz>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
polling and error printk()s into a single function.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
v4: return 0 on success; use %pe for error code
---
 drivers/input/touchscreen/elants_i2c.c | 189 +++++++++++++------------
 1 file changed, 96 insertions(+), 93 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index c08a7971cd32..71ffbc565d8e 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -205,7 +205,8 @@ static int elants_i2c_read(struct i2c_client *client, void *data, size_t size)
 
 static int elants_i2c_execute_command(struct i2c_client *client,
 				      const u8 *cmd, size_t cmd_size,
-				      u8 *resp, size_t resp_size)
+				      u8 *resp, size_t resp_size,
+				      int retries, const char *cmd_name)
 {
 	struct i2c_msg msgs[2];
 	int ret;
@@ -225,30 +226,55 @@ static int elants_i2c_execute_command(struct i2c_client *client,
 		break;
 
 	default:
-		dev_err(&client->dev, "%s: invalid command %*ph\n",
-			__func__, (int)cmd_size, cmd);
+		dev_err(&client->dev, "(%s): invalid command: %*ph\n",
+			cmd_name, (int)cmd_size, cmd);
 		return -EINVAL;
 	}
 
-	msgs[0].addr = client->addr;
-	msgs[0].flags = client->flags & I2C_M_TEN;
-	msgs[0].len = cmd_size;
-	msgs[0].buf = (u8 *)cmd;
+	for (;;) {
+		msgs[0].addr = client->addr;
+		msgs[0].flags = client->flags & I2C_M_TEN;
+		msgs[0].len = cmd_size;
+		msgs[0].buf = (u8 *)cmd;
 
-	msgs[1].addr = client->addr;
-	msgs[1].flags = client->flags & I2C_M_TEN;
-	msgs[1].flags |= I2C_M_RD;
-	msgs[1].len = resp_size;
-	msgs[1].buf = resp;
+		msgs[1].addr = client->addr;
+		msgs[1].flags = client->flags & I2C_M_TEN;
+		msgs[1].flags |= I2C_M_RD;
+		msgs[1].len = resp_size;
+		msgs[1].buf = resp;
 
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret < 0)
-		return ret;
+		ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+		if (ret < 0) {
+			if (--retries > 0) {
+				dev_dbg(&client->dev,
+					"(%s) I2C transfer failed: %pe (retrying)\n",
+					cmd_name, ERR_PTR(ret));
+				continue;
+			}
 
-	if (ret != ARRAY_SIZE(msgs) || resp[FW_HDR_TYPE] != expected_response)
-		return -EIO;
+			dev_err(&client->dev,
+				"(%s) I2C transfer failed: %pe\n",
+				cmd_name, ERR_PTR(ret));
+			return ret;
+		}
 
-	return 0;
+		if (ret != ARRAY_SIZE(msgs) ||
+		    resp[FW_HDR_TYPE] != expected_response) {
+			if (--retries > 0) {
+				dev_dbg(&client->dev,
+					"(%s) unexpected response: %*ph (retrying)\n",
+					cmd_name, ret, resp);
+				continue;
+			}
+
+			dev_err(&client->dev,
+				"(%s) unexpected response: %*ph\n",
+				cmd_name, ret, resp);
+			return -EIO;
+		}
+
+		return 0;
+	}
 }
 
 static int elants_i2c_calibrate(struct elants_data *ts)
@@ -321,27 +347,21 @@ static u16 elants_i2c_parse_version(u8 *buf)
 static int elants_i2c_query_hw_version(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
-	int error, retry_cnt;
+	int retry_cnt = MAX_RETRIES;
 	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_FW_ID, 0x00, 0x01 };
 	u8 resp[HEADER_SIZE];
+	int err;
 
-	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
-		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-						   resp, sizeof(resp));
-		if (!error) {
-			ts->hw_version = elants_i2c_parse_version(resp);
-			if (ts->hw_version != 0xffff)
-				return 0;
-		}
+	while (retry_cnt--) {
+		err = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+						 resp, sizeof(resp), 1,
+						 "read fw id");
+		if (err < 0)
+			return err;
 
-		dev_dbg(&client->dev, "read fw id error=%d, buf=%*phC\n",
-			error, (int)sizeof(resp), resp);
-	}
-
-	if (error) {
-		dev_err(&client->dev,
-			"Failed to read fw id: %d\n", error);
-		return error;
+		ts->hw_version = elants_i2c_parse_version(resp);
+		if (ts->hw_version != 0xffff)
+			return 0;
 	}
 
 	dev_err(&client->dev, "Invalid fw id: %#04x\n", ts->hw_version);
@@ -352,26 +372,27 @@ static int elants_i2c_query_hw_version(struct elants_data *ts)
 static int elants_i2c_query_fw_version(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
-	int error, retry_cnt;
+	int retry_cnt = MAX_RETRIES;
 	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_FW_VER, 0x00, 0x01 };
 	u8 resp[HEADER_SIZE];
+	int err;
 
-	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
-		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-						   resp, sizeof(resp));
-		if (!error) {
-			ts->fw_version = elants_i2c_parse_version(resp);
-			if (ts->fw_version != 0x0000 &&
-			    ts->fw_version != 0xffff)
-				return 0;
-		}
+	while (retry_cnt--) {
+		err = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+						 resp, sizeof(resp), 1,
+						 "read fw version");
+		if (err < 0)
+			return err;
 
-		dev_dbg(&client->dev, "read fw version error=%d, buf=%*phC\n",
-			error, (int)sizeof(resp), resp);
+		ts->fw_version = elants_i2c_parse_version(resp);
+		if (ts->fw_version != 0x0000 && ts->fw_version != 0xffff)
+			return 0;
+
+		dev_dbg(&client->dev, "(read fw version) resp %*phC\n",
+			(int)sizeof(resp), resp);
 	}
 
-	dev_err(&client->dev,
-		"Failed to read fw version or fw version is invalid\n");
+	dev_err(&client->dev, "Invalid fw ver: %#04x\n", ts->fw_version);
 
 	return -EINVAL;
 }
@@ -379,25 +400,20 @@ static int elants_i2c_query_fw_version(struct elants_data *ts)
 static int elants_i2c_query_test_version(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
-	int error, retry_cnt;
+	int error;
 	u16 version;
 	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_TEST_VER, 0x00, 0x01 };
 	u8 resp[HEADER_SIZE];
 
-	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
-		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-						   resp, sizeof(resp));
-		if (!error) {
-			version = elants_i2c_parse_version(resp);
-			ts->test_version = version >> 8;
-			ts->solution_version = version & 0xff;
+	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+					   resp, sizeof(resp), MAX_RETRIES,
+					   "read test version");
+	if (!error) {
+		version = elants_i2c_parse_version(resp);
+		ts->test_version = version >> 8;
+		ts->solution_version = version & 0xff;
 
-			return 0;
-		}
-
-		dev_dbg(&client->dev,
-			"read test version error rc=%d, buf=%*phC\n",
-			error, (int)sizeof(resp), resp);
+		return 0;
 	}
 
 	dev_err(&client->dev, "Failed to read test version\n");
@@ -414,13 +430,10 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
 	int error;
 
 	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-					   resp, sizeof(resp));
-	if (error) {
-		dev_err(&client->dev,
-			"read BC version error=%d, buf=%*phC\n",
-			error, (int)sizeof(resp), resp);
+					   resp, sizeof(resp), 1,
+					   "read BC version");
+	if (error)
 		return error;
-	}
 
 	version = elants_i2c_parse_version(resp);
 	ts->bc_version = version >> 8;
@@ -452,12 +465,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
 	error = elants_i2c_execute_command(client,
 					   get_resolution_cmd,
 					   sizeof(get_resolution_cmd),
-					   resp, sizeof(resp));
-	if (error) {
-		dev_err(&client->dev, "get resolution command failed: %d\n",
-			error);
+					   resp, sizeof(resp), 1,
+					   "get resolution");
+	if (error)
 		return error;
-	}
 
 	rows = resp[2] + resp[6] + resp[10];
 	cols = resp[3] + resp[7] + resp[11];
@@ -465,36 +476,29 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
 	/* Process mm_to_pixel information */
 	error = elants_i2c_execute_command(client,
 					   get_osr_cmd, sizeof(get_osr_cmd),
-					   resp, sizeof(resp));
-	if (error) {
-		dev_err(&client->dev, "get osr command failed: %d\n",
-			error);
+					   resp, sizeof(resp), 1, "get osr");
+	if (error)
 		return error;
-	}
 
 	osr = resp[3];
 
 	error = elants_i2c_execute_command(client,
 					   get_physical_scan_cmd,
 					   sizeof(get_physical_scan_cmd),
-					   resp, sizeof(resp));
-	if (error) {
-		dev_err(&client->dev, "get physical scan command failed: %d\n",
-			error);
+					   resp, sizeof(resp), 1,
+					   "get physical scan");
+	if (error)
 		return error;
-	}
 
 	phy_x = get_unaligned_be16(&resp[2]);
 
 	error = elants_i2c_execute_command(client,
 					   get_physical_drive_cmd,
 					   sizeof(get_physical_drive_cmd),
-					   resp, sizeof(resp));
-	if (error) {
-		dev_err(&client->dev, "get physical drive command failed: %d\n",
-			error);
+					   resp, sizeof(resp), 1,
+					   "get physical drive");
+	if (error)
 		return error;
-	}
 
 	phy_y = get_unaligned_be16(&resp[2]);
 
@@ -649,11 +653,10 @@ static int elants_i2c_validate_remark_id(struct elants_data *ts,
 
 	/* Compare TS Remark ID and FW Remark ID */
 	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-					resp, sizeof(resp));
-	if (error) {
-		dev_err(&client->dev, "failed to query Remark ID: %d\n", error);
+					   resp, sizeof(resp),
+					   1, "read Remark ID");
+	if (error < 0)
 		return error;
-	}
 
 	ts_remark_id = get_unaligned_be16(&resp[3]);
 
-- 
2.20.1

