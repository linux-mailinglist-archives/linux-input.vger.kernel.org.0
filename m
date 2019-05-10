Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 398BF196D3
	for <lists+linux-input@lfdr.de>; Fri, 10 May 2019 04:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfEJCyJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 May 2019 22:54:09 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:58080 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726896AbfEJCyJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 9 May 2019 22:54:09 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id DCC6EBDE43C344F5926F;
        Fri, 10 May 2019 10:54:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Fri, 10 May 2019 10:53:56 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH 1/3] Input: apanel: avoid panic if ioreamp fails
Date:   Fri, 10 May 2019 11:03:18 +0800
Message-ID: <20190510030320.109154-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-input@vger.kernel.org
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/input/misc/apanel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/apanel.c b/drivers/input/misc/apanel.c
index c1e66f45d552..1c7262ad4b5b 100644
--- a/drivers/input/misc/apanel.c
+++ b/drivers/input/misc/apanel.c
@@ -259,7 +259,9 @@ static int __init apanel_init(void)
 	unsigned char i2c_addr;
 	int found = 0;
 
-	bios = ioremap(0xF0000, 0x10000); /* Can't fail */
+	bios = ioremap(0xF0000, 0x10000);
+	if (!bios)
+		return -ENOMEM;
 
 	p = bios_signature(bios);
 	if (!p) {
-- 
2.20.1

