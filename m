Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 967C58FE1B
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfHPIiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:14 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1938 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727201AbfHPIh4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:56 -0400
IronPort-SDR: GBTdZV0vDjaVHK/T1ivaSYRI2YkjjZDBE8ddHK7+46SFHNrI+v7IQHAzN4UODIi2eI0aDmAZBK
 rii0maDJ970WgiD7xYbpOgQ9mQWGw0fgjvmm9fDRJGeRthxpoR2J3poW5nrPSymKf9ulGiBnoY
 cg736ZxBs0tEfre98XxYSl9E81wYpWzrjIiSDx7sauW+/7yP/pONsllgsAkyy2cwIdNWr8TlNr
 a6xidlHNJ35BBea/wstpvauXXb4A9HonXumtwRuuKpQqH0D1I6lU8hPkdhtIVQCeiatnahD7Q8
 4Lk=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484294"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:34:52 -0800
IronPort-SDR: AMNkO82KQJcHXkj8uainweV+4M1MLG6kpGJ3+Cr/9ttOBg9cHBfythoF0xJ8Atg14JycN802L5
 i9mPzGRO4WuCPOGH1Nv094KZ7AyiJ9olIqYLJIOEen25+ZRrM7DspHI7++7MSnDR+bEDDPCf7w
 RYT7N2+M8bixbrgiP0KN0NmgEPm4D+KE+E2EfvuLUJU9dt3hzZR34mjrurLJ05HquxgGZLsOXI
 jEhLtawU3Rs0oUlyuHzSTIlAZaxb8S/xyMyM2kw3ZanpYbJ1ic3Jxgyrn+tQrB1yTmb1KRJt+R
 Ftc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 33/63] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Fri, 16 Aug 2019 17:34:21 +0900
Message-ID: <20190816083451.18947-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083451.18947-1-jiada_wang@mentor.com>
References: <20190816083451.18947-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
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
index e185d10c2cac..248d4b239bf6 100644
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
@@ -2060,9 +2059,8 @@ static void mxt_free_object_table(struct mxt_data *data)
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
@@ -2231,7 +2229,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 	u8 *crc_ptr;
 
 	/* If info block already allocated, free it */
-	if (data->raw_info_block)
+	if (data->info)
 		mxt_free_object_table(data);
 
 	/* Read 7-byte ID information block starting at address 0 */
@@ -2282,7 +2280,6 @@ static int mxt_read_info_block(struct mxt_data *data)
 		goto err_free_mem;
 	}
 
-	data->raw_info_block = id_buf;
 	data->info = (struct mxt_info *)id_buf;
 
 	dev_info(&client->dev,
-- 
2.19.2

