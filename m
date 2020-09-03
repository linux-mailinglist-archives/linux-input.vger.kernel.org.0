Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECC325C5FC
	for <lists+linux-input@lfdr.de>; Thu,  3 Sep 2020 17:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728566AbgICP7J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Sep 2020 11:59:09 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:32257 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728210AbgICP7I (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Sep 2020 11:59:08 -0400
IronPort-SDR: sQuBkVyHqn/Ig2AcWPmZw4NPMF5YIpMiFd9eh+DCF5gSxavyUk7Ij8sQRm8JabM9oD+n2iPbus
 Va2nNkmWngDJLytdKZonUWsUTAaYSDYmp1YuElkiaAY5ITFB0dy6CESo1aMZl0dS737tUimu4b
 4s5d9CT8U7MLWPkCNMl6nOqBdohDsaBEbi93ADVO0pa5URhbcKaZC8oBSjeTxoCVv87F/kUf/h
 aisqRvz57yMWtHT47KHJY6ZSC1NBL/1F2vyTka8gbWwZXsKa7tolnoWk93As7d2u0nTM+7mOWT
 ypk=
X-IronPort-AV: E=Sophos;i="5.76,387,1592899200"; 
   d="scan'208";a="54733292"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 03 Sep 2020 07:59:07 -0800
IronPort-SDR: tmMqlO4tN+aNPQnDfhjouRSCXhR9zxcoA5+Cd7M7kEk8lv7ZoHl5jjrxtWO8u0ZE9xGAyt5K+I
 bEEk2UzTNOMIzw23ULrJDgjZIKn6pPP2/0pVkbIRqgRzBFBYUlQ5T0JExpSt9X5s6Yv9WlalVz
 /FJa2B9Qyv4++JqDNI/xnxGddm4ybkPr7zhEXxsPenCE0glOo1ipsTAKvnQMf1KYTwu8ViMaQF
 llfotMJLS9BDBmFRe6wU+48deTY3yqeHu+ygbD+MMsDE6Ocp/7Kqer6H4JdsBPjf2x9u/zhj5G
 18I=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Andrew_Gabbasov@mentor.com>, <erosca@de.adit-jv.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH v2 1/1] Input: atmel_mxt_ts - implement I2C retries
Date:   Fri, 4 Sep 2020 00:59:04 +0900
Message-ID: <20200903155904.17454-1-jiada_wang@mentor.com>
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
[jiada: return exact errno when i2c_transfer & i2c_master_send fails]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..5d4cb15d21dc 100644
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
+			return ret < 0 ? ret : -EIO;
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
+	if (ret != count) {
+		if (!retry) {
+			dev_dbg(&client->dev, "%s: i2c retry\n", __func__);
+			msleep(MXT_WAKEUP_TIME);
+			retry = true;
+			goto retry_write;
+		} else {
+			dev_err(&client->dev, "%s: i2c send failed (%d)\n",
+				__func__, ret);
+			ret = ret < 0 ? ret : -EIO;
+		}
 	} else {
-		if (ret >= 0)
-			ret = -EIO;
-		dev_err(&client->dev, "%s: i2c send failed (%d)\n",
-			__func__, ret);
+		ret = 0;
 	}
 
 	kfree(buf);
-- 
2.17.1

