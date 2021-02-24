Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC993238E6
	for <lists+linux-input@lfdr.de>; Wed, 24 Feb 2021 09:46:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234441AbhBXIpi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Feb 2021 03:45:38 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:58834 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234039AbhBXIoL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Feb 2021 03:44:11 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R761e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UPR-PAi_1614156207;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UPR-PAi_1614156207)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 16:43:27 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] Input: edt-ft5x06: Replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE
Date:   Wed, 24 Feb 2021 16:43:26 +0800
Message-Id: <1614156206-94124-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the following coccicheck warning:
./drivers/input/touchscreen/edt-ft5x06.c:697:0-23: WARNING:
debugfs_mode_fops should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 2eefbc2..12bbc58 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -694,7 +694,7 @@ static int edt_ft5x06_debugfs_mode_set(void *data, u64 mode)
 	return retval;
 };
 
-DEFINE_SIMPLE_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
+DEFINE_DEBUGFS_ATTRIBUTE(debugfs_mode_fops, edt_ft5x06_debugfs_mode_get,
 			edt_ft5x06_debugfs_mode_set, "%llu\n");
 
 static ssize_t edt_ft5x06_debugfs_raw_data_read(struct file *file,
-- 
1.8.3.1

