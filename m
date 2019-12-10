Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B37B1117C4A
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 01:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfLJATW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:19:22 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:7755 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727306AbfLJATW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 19:19:22 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X0wt0mZBzTs;
        Tue, 10 Dec 2019 01:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575937006; bh=C0pMDA+0XkJSsZoVADDmL5DdgomEhABsfYUNpNzl0GI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=QSGxiLA+L7k8nQ+sURzqVSWRNNL3l9iuW0/cVQ7fondMLfXVkdEZOzic2areW/Dul
         FAsaEcWhTDymVAuO4kdlTI6WzIcZAiRkngf739FZBdZwj2inopIhHLTe9qDipZDmc6
         Y5+lUWQZ+ZN/TEUGiaRA50uGs6FEr4lB4y0tKSnAjpzrMpiU9+0vsrMd9bNyaafnCm
         GtpSdcze4su3+ldwa3C0qip2by4UctdXeGial4Qq7NulxTjrvufA5Q1t7FZYG4RoUB
         RiCRunEDlQxjzEAepJ+NlKori0MURfXwU6DBZnnBUMVRD/k4VGTanjt00cB+/2i3Xx
         zj9kf+YpoDNDA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 01:19:18 +0100
Message-Id: <d0901ff04ddfe2f0c5d531db68dd493187a16d81.1575936961.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 5/6] input: elants: refactor elants_i2c_execute_command()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Apply some DRY-ing to elants_i2c_execute_command() callers.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 182 +++++++++++++------------
 1 file changed, 93 insertions(+), 89 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 2e6c9aa60496..27aca3971da5 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -201,7 +201,8 @@ static int elants_i2c_read(struct i2c_client *client, void *data, size_t size)
 
 static int elants_i2c_execute_command(struct i2c_client *client,
 				      const u8 *cmd, size_t cmd_size,
-				      u8 *resp, size_t resp_size)
+				      u8 *resp, size_t resp_size,
+				      int retries, const char *cmd_name)
 {
 	struct i2c_msg msgs[2];
 	int ret;
@@ -217,30 +218,55 @@ static int elants_i2c_execute_command(struct i2c_client *client,
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
@@ -313,27 +339,20 @@ static u16 elants_i2c_parse_version(u8 *buf)
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
@@ -344,26 +363,28 @@ static int elants_i2c_query_hw_version(struct elants_data *ts)
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
@@ -371,25 +392,20 @@ static int elants_i2c_query_fw_version(struct elants_data *ts)
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
@@ -406,13 +422,10 @@ static int elants_i2c_query_bc_version(struct elants_data *ts)
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
@@ -444,12 +457,10 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
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
@@ -457,36 +468,29 @@ static int elants_i2c_query_ts_info(struct elants_data *ts)
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
 
-- 
2.20.1

