Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B40615A3A8
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728764AbgBLIqJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:46:09 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:34491 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728631AbgBLIqJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:46:09 -0500
IronPort-SDR: A8BxmbJStKfw7wottLa3/MRM1OEIxyZ1M4fB5hjgxNkB8BTzhhlKZHNWx/xMQcoE4TYBQdbkjx
 Vugz8WtcWMSCL3ZTA7nbXZO5icwQNV4CBxb6dy9IXGMj3i6vxNmH8yXlcBEf95yyTn3nICUXu8
 yF3mQUq/FmEz48OVRxvpapiAKyN3/kaUqzZIi8hsc0VGNbrE11ySVsLeDuwKd/SCV+mjVK6Cfw
 UGa7MEjxmN71wOWJbh6DlZGQY5EYnHReWo3QWFhja6TE0A3RdBrNVOuC0ZoMZydPkeY/72kxxg
 /Fg=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686261"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:46:07 -0800
IronPort-SDR: aCqCBKyAY5MB47KnhzcNC+zpDE/3ir25ohQYRk+p+iwFalMCzaJFnAtgI9C9jWgQyqZ3iiA8oI
 5SW3pmKg1O7IqHFpLkMC3WScxGdYSFf8UgRHoVWF7sOmUI61wctqpAlIZNS1aHcvla9ZJuNdpb
 OrJr1cegHkTBAnUcCWlmVeeMuor4QwDvawxE9A37UWNFRZXy1oAfep0gOnGvpnnJUaqzCDwM8m
 HZU2VLbOeLi84rbmL0O4OuyZF2goVFVB1oi1IA23LfE9HIninhKYunepHzmaObL16j9Gk/FOQE
 pYY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 30/48] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Wed, 12 Feb 2020 00:42:00 -0800
Message-ID: <20200212084218.32344-31-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index b3e3dbe7a9a0..a64793281ae8 100644
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

