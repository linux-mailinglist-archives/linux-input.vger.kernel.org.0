Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C1D1CA34B
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgEHF71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:27 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:22062 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbgEHF70 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:26 -0400
IronPort-SDR: jfVFPUQOF/0KVTqimvcqRSg3Ipr5j7ROEDr5w5XAO8n3vjFBZ/CPWi+Y2AFz4z4wS3Vu3MLV90
 C9DZO7zuyu1qcLF1of4GblJui2hvwFj7TyHz11Ny8BwltI6mlTq07aHD+b0fBq2c8R09Py/nEg
 WXhWrJF5cpsKqI7zHFmRqEhR6qI2V71/CC6ky73CZn+td6LbEmzJ9FnSMRDciaGBv5rG+xg4lF
 WZ6UaBAmnH+WQqAUss/nJZlIGSoQap3sUZX3ejwI096L2zCLFvyudyuLmu53jakozxwIYf8brR
 uvI=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589126"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:25 -0800
IronPort-SDR: L3NrtHh3nnZ6Sw1G2JDvUzOhqhU6HO2PJGQe51mZTeWccV8WdD2EOxp5hpXykDPc9s6/o3GOUn
 E9qaBdRtW5x38c5kjZKFUbn6OqkB69946fkXCmL9a+Lrm2kBG9AdaDV7s3kYJqQLumW/TWZaV8
 xDWxhwnzZs/JFRtb9W31LM6broVp+e7dH1nfm5tzwcnKw59KuwOAhlC+rbMXudcdMJfRLQzXl1
 An3u/EgLjUh5CsI0AkzJ71ZZdQwGgNkIk/1XNAeParC29Gc+4JH93AxzTLdS4vwyWE61xGMbrr
 Rkk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 38/56] Input: atmel_mxt_ts - eliminate data->raw_info_block
Date:   Thu, 7 May 2020 22:56:38 -0700
Message-ID: <20200508055656.96389-39-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 92c883087a4f..a92ad9a103a1 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -324,7 +324,6 @@ struct mxt_data {
 	char phys[64];		/* device physical location */
 	struct mxt_object *object_table;
 	struct mxt_info *info;
-	void *raw_info_block;
 	unsigned int irq;
 	unsigned int max_x;
 	unsigned int max_y;
@@ -2053,9 +2052,8 @@ static void mxt_free_object_table(struct mxt_data *data)
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
@@ -2224,7 +2222,7 @@ static int mxt_read_info_block(struct mxt_data *data)
 	u8 *crc_ptr;
 
 	/* If info block already allocated, free it */
-	if (data->raw_info_block)
+	if (data->info)
 		mxt_free_object_table(data);
 
 	/* Read 7-byte ID information block starting at address 0 */
@@ -2275,7 +2273,6 @@ static int mxt_read_info_block(struct mxt_data *data)
 		goto err_free_mem;
 	}
 
-	data->raw_info_block = id_buf;
 	data->info = (struct mxt_info *)id_buf;
 
 	dev_info(&client->dev,
-- 
2.17.1

