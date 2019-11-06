Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01949F0FC8
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731490AbfKFHDB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:01 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36314 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731485AbfKFHDA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:00 -0500
IronPort-SDR: 2xtyVBOC3oYitvUTyaC5gNqov9cOd/0BwDWqqFth/wGJ5kWRFM5jyawDMBXVB1B2qWYzduzomP
 dyaRO0nndrBAlvTuzRMxX1lFKNRA7USdqtDPnjGLvZB6bmLfD9PglwEI5BB6z65B1nvs5jp9/A
 6bkzXQX+bnWN5FMXt+C6XFEbG1opwgK4+xZwYiuNqoEG6HFZHA9qfTB7xEY59KM4b479F8P//o
 whHEgQnD5tX77gLO5aWmtLgMwqjkY20HS4baTrLOl6HjK68ZoJAmAytc94VfnpDLvx845qgLmg
 OnI=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42943623"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:02:59 -0800
IronPort-SDR: DwoxQuB9xilbDF2L4L9t1oHu9CxEkbirKgNK1xQSxXxh653EmfVOf4FxtnfMI8rrM/63nXq6MF
 OQY9XY2J03ZB2Ao8Mw14rS0PuqlC1IV/XC+dBZPYH+yrYQB5Daxnvt+MymdKGr4WHB203wl5xt
 Uau+w5yGINBDmiq4qEGlVmWKP7Gsrbpn80q7Yzf/7dbJHjkxOMufu10Q9lw0bFjMIjTXo3Qnqu
 DnJYjR3K/1IGkGv+SyrGZlr6s2JQ5kf5ORJT7kr+Ug08ubQyVcMo0h5Ej8bgoZfukAIUbH8dNz
 +0s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 17/48] Input: atmel_mxt_ts - allow input name to be specified in platform data
Date:   Wed, 6 Nov 2019 16:01:15 +0900
Message-ID: <20191106070146.18759-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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
index 362b7630ec6e..9ee3b6d40c8c 100644
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

