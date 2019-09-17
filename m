Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1765B4B0E
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729206AbfIQJmu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:42:50 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:22250 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfIQJmt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:42:49 -0400
IronPort-SDR: fRZZqrZCRodXqAM5cnC23sfJMVaZmGlwASW3CjsICPP1Mu01k2AdqvX03nAX+R3PuxYSWGHGYW
 9nSMdf4RXo1WGIov9T3eSmY2WmRFbGdBs1mMItcasoqjFZt8Vas+jJYcxO51uecjmlQjAdUn8h
 zHrjXSwYm+GslEl5w7X8L2ICLHYkEPszAkqdevZ/gLs23/ruOXb6SS9SdImDdp1Trkcq4doZ2E
 XXF2ThiCsbzUJ6uzI5MDHBJpT0RKtJURCydlQ5HE1/l8du/0Pjo2hUwK5Jx/m4NO8Sv4GiYXPe
 qKY=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423282"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:42:49 -0800
IronPort-SDR: hP6tF02fU9FRyHRWqoIqutEKQ+wUsaFjQKcE5f5CeOi6PiHhv9PfjrXaRTloX9S7/Zw6z1crQU
 yaGXZjDtY37hqEr6yDhiNSADxeHQSpdC/aOm3Jf4MX1xeqfz4veSd2p7fkihn+X0pDVNQJKitt
 QBDSQGOeT697Rrr6Ibv7EJyhxhVYyElQcBD9t6/t53xSVUz/HTUNmcb4YUEQ5T82AItre0yQxa
 k3ix2hs0u8FBTQAJYd0HAusy+rRV/8orbLxIZaCMJhUjZIhKF70GfBXh7XijvL53/LFMsC5XYx
 hAI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 42/49] Input: Atmel: Improve error handling in mxt_initialize_input_device()
Date:   Tue, 17 Sep 2019 18:42:18 +0900
Message-ID: <20190917094225.18927-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094225.18927-1-jiada_wang@mentor.com>
References: <20190917094225.18927-1-jiada_wang@mentor.com>
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
index 6198149438c3..a13d6938de1e 100644
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
2.19.2

