Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E38BF0F9F
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbfKFHDx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:53 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:9055 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731689AbfKFHDw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:52 -0500
IronPort-SDR: Kb/86F87LJRkZwCLsBOs/St4ht/8xWcYJspTYwcDhEn+VSqui9WGfyGF/PTFW+eZlSV8puNm7/
 Wfqu7dC7d1i4a288Ehyt9wWcYNO2GSl+6RisUXvkzs1WgcKu/I3Ww6K0hWo4zZbz2t6f2Q2fD2
 NU8UhLg349UVkaXVDUXuE7QSHCvZZbeehnONSgFcFO1ieEB/EUR73jdbj1V3O8yJFAd1wD+A+D
 5D5NZeRe+PRaBa4hBmh2vzPLisHDyg9BzfOvOXdwfzGxEi/mljXVJ+Y0wKBjLYtJ4EXOatCx2D
 Afk=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42848298"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:51 -0800
IronPort-SDR: bt68+DTwGeoUwv53+eXuC47DcnXzFkTZex9sSH2+u7b2vuujfmhcRL7/fXiTdOSsSeyEd58fKt
 wP8RI/50oqGTaS7DBu4BKefilSao7IoBIAKPN1HclOaWEiBFCIxkl1YQXhC2suuFXxWfkQVAZm
 0s/4Qgm6y6q4OGQufsZFoRH8TFjFfaT/EoD3p3EmrUxR2RFAofddSUIvrrmI6LkvUD3/0FsD1E
 X8mboO8vHcX76fDpwKk9EQiu6c3Bm/SycRWsFT9PzL/hwwTA5dk3+ay5V1cdqrFtDs9Pl5pfca
 aco=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 31/48] Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
Date:   Wed, 6 Nov 2019 16:01:29 +0900
Message-ID: <20191106070146.18759-32-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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

