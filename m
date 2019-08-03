Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6A8803B0
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2019 03:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388657AbfHCBWu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Aug 2019 21:22:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35070 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388638AbfHCBWu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Aug 2019 21:22:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id u14so36860414pfn.2;
        Fri, 02 Aug 2019 18:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rfhcFrsiK1eMaZLWOciK6JmRLSFVHvQ33G78MdUQfZ8=;
        b=NHlX7VGZmc9BoM7wwbp/Yy4E6TQZxfo/YxmYkjzOHGORl4muICxAXGWHf4OLJKaUVr
         qOTT5JGhZoDV2AHJqmMLrla9IADnvu1C1PsvyCHqdYg2pWYqFhGtQaq6B0fS+42wmNmr
         VeQVuFLlfCnwIKJK9+D6KDpxPokxEIWnL+xapq+v9HEVMfLfrMs+1jACBqEPROjB4duO
         GkjnP88xuC/J5SrQIK4NzUq0Vx0ZyDZeIWE6MP6rfgimQa4BPhx+1+q0w2rHXKBrqUGF
         ebcAHiMNlxqx2ZdUQoB+JH/0BzXFHMCQEHUCOYww871JebiUkQCAc6YTB/mxs9EAqI3U
         uz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rfhcFrsiK1eMaZLWOciK6JmRLSFVHvQ33G78MdUQfZ8=;
        b=JZCw0kOFOf+sMq7GFrVxMmxea0bK7qh2GZ8GyGD96wAOdmygog60lJku5XsNWb8cj4
         yQ7dLk5y0qmU/m2cPb/VWyquVsDw029kVPz7Tq0Sm8D/vPG8iQyc/CnbBFJMsE9R8Qz5
         Scwdoo3EpOm2PCQfly6hH0WJlucv89IajK263dL4aivkoAqx1A6NTqZScNRBVa/YUR+l
         enhw9GyYExxtXo2g1UHj2dCzrEvz2cQGxbmnbR4Dxo7uwqK8vXxmJfHM7caMsvG1mL3r
         +hdb6fOf37lLFrBJOy8C2+bwo4OSt7yI3egGoPzy95Jo4/H8iwa0m9x3mGSksyCx+MnQ
         yMIg==
X-Gm-Message-State: APjAAAUMq25Nm3pk2vSw4E5x8Lerw5Pf8gJcyxhHjqMSXevxLlWc9yG1
        xHslfqDG9ZYxsIUy0XSXGrE=
X-Google-Smtp-Source: APXvYqygOaJazj0lXej17ALNUYq/e5ccMUDgntSQuV0UINMXcEWEZJJOdl9Xw+VzuzYfXbIHtuazig==
X-Received: by 2002:aa7:9293:: with SMTP id j19mr64203812pfa.90.1564795369236;
        Fri, 02 Aug 2019 18:22:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:ee0:491f:d660:1bb4:8d5c:97bb:479d])
        by smtp.gmail.com with ESMTPSA id c98sm10064941pje.1.2019.08.02.18.22.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 02 Aug 2019 18:22:48 -0700 (PDT)
From:   ohaibuzzle@gmail.com
To:     hdegoede@redhat.com
Cc:     dvhart@infradead.org, andy@infradead.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Buzzle <ohaibuzzle@gmail.com>
Subject: [PATCH] platform/x86: silead_dmi: Add touchscreen platform data for the Chuwi Surbook Mini tablet
Date:   Sat,  3 Aug 2019 08:22:38 +0700
Message-Id: <20190803012238.4099-1-ohaibuzzle@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Buzzle <ohaibuzzle@gmail.com>

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

