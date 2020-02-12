Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1091F15A3A0
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728728AbgBLIpz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:45:55 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:43395 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgBLIpy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:45:54 -0500
IronPort-SDR: fcLPZL1HDPOscK1Iegj7iv9XvnxHOEQ32TgvHI3tuYo3QwaggNn9FFAUvaJ60Ay0NSXmwjpVBM
 dqp5Aq8XL9FVHAKMxx1EtH1hoKazj03LTlm7EXoRaF+bUkB4V74Mnfp4Jp7MJDn31D/S6T9h7+
 yYFodRw7hq9bFS6nPQc++cCXu0Wd0zDMkN33yN2OFFd8+vLhSmGA+BTkMxRM+JJiisv6lhc/Fn
 CRQ+13qHgXUXtaB6iQS8J3wrCPDwPodqvrncG4CMKDGFUX2aTUe3Ceajvht7VNuzIe5uq8e/kC
 8ec=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="47667061"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:45:54 -0800
IronPort-SDR: F4Ta9h3UXxZhB20FzEOy9XyipklEvhzMZdmUGoqCRhwt937XFo+ZSO0ezaPJ7XA8L3931uNVEt
 3/wGOZOEve+jahOMLnMGcdSpJtfKO2AHSXPzZ2RVZqEYjbUS2Innp+00C+KT6A0pgOshgmse9W
 PzG6H233yCmvn8TlwGg2Ibq/w4q3+QlnGgdKIF6BYB2Aapy6vdl7hbCLYayqMcpNKnmr0UTS9O
 m4hIB93N4qgBYsXzg887CinjBVQc+QZQehpeOFLYnpsLvltkIDUZ+P+VY4hgKW8K91bkws2ZFd
 YaM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 27/48] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Wed, 12 Feb 2020 00:41:57 -0800
Message-ID: <20200212084218.32344-28-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index b20b520cb278..64770d646052 100644
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

