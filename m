Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F096715A38A
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:44:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728551AbgBLIoo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:44:44 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:45660 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbgBLIoo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:44:44 -0500
IronPort-SDR: qhFAQieqMWnkri35X66ssF8wXopCCRiTIBOZVRSVMh4qogazfGl4A6Ysx1jbMuEE1bi8dgmYRN
 95cSjmPQM3C4Nnc51TwL2ldne+bMPhzodYS0INJBImAwjOLQxN04Em+LwF7XW6P8gbDKicsX9D
 BBmAPKmGfcjRkd+z6Qj/WcJ262LaQN1Y3gV3Mb3nl5BOn/7QjmiLiq0qnotYxW1uNKjNxziaKk
 kRnefFiIhLlkdc53DZIGKoSM3MLJiCU5GiQWmhbjc0SHyW9oHHf1bkEJJV4TC3/ZWe5OOXEBXy
 vAs=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686211"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:44:42 -0800
IronPort-SDR: 0LzThaZ2+24WYYU+lSiM7IovoHEU3go1S68dtIj+W1owjnMsJxvEcuxQnpAqYct6W2qkU7wwCf
 0sFVAUZIM4ID2RKQuW07oOWmncSKcFCwgo595Inhosylu7PgQC43c9LvVV8MQKMGnUoKPr97ux
 Or2nYo+sst/IUaO+Lu/+IM92SSFGQw2QBT6Z3XPav1TVl/vBoXWbvvumsc4AKEWYL5Vxud+lGt
 ZLtI5i0tW0ISu9G31HHfvGIxk29zBMWtfY6HTNiHmHcvZCpHBugOR1jg9AEVMbK6xBEYnW80wE
 QQ0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 17/48] Input: atmel_mxt_ts - allow input name to be specified in platform data
Date:   Wed, 12 Feb 2020 00:41:47 -0800
Message-ID: <20200212084218.32344-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Android systems identify the input device and map to IDC file by using the
input device name. To avoid unnecessary deltas to the driver file, allow
this to be set from the platform data.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit cbf94a7bda754d2e1899d9f50313a0bccc91422d)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../devicetree/bindings/input/atmel,maxtouch.txt         | 2 ++
 drivers/input/touchscreen/atmel_mxt_ts.c                 | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index 713ce870805c..d7db16920083 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -40,6 +40,8 @@ Optional properties for main touchpad device:
 - atmel,cfg_name: Provide name of configuration file in OBP_RAW format. This
     will be downloaded from the firmware loader on probe to the device.
 
+- atmel,input_name: Override name of input device from the default.
+
 Example:
 
 	touch@4b {
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 84ad8daef7d3..b0a07d077016 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -336,6 +336,7 @@ struct mxt_data {
 	char *fw_name;
 	char *cfg_name;
 	const char *pcfg_name;
+	const char *input_name;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2412,7 +2413,11 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	if (!input_dev)
 		return -ENOMEM;
 
-	input_dev->name = "Atmel maXTouch Touchscreen";
+	if (data->input_name)
+		input_dev->name = data->input_name;
+	else
+		input_dev->name = "Atmel maXTouch Touchscreen";
+
 	input_dev->phys = data->phys;
 	input_dev->id.bustype = BUS_I2C;
 	input_dev->dev.parent = dev;
@@ -3653,6 +3658,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 
 	device_property_read_string(dev, "atmel,cfg_name", &data->pcfg_name);
 
+	device_property_read_string(dev, "atmel,input_name", &data->input_name);
+
 	if (device_property_present(dev, keymap_property)) {
 		n_keys = device_property_count_u32(dev, keymap_property);
 		if (n_keys <= 0) {
-- 
2.17.1

