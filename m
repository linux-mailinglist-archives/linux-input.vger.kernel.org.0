Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E02418BA12
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727720AbgCSPCX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:23 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:16097 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728129AbgCSPCV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:21 -0400
IronPort-SDR: 0zTL7Za8JOUEyJPdPMenA9n7460q6vvYfF4VzN0cpemyXMwJxtlcpG0ZkS5ULfOYzlmxD8e+Eq
 P3PXeO4++u3unfcFIt6jcwE52SbZnRgdtHkriuY1BvJ6vbEVj73M2jOtOWFUuwDbqbSrUTBM1U
 x+8hufDwcqu8SovbEjB8nW4uv5OfukistON63N3rdHtUUjyYvwtHG2glOxVBULSFnRBwhOBjuI
 xE4Wfj6r90SoUrnRR9RfW4+NmGECBAolfm4JFmr/3+tJOenj7rpHnUUT0Ute8IVcfVdw7zeqp1
 nWM=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850344"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:02:19 -0800
IronPort-SDR: 7+VyomUZtwuDSYAh/SY6xAWH61GxtJJCC9q1OnWr8SWj/fLw5gaLoApLCfNrm9kXu4FPX7oWeH
 mbhS/18AQcub+EhPx3bzxG1WDZDSqq+xWFXhe8SrhXp8NCB3kx/4xZlHS/Grez27r193G3cO21
 aXFarAcgjeZlNEpuheWnHUCG0h3TuWmpO+E2g5z1g4AXP9xwwDFDSvro3rr1DwFcbFL6uC2LeY
 aTGLE+v4+2pNFYdEu3sIRNDzxvRx5h0lNfUIxs/26AgXtv9Katg99ivA1M8TIvIcLYMvfqimpT
 R+s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 30/52] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Thu, 19 Mar 2020 07:59:54 -0700
Message-ID: <20200319150016.61398-31-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
index 670159c2f218..2c3a59ff70c4 100644
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

