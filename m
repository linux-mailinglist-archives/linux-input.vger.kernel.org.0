Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C5D24D07A
	for <lists+linux-input@lfdr.de>; Fri, 21 Aug 2020 10:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726433AbgHUIXB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Aug 2020 04:23:01 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:39326 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgHUIXA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Aug 2020 04:23:00 -0400
IronPort-SDR: Sy5QkxelKPra9kgqZ6XyrSLWNWtERVhivdWM6P4neqKCf8S2SRGamuHainYqf1ULdFYLCidyue
 QJqrl4IC+9PDqn43v9azRtH2BwBstXqHryHvT81zoqNcD1ELPIlWhnrn9+8RgTf41cdSAoeUDU
 UdH5YiO9oWpoUl4L8319jzPwfigSIaAamLSysZdy/l/Y4mRGzqNYbCf0g6V8twMjoIpR56nZZG
 02E5xwBmvj16kmWcIk67BC42X4nFgZp5sonF9q23xWivurxKuqdml5XwjhpVMN79wOPz5vzAsr
 X84=
X-IronPort-AV: E=Sophos;i="5.76,335,1592899200"; 
   d="scan'208";a="52116004"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 21 Aug 2020 00:22:59 -0800
IronPort-SDR: mOYjkXWjHE3zR6aa97XmiX6DyhHEDhZ0360Yp/5HdCctKOsktkOSLw+c7FiUhmJwF2rHrOt8wL
 UWz6yJX11cUgvVZVkCaHcpeIsu12SVN85bXB5eGRSJvKR9pnxc9U4ZvQL4IO55C+08/kmAUvqb
 kWHi19Muxp7nGJAekQ2YrtFVVH2tx7YKlEaWY9Xb1Unk3bsfdcepw4ifgrJxE82ENd0eTV6WUX
 841K3nfXNVd9zDEFyttQ6i5nLIyFyV3bDSWcc3hVQZqWdA+PlYzFSEA1vRYPBGr1XPqHRT8pn9
 GKY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH 1/1] Input: atmel_mxt_ts - implement I2C retries
Date:   Fri, 21 Aug 2020 17:22:54 +0900
Message-ID: <20200821082254.16661-1-jiada_wang@mentor.com>
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
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 63fd7a2cd03c3a572a5db39c52f4856819e1835d)
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..e93eda1f3d59 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -196,6 +196,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -626,6 +627,7 @@ static int __mxt_read_reg(struct i2c_client *client,
 	struct i2c_msg xfer[2];
 	u8 buf[2];
 	int ret;
+	bool retry = false;
 
 	buf[0] = reg & 0xff;
 	buf[1] = (reg >> 8) & 0xff;
@@ -642,17 +644,22 @@ static int __mxt_read_reg(struct i2c_client *client,
 	xfer[1].len = len;
 	xfer[1].buf = val;
 
-	ret = i2c_transfer(client->adapter, xfer, 2);
-	if (ret == 2) {
-		ret = 0;
-	} else {
-		if (ret >= 0)
-			ret = -EIO;
-		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
-			__func__, ret);
+retry_read:
+	ret = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
+	if (ret != ARRAY_SIZE(xfer)) {
+		if (!retry) {
+			dev_dbg(&client->dev, "%s: i2c retry\n", __func__);
+			msleep(MXT_WAKEUP_TIME);
+			retry = true;
+			goto retry_read;
+		} else {
+			dev_err(&client->dev, "%s: i2c transfer failed (%d)\n",
+				__func__, ret);
+			return -EIO;
+		}
 	}
 
-	return ret;
+	return 0;
 }
 
 static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
@@ -661,6 +668,7 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	u8 *buf;
 	size_t count;
 	int ret;
+	bool retry = false;
 
 	count = len + 2;
 	buf = kmalloc(count, GFP_KERNEL);
@@ -671,14 +679,21 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	buf[1] = (reg >> 8) & 0xff;
 	memcpy(&buf[2], val, len);
 
+retry_write:
 	ret = i2c_master_send(client, buf, count);
-	if (ret == count) {
-		ret = 0;
-	} else {
-		if (ret >= 0)
+	if (ret != count) {
+		if (!retry) {
+			dev_dbg(&client->dev, "%s: i2c retry\n", __func__);
+			msleep(MXT_WAKEUP_TIME);
+			retry = true;
+			goto retry_write;
+		} else {
+			dev_err(&client->dev, "%s: i2c send failed (%d)\n",
+				__func__, ret);
 			ret = -EIO;
-		dev_err(&client->dev, "%s: i2c send failed (%d)\n",
-			__func__, ret);
+		}
+	} else {
+		ret = 0;
 	}
 
 	kfree(buf);
-- 
2.17.1

