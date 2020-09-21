Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F5F272685
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 16:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbgIUOBG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 10:01:06 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:55479 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbgIUOBE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 10:01:04 -0400
IronPort-SDR: EDEfynIPo8BQ1myc8piFf/FNXmyHV/96Q6PUjZXd8PWDObxSuIOR6Ilg/QsArOnUzJM5jz+yfB
 /yQL7+iOM0pbHQGEkogP2NJn6t0M8UoAx1/2cQ8P64dbxAlvuUvjg/g0SyW53x5owkzk/sQAbN
 ro1HUX08sZHtFxn8ALcax9xOkU8CaVAyECgIv2Rdy+dFtMGNp4yhSkZ+6+F3FRUSZIAUPw8kSU
 KEMBTF0vEJ5/Ehcxhf2iEWZ7fgAmlAARN5iG5MWmVglDHS0nyVyclXyru+5/c2b8LLwUPTojvt
 txM=
X-IronPort-AV: E=Sophos;i="5.77,286,1596528000"; 
   d="scan'208";a="55324404"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 21 Sep 2020 06:01:03 -0800
IronPort-SDR: 6Jv8tg2LZPrFi05WR+y2c1rK/iPtWUT7s8N6/6w5chFfy9GsK9154o9FI7K0CcLJy2BtDn8q9V
 Zz//7YuU+d2qnXUsCFq9mHCHr8ovhfmopTcW9rRmT2uWzkT50VvxFnKMmOjeHU2oAtHxhNNVs1
 9lRJgazpLEt5IsHN37ycYG29/Qaz69fApGtZNnqhzjOr9Dgc39Y4zZygGBl1ST1R5kxNqR5fuc
 KEL/lzxwOdZ6OaJDuicPAid3oLh5nDvaUXKKyWCthzEEHK05NfeXaa+a0lZWEsUVSmSMFm6sk4
 GA8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v1 2/3] Input: atmel_mxt_ts - implement I2C retries for mXT1368
Date:   Mon, 21 Sep 2020 23:00:53 +0900
Message-ID: <20200921140054.2389-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921140054.2389-1-jiada_wang@mentor.com>
References: <20200921140054.2389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to datasheet, mXT1386 chip has a WAKE line, it is used
to wake the chip up from deep sleep mode before communicating with
it via the I2C-compatible interface.

if the WAKE line is connected to a GPIO line, the line must be
asserted 25 ms before the host attempts to communicate with the mXT1386.
If the WAKE line is connected to the SCL pin, the mXT1386 will send a
NACK on the first attempt to address it, the host must then retry 25 ms
later.

This patch adds compatible string "atmel,mXT1386" for mXT1386 controller,
when I2C transfer on mXT1386 fails, retry the transfer once after a 25 ms
sleep.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 44 +++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 98f17fa3a892..96d5f4d64cb0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -198,6 +198,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -627,7 +628,9 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 static int __mxt_read_reg(struct i2c_client *client,
 			       u16 reg, u16 len, void *val)
 {
+	struct device_node *np = client->dev.of_node;
 	struct i2c_msg xfer[2];
+	bool retried = false;
 	u8 buf[2];
 	int ret;
 
@@ -646,22 +649,30 @@ static int __mxt_read_reg(struct i2c_client *client,
 	xfer[1].len = len;
 	xfer[1].buf = val;
 
-	ret = i2c_transfer(client->adapter, xfer, 2);
-	if (ret == 2) {
-		ret = 0;
-	} else {
-		if (ret >= 0)
-			ret = -EIO;
+retry_read:
+	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
+	if (ret != ARRAY_SIZE(xfer)) {
+		if (of_device_is_compatible(np, "atmel,mXT1386") && !retried) {
+			dev_dbg(&client->dev, "i2c retry\n");
+			/* TODO: add WAKE-GPIO support */
+			msleep(MXT_WAKEUP_TIME);
+			retried = true;
+			goto retry_read;
+		}
+		ret = ret < 0 ? ret : -EIO;
 		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
 			__func__, ret);
+		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 			   const void *val)
 {
+	struct device_node *np = client->dev.of_node;
+	bool retried = false;
 	u8 *buf;
 	size_t count;
 	int ret;
@@ -675,14 +686,21 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	buf[1] = (reg >> 8) & 0xff;
 	memcpy(&buf[2], val, len);
 
+retry_write:
 	ret = i2c_master_send(client, buf, count);
-	if (ret == count) {
-		ret = 0;
-	} else {
-		if (ret >= 0)
-			ret = -EIO;
+	if (ret != count) {
+		if (of_device_is_compatible(np, "atmel,mXT1386") && !retried) {
+			dev_dbg(&client->dev, "i2c retry\n");
+			/* TODO: add WAKE-GPIO support */
+			msleep(MXT_WAKEUP_TIME);
+			retried = true;
+			goto retry_write;
+		}
+		ret = ret < 0 ? ret : -EIO;
 		dev_err(&client->dev, "%s: i2c send failed (%d)\n",
 			__func__, ret);
+	} else {
+		ret = 0;
 	}
 
 	kfree(buf);
@@ -3235,6 +3253,7 @@ static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
 
 static const struct of_device_id mxt_of_match[] = {
 	{ .compatible = "atmel,maxtouch", },
+	{ .compatible = "atmel,mXT1386", },
 	/* Compatibles listed below are deprecated */
 	{ .compatible = "atmel,qt602240_ts", },
 	{ .compatible = "atmel,atmel_mxt_ts", },
@@ -3259,6 +3278,7 @@ static const struct i2c_device_id mxt_id[] = {
 	{ "atmel_mxt_tp", 0 },
 	{ "maxtouch", 0 },
 	{ "mXT224", 0 },
+	{ "mXT1386", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mxt_id);
-- 
2.17.1

