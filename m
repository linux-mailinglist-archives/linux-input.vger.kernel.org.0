Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C459E2A4C8
	for <lists+linux-input@lfdr.de>; Sat, 25 May 2019 16:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfEYOJz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 May 2019 10:09:55 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:17158 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726917AbfEYOJz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 May 2019 10:09:55 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 138424CFE908AEBA324E;
        Sat, 25 May 2019 22:09:52 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Sat, 25 May 2019
 22:09:42 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices
Date:   Sat, 25 May 2019 22:09:08 +0800
Message-ID: <20190525140908.2804-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We should return 'retval' as the correct return value
instead of always zero.

Fixes: 74808f9115ce ("HID: logitech-dj: add support for non unifying receivers")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 41baa4dbbfcc..7f8db602eec0 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -1133,7 +1133,7 @@ static int logi_dj_recv_query_hidpp_devices(struct dj_receiver_dev *djrcv_dev)
 				    HID_REQ_SET_REPORT);
 
 	kfree(hidpp_report);
-	return 0;
+	return retval;
 }
 
 static int logi_dj_recv_query_paired_devices(struct dj_receiver_dev *djrcv_dev)
-- 
2.17.1


