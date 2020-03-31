Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BBA519944C
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbgCaKx7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:59 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730442AbgCaKx6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:58 -0400
IronPort-SDR: 7UFbKBYjs9UC4mGHRIwjuoCP+/tDSYVmeVkNCHuiFSxJqrf3sS+n4v16/KDWpLuBGou+l8Ljzh
 eaBhKIK9IwytNpm0UHv3V6rhqRJhlNY1zBR5PTiLmRoGpPuL6TrsaBZFKFtCjcMQWZZt1FnSnN
 muLzqmF0ahBwKUxY5KljdXAi/vaAdWD7xWXd9SptBl6NU0z7SovrEgRYSLANiPIF2/hTcwNhDE
 EdcwUFsedSGFu1BC3ucroc8B4AjfeCUpOBcxVmlwYjwOP3VnZOzh2qV4Ib0R7/yurwg/Miuvqo
 +Ig=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330848"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:57 -0800
IronPort-SDR: Pu2HhLCygRrU10jR/0iFFLx1jJcP0aD+lrJdMYzqzwbzkWqRfRoF3BqdlPO/+IWyF5nh3LpRFq
 1SCIqPh7SyB5MuUL+1MQ5AC7UxbvY46cEX2w53X6qEJ+R51DvbUl+GgRzh5UuMqOhWLxLOGDHi
 q2/kTnnCjWwjap6/Q2NBubGBWZ+mNhfoGsLYC82GUMjjEVd6MIY6lmVegtEegMrkNX2Lp4lQvK
 w/9+lq0pYvPaQr2WMYornqI+QasJOek8tVkoZSVTQVVS681+kHmBZhLgFCL3v8i+SkF1cNz5oL
 zmk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 48/55] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Tue, 31 Mar 2020 03:50:44 -0700
Message-ID: <20200331105051.58896-49-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 069a532bd0b2..ed357e958f07 100644
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

