Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 229B01CA351
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbgEHF7i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:38 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:22062 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbgEHF7h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:37 -0400
IronPort-SDR: UAaKYMRmA706/bg+73rSkheG70dmXQmFw99jC7+QDpHPhAypEBa3Sbg+0J5ovSax3ypr0bJl84
 IdQDfIQ3lDrgo2XH/grH/I+ui1Mi2b/R0kZGCGwesA7iqtxYGbfVeE7ysC36rNBd8y2ISMn5yD
 sg+WpEhBv9pklM40LGVWyHlvzkpjZCer3xPaioucQi0hp7PVWDSBfwSl+6RlREfd5JXomjUGOl
 hGkgIL9aIaovgocPeI4yORwsbbNvUCt6fZva5zzFQsl/U9zlKvZhHgckiICTwm2U9p/Juel0k0
 k/Y=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589133"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:36 -0800
IronPort-SDR: G1BwukNXBxJLSkZMP2b9tF5jA2N/7RgTPIEnXtEjWjtuY7hXTE5wX7XZ1US6NHkFbdkftdxR0d
 aEmqUA8qWdKfJ7Kv9531H/hcrLGtj+R/eX0zYC/gdpugXvNbJlPejhhXzCPKqiQ2gcOrKOwx9q
 Vf7wLQIX3fljcP0AP/laVqrIrbryYvBbwkde2pag/h3ksUrCTBumGKCq+//w2nyjfNxwYiL9H+
 4UWc60ncp761XebFVLCJLG1QzpPuQZglXgFdtex0QkTLc0iMJr2RGgtL6xLlZPnXN1n8MNPJ7t
 JXE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 41/56] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Thu, 7 May 2020 22:56:41 -0700
Message-ID: <20200508055656.96389-42-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 75329f87927b..ceb14b4a8d4d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4080,6 +4080,19 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
 		enable_irq(data->irq);
 
@@ -4110,6 +4123,10 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 err_free_object:
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	if (data->reset_gpio) {
+		sysfs_remove_link(&client->dev.kobj, "reset");
+		gpiod_unexport(data->reset_gpio);
+	}
 	return error;
 }
 
@@ -4119,6 +4136,10 @@ static int mxt_remove(struct i2c_client *client)
 
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

