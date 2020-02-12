Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36BF915A3AE
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728519AbgBLIq0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:46:26 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:34506 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728650AbgBLIqZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:46:25 -0500
IronPort-SDR: j6jrWTeEKbtG2Va7gI/oGHbhGnQWvlMrBjE+lMxUUs9OGIxSqbRCbF0TaiLTJjehpm48EMl46C
 qZS9es9CRghUh1NFrD00nCKcDHjyr12taN5TzddPh+YZZTPJNsQMQH3LG/r0+4TEb0Y1fJcUqT
 wE6w/0RxfXzhbbgVC5KDAEsc2kGrWu/kS7D03O4SquhG5DUwNvWF9dZ77gnNSYflOTsSsrPKL7
 99mYSqvN+lzq46qI0PDWxAApz6aRrc0OkLOUUnKTrXzdnVnQHE2xL2Cc6DStr7ytn91KnXxxgd
 0zo=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686269"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:46:24 -0800
IronPort-SDR: Gh9d+LeU9PTJdoL+WaV+JAtF9KUDF2XVJwZmY1Dn+P8ANG1jCmB2Tb+XxU000Sku8XQS4MVnF4
 rxzsjVlBD6R/vVzZ2phDgaI+crXVrFziJFanNRvdHuQb6eQq8Ckf3+IHu1z6pIMFmkaQFPXtmO
 CTLiNItau9oFNeVNHIkHsQFAhay38/XBbWr0IXIfxbbgWmyaPoyVA3UznGUa4gg7qx0fNC4fXe
 ljg4IC1whJ1yMTBqnkKQMT4SQEMFaFGA2RJlaBHy0Yzq1d21FkYb0vmjQnx6ianDLfX+dS7si3
 5q4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 33/48] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Wed, 12 Feb 2020 00:42:03 -0800
Message-ID: <20200212084218.32344-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 3c15ce499e34..b4ec565ee7dd 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4082,6 +4082,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
@@ -4114,6 +4127,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	return error;
 }
 
@@ -4123,6 +4140,10 @@ static int mxt_remove(struct i2c_client *client)
 
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

