Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814A58FE40
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfHPIjT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:19 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42057 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727519AbfHPIjT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:19 -0400
IronPort-SDR: rhV3hDnFVIIdujUjvqAJwMio7Pm8J+A+zBP5ZzHTkclgeOhVTcZBScl+O65hKDquz8pRmeZbd+
 zDZkLt1P33LcTWn5qHJU9tvf9gRXGwX7DKLdOmicI8dmdrKq8R8u81Uc6OjXmQ/bLfip4hfuC3
 YwZSjCasU+lpUwRoKhhO/FtzZPCZFVZI9SIi9Jnf4nPvxikOcHZXCdgy8x0NWiQCrnfhKTdjGP
 D52mlNNBPxpGQlR2xRD0mA5zgGLXAqm2Qaz+tNXf55Opcq9zPXgcVn5AP20jz7n70cG+oQwCe8
 /RU=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507262"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:39:03 -0800
IronPort-SDR: KpBfaGbIc1jMikhxq9noTnNdCkmy+laTPt8mVUXnd6C6GRF4wdScsNBESmhWsdNZXF+K40wNLQ
 j62f7E2gpZ4LH+rF57AL8mKwNimNZWPyFGjCPgYCelyRaD4hNr2cDRBnE7J7tbwiX7UX1FE0Fh
 QQe0Ydp4qE+hif1YrDENQAi/dZKxo6zKNiMIqGmONZLUE2cu9ter4R3RQku1WWsVETxC9hWyvB
 cJrwUx2jdzrq3V0mc3fZogODPfImWPjJ8u+AYNGLNa4eRPIytDNRP2snNuuETW1knj23SBLkVU
 fbo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 63/63] Input: atmel_mxt_ts - Fix compilation warning
Date:   Fri, 16 Aug 2019 17:39:02 +0900
Message-ID: <20190816083902.19659-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083902.19659-1-jiada_wang@mentor.com>
References: <20190816083902.19659-1-jiada_wang@mentor.com>
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
index 6e5fad91c379..063565511ae1 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2056,7 +2056,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.19.2

