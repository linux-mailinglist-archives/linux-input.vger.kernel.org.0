Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0BCB4B0B
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729184AbfIQJmr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:42:47 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:22250 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfIQJmr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:42:47 -0400
IronPort-SDR: Uz7Uoz+HXUqceR0YYNkhUQfSmB7AmvXHyT3xbDfkYlTTu469tbHe2co7RXWMPWTUlcmKd/V08y
 Fa6Su33DVf9Y/rwDVBZPOIjWpZB4eR1ZktdoSOdYu7p5rjUqLbiUVVI8SfExt9jRD6dUGctYmD
 cdP92C8J87Ksol1wc7TDIoOMOOQD0nzdTi6FNubA8xTWYcQ2zFw098lMhej+WXF00DcIjqtUfb
 po+7NcMJ7H99z+IJRGrkkB3bDKTeL/DXe+b/9xW5yxv0ZHjLz2NhM/tvE9LCan4YyysRGDooSo
 AVA=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423280"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:42:46 -0800
IronPort-SDR: IPTI1h5A/nplM2DvMGSKGMVbgFaOKa05XvLoCC5ZmUXSNnCwje97w/KBtm2BvuPsx/4obMoMxt
 fIEqIRDPntkFmGDdYvxdTVaDb7NifX5rDRQhgSp56nf4Q+g+KPu68lXni81yVL2vcdNRrg9B17
 4VP8mToMqmuj2fKxDMjiZjA2DxoOSe4iToyau5AiIFUr+GGVOxo2ZMCzkcdfbz+8Pk/a6CjvIK
 CDg5y2IyOWR90cy7oS03ed4lbScNdl7F3g+iyT2qIA8SpQheCaG9+YiYcsAMD6+5fmdY+PIvwK
 yzc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 41/49] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Tue, 17 Sep 2019 18:42:17 +0900
Message-ID: <20190917094225.18927-3-jiada_wang@mentor.com>
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

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index b260ac155b5e..6198149438c3 100644
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
2.19.2

