Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC611C5184
	for <lists+linux-input@lfdr.de>; Tue,  5 May 2020 11:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgEEJFY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 05:05:24 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:41582 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725915AbgEEJFY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 5 May 2020 05:05:24 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4D868F62D3ABAF89CEC2;
        Tue,  5 May 2020 17:05:22 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 5 May 2020 17:05:21 +0800
From:   Xie XiuQi <xiexiuqi@huawei.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: atmel_mxt_ts: remove meaningless checking
Date:   Tue, 5 May 2020 17:09:30 +0800
Message-ID: <20200505090930.183748-1-xiexiuqi@huawei.com>
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

byte_offset is unsigned integer, it's always >= 0, so remove this
meaningless checking.

Signed-off-by: Xie XiuQi <xiexiuqi@huawei.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ae60442efda0..1bd072c5a49d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1368,7 +1368,7 @@ static int mxt_prepare_cfg_mem(struct mxt_data *data, struct mxt_cfg *cfg)
 
 			byte_offset = reg + i - cfg->start_ofs;
 
-			if (byte_offset >= 0 && byte_offset < cfg->mem_size) {
+			if (byte_offset < cfg->mem_size) {
 				*(cfg->mem + byte_offset) = val;
 			} else {
 				dev_err(dev, "Bad object: reg:%d, T%d, ofs=%d\n",
-- 
2.20.1

