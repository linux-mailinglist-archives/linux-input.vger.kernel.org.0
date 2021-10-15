Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8748842E684
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 04:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235001AbhJOCap (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 22:30:45 -0400
Received: from mx22.baidu.com ([220.181.50.185]:51886 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234986AbhJOCao (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 22:30:44 -0400
Received: from BC-Mail-Ex26.internal.baidu.com (unknown [172.31.51.20])
        by Forcepoint Email with ESMTPS id C5B1299473A1198EF05A;
        Fri, 15 Oct 2021 10:28:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex26.internal.baidu.com (172.31.51.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 15 Oct 2021 10:28:32 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 15 Oct 2021 10:28:31 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <killertofu@gmail.com>, <Ping.Cheng@wacom.com>
CC:     <jikos@kernel.org>, <caihuoqing@baidu.com>,
        <benjamin.tissoires@redhat.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <Jason.Gerecke@wacom.com>,
        <skomra@gmail.com>, <joshua.dickens@wacom.com>
Subject: [PATCH v2 2/2] HID: wacom: Make use of the helper function devm_add_action_or_reset()
Date:   Fri, 15 Oct 2021 10:28:03 +0800
Message-ID: <20211015022803.3827-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211015022803.3827-1-caihuoqing@baidu.com>
References: <20211015022803.3827-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex31.internal.baidu.com (172.31.51.25) To
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
v1->v2:
	*Sort to patch series with [PATCH v2 1/2] from Jason

 drivers/hid/wacom_sys.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 62f50e4b837d..2717d39600b4 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -894,11 +894,9 @@ static int wacom_add_shared_data(struct hid_device *hdev)
 
 	wacom_wac->shared = &data->shared;
 
-	retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
-	if (retval) {
-		wacom_remove_shared_data(wacom);
+	retval = devm_add_action_or_reset(&hdev->dev, wacom_remove_shared_data, wacom);
+	if (retval)
 		return retval;
-	}
 
 	if (wacom_wac->features.device_type & WACOM_DEVICETYPE_TOUCH)
 		wacom_wac->shared->touch = hdev;
-- 
2.25.1

