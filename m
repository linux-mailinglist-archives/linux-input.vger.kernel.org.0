Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 907DBDE0C9
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2019 23:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfJTVsf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 17:48:35 -0400
Received: from 9.mo68.mail-out.ovh.net ([46.105.78.111]:34858 "EHLO
        9.mo68.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726374AbfJTVse (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 17:48:34 -0400
X-Greylist: delayed 4199 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Oct 2019 17:48:33 EDT
Received: from player697.ha.ovh.net (unknown [10.109.143.183])
        by mo68.mail-out.ovh.net (Postfix) with ESMTP id E455D1447B7
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 22:29:21 +0200 (CEST)
Received: from etezian.org (81-175-223-118.bb.dnainternet.fi [81.175.223.118])
        (Authenticated sender: andi@etezian.org)
        by player697.ha.ovh.net (Postfix) with ESMTPSA id CC385B33638B;
        Sun, 20 Oct 2019 20:29:15 +0000 (UTC)
From:   Andi Shyti <andi@etezian.org>
To:     Linux Input <linux-input@vger.kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Andi Shyti <andi@etezian.org>
Subject: [PATCH v2 1/2] Input: mms114 - use smbus functions whenever possible
Date:   Sun, 20 Oct 2019 23:28:55 +0300
Message-Id: <20191020202856.20287-2-andi@etezian.org>
X-Mailer: git-send-email 2.24.0.rc0
In-Reply-To: <20191020202856.20287-1-andi@etezian.org>
References: <20191020202856.20287-1-andi@etezian.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14096548312903828038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrkeefgdduhedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The exchange of data to and from the mms114 touchscreen never
exceeds 256 bytes. In the worst case it goes up to 80 bytes in
the interrupt handler while reading the events.

Thus it's not needed to make use of custom read/write functions
for accessing the i2c. Replace, whenever possible, the use of
custom functions with the more standard smbus ones.

It's not possible only in one case, in the mms114_set_active()
function where the 'cache_mode_control' variable is updated
according to the value in the register 'MMS114_MODE_CONTROL'
register.

Signed-off-by: Andi Shyti <andi@etezian.org>
Tested-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 drivers/input/touchscreen/mms114.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index a5ab774da4cc..170dcb5312b9 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -204,14 +204,15 @@ static irqreturn_t mms114_interrupt(int irq, void *dev_id)
 	}
 	mutex_unlock(&input_dev->mutex);
 
-	packet_size = mms114_read_reg(data, MMS114_PACKET_SIZE);
+	packet_size = i2c_smbus_read_byte_data(data->client,
+					       MMS114_PACKET_SIZE);
 	if (packet_size <= 0)
 		goto out;
 
 	touch_size = packet_size / MMS114_PACKET_NUM;
 
-	error = __mms114_read_reg(data, MMS114_INFORMATION, packet_size,
-			(u8 *)touch);
+	error = i2c_smbus_read_i2c_block_data(data->client, MMS114_INFORMATION,
+					      packet_size, (u8 *)touch);
 	if (error < 0)
 		goto out;
 
@@ -251,7 +252,8 @@ static int mms114_get_version(struct mms114_data *data)
 
 	switch (data->type) {
 	case TYPE_MMS152:
-		error = __mms114_read_reg(data, MMS152_FW_REV, 3, buf);
+		error = i2c_smbus_read_i2c_block_data(data->client,
+						      MMS152_FW_REV, 3, buf);
 		if (error)
 			return error;
 
@@ -265,7 +267,8 @@ static int mms114_get_version(struct mms114_data *data)
 		break;
 
 	case TYPE_MMS114:
-		error = __mms114_read_reg(data, MMS114_TSP_REV, 6, buf);
+		error = i2c_smbus_read_i2c_block_data(data->client,
+						      MMS114_TSP_REV, 6, buf);
 		if (error)
 			return error;
 
@@ -297,30 +300,35 @@ static int mms114_setup_regs(struct mms114_data *data)
 
 	val = (props->max_x >> 8) & 0xf;
 	val |= ((props->max_y >> 8) & 0xf) << 4;
-	error = mms114_write_reg(data, MMS114_XY_RESOLUTION_H, val);
+	error = i2c_smbus_write_byte_data(data->client,
+					  MMS114_XY_RESOLUTION_H, val);
 	if (error < 0)
 		return error;
 
 	val = props->max_x & 0xff;
-	error = mms114_write_reg(data, MMS114_X_RESOLUTION, val);
+	error = i2c_smbus_write_byte_data(data->client,
+					  MMS114_X_RESOLUTION, val);
 	if (error < 0)
 		return error;
 
 	val = props->max_x & 0xff;
-	error = mms114_write_reg(data, MMS114_Y_RESOLUTION, val);
+	error = i2c_smbus_write_byte_data(data->client,
+					  MMS114_Y_RESOLUTION, val);
 	if (error < 0)
 		return error;
 
 	if (data->contact_threshold) {
-		error = mms114_write_reg(data, MMS114_CONTACT_THRESHOLD,
-				data->contact_threshold);
+		error = i2c_smbus_write_byte_data(data->client,
+						  MMS114_CONTACT_THRESHOLD,
+						  data->contact_threshold);
 		if (error < 0)
 			return error;
 	}
 
 	if (data->moving_threshold) {
-		error = mms114_write_reg(data, MMS114_MOVING_THRESHOLD,
-				data->moving_threshold);
+		error = i2c_smbus_write_byte_data(data->client,
+						  MMS114_MOVING_THRESHOLD,
+						  data->moving_threshold);
 		if (error < 0)
 			return error;
 	}
-- 
2.24.0.rc0

