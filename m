Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7118336B0B7
	for <lists+linux-input@lfdr.de>; Mon, 26 Apr 2021 11:35:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232239AbhDZJgM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Apr 2021 05:36:12 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:51732 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232078AbhDZJgL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Apr 2021 05:36:11 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0UWpMk66_1619429727;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UWpMk66_1619429727)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 26 Apr 2021 17:35:28 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] HID: hiddev: return -ENOMEM when kmalloc failed
Date:   Mon, 26 Apr 2021 17:35:26 +0800
Message-Id: <1619429726-54768-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver is using -1 instead of the -ENOMEM defined macro to
specify that a buffer allocation failed. Using the correct error
code is more intuitive.

Smatch tool warning:
drivers/hid/usbhid/hiddev.c:894 hiddev_connect() warn: returning -1
instead of -ENOMEM is sloppy

No functional change, just more standardized.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/hid/usbhid/hiddev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hiddev.c b/drivers/hid/usbhid/hiddev.c
index 45e0b1c..88020f3 100644
--- a/drivers/hid/usbhid/hiddev.c
+++ b/drivers/hid/usbhid/hiddev.c
@@ -891,7 +891,7 @@ int hiddev_connect(struct hid_device *hid, unsigned int force)
 	}
 
 	if (!(hiddev = kzalloc(sizeof(struct hiddev), GFP_KERNEL)))
-		return -1;
+		return -ENOMEM;
 
 	init_waitqueue_head(&hiddev->wait);
 	INIT_LIST_HEAD(&hiddev->list);
-- 
1.8.3.1

