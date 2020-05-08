Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD3C1CA34D
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgEHF7a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:30 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:22062 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgEHF73 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:29 -0400
IronPort-SDR: fDjjMm5weOm8Qf1YIK3TAvi++tdmFCIOfdR+KT1x/4yX0d5e8Pyk2TjT4Tn+MWP9uSQXCmeIb7
 hGIgZvc/cevbDs5G7kNF/4gH7Nyqhl0FEHTOZAUL2pC2HS2J+sLCE8qf1hNr3MRY+KWGoQoS86
 hFuA4krw0aUSyDQ5FbY0LGU20cAhwwPDikknqKDrxTRhIzdepULTqtFlufL6OclTV5w+IfRYKu
 8PaAjSOwjlVV3JNpSLgCOqQpwMv4VfkU8RHheFrdgJpx0CBLi/p1koxzprjsvCZU4bsnJi80Pf
 UCE=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589128"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:28 -0800
IronPort-SDR: 7VJ5xFQXTU4nGcCbOETYIz2S58b0p4CZMF5CuPO37JlZBJVqjOf+bBDDOCv7F6bsMkMXaXn++4
 iCeioDdfSQOJezwQKFnjS/rRRSOKZIDEEP15BWzoZAAvmKS6gSjbZhkQoZcXWuVUAkDH2ANncq
 3LGTdQ61sfRXecmPqe2Pye9tCyFlKLqoIl8Y7PRl7dnvS9xzeHPi4B0ohd4HIoMS1bunn7sTnn
 yYwP/VpC3BOAdG1JDR8U+4SJ947RlZ10B8s4+Znxu2GvQ1P13ZLl9m0meXEdEZlDoLqZgy2/yV
 Llo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 39/56] Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
Date:   Thu, 7 May 2020 22:56:39 -0700
Message-ID: <20200508055656.96389-40-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Kautuk Consul <kautuk_consul@mentor.com>

Revamping the code to call mxt_free_object_table and mxt_free_input_device
functions only in the following scenarios and code paths:
1) The error path of the mxt_probe() entry point
2) The mxt_remove de-init path entry point
3) All paths which definitely expect to populate the object table
   like:
   - the mxt_update_fw_store path which first calls
     mxt_load_fw and then resorts to calling mxt_initialize itself.
   - the mxt_read_info_block function which attempts to fill in the
     object table itself as the main non-error part of the logic.
4) All paths in the code expected to definitely allocate and register
   the input device such as:
   - the mxt_update_fw_store path which first calls
     mxt_load_fw and then resorts to calling mxt_initialize itself.
   - the mxt_update_cfg_store function which will call
     mxt_configure_objects.

Signed-off-by: Kautuk Consul <kautuk_consul@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a92ad9a103a1..9281a574ca80 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3317,21 +3317,21 @@ static int mxt_configure_objects(struct mxt_data *data,
 	error = mxt_init_t7_power_cfg(data);
 	if (error) {
 		dev_err(dev, "Failed to initialize power cfg\n");
-		goto err_free_object_table;
+		return error;
 	}
 
 	if (cfg) {
 		error = mxt_update_cfg(data, cfg);
 		if (error) {
 			dev_warn(dev, "Error %d updating config\n", error);
-			goto err_free_object_table;
+			return error;
 		}
 	}
 
 	if (data->multitouch) {
 		error = mxt_initialize_input_device(data);
 		if (error)
-			goto err_free_object_table;
+			return error;
 	} else {
 		dev_warn(dev, "No touch object detected\n");
 	}
@@ -3339,10 +3339,6 @@ static int mxt_configure_objects(struct mxt_data *data,
 	mxt_debug_init(data);
 
 	return 0;
-
-err_free_object_table:
-	mxt_free_object_table(data);
-	return error;
 }
 
 /* Configuration crc check sum is returned as hex xxxxxx */
@@ -4093,16 +4089,21 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = mxt_initialize(data);
 	if (error)
-		return error;
+		goto err_free_object;
 
 	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (error) {
 		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
 			error);
-		return error;
+		goto err_free_object;
 	}
 
 	return 0;
+
+err_free_object:
+	mxt_free_input_device(data);
+	mxt_free_object_table(data);
+	return error;
 }
 
 static int mxt_remove(struct i2c_client *client)
-- 
2.17.1

