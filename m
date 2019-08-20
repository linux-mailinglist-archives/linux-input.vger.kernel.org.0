Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 015A595CB9
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 12:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729527AbfHTK4V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 06:56:21 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:44747 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbfHTK4V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 06:56:21 -0400
Received: from orion.localdomain ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N7zJj-1iL0so05K7-0154qV; Tue, 20 Aug 2019 12:56:13 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     pali.rohar@gmail.com, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net
Subject: [PATCH 2/2] drivers: input: mouse: alps: drop unneeded likely() call around IS_ERR()
Date:   Tue, 20 Aug 2019 12:56:12 +0200
Message-Id: <1566298572-12409-2-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1566298572-12409-1-git-send-email-info@metux.net>
References: <1566298572-12409-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:whkxWFqHpdHfrjQsHABxXf1siumYRLGP1V4hb0olYemOQT1Nzjf
 qMmymy5q7ZV5VEDz5lK7NyHZGO0O9prrItp68Ft6NqId8+BdUy0rqRRUJj53S9mX+ow93BY
 coIjXUof8+bn3SkO6vNDrjHwgPAHAZCtjVpliAtWXKgvs40v6di15iK2WEP1BWHC7hZDf+L
 VpunXR1NttP6PMIh/Ukog==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+DIcX1QlTiw=:nVNYVKLc+ATQtvzPHMsY+Y
 +Ne3LJmQHZB5q06NivPCAYHDc9Ak6JezzxvQyViqN2U9lY4+XaSdP7Durz5Jd5MaiAXBeTE28
 rQWJKQDoJjUub07K+CjNs84BvE770bXjwfHRCLexa5eTBgB/tfzW3XCkAD7By3HtOn2577NlZ
 XKpTlZF0087qKbXV0g0AScBkUKRcUGDGVfd5DYUufjDOZCRH74AzQj6+Ue3PzCgmmbDIkGINb
 GIqUM4WxfuyedytTyJFElXV2322RvWN/eM2IvLJw7g8RwiNIMcMdQklWrfm5IRsJRDLiNH9XD
 4sbO9kSfS6LhY37LKQSKKEoRBe/sJBWCV8VLFrkx1T8HJT2kbvPDsVeHITVrxFGRo9ity07gu
 2Rat4b4lQ1aTUFDIYe1S28i5WOJ0jaWf2essY9zYpMIyo05qL4weRnTxqPaTEMWua7WPNUrQG
 fTkJnD+ir0Nif1aeh2mouu6AnYta6teQq+g473AXuMn09kRWBBzDqsIgcdXBZBS0eUfRfVO6v
 cQDbuCrC2PGDK27BsmI+kCyjSYURHlmOq0c0y7VpaE5y+Xo/BGb2KL3lsd2pLKcSAYSJp5QPS
 aXk3YRjN3CDhNq2XAWGYJcq0UFeK27TCCEKf+8dfWGAvkXGcOREy3KsrtxniHUq1LiXdyj5r2
 Dufff3BUhJXzSO+83UteUzHohchevLG9Hq2Ne56Qlf7IhZ5Cd7VZhFbLna1u6lyfYvlfa+fXn
 R0sFKPegY1lNccaNu7R9tg/cekmmHzt/R4mAqg==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

IS_ERR() already calls unlikely(), so this extra unlikely() call
around IS_ERR() is not needed.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/input/mouse/alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
index 34700ed..ed16614 100644
--- a/drivers/input/mouse/alps.c
+++ b/drivers/input/mouse/alps.c
@@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
 		/* On V2 devices the DualPoint Stick reports bare packets */
 		dev = priv->dev2;
 		dev2 = psmouse->dev;
-	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
+	} else if (IS_ERR_OR_NULL(priv->dev3)) {
 		/* Register dev3 mouse if we received PS/2 packet first time */
 		if (!IS_ERR(priv->dev3))
 			psmouse_queue_work(psmouse, &priv->dev3_register_work,
-- 
1.9.1

