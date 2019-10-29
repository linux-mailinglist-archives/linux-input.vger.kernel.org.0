Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80946E8257
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbfJ2HVR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:21:17 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:18659 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730457AbfJ2HVR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:21:17 -0400
IronPort-SDR: bfS1d7rNXXVYpTw8NROtCMd2jGudsbeqju2tc3VnhKFAPFUox3jpL3liatP826kZwNWtAHEivY
 Zt4WS3rOr6IbVt23lkuaRFAHWnZToMp+Y7mK/OhO9rsPyg+ipxkAHablOf44NI4Z35fpswJEDe
 8ds6gcpRhzwaolHfk5EMHVhANlD4o//AKDKRtTrW74yvpmajmX+7Ys6I9RxRFvdCijUPfEM2WC
 P/IDTMuTLTYcTMlI2Qy9fNahwAOzWaeoG7+vDGqrqvta7ml7sS5btLd6ZlOwBowq6VKh7vZifw
 mlQ=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42609608"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:21:16 -0800
IronPort-SDR: 4bDTQ2u1SXnfKHA74od5hD4Ah3nrpV12bpYKvv98il12MUJsc1SnImMNLj/WMyy84nTbE6RehF
 khX+k0aXjU4PJ480NlOM9UHdr/Qd30+1oDAKqwe0f3F2y6ErDpJm4JZkk1JxKiC/8akUdKB37O
 tx+9Km95PkSeHHAGNZmpNSszwQ7QzGZ5qa8n8SoCvlaGxGSH8zOY+RLjqVg8wVQwEyV/dtzlrS
 irpW9P9mRHYwyWClaBZqnwL92IQg26y4YRlux3hwWojbgPqPhj8IKZSu3K6a+AMkeYDgiOjCQK
 ZVQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 17/48] Input: atmel_mxt_ts - allow input name to be specified in platform data
Date:   Tue, 29 Oct 2019 16:19:39 +0900
Message-ID: <20191029072010.8492-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index 3eff58a5dc08..43f71a4a44dd 100644
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

