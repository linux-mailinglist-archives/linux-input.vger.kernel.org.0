Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2511106803
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727022AbfKVI0l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:41 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:4485 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbfKVI0k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:40 -0500
IronPort-SDR: gIY1LfrtPAyFlfYcwRBDhCrPcPs7FPZM3xqxteZNKolO6/ZvWCC7e/H6suP0n6UA/T2fOtL3Q6
 gLNBMLamuwYE4ISOegZjC9oKzWipn3myjgiCdmYGdQYwXP29G7sG2h4ItgNUoVinLRNDv7PW3F
 T78B9xOxRx7gE1ukt1bRWLL1kq77+Vn0kcqQpVjL4YDiMQ8NyaqK4OPysfYYqnP/B/Nz2/Murb
 In3RfkOg+4GV78nIKhCuunApp8pw0TYotr/m4dlqy4TjLpwO0rN1yJdB6MNoIprzWt9RABUiCt
 WL8=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43419510"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:39 -0800
IronPort-SDR: rN29y0X6XJFOufnfagWqX8oKH7k7O10myPX5C8lj14fz8QmPJI/joSequSDSfXCgIznJMGFLBL
 Rhdtl/IWVA+QdvbMbjEU6WMLSIPf6lx7lOx6s5mTWK8I0Yl8xU1iH+TZDm331Fa3MZ6O+UmXTX
 bUz23HjjUwzaYfHeMvOIUpD8Si2drcXtWSMK35IBj8/miJhrhSBVR3dsl0o2YnwrqykRmugoaN
 bAr87bX/DroVEFzSWMSyn4Gl6hocgpL7wFFbB1+LM+wlmyBQJFwTFKf/DsV/QuOUSk3Eb6lXKK
 tOQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 41/48] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Fri, 22 Nov 2019 17:23:55 +0900
Message-ID: <20191122082402.18173-42-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Currently Driver probe continues with a warning message when it fails to
get the proper multitouch object configurations like TouchScreen resolution.
But Driver probe should fail in case of above scneario because it will not behave
as expected without the proper touchscreen configurations.

This commit modifies mxt_initialize_input_device() to return error when it fails
to get the proper touch screen configurations.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 92af95bd4eed..e3ed74e7c270 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2762,15 +2762,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	case MXT_TOUCH_MULTI_T9:
 		num_mt_slots = data->T9_reportid_max - data->T9_reportid_min + 1;
 		error = mxt_read_t9_resolution(data);
-		if (error)
-			dev_warn(dev, "Failed to initialize T9 resolution\n");
+		if (error) {
+			dev_err(dev, "Failed to initialize T9 resolution\n");
+			return error;
+		}
 		break;
 
 	case MXT_TOUCH_MULTITOUCHSCREEN_T100:
 		num_mt_slots = data->num_touchids;
 		error = mxt_read_t100_config(data);
-		if (error)
-			dev_warn(dev, "Failed to read T100 config\n");
+		if (error) {
+			dev_err(dev, "Failed to read T100 config\n");
+			return error;
+		}
 		break;
 
 	default:
-- 
2.17.1

