Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA0B8FE03
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727072AbfHPIhb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:31 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1919 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIh2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:28 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:37:16 EDT
IronPort-SDR: 46TX7M5M37P8wAjP48FKCRPO9OQed3xgGgJkJ/hsCb6T5ilfGdfPcEtkd9Fx7cuq1vlW/auLDi
 LnyLGw2k8IDBDv0ilPEg9Mgax5RzdTk05+0eTUeyjpgj/TwBGKa6jpBHGhCX827gJUKRLwwl6Z
 T9hwTGTgZn/CP55MhQJAWhKDllnsZPywa1ICKyV+nEmZRjUsBgaUmfa9Bi9glEUmhaNhsAbwzB
 gpbQ2dCI/UEQVqVMEJ7qdpYgH+m415Z7FXX4jOk33bYls0bu+2HpHJP6nu+EV2sORAj2oHN8L5
 Lko=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484358"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:27 -0800
IronPort-SDR: Q6iKXML1o0G+yPHEyCng0OT2SY59gDhwzHlQ8uLw3h0O2PLhWc9uNWf3L2SEbPkUhzl3pWNWVP
 GmWjIM0zhZki1r8eW11ayKq0apYl8aXZ8ttCpRZbIs1u5ebRorxf8K1xh8K0EPS7wwF5PSVa3o
 W2amPgXX/CJwdszzziMSxokHLwOLjvWong5jfgvb3YnWiaEVXPc7ApKtbmiKb92cYzhDCfvUrz
 ZeDOrH/C+7T0baQgf79c7wJYc4nNMbYF0gyYZJHHUI+2znTUnOTNtyWcLsH22TflGbr/THrxzR
 pic=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 49/63] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Fri, 16 Aug 2019 17:37:10 +0900
Message-ID: <20190816083724.19341-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083724.19341-1-jiada_wang@mentor.com>
References: <20190816083724.19341-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 27b908a50b66..b17af89a4711 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2749,15 +2749,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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
2.19.2

