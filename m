Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FF73266E5
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 19:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhBZSaR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 13:30:17 -0500
Received: from mga18.intel.com ([134.134.136.126]:16485 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhBZSaQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 13:30:16 -0500
IronPort-SDR: hMt8p7GfM12B0DiM35XxHSWqKf1qylH/YL8OKUZY22asLY1zofWkUIe/SDwDhnezdlTV/MzHEg
 /id5MRmy3wgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="173605623"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="173605623"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 10:28:42 -0800
IronPort-SDR: KPMxEPn6Ik/l9l1nMGG8Qv2XbOUvvezy9WwSiysXHhVPOvyWpFtL+kQRyhc7KYEZejBegsg11n
 NkXdxc5JZB6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="434467518"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2021 10:28:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CECD517E; Fri, 26 Feb 2021 20:25:42 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Douglas Anderson <dianders@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v1 1/1] HID: i2c-hid: acpi: Move GUID out of function and described it
Date:   Fri, 26 Feb 2021 20:25:33 +0200
Message-Id: <20210226182533.6595-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move static GUID variable out of the function and add a comment
how it looks like in the human readable representation.

While at it, include uuid.h since the guid_t type is defined in it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index bb8c00e6be78..00bbd218f1e8 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -25,6 +25,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/pm.h>
+#include <linux/uuid.h>
 
 #include "i2c-hid.h"
 
@@ -42,11 +43,13 @@ static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
 	{ },
 };
 
+/* HID I²C Device: 3cdff6f7-4267-4555-ad05-b30a3d8938de */
+static guid_t i2c_hid_guid =
+	GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
+		  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
+
 static int i2c_hid_acpi_get_descriptor(struct i2c_client *client)
 {
-	static guid_t i2c_hid_guid =
-		GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
-			  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
 	union acpi_object *obj;
 	struct acpi_device *adev;
 	acpi_handle handle;
-- 
2.30.0

