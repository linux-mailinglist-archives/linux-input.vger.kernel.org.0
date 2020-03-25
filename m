Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F3AF192A21
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCYNgq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:46 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53226 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727656AbgCYNgK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:10 -0400
IronPort-SDR: RZ0w/qKXn0vF/UW12Dyd/e6+O0Qsc3bGjij9LLQ7Mu1Dpw6bgGVCDgur9qhIGRdtKMT/5L+ulb
 jADv18A6QvJtx8MSOvAx8jdDsgctx3ZOzNM9S/UeiGAoKYvWgZkOTHzN9Ns/q3uIIZOAMTGyGd
 2n2oRibB9yD2PBNF5paEVAytJEWC/La/rNsG7hNh9xcTtKL0ljTdaO6DzcB2WG7Nxxm2xPqAjD
 uwIKOoGwaBFy5tfjlJc1VczDHcHhN/LptwDZL7DHvDPfcbh4he0/Rtso9TOooUOQUYKoFeFJ+u
 6ts=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099765"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:04 -0800
IronPort-SDR: ICFDlk+3X/KxgUMcPk9uzWIT7VFtkzczqGXU9VV4R8ntE3yN0AsJThCzcEjjhNcEseQUJP/HsS
 9MMBA7teWTHST+AIq9o9oOffmvUvXjTwjyb7j/Vb2DYQzRjaqrdywz8irdVn4ZtSoJH3KCokdU
 NF5CW4CB9GaYD48mK1J91Px+uxM6eF1julZO5AWlpIajmI4Wdc5SGWXCsZEv3D/Whq3R8xYY/J
 M7gpLtrmOQ4KD8W0ljZVosnDZew/VH1S6a9w4Uhg2Jz+Eia2HKCC+YsLBNQgB+RYZwtSr+Sv+B
 Rkk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 36/55] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Wed, 25 Mar 2020 06:33:15 -0700
Message-ID: <20200325133334.19346-37-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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
index 9476326596d9..36a87d9b9c83 100644
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
2.17.1

