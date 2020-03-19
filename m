Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A67C18BA98
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgCSPJG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:09:06 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5956 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgCSPJG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:09:06 -0400
IronPort-SDR: Amn3w9kvJCY9IGucDbC/S6ntif9zKsG1WCyIhjyvxXqbcpi3BxAPMUp96fOvkeSSG5gmwnpglS
 STULuLssD/H927p9RGe341Rttv0XeZVUXfQfYmeONqG8WGe12zOvHgpMc5JDVqeJeagvY+3uUr
 S1aynOznvosnE9m6XOi2kwfAtA8froZCPBUf9bhL+8gZncNFg11/0gaWJOy6/wRoKoeMiAoFtF
 BPZkasYSRFaL+vvKR2a6mwHHoIqgVATze2WjBlzpj9SK4264rFWlDE3JtIhus6Uc0yNDysmQcY
 0e4=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46926859"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:36 -0800
IronPort-SDR: +FOnKRzCPSsw49JPLxcC5GqTzcUHT7kOftklaPsUwd3J9WicnG0u60PAWq/LqQ6zUThSrcHvAo
 uYkkRpYfjlaunoIFB4WAJX9co8YgQ5a5j5orF07UGvbE/rkO3wG8yV9PIo5qnEWGXvNg24LlVE
 4Idwf35ogDGGrlI8/IxyJSdd5l0aKrUjwHs8w8tjMJ8QhoA2Bps8BYd5nIVgSsYLdBTUj1S1mm
 o5powKlRhSpcafkR29VsEyFpmuTUKsvvUZcOMFLJY/TJz/JADqmSFMy8r40M6ZlJTkX3qLnkcQ
 bcA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 19/52] Input: atmel_mxt_ts - allow input name to be specified in platform data
Date:   Thu, 19 Mar 2020 07:59:43 -0700
Message-ID: <20200319150016.61398-20-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
[jiada: Separate Documentation/ portion change to another commit]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3ef98e14c94e..c884c254ad2d 100644
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

