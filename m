Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81ED71CA362
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728307AbgEHGAE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:04 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgEHGAD (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:03 -0400
IronPort-SDR: 9I7VdDF1VzIfm6kdWbjaIG4FKAKqM7nT+8b9o8e8V9RXG91aJ01fybEXHTZhIYsxagZBwzmH/T
 Tm42fDRa81Ed4qH/lZel3MM971cGVe2fRn03WqAznw+9wUu48UCnQmowzhs/qTtwlIAtdo5hzC
 kXPcxupwlBJj2YSX0XWKbsOyQP3g8X8F1kq1vNdnY4/NC5RkBDTSOhBooqlBV9hatrwwoAhlrB
 TGzqWXdHR//Ox8juQyJkW5puMHZRWDzHR/FLD5B2kk76bEH60S7gF9qYOGCnu1BwB+nGrTayD4
 yIo=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670152"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:01 -0800
IronPort-SDR: Gisp1ek7G0L716U9x5yQZge7TL6zYKgwRZq31Ly7lUh7nBbgfYulJgo32tc3aNoPkJM1V5pgtZ
 6SA8cr0McrI93vhnAaAFyoOQ3wMWqGXi2D2szPvgmJ4nLjuF1smwp+pdXUVjpbz0mP26/h9k/w
 7SL1OtAicfbxg/IxNlvJkF3XAfS1Dx6Lk8qDEiog/ywdXJp9ajuPboes+jgE4zu9/trRJkO9Fk
 SA0n0PDn2iMbGwF3NpfFjNTd3maGEDqmkGgqfNtNLuqSdfZOXNGVOW1mSqKwS+8S855aavBEGy
 UC0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 48/56] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Thu, 7 May 2020 22:56:48 -0700
Message-ID: <20200508055656.96389-49-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index c779cac565a8..83fa2caddeab 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2172,7 +2172,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	dev_info(dev, "Config successfully updated\n");
 
 	/* T7 config may have changed */
-	mxt_init_t7_power_cfg(data);
+	ret = mxt_init_t7_power_cfg(data);
+	if (ret)
+		dev_warn(dev, "Power Config failed to update\n");
 
 release_mem:
 	kfree(cfg.mem);
-- 
2.17.1

