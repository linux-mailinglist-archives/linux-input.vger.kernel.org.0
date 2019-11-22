Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9B061067B8
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfKVIYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:24:21 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52461 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfKVIYV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:24:21 -0500
IronPort-SDR: SQIhX7JwH4BYZjXXm7jWcs47L8Lw6AKPwOcA3bL6bkSKxZOuRFSCGQZg5QbnsFYXWi/JLe5NtY
 UPoSvHvKIRKEa9Wu8Fof98yMAlG+7NiGIaAUHsxjT+DEoZSdyIDFbNI4wz5SfY/2T01e3VlPRZ
 MiyHHNh6R/3S56zdCFZWMIaAKInjFOYYDMdAiC7gVq3uywK5C1EDmo9aCmLq6rKnbLb5dyENFs
 YhdAszRSqCtBWnxn+0IpPfmvnvB1WABlp21Z5x6Ux/OUOooq2xrCZgocF/0y+bez/S48boWCxk
 ZNw=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358888"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:24:20 -0800
IronPort-SDR: XvyKyFn8UpO2pWmvMLeYvVcQbQH0VhQMgrbDOsMCblPh9PtRjvRO/mFSlBFZO0hdWa0qVZ7zwD
 vaA9Pwxu2c0M0IzVyPLkeIYvTrb5fWXTYSSNuIsT/qSi7TrCjT6f9OB+uUOO1wIaUL6kbzDZyw
 yoEDrxpQqZBZ0nPnxOH09H2WNFnzbCCyNYMg4aYt7llQ4Ab3qCFIFrltGwkeN/ajNOUjqVE17d
 exlc5RPufavfYq60N9nbBhasPIspyvE8t5oWSzIcSfKIvh7QaStgdazT+foqGJmHkGhW9MG4gl
 0zI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 04/48] Input: atmel_mxt_ts - split large i2c transfers into blocks
Date:   Fri, 22 Nov 2019 17:23:18 +0900
Message-ID: <20191122082402.18173-5-jiada_wang@mentor.com>
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
index ce5a069b62d4..9088b2d3266b 100644
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

