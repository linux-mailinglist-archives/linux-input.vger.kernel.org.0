Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 047E98FE55
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727606AbfHPIkL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:11 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:27764 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfHPIkC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:40:02 -0400
IronPort-SDR: F9DTrPJA55NesLXuPoxg3vamdHQSXNSPtqgARIZO+Bk9bnnDqgC7uTflTUcxG5uQnHjnafBTue
 H1q2kJfohR1V4c/O4rYQPNGp/pMY7ZY4mfXKjvOS8dEAIJtlp7l6fRd9nvpMAesqSTw05948bG
 85aDKu0twoEUbiLvc6khsbs0LOBGOmeUdsrVmLm/6IUcgyEjZ6jm5t258kvDOq4FamJkDPQKVl
 Sy7MbvGHvg/Zqtz2whHSuKhG8VPp6Grbuc+fb9EnnavodVSZdR9eUCCRpMzTxhU38b6QYL3cWd
 BI4=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484245"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:32:55 -0800
IronPort-SDR: lYAhz9xCBrzuYt3eOGKhlctxdYXyjwsUdKrGgR0I3Nvnl/U6c+R0yCba88iEyaBptJzDPvLfrt
 ZaLvPDB0kHZfNgkJDUhUsBfDT36om2fpdRQKZ5g3El5cWosYmMqlf31k5K2nYvKpkJ73ewkXjb
 7GzXCi/hW2fZu2eMnOfddq6OfRZk8OO/qvyYvkmakRszfMjybN73k1MPM8JHTsZUaOhbYpQGHi
 o5Cc2XIWidc3VK82rOQK4KX1PnpDE8Pd49GMotuSXJJdH2RzhNPL/uT+X/oVgOefOSeIE+D65y
 tK4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 17/63] Input: atmel_mxt_ts - allow input name to be specified in platform data
Date:   Fri, 16 Aug 2019 17:32:11 +0900
Message-ID: <20190816083257.18546-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083257.18546-1-jiada_wang@mentor.com>
References: <20190816083257.18546-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index a5ac2cc93f3f..4f335c3da994 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -336,6 +336,7 @@ struct mxt_data {
 	char *fw_name;
 	char *cfg_name;
 	const char *pcfg_name;
+	const char *input_name;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2407,7 +2408,11 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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
@@ -3645,6 +3650,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 
 	device_property_read_string(dev, "atmel,cfg_name", &data->pcfg_name);
 
+	device_property_read_string(dev, "atmel,input_name", &data->input_name);
+
 	if (device_property_present(dev, keymap_property)) {
 		n_keys = device_property_read_u32_array(dev, keymap_property,
 							NULL, 0);
-- 
2.19.2

