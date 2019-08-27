Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A63159DDF7
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728965AbfH0GaS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:30:18 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48242 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbfH0GaR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:30:17 -0400
IronPort-SDR: HwBritT05BXEgMVxW4Fcvbm47r95wpFbvCRWSdHon3BCN8eCPft2i+DhSAP+nvrUyVprqiybO1
 unhG8ZMLIM23A+zOand/pfmG3argQ7OSz6GcKyfOnxtW79DBSm02dzFqKaciC2mVMDGr7+bMxq
 z41YAj2vz0AAzjbx1ln9bZAoy1vviaCdJL/UVxwsL0FE/JJVB1vC2LdG+8Zxt/+noAqjw4P10E
 /H8oTBZT1Pbds8RwcPi+whBe9cTMSOYcHodY6fUxQVWvSx2rxjdEEThBQJ+/kLWA104FQ2N21y
 8pk=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784606"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:30:17 -0800
IronPort-SDR: mX0ea9I4EikrmnMVy5c2XjEbs9lxB8+p/fyIBGRTzweMG9hRbIFH8A/1acp9/XWqfKI3cNOFcP
 BXa0qotBEBssPQGS8n2OPXhq2W7nAAfwI/zvBsVdQ/YIdJmzbWMvngV/R120ZeUa/VhKZbS0H2
 h2gc32QRhVc7mRE8qbxLRHDq5GSqNsvBmgbjR7EL3m0GJpIIk8fEtIj9a1GcG2rIYnvN4Q96pF
 XBrE/tMGxuvyPg0ab5iOLkhxlCPk+PGKK5jSpbSEFosE/AuD6LKmGOgNYbVD63BzNAoycvHWsC
 C1Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 34/49] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Tue, 27 Aug 2019 15:30:00 +0900
Message-ID: <20190827063015.20794-5-jiada_wang@mentor.com>
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
index 560d46634bae..35f41bfa70d5 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4083,6 +4083,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
@@ -4115,6 +4128,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	return error;
 }
 
@@ -4124,6 +4141,10 @@ static int mxt_remove(struct i2c_client *client)
 
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
2.19.2

