Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F160F192A1B
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727921AbgCYNgG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:06 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:53226 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgCYNgE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:04 -0400
IronPort-SDR: eXPkiR2SqMGcynKU6yrFjwf2tKOW43Ld4mKR7gsqSXxgCryPX1J+Af3n+ikofrqiQPJnlJJyF5
 CVKkcQCpX5iJ2lXvE0N5mQ597jauj5c62NfXCSlEqHO5B0BAPYhdHI/akKdCTgXgiceTxeqRMv
 GlKGPZHHbeEUrkP69hqzJnjO1Ve8CzowV9pkvV9oEXvyo+7ZJXbzpY0mfeAksNgt9onkTS57aA
 2PHa8qfep0GbezIWU2jsPA1h7YoS04pgiJWUmRA1LZ2P/IHxxK3Fd2JgRjiUDFB/w5CYNgYJuc
 Xtg=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47099750"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:35:52 -0800
IronPort-SDR: W0C88yslZHCLrS6DGsvAoxd+os8Ca0DQ0x7qHtAIdIkxRofOE3UQ514OlZZdjbp9mlS8eHNSSQ
 OFIOpFIsT6xZP1sXNDwhCxpXKWVMF/hsX6JbGtceXVyIOT4Ek28hesiI5qSXWzFbfBDiByZGV6
 kSZQpLgyPAGoKaAFBQcH300cO7aN9n2Wy47xfrN4VPeDCxe7DwIp38j0ag4Iyz7RVebuXATAWe
 dQQgQay4eMbP4UuGwmABU0Gt0G2mZk3hHMbRYbr2EbuXUFTGmBghd7JJoodEGqKnqiDoZkTROC
 Rfs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 33/55] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Wed, 25 Mar 2020 06:33:12 -0700
Message-ID: <20200325133334.19346-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

When in hover, the orientation information is not sent

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 0c885d5bd276bd9240c43aa046fc407cbe2ae864)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index daa77eb9561b..b1f54bf207b8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1026,10 +1026,6 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 			distance = MXT_DISTANCE_HOVERING;
 			hover = true;
 			active = true;
-
-			if (data->t100_aux_vect)
-				orientation = message[data->t100_aux_vect];
-
 			break;
 
 		case MXT_T100_TYPE_FINGER:
-- 
2.17.1

