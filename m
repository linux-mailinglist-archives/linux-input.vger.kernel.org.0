Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D911A6702
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729929AbgDMNcb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:32:31 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:24403 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729908AbgDMNc3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:29 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918gF3WQyz11B;
        Mon, 13 Apr 2020 15:32:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784745; bh=efH5VtUZJ2E8kUzuZHmUlkvg0p//dIUMqAULmMuUIjM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kDg6lIgkTjMYkqfY9530bCb+c5ogHFpFtUDitVW7zu52koqsdL4SOMUG6R2Q1+yZv
         nHz3yEWGk6PlG+OcIQhWgyNoRVW/fPeIWlw7DDlgOYitYfKsOPK2DWlkAGwdlQCTQA
         AXZQwPnIzdNyWxWfTSQf6vJBQz2/o0gioQFUs4LwQHWgKRueUktg6RsixU4IORyPME
         8Vj0ZEVTG0LiuBcvKTeApKjPLT5leOT7m3TDB83L2Hbr+jgbmR3saHnOg9shBdHRsE
         0d18yafpOS520J24hBKjgGU9SK2BKzvIOPBHyql+BngBan/kAt8diRmDW08CEfncTF
         2HhYA8xHVtj4A==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:24 +0200
Message-Id: <934e4ed8808de930f7380ce50cb3063c4039514e.1586784389.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 5/9] input: elants: refactor elants_i2c_execute_command()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Apply some DRY-ing to elants_i2c_execute_command() callers.  This pulls
polling and error printk()s into a single function.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 189 +++++++++++++------------
 1 file changed, 96 insertions(+), 93 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 87d686ce08f2..b0f083f7f2a9 100644
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
+					"(%s) I2C transfer failed: %d (retrying)\n",
+					cmd_name, ret);
+				continue;
+			}
 
-	if (ret != ARRAY_SIZE(msgs) || resp[FW_HDR_TYPE] != expected_response)
-		return -EIO;
+			dev_err(&client->dev,
+				"(%s) I2C transfer failed: %d\n",
+				cmd_name, ret);
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
+		return --retries;
+	}
 }
 
 static int elants_i2c_calibrate(struct elants_data *ts)
@@ -321,27 +347,20 @@ static u16 elants_i2c_parse_version(u8 *buf)
 static int elants_i2c_query_hw_version(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
-	int error, retry_cnt;
+	int retry_cnt = MAX_RETRIES;
 	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_FW_ID, 0x00, 0x01 };
 	u8 resp[HEADER_SIZE];
 
-	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
-		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-						   resp, sizeof(resp));
-		if (!error) {
-			ts->hw_version = elants_i2c_parse_version(resp);
-			if (ts->hw_version != 0xffff)
-				return 0;
-		}
+	while (retry_cnt) {
+		retry_cnt = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+						       resp, sizeof(resp),
+						       retry_cnt, "read fw id");
+		if (retry_cnt < 0)
+			return retry_cnt;
 
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
@@ -352,26 +371,28 @@ static int elants_i2c_query_hw_version(struct elants_data *ts)
 static int elants_i2c_query_fw_version(struct elants_data *ts)
 {
 	struct i2c_client *client = ts->client;
-	int error, retry_cnt;
+	int retry_cnt = MAX_RETRIES;
 	const u8 cmd[] = { CMD_HEADER_READ, E_ELAN_INFO_FW_VER, 0x00, 0x01 };
 	u8 resp[HEADER_SIZE];
 
-	for (retry_cnt = 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
-		error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
-						   resp, sizeof(resp));
-		if (!error) {
-			ts->fw_version = elants_i2c_parse_version(resp);
-			if (ts->fw_version != 0x0000 &&
-			    ts->fw_version != 0xffff)
-				return 0;
-		}
+	while (retry_cnt) {
+		retry_cnt = elants_i2c_execute_command(client, cmd,
+						       sizeof(cmd),
+						       resp, sizeof(resp),
+						       retry_cnt,
+						       "read fw version");
+		if (retry_cnt < 0)
+			return retry_cnt;
 
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
+	if (error >= 0) {
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

