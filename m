Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18EF1B4AF4
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728888AbfIQJlL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:41:11 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:19904 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbfIQJlK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:41:10 -0400
IronPort-SDR: t8jIqH9+LgaP2qLBioki9Sx3S2LEwlOJe01YKklO9kl6vYK1GEV7q55cuEmNTx+n0sqkhAHQI0
 1+3NtV0SvdvNqYyxXDh03jmCke6ntRXNI7c5Ge7xMJ+WWy1ZN+zeetmTM0M4KqoqNse1OzQbr5
 hIrjMKSXYPkprTxPo9KDmddth8xNIjN+r/5TLLrAQF9KW2tSpcwhowEGQLs6TWF4t+xybDOKM/
 l4s5iapRj0ot6sdpSh5WqpTapHROwnDAFUJaIi81LKkEx4daLVKpypVHWZAa0tx1+SZ3p2JLW6
 uO4=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41374169"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:41:10 -0800
IronPort-SDR: KUBxps6UohzZXT09EzcIO6hlGGywFtqNXSYyXQjwXhdKYnddNXegeBiUv4yygp1gyRKILgKaSR
 Wy1z6l1n/Wri9nsucLG1VoPcj3ddRo6me9Mg9W3gKZNTIfU8B7NIE1eh+lF2p7OrRVjHV/ct1+
 L3Am6QuxNG0KnbIJvJE/4PjeZ5eVNZTBYxbnCPhhEqTJR0IKNl5B1e10HV/zGh3bkbOz/7qcf0
 tKnZgX3CJyWzbJ4CdaGatwLR0q87ycQ1VtATNPK9ddrdcNWpTbcOurCcln/Qd7dO+CTe0DtGRw
 3Nc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 31/49] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Tue, 17 Sep 2019 18:40:32 +0900
Message-ID: <20190917094050.18771-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094050.18771-1-jiada_wang@mentor.com>
References: <20190917094050.18771-1-jiada_wang@mentor.com>
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
index b3152aaaed63..560fe8a3bf62 100644
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
@@ -2070,9 +2069,8 @@ static void mxt_free_object_table(struct mxt_data *data)
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
@@ -2241,7 +2239,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 	u8 *crc_ptr;
 
 	/* If info block already allocated, free it */
-	if (data->raw_info_block)
+	if (data->info)
 		mxt_free_object_table(data);
 
 	/* Read 7-byte ID information block starting at address 0 */
@@ -2292,7 +2290,6 @@ static int mxt_read_info_block(struct mxt_data *data)
 		goto err_free_mem;
 	}
 
-	data->raw_info_block = id_buf;
 	data->info = (struct mxt_info *)id_buf;
 
 	dev_info(&client->dev,
-- 
2.19.2

