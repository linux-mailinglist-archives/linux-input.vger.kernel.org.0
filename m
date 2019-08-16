Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A94158FE5F
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfHPIiX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:23 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42029 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727188AbfHPIiX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:23 -0400
IronPort-SDR: jrTJUyIB8wLCLCIgUmDd9dUQXFacnNTPpEPbbYgf+2bpyMbOlLtphDvvH64KZIYAkdrPffLJYQ
 8e+ppzLL3wTfboN3c7pmOWB0cikDNCRDqfDsGOsPyI+2SaK8kepJLAh7aNaO0RO5YeWAYeC2ly
 HudXk4SFT2FkIhNaLSw6GIT1/62ffghEE7FFNqGvlcYVtBZhklSlaknjArZzgjmGJq8N0FHtqx
 q3DTEPtI6pwXPTGeFYvoeAYSSa5u9PO88W2pw+jbhT2Cwz0tjXPocoZWZgmCfKoYvjt1YoQJtx
 xMY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507245"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:38:21 -0800
IronPort-SDR: Ld2RW3s3aku5NrPIGsQOXbKSNwBwtAoQGuUS3kcWHQcJ5r12xyAuJqQ5Sww1WhMoSRQaikSohZ
 uQEwXKRhivIlYb1zv9zl/UD8lPWr8XNAb6Y29IqSW8XMDATJCt5sovEpBUQjnhjkfVOkYILHrc
 r3Ex7chWRG+e0Mv8DRhtPTncwT1Z8cp1MeLNe3F5udgKjeDwD75b4Se0COw+caxAgl/h6N1JeO
 uotPXZORj8mKlJCwB5UGR7nHGlT/aeIBnHxbCfPoj3OiuEt0vNfD7Q9roHqJqRHucW9L+plh+y
 QhA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 55/63] Input: atmel_mxt_ts: Use msecs_to_jiffies() instead of HZ
Date:   Fri, 16 Aug 2019 17:38:22 +0900
Message-ID: <20190816083830.19553-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dean Jenkins <Dean_Jenkins@mentor.com>

Replace HZ / 10 with msecs_to_jiffies(100) in the
schedule_delayed_work() calls in mxt_fw_work() and
mxt_check_bootloader() because it is cleaner.

Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 35d92751e49f..40263ef79e8e 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -842,7 +842,7 @@ static int mxt_check_bootloader(struct mxt_data *data)
 	f->previous = state;
 
 	/* Poll after 0.1s if no interrupt received */
-	schedule_delayed_work(&f->work, HZ / 10);
+	schedule_delayed_work(&f->work, msecs_to_jiffies(100));
 
 	return 0;
 
@@ -3773,7 +3773,7 @@ static int mxt_load_fw(struct device *dev)
 		goto release_firmware;
 
 	/* Poll after 0.1s if no interrupt received */
-	schedule_delayed_work(&data->flash->work, HZ / 10);
+	schedule_delayed_work(&data->flash->work, msecs_to_jiffies(100));
 
 	/* Wait for flash. */
 	ret = mxt_wait_for_completion(data, &data->flash->flash_completion,
-- 
2.19.2

