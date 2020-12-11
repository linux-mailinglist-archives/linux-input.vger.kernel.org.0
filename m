Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A717F2D723B
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 09:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392178AbgLKIuh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 03:50:37 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9517 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392566AbgLKIuU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 03:50:20 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cskwc5RXvzhqgM;
        Fri, 11 Dec 2020 16:49:04 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Fri, 11 Dec 2020 16:49:28 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] input: serio: convert comma to semicolon
Date:   Fri, 11 Dec 2020 16:49:57 +0800
Message-ID: <20201211084957.2540-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/input/serio/parkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/parkbd.c b/drivers/input/serio/parkbd.c
index ddbbd4afb4a2..3ac57a91ede4 100644
--- a/drivers/input/serio/parkbd.c
+++ b/drivers/input/serio/parkbd.c
@@ -168,7 +168,7 @@ static struct serio *parkbd_allocate_serio(void)
 	serio = kzalloc(sizeof(struct serio), GFP_KERNEL);
 	if (serio) {
 		serio->id.type = parkbd_mode;
-		serio->write = parkbd_write,
+		serio->write = parkbd_write;
 		strlcpy(serio->name, "PARKBD AT/XT keyboard adapter", sizeof(serio->name));
 		snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", parkbd_dev->port->name);
 	}
-- 
2.22.0

