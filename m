Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D2B4149F4
	for <lists+linux-input@lfdr.de>; Wed, 22 Sep 2021 14:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhIVNBS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Sep 2021 09:01:18 -0400
Received: from mx24.baidu.com ([111.206.215.185]:54386 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230356AbhIVNBS (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Sep 2021 09:01:18 -0400
Received: from BC-Mail-Ex25.internal.baidu.com (unknown [172.31.51.19])
        by Forcepoint Email with ESMTPS id B98E41151463E85EF74A;
        Wed, 22 Sep 2021 20:59:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex25.internal.baidu.com (172.31.51.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Wed, 22 Sep 2021 20:59:46 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Wed, 22 Sep 2021 20:59:46 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] HID: wacom: Make use of the helper function devm_add_action_or_reset()
Date:   Wed, 22 Sep 2021 20:59:39 +0800
Message-ID: <20210922125939.427-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex09.internal.baidu.com (10.127.64.32) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The helper function devm_add_action_or_reset() will internally
call devm_add_action(), and if devm_add_action() fails then it will
execute the action mentioned and return the error code. So
use devm_add_action_or_reset() instead of devm_add_action()
to simplify the error handling, reduce the code.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/hid/wacom_sys.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 93f49b766376..3aed7ba249f7 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -892,10 +892,9 @@ static int wacom_add_shared_data(struct hid_device *hdev)
 
 	wacom_wac->shared = &data->shared;
 
-	retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
+	retval = devm_add_action_or_reset(&hdev->dev, wacom_remove_shared_data, wacom);
 	if (retval) {
 		mutex_unlock(&wacom_udev_list_lock);
-		wacom_remove_shared_data(wacom);
 		return retval;
 	}
 
-- 
2.25.1

