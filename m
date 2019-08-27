Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8C9E9DDFC
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729315AbfH0GaK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:30:10 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48242 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728711AbfH0GaI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:30:08 -0400
IronPort-SDR: +oekr0JulOFpes2ePCKH0YjDmtqhqD0c6QZk5shLwlSBQnx92chAKGQKEJpu6RsK1dbQntzdwU
 UKVwfpwXwlsSLQHbR2S1LCntbu0BuTY0Dzk2AxqdKBETswzd19jlICPlINg/ngAsu2WdEmEZhy
 hgsXqMEMJfMHfwSmI6ZZytUhlfvk25zRhimQs+BO0EsfKskT9DwKmHY8xJO6pVV7jtjIXJSPRH
 /krtJsaJGI3Dv056LDqQHpgOvWiPo3DmIt5kSDnf5xbdQWuVrqOgOZqe61Q7ayLlUsoerRrlsz
 JcY=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784570"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:30:07 -0800
IronPort-SDR: 8g7fxdg565sJYW3F5YUXm4bpz1G11DH6wdG1q/PjK/A/sc+SjYXyVcAYdV4oUQ+SYt8F3zKUXp
 DbBq8uh0HB4ENum5CuIZtk1Yo8Du2K25ETirsT8St6RBudihkYKmr4hThnO6+zLAjpMaTTKDSF
 aTK/De3n8sFDrYlSYa/nH0Y4e/S/XE7hQmXiTGrsWrBEKNHpGpqhYnaCXmnNGSixVdmfmGFfJb
 eQiQFdYYOISYgwf+6q+NBaQ6S1fGrtcVP18QTfEXuQvw+LAANBJ6pTPVobQvRew4xeP5a83Qwb
 x4Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 31/49] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Tue, 27 Aug 2019 15:29:57 +0900
Message-ID: <20190827063015.20794-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063015.20794-1-jiada_wang@mentor.com>
References: <20190827063015.20794-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dynamically allocated in mxt_read_info_block() buffer buf is assigned
both to data->info and data->raw_info_block, having both data->info
and data->raw_info_block is redundant and confusing.

This patch eliminates data->raw_info_block.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2d9d2c1e39dd..f6d65930885a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -323,7 +323,6 @@ struct mxt_data {
 	char phys[64];		/* device physical location */
 	struct mxt_object *object_table;
 	struct mxt_info *info;
-	void *raw_info_block;
 	unsigned int irq;
 	unsigned int max_x;
 	unsigned int max_y;
@@ -2067,9 +2066,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	v4l2_device_unregister(&data->dbg.v4l2);
 #endif
 	data->object_table = NULL;
+	kfree(data->info);
 	data->info = NULL;
-	kfree(data->raw_info_block);
-	data->raw_info_block = NULL;
 	kfree(data->msg_buf);
 	data->msg_buf = NULL;
 	data->T5_address = 0;
@@ -2238,7 +2236,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 	u8 *crc_ptr;
 
 	/* If info block already allocated, free it */
-	if (data->raw_info_block)
+	if (data->info)
 		mxt_free_object_table(data);
 
 	/* Read 7-byte ID information block starting at address 0 */
@@ -2289,7 +2287,6 @@ static int mxt_read_info_block(struct mxt_data *data)
 		goto err_free_mem;
 	}
 
-	data->raw_info_block = id_buf;
 	data->info = (struct mxt_info *)id_buf;
 
 	dev_info(&client->dev,
-- 
2.19.2

