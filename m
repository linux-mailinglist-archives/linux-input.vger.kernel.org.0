Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 143181067E4
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfKVIZn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:43 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52499 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727515AbfKVIZl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:41 -0500
IronPort-SDR: Ztu03b7eP7vCIqt5amD4wZiLZiWdWl+Uhfj/3rJFSNTYgOlX7ybVJoIsh51gSdJVP9ZMnUFkJj
 d+41wgxGlgHRVp9O3pG04PPn/sXOxd5JC21DzipxI+H8A0Ut4zQkHcny/nDr4VxX/pR5M1GTa7
 3O+0HUK5YO5WJd6SsWeBBxPoYdyYo9uEAdhWs85dwKK1hGuRGoRX36PV0/1gHcDqTMIj1WsPCv
 GJbna5LGAKA4rc60ae1QaZfWR4pvksTZe2a6hNXc9D8TGSKg/ldl9NXJvdL53SA8OzHtRRHDFD
 TtU=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358940"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:40 -0800
IronPort-SDR: BGu81x4CW27EWPaPmm6sWFIgNopjnVu9qcHkh1zEtmvnhwMHKtCviyIDAaXYxBkoyUtgiCEJtd
 RlatjYoju4xdeZWuNCjj4dq+DEJhIZ+WwIlX3xsEmLZyLt8xZT7nPxKlo5/1/f9408VKLOjSe8
 KSD0nsClsQoDueZynZztQG3xwSN6umpak/g7sKuqs9dGu1BNITa3SD40BCFQywQxY7jSRsNkvO
 O2MOtJXOQeOFE9us14E+IErboFHDK9LWtYLCKXQ8wF1W/h1f5bULRxBUuLk44LemgqC50zE72V
 8n0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 26/48] Input: atmel_mxt_ts - implement I2C retries
Date:   Fri, 22 Nov 2019 17:23:40 +0900
Message-ID: <20191122082402.18173-27-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index f5d67e43a786..fc2f804e5293 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -216,6 +216,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 #define MXT_REGULATOR_DELAY	150	/* msec */
 #define MXT_CHG_DELAY	        100	/* msec */
 #define MXT_POWERON_DELAY	150	/* msec */
@@ -723,6 +724,7 @@ static int __mxt_read_chunk(struct i2c_client *client,
 	struct i2c_msg xfer[2];
 	u8 buf[2];
 	int ret;
+	bool retry = false;
 
 	buf[0] = reg & 0xff;
 	buf[1] = (reg >> 8) & 0xff;
@@ -739,17 +741,22 @@ static int __mxt_read_chunk(struct i2c_client *client,
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
 
 static int __mxt_read_reg(struct i2c_client *client,
@@ -780,6 +787,7 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	u8 *buf;
 	size_t count;
 	int ret;
+	bool retry = false;
 
 	count = len + 2;
 	buf = kmalloc(count, GFP_KERNEL);
@@ -790,14 +798,21 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
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

