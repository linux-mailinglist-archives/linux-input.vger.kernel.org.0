Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943A0272502
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 15:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgIUNKZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 09:10:25 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13759 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726501AbgIUNKY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:24 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 851822338D8AA5C9C5D5;
        Mon, 21 Sep 2020 21:10:21 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:11 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] Input: atmel_mxt_ts - simplify the return expression of mxt_send_bootloader_cmd
Date:   Mon, 21 Sep 2020 21:10:35 +0800
Message-ID: <20200921131035.92113-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 98f17fa3a..b9aa2c912 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -606,7 +606,6 @@ static int mxt_check_bootloader(struct mxt_data *data, unsigned int state,
 
 static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 {
-	int ret;
 	u8 buf[2];
 
 	if (unlock) {
@@ -617,11 +616,7 @@ static int mxt_send_bootloader_cmd(struct mxt_data *data, bool unlock)
 		buf[1] = 0x01;
 	}
 
-	ret = mxt_bootloader_write(data, buf, 2);
-	if (ret)
-		return ret;
-
-	return 0;
+	return mxt_bootloader_write(data, buf, 2);
 }
 
 static int __mxt_read_reg(struct i2c_client *client,
-- 
2.23.0

