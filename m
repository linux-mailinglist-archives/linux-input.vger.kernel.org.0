Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9302718BA30
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728464AbgCSPDU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:03:20 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32379 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbgCSPDT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:03:19 -0400
IronPort-SDR: pnEWoouqL2/muF07ofLVYUyUy/HQD2rYos/wwYYyrndkTUgTbtuXEzf3b9yRBrSktuokXqiVg5
 qIt4KkVYLTSeH+5ZkVMKURu6W2Eubs8SoD6beJirL/wjCgccRJoVQ/ai3n4mB74BaE8njYSvQN
 NH9jYB+zKNFvvzgfSCqTs+s9/jHYZ++qbOS7Hm5W8Pgi9DyR2FD4uQtEBoh1AP46hIou5nFWXB
 lWVR8vYNrJL8ztRpjg8g38N4fo8/lLhamOE9DQo2QOImh1TdWISsxPpvEoH0sCPY5wwkQjuxsv
 oSU=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46891070"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:03:18 -0800
IronPort-SDR: lESiGKohi5ReR/Powo1gz/WoWbBgQye/3KGJ/7wruXSWk6WRigfNw3CAeaW67MWmNF2aQQ1xQB
 y/85Sj0dYMPz8OnFyZs9S1UDw+eQtjIKThNmseDfy6DdO4JsEkyjRl3W2RpUlF9jutWawaQzjI
 p0fE348BY5FK6gN5N9pI2Q+N6uo2Dv7WTnvTF/wZUK5NqEodlr0l2PzBeNn7QCbPvK+bILCLri
 aYY1mDdiES5NHL+BKqixwOR80kT4wOWbStRlQ7FWdLXUutemTvYAdEyJEvSso5+STfiGQWb7G3
 P64=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 45/52] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Thu, 19 Mar 2020 08:00:09 -0700
Message-ID: <20200319150016.61398-46-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Currently Driver probe continues with a warning message when it
fails to get the proper multitouch object configurations like
TouchScreen resolution.

But Driver probe should fail in case of above scneario because it
will not behave as expected without the proper touchscreen
configurations.

This commit modifies mxt_initialize_input_device() to return error
when it fails to get the proper touch screen configurations.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index edab65337061..994232c43554 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2761,15 +2761,19 @@ static int mxt_initialize_input_device(struct mxt_data *data)
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

