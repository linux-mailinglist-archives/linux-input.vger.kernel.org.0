Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B57B326704
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 19:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbhBZSnE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 13:43:04 -0500
Received: from mga17.intel.com ([192.55.52.151]:28289 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229545AbhBZSnE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 13:43:04 -0500
IronPort-SDR: rDI9yPTONGmL6MsH9UjC+CTMjLKi+wMbk/H+JhTiVZT04dKn0OZuNZ4Lq5zuFKcGE9Xer39Aal
 dV4p8xPIqrDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="165826680"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="165826680"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 10:41:18 -0800
IronPort-SDR: bL1XGi92rH/3RGsWFz4Wyypgta23yvFeP2vhh3M12Ms4x4mV2wB5tvQhPN7OuosUVB/M7+QXSK
 5NwOTWi4VG5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="594642279"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2021 10:41:17 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5EA0317E; Fri, 26 Feb 2021 20:38:56 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v1 1/1] HID: i2c-hid: acpi: Get ACPI companion only once and reuse it
Date:   Fri, 26 Feb 2021 20:38:54 +0200
Message-Id: <20210226183854.11608-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently the ACPI companion and handle are retrieved and checked
a few times in different functions. Instead get ACPI companion only
once and reuse it everywhere.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

It depends on previously sent patch that moves GUID out of the function.
If needed I can resend all of them as a series.

 drivers/hid/i2c-hid/i2c-hid-acpi.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index d35ff3f16a5b..b438806f7cb3 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -48,26 +48,19 @@ static guid_t i2c_hid_guid =
 	GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
 		  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
 
-static int i2c_hid_acpi_get_descriptor(struct i2c_client *client)
+static int i2c_hid_acpi_get_descriptor(struct acpi_device *adev)
 {
+	acpi_handle handle = acpi_device_handle(adev);
 	union acpi_object *obj;
-	struct acpi_device *adev;
-	acpi_handle handle;
 	u16 hid_descriptor_address;
 
-	handle = ACPI_HANDLE(&client->dev);
-	if (!handle || acpi_bus_get_device(handle, &adev)) {
-		dev_err(&client->dev, "Error could not get ACPI device\n");
-		return -ENODEV;
-	}
-
 	if (acpi_match_device_ids(adev, i2c_hid_acpi_blacklist) == 0)
 		return -ENODEV;
 
 	obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
 				      ACPI_TYPE_INTEGER);
 	if (!obj) {
-		dev_err(&client->dev, "Error _DSM call to get HID descriptor address failed\n");
+		acpi_handle_err(handle, "Error _DSM call to get HID descriptor address failed\n");
 		return -ENODEV;
 	}
 
@@ -94,6 +87,12 @@ static int i2c_hid_acpi_probe(struct i2c_client *client,
 	u16 hid_descriptor_address;
 	int ret;
 
+	adev = ACPI_COMPANION(dev);
+	if (!adev) {
+		dev_err(&client->dev, "Error could not get ACPI device\n");
+		return -ENODEV;
+	}
+
 	ihid_acpi = devm_kzalloc(&client->dev, sizeof(*ihid_acpi), GFP_KERNEL);
 	if (!ihid_acpi)
 		return -ENOMEM;
@@ -101,14 +100,12 @@ static int i2c_hid_acpi_probe(struct i2c_client *client,
 	ihid_acpi->client = client;
 	ihid_acpi->ops.shutdown_tail = i2c_hid_acpi_shutdown_tail;
 
-	ret = i2c_hid_acpi_get_descriptor(client);
+	ret = i2c_hid_acpi_get_descriptor(adev);
 	if (ret < 0)
 		return ret;
 	hid_descriptor_address = ret;
 
-	adev = ACPI_COMPANION(dev);
-	if (adev)
-		acpi_device_fix_up_power(adev);
+	acpi_device_fix_up_power(adev);
 
 	if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
 		device_set_wakeup_capable(dev, true);
-- 
2.30.0

