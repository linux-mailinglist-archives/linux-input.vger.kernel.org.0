Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 598218FDFA
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfHPIhD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:03 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36109 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIhD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:03 -0400
IronPort-SDR: pQdOdqk59jmTwrcFx7BDb2rnPXcz9DDmmV4XELw/08xYNEppbq+BjfsKaIxItOu7wOFwx1fTdT
 +dDk3JWMDuXVdn/7KbUX2W+DXDfTxgfb75t3FmpLeymCWRbBNgPnjs74kHXcrPl/cRs0f43oaA
 9zXtzVzAQqrxW38blpYHIXlJbmS8MpuDTNjGUu/Cas22ObGU3lVq0sd4YYDiiRbOGT9Y1OELeI
 y/IHsqEeD5iECkZ1qRxhz5/xewBW/uJDk9vtJfbLTBMVA7Sepwb0LlHszIrvtpivb5Mfrr74+q
 QlI=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40518979"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:29:58 -0800
IronPort-SDR: iu65sE39n6cJsrtsteCFw8I62ZXoQ7jaW93Z6TG86qa6U9nxH6Htc3H2zGQGFOBR83UiVKK36k
 7uIlMjSYGIL3uepeS7jDLDxtbBndhY9qoWTVMpWfbZTEDn48Mjmg3+sZUFUqieSbE/TJC4fil1
 DqboqDDDcBoqBusWiMSCW2zt5rLrSMowRMwjcR/UCxz6xl3iZMQXEBTkCJweyAVGkgH4sM5lJt
 eAiDPXoc5OXFbHcg5j0CX3SMl0z95vTx5TO5+tzf/L+sV+pwsBnwCNsMfnYoXrk/T9G6Kguf9t
 nG4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 04/63] Input: atmel_mxt_ts - split large i2c transfers into blocks
Date:   Fri, 16 Aug 2019 17:28:53 +0900
Message-ID: <20190816082952.17985-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816082952.17985-1-jiada_wang@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

On some firmware variants, the size of the info block exceeds what can
be read in a single transfer.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 74c4f5277cfa403d43fafc404119dc57a08677db)
[gdavis: Forward port and fix conflicts due to v4.14.51 commit
	 960fe000b1d3 ("Input: atmel_mxt_ts - fix the firmware
	 update").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 27 +++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 9b165d23e092..2d70ddf71cd9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -40,7 +40,7 @@
 #define MXT_OBJECT_START	0x07
 #define MXT_OBJECT_SIZE		6
 #define MXT_INFO_CHECKSUM_SIZE	3
-#define MXT_MAX_BLOCK_WRITE	256
+#define MXT_MAX_BLOCK_WRITE	255
 
 /* Object types */
 #define MXT_DEBUG_DIAGNOSTIC_T37	37
@@ -659,6 +659,27 @@ static int __mxt_read_reg(struct i2c_client *client,
 	return ret;
 }
 
+static int mxt_read_blks(struct mxt_data *data, u16 start, u16 count, u8 *buf)
+{
+	u16 offset = 0;
+	int error;
+	u16 size;
+
+	while (offset < count) {
+		size = min(MXT_MAX_BLOCK_WRITE, count - offset);
+
+		error = __mxt_read_reg(data->client,
+				       start + offset,
+				       size, buf + offset);
+		if (error)
+			return error;
+
+		offset += size;
+	}
+
+	return 0;
+}
+
 static int __mxt_write_reg(struct i2c_client *client, u16 reg, u16 len,
 			   const void *val)
 {
@@ -1793,7 +1814,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 	id_buf = buf;
 
 	/* Read rest of info block */
-	error = __mxt_read_reg(client, MXT_OBJECT_START,
+	error = mxt_read_blks(data, MXT_OBJECT_START,
 			       size - MXT_OBJECT_START,
 			       id_buf + MXT_OBJECT_START);
 	if (error)
@@ -2783,7 +2804,7 @@ static ssize_t mxt_object_show(struct device *dev,
 			u16 size = mxt_obj_size(object);
 			u16 addr = object->start_address + j * size;
 
-			error = __mxt_read_reg(data->client, addr, size, obuf);
+			error = mxt_read_blks(data, addr, size, obuf);
 			if (error)
 				goto done;
 
-- 
2.19.2

