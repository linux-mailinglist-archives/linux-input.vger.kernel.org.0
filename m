Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8EE2F0F9C
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731671AbfKFHDt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:49 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:18623 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729926AbfKFHDs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:48 -0500
IronPort-SDR: mL8JUM/wa/RdpVME/k51twZL4A6FnEq+7zKYMAoP2d/oD92JvEQL5eM8GNlx9ALTWDts0bYkHp
 gUxEQ7tCDjoUWK8NDhdTOg3tWuYgcnn0QrJseVae0bWzbYcnAnULnhRQspJFREK71OLxjIXC/O
 Fv1kZmdHjMrOnzQ6nOsofdkK4Ap5vv34WoSF7xQdJ8a3JbCDda+2p4J/lNO1fOa4hkKvKODXpC
 1wAURmiDO5F+PuxDnH+QuX99Fk/m7bmsT/jUIa76rrmo6Y0GROAQX4QmVvxC2Aune7/OD6ige1
 594=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="44759290"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:47 -0800
IronPort-SDR: szDzx3mvg78n4McnqPSjHY/I0k53AkrScLfAdGUj0cAqfjhY5K7rIo1NEAecR5hOShNHdh+Fl3
 wM3VRsjlmjmpHSFiNGjceEJxihyzAkCS5jhLfeigP2vIGlkG5x4Tp2l4DOkMRK4wsYHHlWujJ1
 paPcgR5L+5ok0Brs9pcF8iCFjO3qWH2wZthb6dYNrEM/tDLwu3m/GIa013QhQx6CDy9Ga/NUx4
 /0I4/qWqAOC+6XAReqI4Laa1Q3XTUfKxho/Xy39Y2ZF/FqnYdti4GAx8JMbT9TV7iLdJQzRYEG
 aLQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 30/48] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Wed, 6 Nov 2019 16:01:28 +0900
Message-ID: <20191106070146.18759-31-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index db91caff40e4..54e2d5f81af9 100644
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
2.17.1

