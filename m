Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8436831EA10
	for <lists+linux-input@lfdr.de>; Thu, 18 Feb 2021 13:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbhBRMxz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Feb 2021 07:53:55 -0500
Received: from out30-54.freemail.mail.aliyun.com ([115.124.30.54]:33092 "EHLO
        out30-54.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231185AbhBRKZ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Feb 2021 05:25:26 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0UOtQoj3_1613643837;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UOtQoj3_1613643837)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 18 Feb 2021 18:24:04 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     dmitry.torokhov@gmail.com
Cc:     rydberg@bitmath.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] Input: Use true and false for bool variable
Date:   Thu, 18 Feb 2021 18:23:55 +0800
Message-Id: <1613643835-1147-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following coccicheck warnings:

./drivers/input/touchscreen/zinitix.c:250:8-9: WARNING: return of 0/1 in
function 'zinitix_init_touch' with return type bool.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/input/touchscreen/zinitix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index a3e3adb..acb1d53 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -247,7 +247,7 @@ static bool zinitix_init_touch(struct bt541_ts_data *bt541)
 		udelay(10);
 	}
 
-	return 0;
+	return false;
 }
 
 static int zinitix_init_regulators(struct bt541_ts_data *bt541)
-- 
1.8.3.1

