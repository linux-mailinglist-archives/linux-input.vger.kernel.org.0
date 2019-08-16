Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85F808FDFF
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbfHPIhX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:23 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1919 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIhW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:22 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:37:16 EDT
IronPort-SDR: 9cBcObNhuBTpCWSUzTXXqJ10FbqMFTl8ZZ8ko3yEyzdDT62mHe31HAjfHFDsRUGwiZOjOWS2+u
 nhhIIkldCWMcEsNFQL80gg/AaRkLj8dd++YGv2Q05mZDgCm+iDUHch0PDSidjEzwkkerPBU8lD
 JaWHVi5m5JLajcUiSbFhlnDxkVlygBML1gmgM8JSz9hQU5eoPYR1qrHA6qNWUUaGr7njJ9bff6
 Ars5MqlP+Q4BaxxrYnxIepvwIzP4LyTH7dzYHFCyM+lSkQQrRPQ+bnI2AygQ5iVEVUWdIdgPbY
 DVY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484354"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:21 -0800
IronPort-SDR: VG1zB6usqLggr14YPVndYZGr1+SYXroPYixLGWsTjo5R+2q1747ZcKEeHfON5frAbVTlrFjdUB
 47NKy/OwkcPTPvlupD+sAdhaCYhXk+34wAj8c5ak8laZGA69X1TPYBR9wIhSDYi8UMIlrj973x
 tlbT0RljhA2Cp45NC/uI+4eUhW5+K7+6WlTSKYFy2LLab1+49Pw1OdO5Q+DVOU4ECZQGfr8627
 E+oMA45ATmAjrx5gZY8dec4jfZd98vaipmz2Cf7n8WpQfXMxpTpfXjLhkw5Z/CmD6fkv5QQRsR
 tmc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 47/63] Input: Atmel: improve error handling in mxt_update_cfg()
Date:   Fri, 16 Aug 2019 17:37:08 +0900
Message-ID: <20190816083724.19341-3-jiada_wang@mentor.com>
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

mxt_update_cfg() failed to propagate the error
code from mxt_init_t7_power_cfg() so return the error code.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3999d3e31a6a..dec9f2b2c64d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2173,7 +2173,9 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

