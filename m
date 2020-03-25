Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25461929C4
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgCYNd6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:33:58 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:4295 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgCYNd6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:33:58 -0400
IronPort-SDR: zcxdrWD/IRQhwh1INPxKyRaN0DP4tkIdWx/cXZc/WxIEnzje2GAmg9fPUIqkw13zKGbDMB0LLB
 5J5m/WrRZpEp1u8vEO8tcQ19jPlPt+z5F6gK4PkB4cm9xGOOqtoxmsQw/GNtO9AEHAZX25qIxM
 DUyB+0j3CB1buWaKrtIeb96CSUDqQnPFJJZquAQ+vigedHNnMdgMNCe/9IDuhxr6uyAK/f8ZlY
 T1AsWd3egpoVt0iT1tzq22FwJAxs3UMrqZ1A36claHjqAKKQli0COZZCI9W7kUnx3gMvA6PRDC
 iXE=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="49059989"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:33:57 -0800
IronPort-SDR: q29J7NtsCAYHTLG9yXYD8V3LSfmjR55tP8LOUCT6Yn+OBKYyMzkBiPaPFhAaRJzai7mSREG5AA
 /uLsgIW48h/lFaEBjtshV/uFYNBViMsN+dPexWI7OPD0UqxuNQ4Lpbr/EOjGJDEV6mprwOp/vA
 ZLO7lPN1iXGgGWzWjFWyHxESRy627kKSjqQZlEMJdehbGqkjWEOydiqtPtzoLhkz9a7LNLC4RE
 f4WpCNpElmnFfQyHZGKH/Zu+vd82+Seta9PnfIz3x3D5LZqm5Psi9e7je7QrHNuOxydNINqKiC
 YGk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 04/55] Input: atmel_mxt_ts - split large i2c transfers into blocks
Date:   Wed, 25 Mar 2020 06:32:43 -0700
Message-ID: <20200325133334.19346-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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

