Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7720D1067EB
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbfKVIZ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:56 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:62576 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKVIZy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:54 -0500
IronPort-SDR: 0PulPbwHco7Vk4EGGig3UQuazAxBSR0dyIQaTWeax7PBYX7mxP10mUQJI2GGgTLj6EguHf3WBB
 jAwaIFfUG7xQFsJXla33CT9ZetmsDG5MQTIUKSEc+q0LIMwWk7boI9Thz+68VmFqrsRC8Bjko9
 3RYSq96D2prQNNKnbVpwIkHZVOv0hltKnk1cJutFqO9rVbffNvofeIR6UkKTD/All+pLHqOnEw
 ovfoWpzgwFPez8liKfSg7srMDUVI262HCzm2JogDqBZyaxRe3JY7JI6afVN4EYKi/U2gJA5C4q
 pd8=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457612"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:54 -0800
IronPort-SDR: d1E7AVh7BzY1dPhf0PvWFshUe4bo1Ygcf5fwWplQZ+juaVyNy27JUfbdr8edmFi/BSFK+EF5rJ
 2ZZrYL+HEYEE8zB4EfzPYIhR4djPPkVzVb9VXX71x1D1r0KKFGsggWjtfaxf6T/LgS+xhqVqf5
 u6/WALKpLukLcjgR7QHxFW0xgJL6yZAuKGjWhfGcB1MNn2OdxwB+HzlHBrnRwXvmcmZbmNPQAR
 7s5JDkASU+qt9i2M7+73lPqXkSlUEjnWGTYwGYPTH/h793h6jgQG1rWxKeFIIUo440BOg8xOe6
 OnI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 30/48] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Fri, 22 Nov 2019 17:23:44 +0900
Message-ID: <20191122082402.18173-31-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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

