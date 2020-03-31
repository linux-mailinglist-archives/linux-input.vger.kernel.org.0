Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A723B199415
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730483AbgCaKwk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:40 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43589 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730410AbgCaKwk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:40 -0400
IronPort-SDR: IlEyzTrZ/iHDjmRfOyAUKck7waKJubEXq9VDLpCi2uXxlcQ6j0fnro7nL6PBFVAZMefqNW9fvg
 fVnv6bHkcQKKyRdUMEqDfSyfn5TH+USfjkNm7AsrD1f1Eiv+mCASIB1n6BeI2ecsTzVRkxi1SK
 vyZlWCpMHJJjsa8pory1WmcdkjwnosXM/RnBkCc/Tw4C4EGAQHTFzRCVKjjBx2b/qMBYZt4Jpy
 mzgqHTVVpWNQbXfzqHmIfF0EkOvjZCdbLWsXmyTzPAOlgs2TgwkU08vY7A9/6EVH4d50Uf3kff
 ju4=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330777"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:20 -0800
IronPort-SDR: VCb3GzgQuZMCQk4GyI3gjJkVazkmEJORCNejFtqLBC8fK9Hj9iZw+7cQIqly5V8C1FzTqhtJXV
 wt7HH04b26EVKW2Hczyx/X9+28rtCcbdFxvweFAyx16oqqcON83otFGrW+jiYFpd1rI2gM2WUH
 x4U0gQZkNHZTelzh/t1fN4axxFL3WxiuQeyCzCVPE8j/qbQiLnWXBQEoWKkLnEDl2b/CsKqtpg
 6eheewasmf2TJBxY28RsPNsUvYP11MReoASOlFmUQI/sP9O+Mq6bmo9wP1JOmyAPoXiSuiwhyD
 iI8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 22/55] Input: atmel_mxt_ts - allow input name to be specified in platform data
Date:   Tue, 31 Mar 2020 03:50:18 -0700
Message-ID: <20200331105051.58896-23-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index d1865250f492..dfc20c0ca0a5 100644
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

