Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A44CA8FE3A
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfHPIjE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:04 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1982 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbfHPIjE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:04 -0400
IronPort-SDR: rnwDgqUG3xmR0wtwdABN0hMygBAECTJ1UT2q0lb+Idy2CdgQiBsYLctuAmGMBXP196e7amLRSL
 1XlbcrdNfo8/pbdB7GVOQFoFVu+k58GUFbQQ2uWPMNFDG55z3mZfcNKN3Nm4nLpdqCHleu0ZLl
 Oh8s/xvMq6i0EhEmMpgIiUl5kYEP1Leg2Wsh12Gee8Gooc29M5RUO8mo9X205yHFR0T/To5WxV
 2rf6rYRdvnlSgezb+RLrXRnqT299J8h9IjL9XDFA5c+Y1F8eaBRqiM6DDXJmMxXO+0sKln2mnv
 fwo=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484326"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:59 -0800
IronPort-SDR: /ANvxHRvxgDKA6tGt6y914PfrODrzSoMNWY4pUS4PGVl2eB8WiWGX2K9lRd/A7A1tF3DDVzMnm
 SzNq9bebixDf2eMsBFi8yGXmgjRhzGVccAUgBE6Q+r61WniA+yUW7zUa+Iy0paFEHOHUAA+QXZ
 puXX71G+YdwmgVV9Py8FcUZj4OdEVHN4fd/WEH9JHQE1wIucKWWSaU4n4zSeejTqiGZ772/ZgA
 4VdZKzOJLhiNaI/KV6FuHtHfShOLhCGJ9CkHTezU07IgRwq3hms0s6ApiO0CLW95/9NLW+1Y4N
 IzQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 43/63] Input: atmel_mxt_ts: update stale use_retrigen_workaround flag
Date:   Fri, 16 Aug 2019 17:35:38 +0900
Message-ID: <20190816083558.19189-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083558.19189-1-jiada_wang@mentor.com>
References: <20190816083558.19189-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>

If after configuration update, retrigen status is enabled, the
mxt_check_retrigen() function, called after configuration update,
does not clear the use_retrigen_workaround flag, if it was previously
set.

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index e315ad3a8d2a..b3d40390abb6 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1857,6 +1857,8 @@ static int mxt_check_retrigen(struct mxt_data *data)
 	int error;
 	int val;
 
+	data->use_retrigen_workaround = false;
+
 	if (irq_get_trigger_type(data->irq) & IRQF_TRIGGER_LOW)
 		return 0;
 
-- 
2.19.2

