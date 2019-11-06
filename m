Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0FA8F0FBB
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731844AbfKFHEz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:04:55 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:18687 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731824AbfKFHEz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:55 -0500
IronPort-SDR: GXUtK91lnGhqhFsdIhspZy1fB1f8vO9Xasm1VzIxnLZAqz9mLWXsTxdALcAIlDYJj3EaiMpYxa
 GoY1aDt/bVfjJo3Cw0KNg0yoE0yeMWh3xGTg4+0M1qR0MA2d9UPpCU5JRH47h3YoaP0q89SAdV
 RV8MoNH4roKbCfg68e6vor4iBVnG+dL9ArhAniyrtjRw5YKAt/QgD4Zxo4KKarCOzWU3oEjWqx
 II5ZQ+jH4amVELfrNWwm5Q7mDzhIeNqM908Vr9Lib2sAnqfLJ49BUlucsn29cRjnja1AITIBiZ
 pIQ=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="44759346"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:54 -0800
IronPort-SDR: riHpJbmBY/cMLTF4AEiPSrR6qbNyBs4glwf6GgoEx8d1aeIuZfDmrh8HAQJjZZWypZ7u2uar6d
 7ZMOXux6jlvEdzMnTErgo72U0Q91GzSriN/QGtg80vP0hi4cNCMCvU0IUMqVxA85nUs8epoYMc
 HhQVhqPRsdrQnx96RPBGgl5hP3rQT/Xw4s036Bk+q+mFjkAywj6Z/MQV7HAhjV/OK29wJSaE+V
 7D6IdJRVjEPO4Ks60HkOrO5gmY4Vp76hS1Z1FllYDEEENckDCL3b/U2xqAldlSfMeLSW/VMRQK
 sCE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 48/48] Input: atmel_mxt_ts - Fix compilation warning
Date:   Wed, 6 Nov 2019 16:01:46 +0900
Message-ID: <20191106070146.18759-49-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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

