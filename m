Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A66D9DE1A
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729149AbfH0GcE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:32:04 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:23260 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729545AbfH0GcE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:32:04 -0400
IronPort-SDR: AcdhZaMJwmtTUk+IqeN3rqsH6IHGCuWB068rm643HJ8pXx4bMGUE9DMgTrkKfer+f2OER9iz5f
 mHrF2mN8Lzu3vs5Z+P0js7jXiUF1ZQC+lnIea6dVmMul5DWfgXYzocFvHMSn4v/GkTwiFwbqtw
 /ie/v9dpIqPxi8u/6B0rhhXv6ArbhjObkA/99u7RtdDcXuDhx82HBP2OXzCYipCEV/s5h2x4eY
 asQGcRq3a28uhs4PRKNkUaAEyY/g4GXbjtjizqjwCvh8BeHgqmIxgtn12daFoHlUWqI2/cNOvT
 khI=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40755058"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:32:03 -0800
IronPort-SDR: mIHUgKsrd+kLjnVFW+oAZWuv2w6FEzx5ir6k+10stDNQcNVFoxS5523zlZkT+vLUMdgLphB32M
 OsXxwLHNza26T7VoZ7LxW03emG9simoqOWbz63o8f9XuvyqWMu1+tiU9sul29MVXtHWkBeoy3z
 UbzwCBUqEkWfHCfMnqGSLeSsLF3ug31QfyhRL2Ni/BS7L73bIv2UkfasbfXYa+9zt2TzXSw+e2
 nYCCGTLctwd/GllnXUOdRXk/IPnXhkS2eXmPCF+cLpvbhtXqCANyEfy//bQGV2rEAnQoHZtBT6
 JTo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 49/49] Input: atmel_mxt_ts - Fix compilation warning
Date:   Tue, 27 Aug 2019 15:32:01 +0900
Message-ID: <20190827063201.21048-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063201.21048-1-jiada_wang@mentor.com>
References: <20190827063201.21048-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

fix "make W=1" compilation warnings from Atmel driver
as per the compilation logs.

Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a461220cd336..115c94d3f0d4 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2046,7 +2046,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.19.2

