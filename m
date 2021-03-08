Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859C2330D3B
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 13:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCHMUT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 07:20:19 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13482 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbhCHMUT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 07:20:19 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DvHS475GVzjTYN;
        Mon,  8 Mar 2021 20:18:28 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Mon, 8 Mar 2021 20:20:06 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lauri Kasanen <cand@gmx.com>
CC:     <linux-input@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Hulk Robot" <hulkci@huawei.com>
Subject: [PATCH -next] Input: n64joy - Fix return value check in n64joy_probe()
Date:   Mon, 8 Mar 2021 12:28:56 +0000
Message-ID: <20210308122856.2177071-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function devm_platform_ioremap_resource()
returns ERR_PTR() and never returns NULL. The NULL test in the
return value check should be replaced with IS_ERR().

Fixes: 3bdffa8ffb45 ("Input: Add N64 controller driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/input/joystick/n64joy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/joystick/n64joy.c b/drivers/input/joystick/n64joy.c
index 8bcc529942bc..9dbca366613e 100644
--- a/drivers/input/joystick/n64joy.c
+++ b/drivers/input/joystick/n64joy.c
@@ -252,8 +252,8 @@ static int __init n64joy_probe(struct platform_device *pdev)
 	mutex_init(&priv->n64joy_mutex);
 
 	priv->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (!priv->reg_base) {
-		err = -EINVAL;
+	if (IS_ERR(priv->reg_base)) {
+		err = PTR_ERR(priv->reg_base);
 		goto fail;
 	}
 

