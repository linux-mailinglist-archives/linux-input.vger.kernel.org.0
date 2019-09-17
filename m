Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10BEDB4B22
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbfIQJoQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:44:16 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:59631 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbfIQJoQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:44:16 -0400
IronPort-SDR: XgmgYfeE/4IiaOHBSpomVdiHCJ/t0cO6kz17t7/vkDY/VDjPsmSb+MlnUinKqOxAoVALr57nun
 0wvNWi9khRYB0oERw2Na42aZs05DGjrYnIPBVnwYJQ/D9eXCHLJX88LTxqWUBlKUqH2e768Hof
 49SGoc0ne/cRVHhsLeg5SJc52oQzhzlWH2KUqvDZCkhJIn8b7xq1P5gfdW/6XZvm1rkcnD3SLi
 3SxB01/9C/nP8D2GClzufhokt/jIzUinvPpH9sr96TTuqjLNb20W32Yn4/Uz5vRk+q7JXl5Lmf
 Z6E=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="43223310"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:44:15 -0800
IronPort-SDR: AISKxrRVLKfBs86CY+n37Yz1pc+NB4rPKLiVP9hN3PzdvUaFFaKNUbMP9qbdUsCkBA0N+YN0+l
 x/TykKg6C3u74EQovNauWRUBdKSmUniHx5KjiAO215sSbpczsESfkiylDKcBzcDcfHjECJ46wC
 MFSOWQNpLyxiham9XU7v3BquwtWHsDJ2GF/aUtM6LzXuR4JJ42NhilCFermHnSuGtabbVtgtVR
 OW8vP3lqtPg2LFRlrJgOcjiRxPEOA+FLaB+9JedbxKPYnE2IFCfUKTz5oGGxfE4UwqNOMi7WwU
 mPo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 49/49] Input: atmel_mxt_ts - Fix compilation warning
Date:   Tue, 17 Sep 2019 18:44:02 +0900
Message-ID: <20190917094402.19061-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
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
index ff6d3ed58604..511ad2bb6b07 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2049,7 +2049,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.19.2

