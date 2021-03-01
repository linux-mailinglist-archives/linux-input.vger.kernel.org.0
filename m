Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01683278E8
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 09:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbhCAIIy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 03:08:54 -0500
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:42581 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232707AbhCAIIx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 03:08:53 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UPvxMk1_1614586089;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPvxMk1_1614586089)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 01 Mar 2021 16:08:10 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     bleung@chromium.org
Cc:     dmitry.torokhov@gmail.com, groeck@chromium.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] Input: cros_ec_keyb: Switch to using the new API kobj_to_dev()
Date:   Mon,  1 Mar 2021 16:08:08 +0800
Message-Id: <1614586088-115182-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

fixed the following coccicheck:
./drivers/input/keyboard/cros_ec_keyb.c:647:60-61: WARNING opportunity
for kobj_to_dev()

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/input/keyboard/cros_ec_keyb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 38457d9..fc02c54 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -644,7 +644,7 @@ static umode_t cros_ec_keyb_attr_is_visible(struct kobject *kobj,
 					    struct attribute *attr,
 					    int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct cros_ec_keyb *ckdev = dev_get_drvdata(dev);
 
 	if (attr == &dev_attr_function_row_physmap.attr &&
-- 
1.8.3.1

