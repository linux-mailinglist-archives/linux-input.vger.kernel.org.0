Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49663E825B
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733005AbfJ2HWP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:22:15 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:7825 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732984AbfJ2HWO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:22:14 -0400
IronPort-SDR: uoBub0NMDjgPDlkcB4bWhFwYV+k1eL4LYCm5dIphnoTg4z+gV68y8uRSub4XAOSXgXOYv/4EYY
 z1zriIS5n7kQppVs/hXi06ZxhZX+4cbztmeE9DHVWOdy9hfHg8ZZBSgIr7SqglnI2wFJSvBDHh
 V+csMDN08DJLWEdiYQ4dyM82uHf+6JhTcOOX9qk74GrjLbu8sRDYoGttM0qnBvBglym05NnXPJ
 0UUeN1C5r22CimhjiOkqBbAqgPdAn0YvqeuYx+B7ts745ef35EO8oerSdmzkQiiR1UlnQxGI9T
 Xb8=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="44509425"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:22:13 -0800
IronPort-SDR: TT4A7F9H1jaUUokg1UQTEv9q0hLn0kJ+wIHg9hhWp144cfK6wJIVrwacIYdCW43FQCMdkUlIg+
 JOrxdIOWfKTF3l9p4NarGLFCzaw3wka1ja1nVlVrpF9sEpav6ApUiXK3cf8UyWmg2DTU2SBBnX
 PZ5njnmbsBqOW0omEpPv6SORF+UOUo7zAHTu3ZsevT9otOiCyIZ8me5P1E6SSzUBSsGH6ocMwe
 j+Mo5DPTOsY/ROxZIVyV6JPOAXp0t+ka2Njswh5lHaDU69jtwqwyQLJKFGZ3lsjn0uhRS+mfEZ
 vwY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 33/48] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Tue, 29 Oct 2019 16:19:55 +0900
Message-ID: <20191029072010.8492-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index 21c29a8db794..8708bbb877cf 100644
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

