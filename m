Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C6610680F
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbfKVI1E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:27:04 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:4507 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbfKVI1D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:27:03 -0500
IronPort-SDR: WmE4YpRTIdKexfKlXc+xiQIxrcGVPaBsL0TL0yy1gxZmTsipzFQk/F3Zs/MbIeU7D14kXCFwwf
 UfNrLB7mzmxNIIp9rw5U4j2+cD8WCTWX4CE2vJBmRIzgujpp81XtqWqs2j638wTROzIsIAwUzO
 LX+Ic8XZhXQ/OPA2HvAPdwQ7f7entQ7/RMETJAK04wiLYRxlaXiy2TR2unQNeTxPduviOYu0rd
 43O1em9ICCtS61Q3xw+Em2cIQnrx8nKmcGrqQn6MACm8PHWNfm0F1YRHQ1BFBam+XNlCiHT+zI
 FA4=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43419521"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:27:03 -0800
IronPort-SDR: 9l9ljm6lWSenEIbXSZW35AakmKv0BEFPwkciDkX2Oi0LFlamqYbVh8mT0/SuhefPHepGspJZED
 PyLAMqWK015XGGKSTkHMDmIOLffEyUMCeaLwVjhsy9cj7M8mZJdgtoncBGG3e7kS5NATtNUGA0
 pCOvGzLCyAhAbZNvAYsD1fpKVeuM2w1FD8b+pdZVSV5vxblQ6lfPU89mCu0ai8WK+R1dLvRVkl
 SrMHqS0PZ0F6M2ciVtoU7xNnLdd9CEonU7clAuP3HH6v9gaYOz9BytaXGEnoHDOJvogTEJUDEM
 whs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 48/48] Input: atmel_mxt_ts - Fix compilation warning
Date:   Fri, 22 Nov 2019 17:24:02 +0900
Message-ID: <20191122082402.18173-49-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index 243820b102b8..3e2697810cf0 100644
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
2.17.1

