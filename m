Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1267106814
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbfKVIZp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:45 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:60568 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727529AbfKVIZo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:44 -0500
IronPort-SDR: 6FKMhYuUEd7O25zaWCBe/YqzppFflF61uGsobbOuJqC7Cjup2dY8PwDG6B/ypUrDuOI5P72hSk
 0plPCMxTOlCZRC14HStuVRAc8lFABa6FbaPXJyluxV6lTreZHwEPfwB75oKfhfnNTBMdvmCTKp
 nwlQ57OekxQeXik/QsrKSwAxC8+9nGGgfACGzLXedWicFSyycLB296e29hEZGtdwf8nnaZvLLH
 Z8HDGyl5HHdHgw7Jb0Dzb3IcSonGbfOn7vwdz2kh8zJUc1KwZabgT20sNLyCMQS8a6WMYH7Yz9
 yuY=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="45291148"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:44 -0800
IronPort-SDR: 8vcvcRxrs7iO1JAqq+x+sUhEE4gMRC1dNJN16YfYxcDEQJ8ULcjqZhNcpoOOEVDzBKgi2+JlII
 8n/Dzzf/VL8/VpP9Rhrlr/N5U6IUTc1kvPbeycGNp+2zNg9jwS1uABUzmKuK3bdMhOPJfkGThh
 GPpyQjYjbsVb0yNhmCYP4JH1zt0P+vc8Vr+8kX44V5VUFBc0lP0PSoECgsTfRd4MgoLbVUeqJQ
 kixQ/AcCJut5EZpoa1yM4HVgw8OwrVS5+28rQPzFDqN/O6AjSgQVJpsiEY19lAY5H5P0ty4ztH
 UFo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 27/48] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Fri, 22 Nov 2019 17:23:41 +0900
Message-ID: <20191122082402.18173-28-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index fc2f804e5293..de77079e3324 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1029,10 +1029,6 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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

