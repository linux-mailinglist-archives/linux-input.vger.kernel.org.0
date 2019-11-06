Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12BCCF0FAC
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729986AbfKFHEa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:04:30 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36391 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbfKFHE3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:29 -0500
IronPort-SDR: Ew4q7tY9oHyxderEpTMJyzepFfnOdcVdA3xOxhB8RTk4bdX8QmHi1Ufl0C4ygTUoq46Qn9o0N5
 nlRn1ynmcM1VAioN4qJqd5nFD1bgOc+F1NsVt3Ir2aTVkEUZI5L2o8pgb/x5NqQSY6Zg9UsuZw
 N/UM4xRZlycV/n+KMSCYFO8Gei5jH1ceLaIHMKpGnYZ3WHOjeTW3bHV2vmsTdOR0tgofulMG2Q
 LyeFKxtQ5rL5/5FqOyrNLkpFXYBtxQSpiQeRDlKDWry/dqccy8+Q99jbxE27YeZHUlvL54Letm
 FV4=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42943703"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:28 -0800
IronPort-SDR: 4b5PBNZnmGWdBlukQZyEDlBs9bVKJhpQqZIyGbt3HqW8gcTiZbNQL3OOb9CMcCW5BfUM+xrOPp
 WsHvbZrPGyGWS31Zr7wQqVmWKLICQTn/zceAhHyPjwDYYabylcFFXQ9IpY78/M8KAo1EwIseLX
 go/yJRiqAhH+LY8rkcrBS43truoLzwjoWkYu5/8nj3d0dyahVKyH/QK81JUHtIRAVgJU1ckYFe
 9HD9oVgCdgszk0TsZ0R4IOTYhGx/MjvA1hmqmpi+MM9pXMATLTh1M4v1/D36xcXFXoWM5f7z7B
 f74=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 41/48] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Wed, 6 Nov 2019 16:01:39 +0900
Message-ID: <20191106070146.18759-42-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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

