Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E30F18B9E3
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727504AbgCSPAj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:00:39 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:15923 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbgCSPAj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:00:39 -0400
IronPort-SDR: aq9BidRel6u2dHiaDJejrznQabVWcfiPPFH28pVCrpcPy7uOPOy6uVuBMswiEYLRHhXxalLjTD
 uKq1vuPQN3sm6VuR2sX8PJg2VbJbCzPyQtbXYv7KmQP/yXo8sZlENlUNimQroYPwlSztJXd3nV
 Rfbe41je5n0JV0hmfFxKSxpuxUP0x1UTtC529Jk8/B/jN+Rx5DUQTXsNMY3N72TVAw3WZodCOt
 3mB8N3DFnUx9FOhbzuAcQ+HjVWP30N/2hWKsPO+lnPcLeo4bFBm4znv1o7XjzA5g9x3UQxTQrT
 JT8=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850130"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:00:38 -0800
IronPort-SDR: V666wCBxE7uhKD5NWWFiTqoOOsLRkXJrRveIYym1WNZCWKtzP0x97v1QPSH2t0oGS5T+aZk5W/
 hyCgiu6UFOeySoCZSgy6NjeR6HOaxNhZjY9MLrfQNQimU+jrOLcXvGzvwB47Q6fT3RsRNN2Iyn
 s0S0cT1vWhzbwRkqF71ZiJcLm0LYzcj9ESTap6APZIR6TQhDZ4u9BxMhdXL0ZN/t5ybq/7owq2
 AeSYNod7d9SwBrcU0ac2w72rCCR04an8iekEeX2npB1KAdvwOgjNanEm/WiHk1yLr1t9gJZdWB
 J98=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 04/52] Input: atmel_mxt_ts - split large i2c transfers into blocks
Date:   Thu, 19 Mar 2020 07:59:28 -0700
Message-ID: <20200319150016.61398-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
[jiada: Change mxt_read_blks() to __mxt_read_reg(), original __mxt_read_reg() to
	__mxt_read_chunk()]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 28 +++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3f1ebe14802f..7e6a66e3e1e0 100644
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
@@ -624,8 +624,8 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 	return 0;
 }
 
-static int __mxt_read_reg(struct i2c_client *client,
-			       u16 reg, u16 len, void *val)
+static int __mxt_read_chunk(struct i2c_client *client,
+			    u16 reg, u16 len, void *val)
 {
 	struct i2c_msg xfer[2];
 	u8 buf[2];
@@ -659,6 +659,28 @@ static int __mxt_read_reg(struct i2c_client *client,
 	return ret;
 }
 
+static int __mxt_read_reg(struct i2c_client *client,
+			  u16 reg, u16 len, void *buf)
+{
+	u16 offset = 0;
+	int error;
+	u16 size;
+
+	while (offset < len) {
+		size = min(MXT_MAX_BLOCK_WRITE, len - offset);
+
+		error = __mxt_read_chunk(client,
+					 reg + offset,
+					 size, buf + offset);
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
-- 
2.17.1

