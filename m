Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F31E8FE26
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfHPIif (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:35 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42029 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727366AbfHPIie (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:34 -0400
IronPort-SDR: XERSumQLEwzao22T1ipSoftfuHzTe66UGffkKgp67DHuqL/RMHZLLK0s1Nl1BWGKv4X8oQP2UY
 2qA2A3AcR9NJhmpqOErGP0p4RJDJCmwIpuBlYgnikRt3LJ8EbjHBCt6leqlXM8d+vKVix6VAxg
 TKNpebvMmGuW5HME0L9ZnIFOHLjcbgfD/xhoQWpneNJqKEZfB54DqdYFk4ylmhh3piwbao3G/q
 ltD1wj01rddUHhNX/MHicHr7fn6pe4LLhfqlz9yhpb5E5DCxVf5Z8sRfMnJCrFPQl4mtO1U7C6
 qJk=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507251"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:38:33 -0800
IronPort-SDR: T2VK5ySOgnjFEA/4txlIECe+/Xsy0+IXGiNFBMWiT5xDLZmg1LT3Gz8btLAPk5oTZ+IuOUDxJZ
 jzpP/q7IFXGoVI8K/as0d+WcMTDxGdUhVCSkZcLr0Wg2PDO7lF23ALiQ7ktWwhGZBYD4ub2EV5
 Wyl17Vb6e8UvZUyshjBjUZzuRskpwRuwwvs3C21ye8sDUZLJrKno9yqAuxZVFDVTjOB3rNPzNn
 hBawcgLu1i5mBAxTTr5syVjtoc04zYAAWwtAiUNf5GDhm57GwN7vmw+yUqHwPscF94UU5HXvXk
 mtc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 59/63] Input: atmel_mxt_ts: Prevent crash due to freeing of input device
Date:   Fri, 16 Aug 2019 17:38:26 +0900
Message-ID: <20190816083830.19553-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083830.19553-1-jiada_wang@mentor.com>
References: <20190816083830.19553-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bhuvanesh Surachari <Bhuvanesh_Surachari@mentor.com>

Move sysfs creation after intializing the input device to
prevent crash due to freeing of input device by function via sysfs.

Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 431c2c54eab0..8e95f46a30d7 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2962,6 +2962,8 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 		goto err_free_mem;
 	}
 
+	data->input_dev = input_dev;
+
 	if (data->gpio_attrs.attrs) {
 		error = sysfs_create_group(&input_dev->dev.kobj,
 					   &data->gpio_attrs);
@@ -2972,11 +2974,10 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 		}
 	}
 
-	data->input_dev = input_dev;
-
 	return 0;
 
 err_free_mem:
+	data->input_dev = NULL;
 	input_free_device(input_dev);
 	return error;
 }
@@ -4597,13 +4598,6 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_TIME);
 	}
 
-	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
-	if (error) {
-		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
-			error);
-		return error;
-	}
-
 	INIT_WORK(&data->watchdog_work, mxt_watchdog_work);
 
 	/* setup watchdog timer */
@@ -4613,11 +4607,18 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = mxt_initialize(data);
 	if (error)
-		goto err_free_object;
+		goto err_del_wd_timer;
+
+	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
+	if (error) {
+		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
+			error);
+		goto err_del_wd_timer;
+	}
 
 	return 0;
 
-err_free_object:
+err_del_wd_timer:
 	cancel_work_sync(&data->watchdog_work);
 	mxt_stop_wd_timer(data);
 	mxt_free_input_device(data);
-- 
2.19.2

