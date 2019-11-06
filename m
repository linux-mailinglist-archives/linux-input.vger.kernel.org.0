Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6CAF0FBE
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731263AbfKFHEZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:04:25 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36391 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731257AbfKFHEZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:25 -0500
IronPort-SDR: jd/l7XzeAbGH0OA8aQJ74xPAfiEy8BCceH3Taf5/r0JSD0q6B0cfnHKYJ2NPa8vHDIu9v+zM/F
 sJTx5YeR0a9FwCpIFz3sycXey2RAChPviRyitsEyrk+o5gOErwDuK1Llx2WJFe4hPGERXnvnda
 qXZwiUBPyRvrERrpmvC8CFEbkklSD8ddzVRrVnv+y4UHgAVhcVfzO8zQKf4pVQJRqIcTjfSCii
 L9gM3/R7uAYWlEIlJldNo+PTew4D2p8M9L+6UZala7o9a6jpuMYelA8rHUmp9g7J6fp3EiLDGe
 i5w=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42943698"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:25 -0800
IronPort-SDR: 6LSlHxjluN6xcDzI3SE9dVbMG3aeOwLNmKepsogKjyOpRRITYlOknLrfMOGjgtXn2dgzSJ1scf
 C3RxzRCCopS0FknuKfL2poNl+DBvfbrXVGamqLFEM1r7MJdd0RChuk7VD7bb4czL0BD4dq5jgv
 vYb5NH6pAgVH+Ikgm+oC/YxB/aLqUq7FbyI4PjGDUM2fHdUMsCXVls1zifLa9hH4DukSi/WCJT
 GMJ+09/gnb8GAjaw47NrEuOtitacriO6opAsjv+sv0TD88520V8pT1wimcvQsmvnECGgDWBBT0
 EyQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 40/48] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Wed, 6 Nov 2019 16:01:38 +0900
Message-ID: <20191106070146.18759-41-jiada_wang@mentor.com>
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

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 110c966e7f3a..92af95bd4eed 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2186,7 +2186,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

