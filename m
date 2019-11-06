Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4165BF0FC2
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731068AbfKFHEM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:04:12 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:8786 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbfKFHEM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:12 -0500
IronPort-SDR: Vvd0jmYL+fzssprkU+UybLzk/tsqkZGtfAbb+YSukEBrroIPozU2LO2G6dJfk63CF3n8pfGQ02
 iQvyI85A6YAqDIQ1eJu7v01ZJYpoulfb7ilElp3dh8tf0q7r0Dj+S/HDbpge0MuqijU+AgPHvN
 Fru5KZ2qLRwbrPG7wLTLz6aK5BfY8dsTyyCiNgEQ/PETsffJOueuFV4tbCBTgtepcnGJ41GYNu
 qm8mWubekekwzCWTEynoWcKenmWj9+Xi7Z2zNQNnxgfEdgrMi4cZS+H1d+oFP6Vg0hC7OjirxD
 idE=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42908658"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:58 -0800
IronPort-SDR: ihCJ1niPX9PUZjW1dq4EvpoDM2UhKD6ohADgxg/TaNMN9mDimuSfDgWAa12ucMAZSN2E341wUG
 u6LoS8OGZKMgK+d1MTlJypSlkgM54fS8kKNAWiBcFURc0BUMSictsh0V7J3oRK20DLc0qIu/OS
 CxgU5H4Z3PBCrxxQ4noUWCM2Q8ZN8OLrxZxhEbcMFahGxMoreNt/GgUwvvPZvIIfCFK++S6FI5
 +RZPIhDUzghomPW6hNJOGDcTMMOcAKH7qHOOnblTsy7Vze8dKTIE+1D0Dly8fh4sIVcgXj2NkH
 YQo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 33/48] input: atmel_mxt_ts: export GPIO reset line via sysfs
Date:   Wed, 6 Nov 2019 16:01:31 +0900
Message-ID: <20191106070146.18759-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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

