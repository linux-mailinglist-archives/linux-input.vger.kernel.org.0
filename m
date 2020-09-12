Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3682676FF
	for <lists+linux-input@lfdr.de>; Sat, 12 Sep 2020 03:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILBCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Sep 2020 21:02:43 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:59507 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgILBCm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Sep 2020 21:02:42 -0400
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Sep 2020 21:02:41 EDT
IronPort-SDR: EfE4iC2+4LL0/B/o46YkugYCqq4P9Aiy+NH1MSArpXsRfj0+A6cgkzW+LP9SsIvVn8thcB0mVn
 V3O4uuu7finBoaRxU2Oe1XSJ5JATtKUUnK6nbQwD/R5x0ugtq80k83R+11q+rA+/qKzVUAMztT
 MaL3BuXZFNtHJOip0ltG5V3lCDHrx5M7P7q/pNbQ9H+Evymq9A5Tyodo0j58G2lzQ+J1C4F9sl
 LDhTU78heQ0YCVfYlWy4/6UHvOc422JfvcVz/KYeUqpOsFufiOV27pKSJPla6I+gKp0g3n0FHC
 7/8=
X-IronPort-AV: E=Sophos;i="5.76,418,1592899200"; 
   d="scan'208";a="52850486"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 11 Sep 2020 16:55:26 -0800
IronPort-SDR: zhk17P7uRb4t8+9rp61vPQuDeQ4c3kiOn7MRQ8sHjY/F0fOlTP7vsX0dTqLF6S+J4inoOsr/wX
 UvKKZmtrkl7dmQPy0twpcyv5wKju2KfcwMB1Fj23il6sY8qgA05rJJNMhrTdmsyXb4YrgFoiwQ
 9R4Cc3gk4IwNhOrA9QCQzH3OH0+o6ueZoi+2CEwAL2jhIPNJAyrlZrTTnvB26olB1NqTFJKxLE
 3eB35hrCWv4XQYDRhTfm2fb17C7Os7ZrfvARqs6o901OSD9+f45xO69w57o+75e/XGysP9qNSN
 9SM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <digetx@gmail.com>, <andy.shevchenko@gmail.com>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
Date:   Sat, 12 Sep 2020 09:55:21 +0900
Message-ID: <20200912005521.26319-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
when they are in a sleep state. It must be retried after a delay for the
chip to wake up.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: return exact errno when i2c_transfer & i2c_master_send fails
	rename "retry" to "retried" and keep its order in length
	set "ret" to correct errno before calling dev_err()
	remove reduntant conditional]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 38 ++++++++++++++++--------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..bad3ac58503d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -196,6 +196,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -624,6 +625,7 @@ static int __mxt_read_reg(struct i2c_client *client,
 			       u16 reg, u16 len, void *val)
 {
 	struct i2c_msg xfer[2];
+	bool retried = false;
 	u8 buf[2];
 	int ret;
 
@@ -642,22 +644,28 @@ static int __mxt_read_reg(struct i2c_client *client,
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
+		if (!retried) {
+			dev_dbg(&client->dev, "i2c retry\n");
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
+	bool retried = false;
 	u8 *buf;
 	size_t count;
 	int ret;
@@ -671,14 +679,20 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
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
+		if (!retried) {
+			dev_dbg(&client->dev, "i2c retry\n");
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
-- 
2.17.1

