Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7818F199425
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730803AbgCaKxC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:02 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730601AbgCaKxB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:01 -0400
IronPort-SDR: Dm/vb8HQ2KQZ+t4YMBBNT/GGW0L11hd3FOPuea4EXlctJ1pfhi5YhRn8DXU8DBu2UA6/1Cr6p5
 qidkIGRAd3PXk5ugQ2jEWzJLXZ2INcBqMFViPkDjdWEQ65B+Abq74Y6YG23hbIUOSWyp63mbJW
 uOqmb0fO0jAsCMstVZmOPzIhigRBouFwrys7ZiuALCS61nArMPbUgdFla6LYVa3b4cD0fsKil9
 1IZ7MYyWhDQfY7J3l/ev9TgpUkMzdW3k/bK0NghXj6rL0U8MXrqNfuD+wVehC2cVxcWHNfuGNO
 LhA=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330803"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:01 -0800
IronPort-SDR: oPNaySp6kJ9zbsH9iw9RA4VW4nRhH0EANtxiptfLfQymY+OTaoAKdC1hPs+xLkUNjsEVwg6ErD
 SoJy4uf4qbE//pNgPSmdC/LfHyc1PolGPe5LwT4iH6kB5A91F3PlGsatdhxlnVOS8RyK8sYAli
 ct5j80zDR2ICuJVGplPxxwQ8IXO3ZPBm/6ub+oWvqLn5++3GXfE16bha+kRt/uJEldtMlfW63d
 I1IZqXw+q6PIqSNZeNq4c3ftPnA0VlhIl2/LW0pcKvGEtQJk/adub5yqnpoInivAMcfDUknsNv
 BtY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 33/55] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Tue, 31 Mar 2020 03:50:29 -0700
Message-ID: <20200331105051.58896-34-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

