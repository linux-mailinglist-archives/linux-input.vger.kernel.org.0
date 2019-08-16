Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27DA98FDEE
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbfHPIfX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:35:23 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36047 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726836AbfHPIfW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:35:22 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:35:10 EDT
IronPort-SDR: N6VIAXB1EYIt1lmuBvYRAKWRUggIKyMwr9y4bt3yD5dHHd+wKUBX1w+a+NSmnMOA9cZlp0dOmW
 Wvdpg6VJxqvquWCva0JWEJBybLqg6olOwg9A/77ERjtQ8iPCsrxAoIU1kk87xh3TqC9Rq4NI45
 WeK7jVxKLmyfWobYP+a2CVTZ81Tlfz723wZ+qFnnAb8GEoaVpndMAc2IwARkfgHpdmNb3YHGKz
 GNSqAIulHSoW8bJGIZ0KL47Sml+WWxSP04u3d8khbnO41Gn+E0KMn00hLfdP+Z+FeMLdafyShp
 hUA=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519102"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:34:19 -0800
IronPort-SDR: CBP3MHee4vu/enOXZieG8nzIkzdxbh0ilvJguuY2DPQYq8guRSvPyVNFPMSzDp1g11lTSGi3aH
 YPSon/wT6hqybdmmh1VcQyaPLc81XGQKsA4FPalp7Y5oWnWJCPa5Nu43dYJYifOsck+85yla86
 9h45utnW622/ap/F9j5XJfOe5yAgwXGq7Uxi9P0yEQLMaE5FhqqbKFKBx5ksB4GbkF4o/JaJFj
 xk9B8JzafZd90r/3fctzB09ukB31M6vTUrEAl+gkUcX+tNt3d6mmMnEytWoY+5KkNbFp4PWH+a
 f0s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 29/63] Input: atmel_mxt_ts - orientation is not present in hover
Date:   Fri, 16 Aug 2019 17:33:41 +0900
Message-ID: <20190816083415.18819-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083415.18819-1-jiada_wang@mentor.com>
References: <20190816083415.18819-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
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
index 86c016dbec0d..ba608d04ee82 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1028,10 +1028,6 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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

