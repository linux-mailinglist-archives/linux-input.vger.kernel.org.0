Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADC9199435
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730846AbgCaKxT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:19 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730645AbgCaKxR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:17 -0400
IronPort-SDR: ycolXrOiDrHeEYW+zGwwcI3xVGUL9n/DBKwcb8Agzuq9VEJzZbzxm4wx5WFcPFGQhdXfuqcVw9
 7gyarqsfi6Rz12UeiEmSMYRQeYxzhTbp6mZTVfp3GfMt0dXdS3mdgCw/KrLsfeyKik2KQUP0UD
 SkbTZr4S3ZRgS+HMUKeJ2xVaYc0o2iDW+xZqBpDliDTQndwgaik1ckHjyX6akT7i4loifIfdlW
 0ovWWytwa9voy/VvB7kFjQttUVPiVx9qqCGta5Nm8jhz6jycXSyiATY0K9cPSYPsN7y7CVwgID
 xqk=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330815"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:16 -0800
IronPort-SDR: vzjY3A4F7Mo6I59wU6uExtWjiYCeqGGiIsmrI8Co4bJdWvkosbU0s5FthYXXVUmUHTW6NMlR3d
 VpQq54Dc9unwYyqdwLa0wwMdPmHOs9XYaKS2iZL7moC8dwMH81j5PxrFKX7XcmqeWyC6Yn+y0U
 h/14dI+sj2vXAGbxcPw67dszRPwzpYGKVZ+lSn1nQ58RNhdxpSL7G7UvTXXn70I09drVnOPCic
 ltmpAn7ogFq9nkERFF2igkPnv5+gR/Bhk7rBQAo1b2EFwrEg46N04OXL0t3Kt0ejxGVVZ12kZR
 DaY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 37/55] Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
Date:   Tue, 31 Mar 2020 03:50:33 -0700
Message-ID: <20200331105051.58896-38-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 36a87d9b9c83..860e8ddd4c6b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3336,21 +3336,21 @@ static int mxt_configure_objects(struct mxt_data *data,
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
@@ -3358,10 +3358,6 @@ static int mxt_configure_objects(struct mxt_data *data,
 	mxt_debug_init(data);
 
 	return 0;
-
-err_free_object_table:
-	mxt_free_object_table(data);
-	return error;
 }
 
 /* Configuration crc check sum is returned as hex xxxxxx */
@@ -4106,16 +4102,21 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
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

