Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C47994EB11
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 16:50:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfFUOus (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 10:50:48 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44354 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726031AbfFUOus (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 10:50:48 -0400
Received: by mail-pl1-f196.google.com with SMTP id t7so3109135plr.11;
        Fri, 21 Jun 2019 07:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GqVIjS+HeOIn32Cn3J+ZkUZUfYwZn/U216xOOvZPRAY=;
        b=YcVIF/ZIL4QWtxORovWk3eQzAU8FqKBkLmosNWGgHX3k0tiBSD0Mg3gwYUIXc2GUaL
         JXIpychTPbf+LATbUnu72bKxIqqyiSPlqFfrFFefP0GaZcTBWTfglRAni5UudTaBM8hj
         ZIBsASsdwkBsTl6unIUVCkKdoik8dYka4HRxn8aXUYpW2jKgyQ71hl4s/7ofJe53/I5D
         ci//OMczLs46F1c+K0E2dFJ2Pk1mJeDruIcHJ+VRUTCTRn95xFB4uKXM4h/ChQ9zIFYH
         hL3lQhifZ3UzxZfVYGpENEB8srB6TwoVU+QrOPCG/14ElwDuVkpb+N6Yo0oajHXudbJ9
         8HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GqVIjS+HeOIn32Cn3J+ZkUZUfYwZn/U216xOOvZPRAY=;
        b=Cef+7hczzJBbxTd6mANe1DBF5E5cUKpXNuNy+57SGYiEnIoT47sAY6sYiIrEenoTiv
         fJd92F9qfShBWzgqYETonqc1ACLoKGXKjQt6YSXJf+63rnmMj3gQzbs70Wb2o3/xYcS0
         KzJCFgAlVyLw5fKRX6KhUm/gWxa1P0AIzr/OQwy+bpiBv1hvM3s3FFn+py0Phvev2jba
         p2c8SLvBENLMql6Arygo8++k6Lr/GAw+X2VYTjbJ9QpDeZ6Re8DdnAaDdmTu1grw++Un
         8YetqvbgYXBLobQZKJUdpaKr8a04lRxLYpjVyPzPGWcxGK9LRk1jkllrm3l7cIAGaOph
         9IIQ==
X-Gm-Message-State: APjAAAUbx886wcR6BLxfegSW5LPVZvd7WphQRo9zoqoXx/xhl28HCECW
        rS9J/5mCYUibxLfh44pL01s=
X-Google-Smtp-Source: APXvYqwe9Y+U5AifT5+UIBArXXIDZrD+sNmTCKIR+qoKtbBQlWrwfXbqDtC/+y/QBtr+6awT/8Mu7w==
X-Received: by 2002:a17:902:7894:: with SMTP id q20mr120889318pll.339.1561128647385;
        Fri, 21 Jun 2019 07:50:47 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id y22sm3158782pfm.70.2019.06.21.07.50.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 Jun 2019 07:50:46 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org, hdegoede@redhat.com
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v8 1/5] Input: elan_i2c: Export the device id whitelist
Date:   Fri, 21 Jun 2019 07:50:42 -0700
Message-Id: <20190621145042.38637-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 drivers/input/mouse/elan_i2c_core.c | 50 +------------------
 include/linux/input/elan-i2c-ids.h  | 76 +++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 49 deletions(-)
 create mode 100644 include/linux/input/elan-i2c-ids.h

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 65cd325eabc3..e2c824abd19c 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -37,6 +37,7 @@
 #include <linux/completion.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/input/elan-i2c-ids.h>
 #include <linux/regulator/consumer.h>
 #include <asm/unaligned.h>
 
@@ -1375,55 +1376,6 @@ static const struct i2c_device_id elan_id[] = {
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
 
diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
new file mode 100644
index 000000000000..ceabb01a6a7d
--- /dev/null
+++ b/include/linux/input/elan-i2c-ids.h
@@ -0,0 +1,76 @@
+/*
+ * Elan I2C/SMBus Touchpad device whitelist
+ *
+ * Copyright (c) 2013 ELAN Microelectronics Corp.
+ *
+ * Author: æ維 (Duson Lin) <dusonlin@emc.com.tw>
+ * Author: KT Liao <kt.liao@emc.com.tw>
+ * Version: 1.6.3
+ *
+ * Based on cyapa driver:
+ * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
+ * copyright (c) 2011-2012 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ *
+ * Trademarks are the property of their respective owners.
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
+#endif /* __ELAN_I2C_IDS_H */
-- 
2.17.1

