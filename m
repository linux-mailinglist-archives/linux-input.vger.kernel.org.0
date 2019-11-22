Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF0E1067F1
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfKVI0H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:07 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:62576 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727007AbfKVI0G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:06 -0500
IronPort-SDR: mWpYpRVWBUQqtFNXBGa5e9AixcM/NZo4ZIEax3bHzvtL8IXKGlBKvWiyfvEfHZ9/NYGLnJdRqy
 XLNIWigDaHV8yKpthb6sAJTyM0FfU5/q2APLYrGkZTuVIw1Y7cEA2m8Jna18cRV7UcVieDZCqw
 avwSDBKJKFQkjHymQl+IFlqzjyi6lIF2jpU/7b+Yd7aygKiqnQGLPLO5DUlmXiAUKQJekRn1Rr
 eSqf/pDS/J/N6NY3QsMO8OgdZxHsYN1WrrFRSgjJ25F5FclnEXffLKBx66Dzl8oQyzaTqhi8wf
 3cs=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457621"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:06 -0800
IronPort-SDR: d9uHHP1QH23UTNue8XH0UmkzlCYjD/XiC3HyU8PpzRICQqy7CAi6iN7NxNl3BA0nCObtLd3M5I
 zbGxzYnYyLIraEyPwchcdJApmm/m854B7GENPOF2aymknBbHcN917l4p1grTuEffNNmXBy6hbZ
 B/5Ca6WxgpJVdWpvodnInEmrZF9aQ/6qS267UWL18QtUY5VDIEFFcNN3AkA34tSZqsvRFUrCtN
 pVp/8y8duXjyOlrCiBom4iO2unUY45UlSAHEgIXwPRoSgLu+/0wmTI+zmsD0pVbsZirnErN5SP
 Mxg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 33/48] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Fri, 22 Nov 2019 17:23:47 +0900
Message-ID: <20191122082402.18173-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index 3513413158c3..f357d353447f 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4085,6 +4085,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
@@ -4117,6 +4130,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	return error;
 }
 
@@ -4126,6 +4143,10 @@ static int mxt_remove(struct i2c_client *client)
 
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

