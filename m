Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FAB192A0C
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgCYNgR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:17 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:4463 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727527AbgCYNgR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:17 -0400
IronPort-SDR: oz5X6c6AjZsi7xcFgeg7mjVp7BBt+SlVNkDgcC6P8WLu50WEHO9bh8LVJ1X+XCjfoAjBsYt2wK
 az7vL450E7wl+mESpOICDVacsnaPaUF7bTpFNyNL/d59TYQYy9hPwvK6/++bTGkt2wdjftOxUi
 LSe+BoS+kNB0HEWy50POIbqo8TBmrQX6P10G0h/JUR1FySNrlam53Nuj29DHt1IRugiiEgnmbE
 451CuA7kmw4o3yRSOfAFBIN0leoxOo17LATYKY9E/p/GSG4gqK9g7WOvSOOO6V9XdBgBeC2lzh
 GpM=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="49060144"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:16 -0800
IronPort-SDR: wemHVGpuDfqVgFkee+xweiSh3sX38l3UQypNUTVjo6pXBqgGqTDzfuqu9/M1KTkY5+ZAo1OY5q
 DBie9IbxOGdk7+OXz4Dqx1C7IsNqHCEgIcbNpqF0k+qkHlyS+KYskoBcRK4S5qDLJi/57O9o6a
 mDc6nkdogPvRG+Z8kIVwK5Xl6SGDLQhovCOw1hiIlYotf80ob6ooVP4/1acJW2rgivv1pOTW7c
 WEIJjsLjI56OQK9/84+bUntYd8BgGqHxQyu/U5uKmXVbjaDToMKwZ0Q5kgtANBiBnklqTSISlx
 6GU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 39/55] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Wed, 25 Mar 2020 06:33:18 -0700
Message-ID: <20200325133334.19346-40-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "George G. Davis" <george_davis@mentor.com>

N.B. Modifying the atmel_mxt_ts GPIO reset line during operation will
cause problems with normal driver operation.  This feature is provided
as a diagnostic debug aid.  It does not take into consideration any
pending operations which may be in progress.  Modifying the atmel_mxt_ts
GPIO reset line at any time will inevitably cause the driver to fail.

Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Rajeev Kumar <rajeev_kumar@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 11e65f32b1a2..cfeeacdd4084 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4091,6 +4091,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	if (data->reset_gpio) {
+		error = gpiod_export(data->reset_gpio, 0);
+		if (error)
+			return error;
+
+		error = gpiod_export_link(&client->dev, "reset",
+					  data->reset_gpio);
+		if (error) {
+			gpiod_unexport(data->reset_gpio);
+			return error;
+		}
+	}
+
 	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
 		error = mxt_acquire_irq(data);
 		if (error)
@@ -4123,6 +4136,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	return error;
 }
 
@@ -4132,6 +4149,10 @@ static int mxt_remove(struct i2c_client *client)
 
 	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	mxt_debug_msg_remove(data);
 	mxt_sysfs_remove(data);
 	mxt_free_input_device(data);
-- 
2.17.1

