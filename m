Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75421CA347
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgEHF7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:18 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:45906 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728139AbgEHF7O (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:14 -0400
IronPort-SDR: 5VkTlkxivbDZ5yPUL4Dm+uz450kupOsdfsJd3bmVfZQgegmZfGbyT3QLv4cJUlPb+2OuL8LG1w
 X4jKyTjdRKskx/32ne7kHebmazd6ghdNeGiWjoghm2xifSn/L/sLaRyed+bLXmOngzuC50Tu0b
 lEX6itCiO0O3cLZoYAcaolAHyhhpL427qPuvPYjCwf7D4dnECe5DPCHlgeLOkNKbRNN9voPmec
 v6PzE9Q7LNi4G9dIoCtwAVtRIXs8wPp+nakDMHNALa7G4aZGhnuLdpHwE9A382BG8EvAYxTSAn
 xRo=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48710644"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:14 -0800
IronPort-SDR: wm3fgo17k7SSJ/DnkYOOLsJxwrH7ObDSgby8pR5xdd4ArR7Qoswk9Egeo2EV/CNxwVXzUi4iiI
 la+krsiNlg8yr0cdy/8rEK7ZHNInxKdqPi2ykcBzKVPNAgHX9OeTrGDUTUmmTDTtj28Ybllwqz
 S4tFAZla9JOu2Gs2y0j1gyOPiT/nMjT5vkaFblsFcHUMRcfgmGlPZYPF3N7fkPslV1yZQSnRx7
 iu2X/IoiyxFf3GKxevW8vSp5X1VpZ4/oqrFGmEPJEVcSGgLADZ/6V5m2P76tz+TBjqd6K6o3fQ
 mto=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 35/56] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Thu, 7 May 2020 22:56:35 -0700
Message-ID: <20200508055656.96389-36-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 152069c3e15d..1027ebbc3978 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1027,10 +1027,6 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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

