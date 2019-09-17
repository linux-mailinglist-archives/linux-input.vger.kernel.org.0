Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCD50B4AE7
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbfIQJkV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:40:21 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:20545 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbfIQJkU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:40:20 -0400
IronPort-SDR: MB+HfJsILYF2LxIpWnkQxpmzquqr4a7TB3NboF0+q04Q0sCfZoAbZO4DdA79y4W6yyuTtx6x0O
 vjYZc2EU6gIPHlqEMbtXAQlMH/84mCAosRuuZtBfIqOZb6NmGzqRqYZimHAv3CevXBqxjMnGXK
 SPwjGjPBe4OvvEqM7JnuvfQ7UgGYpPHr4ldlBdZIE0Ivjs8s1w57OhzwqQlvWHqvAaxrgbUOSR
 I3THSOY25Io8vfmwf3lLCY848YvMHczaWfw2iCLPLwz+udHxTchgCkqqqvgdI+Y23NSigfEsxy
 dZ8=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41416551"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:40:07 -0800
IronPort-SDR: IiqBV6rRLBISyheVkTJnmfnOdWAhT7b4xXxtA4E6S1EZqoDxQWBMncstf0kOk8TC0eoqcSiMk0
 LHM0mXT8p4kfg/2YDgRYcWLMyejnHGfILug+mPDWH1dYLlrbbNtwu/AuT/J1JOuvoVwD9yKl+z
 fKVRdLAB9uQd8lfYENQcmkKe1qlSUc9FLlNK+r8i9mCFoLOGrGZBR5UAfBbcVgChvU1p4GUTXy
 fCcYaH9DHCSlJlTo+83XPJs74sZaR44Q6II1EN8+/Lq5pfGtX03YmZW9JZKQLfMtuiK4AzFOGT
 cXg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 28/49] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Tue, 17 Sep 2019 18:38:54 +0900
Message-ID: <20190917093915.18645-9-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093915.18645-1-jiada_wang@mentor.com>
References: <20190917093915.18645-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index cf77f46dd08d..570001131a65 100644
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
2.19.2

