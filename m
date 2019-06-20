Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33EE74D06F
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 16:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfFTOde (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 10:33:34 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34275 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfFTOde (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 10:33:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id c85so1800758pfc.1;
        Thu, 20 Jun 2019 07:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UTON91ZfxEEKURTGvwC2Cul5nEoSiuWliGOjKAxWJDw=;
        b=D3PWLWvLJ4tYoFl+2mv/oW+vgtu0ykWO5P4xUF3LEOEuWFsURxZ+j4vavQPNOXs7Qo
         24Z/v9V6hcKIfl57fh8zFrloQQ97Q9YbbUSqKyff1545ifAwPlIbH8qor8gC4uGNRYpe
         1Bt9MRMh6sjqONGnnHaCWg5u64KjpIgqM8mL+ICGIZceF+ewjuZrQuHPUTKRUSp01lYh
         /qmaGKVourkLaMLwMdNCGpYvloLkechjFU4UCleGJimT/cceyzXNepZPZ8Qn/jxIS6FX
         aFL6NMc8f1fLzhF/Hj+60ukseFsN9fiE7i9otP3LDv2fnyt3ekm1P9Lrv7DqQK/tOQt3
         boag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UTON91ZfxEEKURTGvwC2Cul5nEoSiuWliGOjKAxWJDw=;
        b=qSFU1oK6DcM/GrjtXfYKZqa+XM85x3x2LZ0XzL8qqFGOd8RLDysYo5Ic1bV4leVpX4
         nfQgmZt06hWW70YPiRgVBsVsxbsl5xH8JzTGsHTL9oiax/WZUhbQZeOQ8QYGcvIISQz+
         lD1bITxWSTbVO+DR3g6s0C3ALKWcl9Y2BueTNog5XpAPj4h40bBSqv4TdEHL6LRwuWfd
         QjbxVA2FfOox+tq8nxkQec7c+w2R8kNJGgmo8a283Fk9TfliG40AYdr7kdYsY1mZ5ga4
         UUd5Zb0ya2/438tUIwijwxK5quo1DmzVgP7tmbZEOhtM3CHYcZ1dV7ksfnSJeM35prDd
         6I8g==
X-Gm-Message-State: APjAAAV4xWD2VGm3WRJQgbNLPBRkNHmHxzVHnjcGGK4t/USGZAKqDzGb
        7d7eWSydXCeEfnP/IdK7wzB2YO8K
X-Google-Smtp-Source: APXvYqzrPOwWwkZqlpBMpcqyaNlMZElk4J962MjXXnUGIcZotaPt1OQOtb/KKPmi/Aw6zYU42YSqsA==
X-Received: by 2002:a62:cf07:: with SMTP id b7mr73325456pfg.217.1561041213153;
        Thu, 20 Jun 2019 07:33:33 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id m19sm14040131pjn.3.2019.06.20.07.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Jun 2019 07:33:32 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v7 1/5] Input: elan_i2c: Export the device id whitelist
Date:   Thu, 20 Jun 2019 07:33:18 -0700
Message-Id: <20190620143318.11880-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
References: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Elan_i2c and hid-quirks work in conjunction to decide which devices each
driver will handle.  Elan_i2c has a whitelist of devices that should be
consumed by hid-quirks so that there is one master list of devices to
handoff between the drivers.  Put the ids in a header file so that
hid-quirks can consume it instead of duplicating the list.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 54 +----------------------
 include/linux/input/elan-i2c-ids.h  | 68 +++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+), 53 deletions(-)
 create mode 100644 include/linux/input/elan-i2c-ids.h

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 65cd325eabc3..74585712e979 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -37,6 +37,7 @@
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/input/elan-i2c-ids.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
 
@@ -1375,63 +1376,10 @@ static const struct i2c_device_id elan_id[] = {
 MODULE_DEVICE_TABLE(i2c, elan_id);
 
 #ifdef CONFIG_ACPI
-static const struct acpi_device_id elan_acpi_id[] = {
-	{ "ELAN0000", 0 },
-	{ "ELAN0100", 0 },
-	{ "ELAN0600", 0 },
-	{ "ELAN0601", 0 },
-	{ "ELAN0602", 0 },
-	{ "ELAN0603", 0 },
-	{ "ELAN0604", 0 },
-	{ "ELAN0605", 0 },
-	{ "ELAN0606", 0 },
-	{ "ELAN0607", 0 },
-	{ "ELAN0608", 0 },
-	{ "ELAN0609", 0 },
-	{ "ELAN060B", 0 },
-	{ "ELAN060C", 0 },
-	{ "ELAN060F", 0 },
-	{ "ELAN0610", 0 },
-	{ "ELAN0611", 0 },
-	{ "ELAN0612", 0 },
-	{ "ELAN0615", 0 },
-	{ "ELAN0616", 0 },
-	{ "ELAN0617", 0 },
-	{ "ELAN0618", 0 },
-	{ "ELAN0619", 0 },
-	{ "ELAN061A", 0 },
-	{ "ELAN061B", 0 },
-	{ "ELAN061C", 0 },
-	{ "ELAN061D", 0 },
-	{ "ELAN061E", 0 },
-	{ "ELAN061F", 0 },
-	{ "ELAN0620", 0 },
-	{ "ELAN0621", 0 },
-	{ "ELAN0622", 0 },
-	{ "ELAN0623", 0 },
-	{ "ELAN0624", 0 },
-	{ "ELAN0625", 0 },
-	{ "ELAN0626", 0 },
-	{ "ELAN0627", 0 },
-	{ "ELAN0628", 0 },
-	{ "ELAN0629", 0 },
-	{ "ELAN062A", 0 },
-	{ "ELAN062B", 0 },
-	{ "ELAN062C", 0 },
-	{ "ELAN062D", 0 },
-	{ "ELAN0631", 0 },
-	{ "ELAN0632", 0 },
-	{ "ELAN1000", 0 },
-	{ }
-};
 MODULE_DEVICE_TABLE(acpi, elan_acpi_id);
 #endif
 
 #ifdef CONFIG_OF
-static const struct of_device_id elan_of_match[] = {
-	{ .compatible = "elan,ekth3000" },
-	{ /* sentinel */ }
-};
 MODULE_DEVICE_TABLE(of, elan_of_match);
 #endif
 
diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
new file mode 100644
index 000000000000..8130bbebbdda
--- /dev/null
+++ b/include/linux/input/elan-i2c-ids.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Elan I2C Touchpad devide whitelist
+ *
+ * Copyright (C) 2019 Jeffrey Hugo.  All rights reserved.
+ */
+
+#ifndef __ELAN_I2C_IDS_H
+#define __ELAN_I2C_IDS_H
+
+#include <linux/mod_devicetable.h>
+
+static const struct acpi_device_id elan_acpi_id[] = {
+	{ "ELAN0000", 0 },
+	{ "ELAN0100", 0 },
+	{ "ELAN0600", 0 },
+	{ "ELAN0601", 0 },
+	{ "ELAN0602", 0 },
+	{ "ELAN0603", 0 },
+	{ "ELAN0604", 0 },
+	{ "ELAN0605", 0 },
+	{ "ELAN0606", 0 },
+	{ "ELAN0607", 0 },
+	{ "ELAN0608", 0 },
+	{ "ELAN0609", 0 },
+	{ "ELAN060B", 0 },
+	{ "ELAN060C", 0 },
+	{ "ELAN060F", 0 },
+	{ "ELAN0610", 0 },
+	{ "ELAN0611", 0 },
+	{ "ELAN0612", 0 },
+	{ "ELAN0615", 0 },
+	{ "ELAN0616", 0 },
+	{ "ELAN0617", 0 },
+	{ "ELAN0618", 0 },
+	{ "ELAN0619", 0 },
+	{ "ELAN061A", 0 },
+	{ "ELAN061B", 0 },
+	{ "ELAN061C", 0 },
+	{ "ELAN061D", 0 },
+	{ "ELAN061E", 0 },
+	{ "ELAN061F", 0 },
+	{ "ELAN0620", 0 },
+	{ "ELAN0621", 0 },
+	{ "ELAN0622", 0 },
+	{ "ELAN0623", 0 },
+	{ "ELAN0624", 0 },
+	{ "ELAN0625", 0 },
+	{ "ELAN0626", 0 },
+	{ "ELAN0627", 0 },
+	{ "ELAN0628", 0 },
+	{ "ELAN0629", 0 },
+	{ "ELAN062A", 0 },
+	{ "ELAN062B", 0 },
+	{ "ELAN062C", 0 },
+	{ "ELAN062D", 0 },
+	{ "ELAN0631", 0 },
+	{ "ELAN0632", 0 },
+	{ "ELAN1000", 0 },
+	{ }
+};
+
+static const struct of_device_id elan_of_match[] = {
+	{ .compatible = "elan,ekth3000" },
+	{ /* sentinel */ }
+};
+
+#endif /* __ELAN_I2C_IDS_H */
-- 
2.17.1

