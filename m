Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E002C0BD0
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 14:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgKWNbZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 08:31:25 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:7718 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731864AbgKWNbR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 08:31:17 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cfp1l3r0czkZvJ;
        Mon, 23 Nov 2020 21:30:35 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Mon, 23 Nov 2020 21:30:52 +0800
From:   Luo Meng <luomeng12@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <gustavoars@kernel.org>,
        <hdegoede@redhat.com>, <rajatja@google.com>,
        <linux-input@vger.kernel.org>, <luomeng12@huawei.com>
Subject: [PATCH] Input: i8042 - fix error return code in i8042_setup_aux()
Date:   Mon, 23 Nov 2020 21:34:20 +0800
Message-ID: <20201123133420.4071187-1-luomeng12@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix to return a negative error code from the error handling case
instead of 0 in function i8042_setup_aux(), as done elsewhere in this
function.

Fixes: f81134163fc7 ("Input: i8042 - use platform_driver_probe")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Luo Meng <luomeng12@huawei.com>
---
 drivers/input/serio/i8042.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 944cbb519c6d..abae23af0791 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1471,7 +1471,8 @@ static int __init i8042_setup_aux(void)
 	if (error)
 		goto err_free_ports;
 
-	if (aux_enable())
+	error = aux_enable();
+	if (error)
 		goto err_free_irq;
 
 	i8042_aux_irq_registered = true;
-- 
2.25.4

