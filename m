Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 667A4751F3
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 16:58:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388211AbfGYO61 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 10:58:27 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2757 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387834AbfGYO61 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 10:58:27 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 4B80EB1E2C5037A78C66;
        Thu, 25 Jul 2019 22:58:22 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Thu, 25 Jul 2019
 22:58:11 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <hdegoede@redhat.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] HID: logitech-dj: Fix check of logi_dj_recv_query_paired_devices()
Date:   Thu, 25 Jul 2019 22:57:19 +0800
Message-ID: <20190725145719.8344-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In delayedwork_callback(), logi_dj_recv_query_paired_devices
may return positive value while success now, so check it
correctly.

Fixes: dbcbabf7da92 ("HID: logitech-dj: fix return value of logi_dj_recv_query_hidpp_devices")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hid/hid-logitech-dj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
index 8cdf373..bf6b289 100644
--- a/drivers/hid/hid-logitech-dj.c
+++ b/drivers/hid/hid-logitech-dj.c
@@ -793,7 +793,7 @@ static void delayedwork_callback(struct work_struct *work)
 		break;
 	case WORKITEM_TYPE_UNKNOWN:
 		retval = logi_dj_recv_query_paired_devices(djrcv_dev);
-		if (retval) {
+		if (retval < 0) {
 			hid_err(djrcv_dev->hidpp, "%s: logi_dj_recv_query_paired_devices error: %d\n",
 				__func__, retval);
 		}
-- 
2.7.4


