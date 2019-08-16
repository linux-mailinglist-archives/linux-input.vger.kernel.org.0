Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECF48FE18
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727087AbfHPIiI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:08 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1938 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbfHPIiA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:00 -0400
IronPort-SDR: M3MQztdRVGWppd8ygDAahsKAFAFih4TPtaWWK40v+WeNGgD0aP/RUcdih6aPDJHx1O5Imcqh+h
 BwICWShFNFZDB85RZBx+mKqvc6tyyK+GWCyMGFn7hbVug0wGv/jmlGxCRVBHtTqN7XVNzWPKgA
 Zkf1xm7Rq0KCSElsz/y9zE1ucy/7iDKhUFYmThPKVO2ji4ego2CoV9tNssKZ7680B173zCrrL0
 USLKoGf6zkp8X8VB1ojcxXgwOVxHkbBhVUs+MYQG2cMtxsZMfBR07tVMbZtTfqQ7sRTNZk07m+
 TkQ=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484297"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:34:56 -0800
IronPort-SDR: uCF7Yg3QSrXgLajR6deui0IqBhkjAGMYhsA+0S/AbLohf1meWrWZe1wX3lBAkR3Av13j8GqPLD
 jRU9KyNJFg9z4ciopZwOrbt04ULyDAeOzWmjhUIs9Sv9T4z0xLYtfHfvPJmS/wigkl0vuX9oWt
 dfV6+Y6yIZhPXTKkeO0k7OZIHOcvRMPxDRECTH6aTpqjMuykbiQuCV4khILQhjNUq1fELNmTMn
 Exjpa6ngeBzAvJ+kQYGELs1l2+DcV7j/GW+VheO3XLrwJr4hsYaoNipNk/jydrF1bXH/iBMd/O
 eoA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 34/63] Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
Date:   Fri, 16 Aug 2019 17:34:22 +0900
Message-ID: <20190816083451.18947-5-jiada_wang@mentor.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 248d4b239bf6..aa913d2a0e3b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3328,21 +3328,21 @@ static int mxt_configure_objects(struct mxt_data *data,
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
@@ -3350,10 +3350,6 @@ static int mxt_configure_objects(struct mxt_data *data,
 	mxt_debug_init(data);
 
 	return 0;
-
-err_free_object_table:
-	mxt_free_object_table(data);
-	return error;
 }
 
 /* Configuration crc check sum is returned as hex xxxxxx */
@@ -4142,11 +4138,13 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = mxt_initialize(data);
 	if (error)
-		goto err_sysfs_remove_group;
+		goto err_free_object;
 
 	return 0;
 
-err_sysfs_remove_group:
+err_free_object:
+	mxt_free_input_device(data);
+	mxt_free_object_table(data);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
 	return error;
 }
-- 
2.19.2

