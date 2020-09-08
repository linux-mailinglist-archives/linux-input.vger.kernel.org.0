Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3B4261F8A
	for <lists+linux-input@lfdr.de>; Tue,  8 Sep 2020 22:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730403AbgIHUEn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 16:04:43 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:33732 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730394AbgIHPXq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Sep 2020 11:23:46 -0400
IronPort-SDR: A73xvdNyxsY1l7xwjxJRzrRhOuzXupkcYc7ZnS9I/MNbCnhE9r2NMD/gVfWfXdzVty37py88yS
 NsXtFfY/Muyg63BxZjpYbBXfRFG04MmYT57C+RXVz3+GCiQompLecUbPTf3XMslGO9QxZutYcm
 up9zpP34cHyNIjuEQb4bmnArGmKRsAqVQJeEEjoI6qmG7OD/+5r+/46QfuanAknkowz+r4WEmX
 IZEhD2jPoyRil9+uKahwsYvK6FCYApCTsqvO7emc+uIJe8z/xQdKmOenGmv46BKG+QbiRE3Vrk
 YjI=
X-IronPort-AV: E=Sophos;i="5.76,406,1592899200"; 
   d="scan'208";a="54874117"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 08 Sep 2020 07:16:21 -0800
IronPort-SDR: znhbrejcoFm31kQaQGxCn2w+iduSV/IKA2TT4r1XS0EBSjw2Pr5fv1wQumrikkaJ1hSuarFb4s
 GV3qBM/i3FpkYx6cmzVbLKW8qjXfCZ8k6zSdKu0b+ABC5WveJ1o2d4k8gvxQ8QXOtB/wbotcBs
 TW68eAoAHaXsXVvjJ5x/aQYwqluOE83Bsgh0GFK6EXUY8UrxELnM5osWO7dmkESPBhEN7a/eXg
 uKiZ33eIxolrJL0wGX6LZatW/wPKcNJABrnVbCSAQZ3EMQr24R8ZRk+x0sKCoQbgj/DHNUh1oV
 Hsk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <Andrew_Gabbasov@mentor.com>, <erosca@de.adit-jv.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH v3 1/1] Input: atmel_mxt_ts - implement I2C retries
Date:   Wed, 9 Sep 2020 00:16:17 +0900
Message-ID: <20200908151617.12199-1-jiada_wang@mentor.com>
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
[jiada: return exact errno when i2c_transfer & i2c_master_send fails,
	add "_MS" suffix MXT_WAKEUP_TIME]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 45 ++++++++++++++++--------
 1 file changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..145780f78122 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -196,6 +196,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME_MS	25	/* msec */
 
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
+			msleep(MXT_WAKEUP_TIME_MS);
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
+			msleep(MXT_WAKEUP_TIME_MS);
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

