Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE98B278A04
	for <lists+linux-input@lfdr.de>; Fri, 25 Sep 2020 15:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728626AbgIYNxM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 09:53:12 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:49986 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727290AbgIYNxM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 09:53:12 -0400
IronPort-SDR: iAzkCJzMTcI9E0fs6GhSIxPGQLonpHzM1U8H+Y5FMpgxthP1ZwFlUGfrCjDbw47cTBBBjz8QBp
 sLtgSxM/8rTyWbhNERbCN+rwpvb/Yp12/IXyS/2BCrJPOzeTUdQsZH/MCwDOb3GXOvmJ6J/hEC
 LFkG2mRwrGv/qmLGHDGAAit14SFBJhbhLXf6Z1IPeGS5AZcLrOVEvJ5qNV02fXcEsnjC6N2ys8
 L7u5bXkGtdrZM6ZgHaBnCZF08uQyzRSWOTk5XIXbNZJM5sn1WPccZmNkV9QK9xWtdkJhUQ90eV
 W1w=
X-IronPort-AV: E=Sophos;i="5.77,302,1596528000"; 
   d="scan'208";a="53408340"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Sep 2020 05:53:10 -0800
IronPort-SDR: CxphhHm+71ZRotVeGsf4ubntlGQ9BVAlJrCDZLKYHEE/+HM4N3wQOWstvGbztcSvx1wrRsguIR
 QxAul4G51p8MZlVt4JD/mTPlHi2phy9BvG+wu5WChD/7TaAO769sijk6RBsLW/AhGucCtBWabu
 1OT5RiONk1/TOZz/eDN7e9YZk6FKuWms3rYkfUQAU/fznN26ETToZVCHuP2Lew0sZ7C4dLDbse
 3pG11e13lDZLjXfgns5vipq7biVUjusMREE79ZvEnoR6kiuNIUhXt+2k7pvy3swqqDo0EPkrAU
 YRI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <digetx@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <nick@shmanahar.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <andrew_gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v2 2/3] Input: atmel_mxt_ts - implement I2C retries for mXT1368
Date:   Fri, 25 Sep 2020 22:52:56 +0900
Message-ID: <20200925135257.21138-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200925135257.21138-1-jiada_wang@mentor.com>
References: <20200925135257.21138-1-jiada_wang@mentor.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 62 +++++++++++++++++++-----
 1 file changed, 50 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 98f17fa3a892..c00743caed27 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -198,6 +198,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -340,6 +341,9 @@ struct mxt_data {
 	unsigned int t19_num_keys;
 
 	enum mxt_suspend_mode suspend_mode;
+
+	/* Indicates whether retry is needed when i2c transfer fails */
+	bool retry_i2c_transfers;
 };
 
 struct mxt_vb2_buffer {
@@ -627,7 +631,9 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 static int __mxt_read_reg(struct i2c_client *client,
 			       u16 reg, u16 len, void *val)
 {
+	struct mxt_data *data = i2c_get_clientdata(client);
 	struct i2c_msg xfer[2];
+	bool retried = false;
 	u8 buf[2];
 	int ret;
 
@@ -646,22 +652,30 @@ static int __mxt_read_reg(struct i2c_client *client,
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
+		if (data->retry_i2c_transfers && !retried) {
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
+	struct mxt_data *data = i2c_get_clientdata(client);
+	bool retried = false;
 	u8 *buf;
 	size_t count;
 	int ret;
@@ -675,14 +689,21 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
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
+		if (data->retry_i2c_transfers && !retried) {
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
@@ -3084,6 +3105,7 @@ static const struct dmi_system_id chromebook_T9_suspend_dmi[] = {
 
 static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
+	struct device_node *np = client->dev.of_node;
 	struct mxt_data *data;
 	int error;
 
@@ -3158,6 +3180,20 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
+	/*
+	 * The mXT1386 has a dedicated WAKE-line that could be connected to a
+	 * dedicated GPIO, or to the I2C SCL pin, or permanently asserted LOW.
+	 * It's used for waking controller from a deep-sleep and it needs to be
+	 * asserted LOW for 25 milliseconds before issuing I2C transfer if controller
+	 * was in a deep-sleep mode. If WAKE-line is connected to I2C SCL pin, then
+	 * the first I2C transfer will get an instant NAK and transfer needs to be
+	 * retried after 25ms. There are too many places in the code where the wake-up
+	 * needs to be inserted, hence it's much easier to add a retry to the common
+	 * I2C accessors, also given that the WAKE-GPIO is unsupported by the driver.
+	 */
+	if (of_device_is_compatible(np, "atmel,mXT1386"))
+		data->retry_i2c_transfers = true;
+
 	error = mxt_initialize(data);
 	if (error)
 		return error;
@@ -3235,6 +3271,7 @@ static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
 
 static const struct of_device_id mxt_of_match[] = {
 	{ .compatible = "atmel,maxtouch", },
+	{ .compatible = "atmel,mXT1386", },
 	/* Compatibles listed below are deprecated */
 	{ .compatible = "atmel,qt602240_ts", },
 	{ .compatible = "atmel,atmel_mxt_ts", },
@@ -3259,6 +3296,7 @@ static const struct i2c_device_id mxt_id[] = {
 	{ "atmel_mxt_tp", 0 },
 	{ "maxtouch", 0 },
 	{ "mXT224", 0 },
+	{ "mXT1386", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mxt_id);
-- 
2.17.1

