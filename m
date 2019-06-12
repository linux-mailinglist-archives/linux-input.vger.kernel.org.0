Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6F0744963
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbfFMRRF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:05 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34702 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfFLV1R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:27:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id c85so10427222pfc.1;
        Wed, 12 Jun 2019 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UTON91ZfxEEKURTGvwC2Cul5nEoSiuWliGOjKAxWJDw=;
        b=HmY8TAQsf850la+zuBzhFmlN7trg5fn1Ci88dn7pE9QSr/UJm4DnutdRp0nFhQft9o
         ksMWxQlDK5UXgi2WUbvod71vzV9cPqKJGUnB2dPYS+bkPfJ5huabHVu5T/PCpvqGcNMm
         D+hrt3ZtLRwI+KucgTYu6jikQ8zCug7zQxydoj9SjnQ+ZyczTJK+6K+s1qL4u2zRmkUz
         Q3oA3rjYnMuMwDLDhw4zNkOrwM1Qqb5/j9KZhBeD9VjkCxxBGue0U//tLD6z+6G1Lfdw
         1Ifs0Vo8YEKv5NHCZzYAPHVJs9G97HRaPl/pBCeQUMPv1Zq5HFVcxGNp4gGj3OTrKTO4
         ki/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UTON91ZfxEEKURTGvwC2Cul5nEoSiuWliGOjKAxWJDw=;
        b=NGBgsCl+Ew2xXgiOYD9RAHZh2JEpGHjwHleC3SdChEwiL3UqybS+LdWn0c9d02rKdR
         X0a4Hpbdht+lnRZKcPSBJZiAK2xPxp0jPGnwTPBw/qULVU9u7T5jvi2JivsWRjaO9rYU
         HimbAgIVXbk2zyzPusgne/MH8caqEsr2rXSrs+6Jq/QWlkSi8HVwn63rBMWhS/ei/7/z
         VlhK8WgeMg6ctDq7hHU9RZ65NB/JraSUkOFnyXyhxIhR5EQbV6Dfq/0yerRgVg7uAZI5
         JdLh7/AxFUtXUq9wMn+PfiW09oXOxBcQPcyAPGWQWo/uIEaatoh0nltAmsDI5hi4mZCa
         +JVg==
X-Gm-Message-State: APjAAAVpwHvJrm76wyVlH6V9vK6pEIplbEM4cE9XjdPojHRtD4FaoBro
        q0/fEhOEoosNzNmhTfLiPnw=
X-Google-Smtp-Source: APXvYqyx6sRf/LFDxx8vjUtoCpO6804d+hcdeUXqtQq57Nq65VEsOWdQJR6p/wNw+FbyNW8iieaIdA==
X-Received: by 2002:a62:62c1:: with SMTP id w184mr87585605pfb.95.1560374836201;
        Wed, 12 Jun 2019 14:27:16 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id x7sm449042pfa.125.2019.06.12.14.27.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 14:27:15 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org
Cc:     hdegoede@redhat.com, bjorn.andersson@linaro.org, agross@kernel.org,
        lee.jones@linaro.org, xnox@ubuntu.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v6 1/5] Input: elan_i2c: Export the device id whitelist
Date:   Wed, 12 Jun 2019 14:27:12 -0700
Message-Id: <20190612212712.32144-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
References: <20190612212604.32089-1-jeffrey.l.hugo@gmail.com>
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

