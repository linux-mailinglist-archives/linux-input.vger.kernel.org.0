Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6515232677B
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 20:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhBZTgg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 14:36:36 -0500
Received: from mga03.intel.com ([134.134.136.65]:22836 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229586AbhBZTge (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 14:36:34 -0500
IronPort-SDR: aRoO/1DtjZ5Pss0awOAlhQCstt1jiAk433dGqDCWs31if3FnrsQJJWFcD46cBaN4qtLwt0beCx
 SDgKUwtnMziw==
X-IronPort-AV: E=McAfee;i="6000,8403,9907"; a="186030723"
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="186030723"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2021 11:34:47 -0800
IronPort-SDR: WoMmuMPcC0dWiYJlMlJ1m6U5UpBKi5fmmakFoEKZoaH2mC5BMom8oEPOGCwLUns+Aox8wGp4cs
 NBtL4rNnNshg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,209,1610438400"; 
   d="scan'208";a="516620000"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 26 Feb 2021 11:34:46 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 6D84217E; Fri, 26 Feb 2021 21:32:28 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 1/4] HID: i2c-hid: acpi: Get ACPI companion only once and reuse it
Date:   Fri, 26 Feb 2021 21:32:22 +0200
Message-Id: <20210226193225.47129-1-andriy.shevchenko@linux.intel.com>
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
v2: used companion indeed everywhere (i2c_hid_acpi_shutdown_tail() included)
 drivers/hid/i2c-hid/i2c-hid-acpi.c | 36 +++++++++++++-----------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
index bb8c00e6be78..7225a6bc42f0 100644
--- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
+++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
@@ -30,7 +30,7 @@
 
 struct i2c_hid_acpi {
 	struct i2chid_ops ops;
-	struct i2c_client *client;
+	struct acpi_device *adev;
 };
 
 static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
@@ -42,29 +42,22 @@ static const struct acpi_device_id i2c_hid_acpi_blacklist[] = {
 	{ },
 };
 
-static int i2c_hid_acpi_get_descriptor(struct i2c_client *client)
+static int i2c_hid_acpi_get_descriptor(struct acpi_device *adev)
 {
 	static guid_t i2c_hid_guid =
 		GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
 			  0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);
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
 
@@ -76,10 +69,9 @@ static int i2c_hid_acpi_get_descriptor(struct i2c_client *client)
 
 static void i2c_hid_acpi_shutdown_tail(struct i2chid_ops *ops)
 {
-	struct i2c_hid_acpi *ihid_acpi =
-		container_of(ops, struct i2c_hid_acpi, ops);
-	struct device *dev = &ihid_acpi->client->dev;
-	acpi_device_set_power(ACPI_COMPANION(dev), ACPI_STATE_D3_COLD);
+	struct i2c_hid_acpi *ihid_acpi = container_of(ops, struct i2c_hid_acpi, ops);
+
+	acpi_device_set_power(ihid_acpi->adev, ACPI_STATE_D3_COLD);
 }
 
 static int i2c_hid_acpi_probe(struct i2c_client *client,
@@ -91,21 +83,25 @@ static int i2c_hid_acpi_probe(struct i2c_client *client,
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
 
-	ihid_acpi->client = client;
+	ihid_acpi->adev = adev;
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

