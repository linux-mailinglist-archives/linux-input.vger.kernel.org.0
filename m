Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878BB18BA2E
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728438AbgCSPDQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:03:16 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32379 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbgCSPDO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:03:14 -0400
IronPort-SDR: 5Jq3RKvLYTAyLEqWcpKPL+X7sjRYA9I00NjWhYhzpEP+ecJhAozwJkNb5TYHC/OfWosxuyRGXt
 01Avo63f0kjPIhuEelXmOP94ZEiMsgWS4fpwPy8iQFaNg+SmGQHNN2lm+FGVwRucaKLO5GAzHz
 J60QJcJDuL1DdoKz3144OPo2otj1Y0eKMD5FQDHfoFlkyoJt4MyfiRANgBwILixsfXSGydw+GZ
 zuaLkryr5ZaZQdAcEtZgPCd4hkougaim5q8gpd7zvzkrhYWGo3EWLMMC3Z8ZRerx9RR9J+bQ2d
 g7A=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46891060"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:03:14 -0800
IronPort-SDR: o9oTlPpDDDoKlapVti8kaUvE0cke1Is3vdMmgwl1RQFVcs9yu+cN7kKSFkI3evS8/yl9WgqStB
 DE69twgXtjO/a50kROpTpAST5s46mmqF/fkRI6r679HKoFTjVXMEyHJlO5ZqXzFyBaQqCDDkMc
 kb2yxlOdB0d/XZEdEuISKvHVNpwyvu/8Ist4iQhViIAUOZGlI43ubiGje8fa3W2HWMZqGgKkfL
 uMqNRaFysSW9KhRxTrTyGDlQo5etfoC0eH4svwsZg8LRyhUzrI61aDCr8uQ1RioNbHHML7PpfB
 uO8=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 44/52] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Thu, 19 Mar 2020 08:00:08 -0700
Message-ID: <20200319150016.61398-45-jiada_wang@mentor.com>
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

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 1eedde24e38f..edab65337061 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2185,7 +2185,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

