Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE1111CA345
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbgEHF7N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:13 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:45906 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgEHF7L (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:11 -0400
IronPort-SDR: jfPRDni3ID5y+fB4XIX5JpaTu5nP9IcU1Tzn6Nl8Z1jz6xwHoLG+e4zAl6G+QkA8Uw/pLfQw7F
 AW39tTuwP7mIYdEFOnxHGLdGJ3rUJFLYseUPSlhDe1C4ov1xXpgoLZanTMJAWzKTnKH1nBHL3H
 T7ifeAqPYuu+amxZETj/Kx0rhQdEKvyA3symzMybA1JIn85PcY1EOUf+P91DpC0Kn9UYJeZZcN
 azzJmI9h4cZgnu4zAqrBNum5SptwHVDitOGjlF3wQwrs0/5U2tAVR1eKxuOvpRaCvkzfpcpRnn
 dGA=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48710642"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:10 -0800
IronPort-SDR: UGKK+VPLcMG2JA7Uk25hVenxe0MD08k/t+6TNNmbFtN+bChXMlwXmswSa7dov9Hq0Dn5GnVM8e
 ++Pe4gGn4WBoDOHrJS1c5BOvA655q3N3kZAfmlrlvwMvFhkurlkqPD1K2nmMqfZQjlSfyjviC2
 o16yUWLqswnnAYiqH84k15mhEPvWilzxtRce9GPfwJ+2YJOKYY7xmkv+x2bwqBHnaEymeOA/lt
 ctUjm8UxOAV4jS/bIAfTPOskgCqhcSeOW5igm8/lv0+YVnq2wZiPUWjebzC325OD9vZwJgCDE4
 lIQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 34/56] Input: atmel_mxt_ts - implement I2C retries
Date:   Thu, 7 May 2020 22:56:34 -0700
Message-ID: <20200508055656.96389-35-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index ab4eceac8fe7..152069c3e15d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -217,6 +217,7 @@ enum t100_type {
 #define MXT_CRC_TIMEOUT		1000	/* msec */
 #define MXT_FW_RESET_TIME	3000	/* msec */
 #define MXT_FW_CHG_TIMEOUT	300	/* msec */
+#define MXT_WAKEUP_TIME		25	/* msec */
 #define MXT_REGULATOR_DELAY	150	/* msec */
 #define MXT_CHG_DELAY		100	/* msec */
 #define MXT_POWERON_DELAY	150	/* msec */
@@ -721,6 +722,7 @@ static int __mxt_read_chunk(struct i2c_client *client,
 	struct i2c_msg xfer[2];
 	u8 buf[2];
 	int ret;
+	bool retry = false;
 
 	buf[0] = reg & 0xff;
 	buf[1] = (reg >> 8) & 0xff;
@@ -737,17 +739,22 @@ static int __mxt_read_chunk(struct i2c_client *client,
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
@@ -778,6 +785,7 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 	u8 *buf;
 	size_t count;
 	int ret;
+	bool retry = false;
 
 	count = len + 2;
 	buf = kmalloc(count, GFP_KERNEL);
@@ -788,14 +796,21 @@ static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
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

