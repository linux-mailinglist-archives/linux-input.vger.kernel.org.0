Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 860D080689
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2019 16:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfHCOMd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Aug 2019 10:12:33 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:32883 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725954AbfHCOMd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Aug 2019 10:12:33 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so34657813plo.0;
        Sat, 03 Aug 2019 07:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPhxaN9yxizWGXlh+FVE6Ptl44WglH2FKaiYo1QiZeE=;
        b=uJqBB2Xbzxi5XXMHf67mXlHdXz6Ro9XPQ6TF6I8pmQoS3gs9b9U+zOAZJFdqPqThRS
         rYdOix3cmsjbcwrESA2NcJcQ/v5Wt8nVTETCbayrDYc8Ubs2tnaxZDNjMsr8oNbqtFU8
         zVB+sU/Fi1iiaFEZfSvKbkkBck3mj8/Uh6UNjK0ruF5AZaQ3SmxbDSGG8aPdc2KSjJvS
         DCO5gSkctaZ9iZkMYohNtRNWU4vUdM37X50h3HHN2cqkqiNSf6CeUepsRbDVQWno9F65
         /rxSg2g+pvmA9OwN0r13V5zvkeSgV5TCXd8vlOyl5cP6lUig5DRlfw1gkLb3Twvm+cpj
         gTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jPhxaN9yxizWGXlh+FVE6Ptl44WglH2FKaiYo1QiZeE=;
        b=RxzuT/GXtc60RPbDUfXNWfxqmQsEdqvf4vA0IXk6Gn4CFwmdPAMbk56lGqoYBur1nR
         g+As49NMANUNlVboEDVuBgj8tBVMoT47wQyQRzsbW32EpWkKcxxzAtwA6JAn4In0c+Uq
         6L6azfyG34qZsZy5rPBJo0rUBInQ7iu7gQOEqmqX6CGRzeHGF6G0dQ0fzgf6PIjNTL03
         AXdAVNXRqoToRY8+BnEhQ3QM9EGisLTz0DKPQMm2lmELmLpMJfgO92Akl+K2TmQRmGjA
         8FcC3HLK1wb5Aam4+GHXIrQweBUE7Gd5OGKj2xtKRRPsNHZzDcFCITQSgSLjH+HYN+nF
         anvg==
X-Gm-Message-State: APjAAAV5MmTeLQgVMpaWKiyMX8ISb1drY20dGj8SXBVEBykHfUPeYwXC
        98pThLUis6AAuEGMktRPxjE=
X-Google-Smtp-Source: APXvYqw5QDlJDHNH34d5IQ3SA3Y42EN8fidOGtczOGAfRk3wdm7J/gXejFTUhgN+4wgQxiRS4IIOnA==
X-Received: by 2002:a17:902:b48c:: with SMTP id y12mr101188128plr.202.1564841552432;
        Sat, 03 Aug 2019 07:12:32 -0700 (PDT)
Received: from localhost.localdomain ([2001:ee0:491f:d660:1bb4:8d5c:97bb:479d])
        by smtp.gmail.com with ESMTPSA id o9sm46847092pgv.19.2019.08.03.07.12.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 07:12:31 -0700 (PDT)
From:   Giang Le <ohaibuzzle@gmail.com>
To:     hdegoede@redhat.com
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Giang Le <ohaibuzzle@gmail.com>
Subject: [PATCH] platform/x86: silead_dmi: Add touchscreen platform data for the Chuwi Surbook Mini tablet.
Date:   Sat,  3 Aug 2019 21:12:22 +0700
Message-Id: <20190803141222.9460-1-ohaibuzzle@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Giang Le <ohaibuzzle@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 4370e4add83a..72535b0268eb 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -136,6 +136,22 @@ static const struct ts_dmi_data chuwi_vi10_data = {
 	.properties     = chuwi_vi10_props,
 };
 
+static const struct property_entry chuwi_surbook_mini_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 88),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 13),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 2040),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1524),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-surbook-mini.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_surbook_mini_data = {
+	.acpi_name      = "MSSL1680:00",
+	.properties     = chuwi_surbook_mini_props,
+};
+
 static const struct property_entry connect_tablet9_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
@@ -646,6 +662,14 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "S165"),
 		},
 	},
+	{
+		/* Chuwi Surbook Mini (CWI540) */
+		.driver_data = (void *)&chuwi_surbook_mini_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "C3W6_AP108_4G"),
+		},
+	},
 	{
 		/* Connect Tablet 9 */
 		.driver_data = (void *)&connect_tablet9_data,
-- 
2.22.0

