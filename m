Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5715196D4
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2019 04:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbfEJCyN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 May 2019 22:54:13 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:58084 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726864AbfEJCyJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 May 2019 22:54:09 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E457EF57247D1671A9A1;
        Fri, 10 May 2019 10:54:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 May 2019 10:53:57 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Miloslav Trmac <mitr@volny.cz>,
        Wolfram Sang <wsa@the-dreams.de>,
        <linux-input@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH 2/3] Input: wistron_btns: avoid panic if ioreamp fails
Date:   Fri, 10 May 2019 11:03:19 +0800
Message-ID: <20190510030320.109154-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
References: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

If ioremap fails, NULL pointer dereference will happen and
leading to a kernel panic when access the virtual address
in check_signature().

Fix it by check the return value of ioremap.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Miloslav Trmac <mitr@volny.cz>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-input@vger.kernel.org
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/input/misc/wistron_btns.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 43e67f546366..a82ec3d102b4 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -107,7 +107,10 @@ static int __init map_bios(void)
 	ssize_t offset;
 	u32 entry_point;
 
-	base = ioremap(0xF0000, 0x10000); /* Can't fail */
+	base = ioremap(0xF0000, 0x10000);
+	if (!base)
+		return -ENOMEM;
+
 	offset = locate_wistron_bios(base);
 	if (offset < 0) {
 		printk(KERN_ERR "wistron_btns: BIOS entry point not found\n");
-- 
2.20.1

