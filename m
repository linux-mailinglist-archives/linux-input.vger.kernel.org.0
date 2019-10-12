Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92152D4E47
	for <lists+linux-input@lfdr.de>; Sat, 12 Oct 2019 10:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728732AbfJLI3s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 12 Oct 2019 04:29:48 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3702 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728159AbfJLI3s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 12 Oct 2019 04:29:48 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 95AA3565EEFE49313AEB
        for <linux-input@vger.kernel.org>; Sat, 12 Oct 2019 16:29:45 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sat, 12 Oct 2019
 16:29:36 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <pali.rohar@gmail.com>, <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH] Input: alps - Remove unnecessary unlikely
Date:   Sat, 12 Oct 2019 16:36:47 +0800
Message-ID: <1570869407-41262-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

IS_ERR_OR_NULL already contains unlikely, there is no need
for another one.

Signed-off-by: zhengbin <zhengbin13@huawei.com>
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
2.7.4

