Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DEE32677F
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 20:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhBZTgs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 14:36:48 -0500
Received: from mga12.intel.com ([192.55.52.136]:43224 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230212AbhBZTgn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 14:36:43 -0500
IronPort-SDR: NYq5XWYqFkzWKjDlzC4FF39SnJZbKBkEnofGX3Ol9tzH/WMTaBgmsIFe9JdZcJwlTpSw4vqod4
 FbcuZ3j/IdIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="165195469"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="165195469"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 11:34:48 -0800
IronPort-SDR: pGtGVYUupHM0ZQHpyOyNPVYf+iuxYF7RTrSq7NcyCCyLINPVB+mMx/6oBLVPnzCTzU4i50NHdc
 sEbfdr9zBORw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="584709647"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 26 Feb 2021 11:34:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 82C8654A; Fri, 26 Feb 2021 21:32:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 3/4] HID: i2c-hid: acpi: Move GUID out of function and described it
Date:   Fri, 26 Feb 2021 21:32:24 +0200
Message-Id: <20210226193225.47129-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
References: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
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
v2: rebased on top of patch 1 that used to be separate change
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index 70955f21349a..a4810f199d59 100644
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
 static int i2c_hid_acpi_get_descriptor(struct acpi_device *adev)
 {
-	static guid_t i2c_hid_guid =
-		GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
-			  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
 	acpi_handle handle = acpi_device_handle(adev);
 	union acpi_object *obj;
 	u16 hid_descriptor_address;
-- 
2.30.0

