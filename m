Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8140F18BA19
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgCSPCd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:33 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:16097 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbgCSPCc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:32 -0400
IronPort-SDR: ywqCJ5OIu1WocdUXo8+6Woh83R/3/CtrN2DmMNfwtH/to564qozAv2iMTPsVHfxhg1nVOe1yRe
 3qfQm1Xg2Cyb1Hv3dvlQ10CtN2l3CV9kxrL24A3SX4A3/rR3KfSd2WTZSUP+avSAAT1iysPdqk
 HUBeHB19ulM5gFPgzUPEF7E9BO8t+D5U77VvwCEclsbemmy+JkZGnCaa7qZyzPFJf32CT+encm
 DIpRq6uwEIN9Vb1VapC2DS52pdhFDTeGKPbt4G6v/x15bU9fLa1U7nzrf1hrINlI65OmqXUhI2
 GXw=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850363"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:02:31 -0800
IronPort-SDR: /NjeRM/tk6vq/RGBX4srdWBYpAhWY4DMAwdbnEyKmPf01VF4o5IMaH7glAFqCuf6NNW1sYWmtq
 oNXjnd8MOFgSbWTeAENIIkcyEbmNb+AD6YnCJ6dCpuTRjJaFZid2klSZJh99Ebqy5twf5km4Ai
 Oso0FqwYaLg4gCHibF/RtGV6pPSqYp506Q61aYH55+OXXpXBgu6OLFsEdARf/lBa4mWtF2mhAk
 jjSSb1cU5dYd202VIu1L8kNPtY5fkuW6tNuaH+2r68Xds8HrJR30+LvPao3XFXYVnYGLX2fyX3
 Xxs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 33/52] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Thu, 19 Mar 2020 07:59:57 -0700
Message-ID: <20200319150016.61398-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
index 15bc1b1864de..48ec60be26db 100644
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

