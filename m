Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 834779DDF9
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbfH0GaX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:30:23 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48242 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729361AbfH0GaL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:30:11 -0400
IronPort-SDR: DskCI2MMW1VGmjQf83UR7m+fpv/OpYwWcAsbHZ5DWZZ72nldbTNtRLuwclUl5KmIoj+nQlAji2
 7LgGEiV9QX1AXF9pNuRYccgHk5rsmowsXax6Gfa7R0mKKX5Z0BUKvNjJPl0sH/8XawumktCJSr
 My6D80BP5eVfG+wcbj36r7sl15i++MM5f6zMdVaotWYMrvKvqdrOA00l38ZpPl3oXLO/bu2lGj
 l3t2LBnaVXaYIozAL68pnlXARXsmx1RY/XHEOvstKa3qKzyGHHutKIcJF6G6wnaRIcgqLjsKjg
 YLg=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784581"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:30:10 -0800
IronPort-SDR: H/5tCJYOw5M6NKM4dpcioTEvKmfz4rVtckvmhCVPCwKIjhoiFiKxLABRwD0GOdy6DDOD+p1kST
 Zx6a+gk+CcyIbd3Ac5QhnNAcjFs3Ic04c6HzFpp3v/6sAoKDk30d/Q0eelZw73D9nDM5WEwWj7
 4ntmZ631XDXomLX37FA9i4SWAypRr3ORmbqPdmPQXp5d8LeJ8UMuaIfUNIGViS9MjgueIfIxDy
 K/FFtiTwinJCU8PduvnGE0fRj+pzEUj/v/QJ2usbjef4BiRJ4hKuhYq4AxcKVd+QJnMSgK7CI0
 tvM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 32/49] Input: atmel_mxt_ts - Change call-points of mxt_free_* functions
Date:   Tue, 27 Aug 2019 15:29:58 +0900
Message-ID: <20190827063015.20794-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063015.20794-1-jiada_wang@mentor.com>
References: <20190827063015.20794-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index f6d65930885a..f8e80471be8a 100644
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
@@ -4098,16 +4094,21 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
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
2.19.2

