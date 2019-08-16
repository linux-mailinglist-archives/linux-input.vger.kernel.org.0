Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A7208FE54
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfHPIkL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:11 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:27764 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727598AbfHPIkH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:40:07 -0400
IronPort-SDR: 0ivwSocSH5t+njROyY2iShWDpFr0BZTPp6Ql7caAqGgLVAJE44YdoYJTLS0prcHyiiKK08Sj1H
 1me+JzWfJqeREOU4JPsj+AmJiyrkC82V0W35RTW+CwhJzzKV4hIkquXMCZhDxF538J4f6Tz6Mk
 SMcqwAwN9X94hRrttOF+tM7r+7lmqg2Yxnhn4t513GNTSYsM5LgUS5sGq86j8zMkN0mz+wlZIn
 hWAoj7VI2mUNCzXcTMSxoY/uIDjBWDGIhPu5PJNBzv+TjDWvGj3mKbfeCi/r7yshhskc8uXUAX
 3r8=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484248"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:33:02 -0800
IronPort-SDR: U779ohsLHQY+TGeVqIr6nGEKNsN3nI748qUitWSvxcdsJUIORqTimDL4YG/8rxi+83DyqFQ1gi
 ZlT+dTOD1G7SgrM4w2s7SoPP9fCZlvPwXpX/VFBvoZvuP0OC5rAs4dxN9/4YpPgupRiFmd/FrX
 c15o589xclkzbSksLXjAevD94pxtZ3u03W/ILraJZehyzNTO6V1TLnS6ydMsdTSpdCYQW7AgcF
 pkFtyWRKU2gLioa+n7y7nB4FPMdbRGfR/+dP6R6m8h0Rt+UDbFzEH1+4shJcsiLr2TuPDY8Wgg
 OMU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 19/63] Input: atmel_mxt_ts - check data->input_dev is not null in mxt_input_sync()
Date:   Fri, 16 Aug 2019 17:32:13 +0900
Message-ID: <20190816083257.18546-5-jiada_wang@mentor.com>
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

From: Janus Cheng <drxaero@gmail.com>

* Symptom: if update_fw and update_cfg, kernel panic occurs.
* Reproducibility: 10%
* Root Cause:
  - If update_fw, the T6 will send a CFG_ERR message periodically.
  - After that, update_cfg process begin, the mxt_update_cfg_store() will
    invoke mxt_free_input_device() and nullify data->input_dev.
  - The CFG_ERR message will trigger mxt_interrupt(), and mxt_input_sync()
    will be invoked by mxt_process_messages_t44(). And mxt_input_sync()
    references a NULL data->input_dev and kernel panic occurs.

TrackerRMS TKT-004235

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit c909ada856861f305653b127db3ea0fa60264331)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a4f8364ecca9..99e5c84d207a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -837,9 +837,11 @@ static void mxt_input_button(struct mxt_data *data, u8 *message)
 
 static void mxt_input_sync(struct mxt_data *data)
 {
-	input_mt_report_pointer_emulation(data->input_dev,
-					  data->t19_num_keys);
-	input_sync(data->input_dev);
+	if (data->input_dev) {
+		input_mt_report_pointer_emulation(data->input_dev,
+						  data->t19_num_keys);
+		input_sync(data->input_dev);
+	}
 }
 
 static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
-- 
2.19.2

