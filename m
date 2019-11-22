Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56B9A1067ED
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbfKVI0C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:02 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:62576 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKVIZ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:58 -0500
IronPort-SDR: GSERgvB5Cmb10KfzY9WfM7Dkb+El5A5WPYUSB5Pq8vZbQUY31GMF6tpIu2+5rSJkwv3Wf9sM+T
 Bw6AGM2RfqlABpxxBfefSQyIpRshtKHNi9kgMOl/CoEXLTM+m6jtHAO1G9EpJa2m3ntm7194MU
 ZDM+VaPoGPMRPtX5Q3X/8jLFqxL9zzN/EpSdEtM+RLjIclZkLGSC2J0pcgdheKz6e/tBukqDJE
 /cFOgHQgasty3/SgWrrBiJ1SK44ZnF8yX0B98z1aHrGVrv0YN4Cf8v8WAZT/RaN0nBCE9jsJIz
 QTc=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457614"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:58 -0800
IronPort-SDR: afcT+dPclJ7XnbNAcQBEKVouhsrmrrcNR1SizvifURcMGIglyvQNWSHNwqkL579z6TVAGsNoDV
 7zgrTrUhFZUapZRvZFjEz0Hso0IaahWKN8nsAvWTUh8rAZv6XfvxANYzi8ajbedI2l4m+cZrf4
 zS/YWGDctssG0WYR2FaGsho1TnRAv/t8l6odBhsH+fEH4FOkl0a0j02VNxvlM9qFTbhsLo5H5b
 gqnP68HPnm78YRZQmWoFLda97bUaCLTOtbKGQpuokGmXIS3pi92Plq0bnQec+8JMfvUdlXzWlJ
 AmU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 31/48] Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
Date:   Fri, 22 Nov 2019 17:23:45 +0900
Message-ID: <20191122082402.18173-32-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index 54e2d5f81af9..acbba44d604c 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3339,21 +3339,21 @@ static int mxt_configure_objects(struct mxt_data *data,
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
@@ -3361,10 +3361,6 @@ static int mxt_configure_objects(struct mxt_data *data,
 	mxt_debug_init(data);
 
 	return 0;
-
-err_free_object_table:
-	mxt_free_object_table(data);
-	return error;
 }
 
 /* Configuration crc check sum is returned as hex xxxxxx */
@@ -4100,16 +4096,21 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
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

