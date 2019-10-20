Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 861E1DE084
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 22:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfJTUol (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 16:44:41 -0400
Received: from 4.mo2.mail-out.ovh.net ([87.98.172.75]:34344 "EHLO
        4.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbfJTUok (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 16:44:40 -0400
X-Greylist: delayed 924 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Oct 2019 16:44:39 EDT
Received: from player798.ha.ovh.net (unknown [10.109.160.217])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id C57C71A6724
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 22:29:29 +0200 (CEST)
Received: from etezian.org (81-175-223-118.bb.dnainternet.fi [81.175.223.118])
        (Authenticated sender: andi@etezian.org)
        by player798.ha.ovh.net (Postfix) with ESMTPSA id 085CAB3A8F01;
        Sun, 20 Oct 2019 20:29:23 +0000 (UTC)
From:   Andi Shyti <andi@etezian.org>
To:     Linux Input <linux-input@vger.kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andi Shyti <andi@etezian.org>
Subject: [PATCH v2 2/2] Input: mms114 - get read of custm i2c read/write functions
Date:   Sun, 20 Oct 2019 23:28:56 +0300
Message-Id: <20191020202856.20287-3-andi@etezian.org>
X-Mailer: git-send-email 2.24.0.rc0
In-Reply-To: <20191020202856.20287-1-andi@etezian.org>
References: <20191020202856.20287-1-andi@etezian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14098800108948275782
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeefgdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 'mms114_read_reg' and 'mms114_write_reg' are used when
reading or writing to the 'MMS114_MODE_CONTROL' register for
updating the 'cache_mode_control' variable.

Update the 'cache_mode_control' variable in the calling
mms114_set_active() function and get rid of all the custom i2c
read/write functions.

With this remove also the redundant sleep of MMS114_I2C_DELAY
(50us) between i2c operations. The waiting should to be handled
by the i2c driver.

Signed-off-by: Andi Shyti <andi@etezian.org>
Tested-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/input/touchscreen/mms114.c | 87 ++++--------------------------
 1 file changed, 10 insertions(+), 77 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 170dcb5312b9..4131fe94e661 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -34,9 +34,6 @@
 #define MMS152_FW_REV			0xE1
 #define MMS152_COMPAT_GROUP		0xF2
 
-/* Minimum delay time is 50us between stop and start signal of i2c */
-#define MMS114_I2C_DELAY		50
-
 /* 200ms needs after power on */
 #define MMS114_POWERON_DELAY		200
 
@@ -80,76 +77,6 @@ struct mms114_touch {
 	u8 reserved[2];
 } __packed;
 
-static int __mms114_read_reg(struct mms114_data *data, unsigned int reg,
-			     unsigned int len, u8 *val)
-{
-	struct i2c_client *client = data->client;
-	struct i2c_msg xfer[2];
-	u8 buf = reg & 0xff;
-	int error;
-
-	if (reg <= MMS114_MODE_CONTROL && reg + len > MMS114_MODE_CONTROL)
-		BUG();
-
-	/* Write register: use repeated start */
-	xfer[0].addr = client->addr;
-	xfer[0].flags = I2C_M_TEN | I2C_M_NOSTART;
-	xfer[0].len = 1;
-	xfer[0].buf = &buf;
-
-	/* Read data */
-	xfer[1].addr = client->addr;
-	xfer[1].flags = I2C_M_RD;
-	xfer[1].len = len;
-	xfer[1].buf = val;
-
-	error = i2c_transfer(client->adapter, xfer, 2);
-	if (error != 2) {
-		dev_err(&client->dev,
-			"%s: i2c transfer failed (%d)\n", __func__, error);
-		return error < 0 ? error : -EIO;
-	}
-	udelay(MMS114_I2C_DELAY);
-
-	return 0;
-}
-
-static int mms114_read_reg(struct mms114_data *data, unsigned int reg)
-{
-	u8 val;
-	int error;
-
-	if (reg == MMS114_MODE_CONTROL)
-		return data->cache_mode_control;
-
-	error = __mms114_read_reg(data, reg, 1, &val);
-	return error < 0 ? error : val;
-}
-
-static int mms114_write_reg(struct mms114_data *data, unsigned int reg,
-			    unsigned int val)
-{
-	struct i2c_client *client = data->client;
-	u8 buf[2];
-	int error;
-
-	buf[0] = reg & 0xff;
-	buf[1] = val & 0xff;
-
-	error = i2c_master_send(client, buf, 2);
-	if (error != 2) {
-		dev_err(&client->dev,
-			"%s: i2c send failed (%d)\n", __func__, error);
-		return error < 0 ? error : -EIO;
-	}
-	udelay(MMS114_I2C_DELAY);
-
-	if (reg == MMS114_MODE_CONTROL)
-		data->cache_mode_control = val;
-
-	return 0;
-}
-
 static void mms114_process_mt(struct mms114_data *data, struct mms114_touch *touch)
 {
 	struct i2c_client *client = data->client;
@@ -228,19 +155,25 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
 
 static int mms114_set_active(struct mms114_data *data, bool active)
 {
-	int val;
+	int val, err;
 
-	val = mms114_read_reg(data, MMS114_MODE_CONTROL);
+	val = i2c_smbus_read_byte_data(data->client, MMS114_MODE_CONTROL);
 	if (val < 0)
 		return val;
 
-	val &= ~MMS114_OPERATION_MODE_MASK;
+	val = data->cache_mode_control &= ~MMS114_OPERATION_MODE_MASK;
 
 	/* If active is false, sleep mode */
 	if (active)
 		val |= MMS114_ACTIVE;
 
-	return mms114_write_reg(data, MMS114_MODE_CONTROL, val);
+	err = i2c_smbus_write_byte_data(data->client, MMS114_MODE_CONTROL, val);
+	if (err < 0)
+		return err;
+
+	data->cache_mode_control = val;
+
+	return 0;
 }
 
 static int mms114_get_version(struct mms114_data *data)
-- 
2.24.0.rc0

