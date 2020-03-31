Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D34019945C
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731073AbgCaKyY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:54:24 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:28112 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731063AbgCaKyY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:54:24 -0400
IronPort-SDR: 3tyijdcCR69WBS1sFv8W8UnChHo4wjViFODb5czt4K4clU4kUboF7DVkb6yB+LjPk2IG7l2c1F
 rZHVqz4nXL2ZsZhujr9QBc/PAtSnSwBmFrIRePtoQ38sTCa2R61fZcsqGfCnfq8UDCsl17vbJv
 wlzBZejEkq+BcTkfdL+SGzR9b4DAP/GzSDWA4BhZ64MNbXh4TdFGRJQoi8oMPd4OBf1FzVgvnA
 MwKeHvcLXLzskSakUZnX2txKVTMnkTygjceOzHAOzp5qhy185sk7pYTqGQyGJ8wdUsijC6ueq0
 f1I=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47293543"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:54:24 -0800
IronPort-SDR: lvuXWb17PRMuN201wB7IVkmS/3GlGX8aYkGySmjGd9cJfnwdMuz89/DtSi2DiJcUUw/Y6GhYTu
 w7CJrBj/wA93M45V+UDKFYdtz4Piogxpynch878wc+iQXzGzLh56CnZmPeQREtYFsRuZo1Cy/Y
 MbOhGMy+nX0dGHwngz4nyURHpLUq79ObiNC1EcuhSRYGP2Dw1C1t0UvE6gNx8UwaWgv8qb4AK8
 QjQPs0TnyxuTk1nBoqsS0x0F44dprBky5qLiQcNshl1pPWb3wxz93sTawLVaBvcpDlItt3/R5S
 1OA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 55/55] Input: atmel_mxt_ts - Fix compilation warning
Date:   Tue, 31 Mar 2020 03:50:51 -0700
Message-ID: <20200331105051.58896-56-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index d244d97d134e..b2edf51e1595 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2032,7 +2032,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.17.1

