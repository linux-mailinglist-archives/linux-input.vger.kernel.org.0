Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7D6199433
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730864AbgCaKxQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:16 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730766AbgCaKxO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:14 -0400
IronPort-SDR: h1ZPw5JDlb/23h8/9+CaPe8iFM75q6mmuPNUdUgatYe9dq68nVhXsQaan0RyOnWYemGWiuSR4H
 ye0metFE/ZTMt3lInwU83BXJGBL+OOBv8sNM6u8NxUwnpf/uKT0kPlp/IbsQ2ciw5GrmUl8Yxy
 Cys4GehwsbDvqyi2BW96KtMKwPl1P6tWGCgkody0qDmMcZnmakRlqBnR4l9OxkgCVZXEeFRBv+
 AqE7D+Qb/2rN6AjUIECKhf/Kxi0WyQ6tDGRk1bQXOr+9RH8uGjW2zcy625YT80wBYEQnMc0uBr
 TeI=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330812"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:12 -0800
IronPort-SDR: md36g9/95nZ7XnlmpSWpN3SQl0hJEN6aD96yrlNhAlyKWie+CsNHBNlY2ZOoFdGSSsz/wNU4Vu
 Qv4qISm7lernLLV1oKtZDPJOxM3Wnah1wYcuT35NwDIpRG7RjSCiqm9muMsTMUncNjSgUolQpj
 a/Kaqa/84njI0J+e1uzFiFzBIhUc8EqKEqZmhJ+hx1bdhoWJS79tMU9ZhDzDbLM8iZrhfP0GNW
 HS18uUBv9eLVHVl0KlHRTOILPwDNMT5JKeV+ENWLghKgpO5eB70kMXITBiq7Gat8OsZVPHZQTB
 mAo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 36/55] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Tue, 31 Mar 2020 03:50:32 -0700
Message-ID: <20200331105051.58896-37-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

