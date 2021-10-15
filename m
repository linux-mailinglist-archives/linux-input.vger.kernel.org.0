Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB95542E685
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 04:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235011AbhJOCap (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Oct 2021 22:30:45 -0400
Received: from mx22.baidu.com ([220.181.50.185]:51840 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231331AbhJOCap (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Oct 2021 22:30:45 -0400
Received: from BC-Mail-Ex27.internal.baidu.com (unknown [172.31.51.21])
        by Forcepoint Email with ESMTPS id 28BE16532D595797F2F6;
        Fri, 15 Oct 2021 10:28:32 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex27.internal.baidu.com (172.31.51.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 15 Oct 2021 10:28:31 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 15 Oct 2021 10:28:31 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <killertofu@gmail.com>, <Ping.Cheng@wacom.com>
CC:     <jikos@kernel.org>, <caihuoqing@baidu.com>,
        <benjamin.tissoires@redhat.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <Jason.Gerecke@wacom.com>,
        <skomra@gmail.com>, <joshua.dickens@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Subject: [PATCH v2 1/2] RFC: HID: wacom: Shrink critical section in `wacom_add_shared_data`
Date:   Fri, 15 Oct 2021 10:28:02 +0800
Message-ID: <20211015022803.3827-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex31.internal.baidu.com (172.31.51.25) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jason Gerecke <jason.gerecke@wacom.com>

The size of the critical section in this function appears to be larger
than necessary. The `wacom_udev_list_lock` exists to ensure that one
interface cannot begin checking if a shared object exists while a second
interface is doing the same (otherwise both could determine that no
object exists yet and create their own independent objects rather than
sharing just one). It should be safe for the critical section to end
once a fresly-allocated shared object would be found by other threads
(i.e., once it has been added to `wacom_udev_list`, which is looped
over by `wacom_get_hdev_data`).

This commit is a necessary pre-requisite for a later change to swap the
use of `devm_add_action` with `devm_add_action_or_reset`, which would
otherwise deadlock in its error case.

Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
---
v1->v2:
	*Fix the repeated word 'that' in changelog
	*Sort to patch series with [PATCH v2 2/2] from Cai

 drivers/hid/wacom_sys.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index 93f49b766376..62f50e4b837d 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -881,8 +881,8 @@ static int wacom_add_shared_data(struct hid_device *hdev)
 	if (!data) {
 		data = kzalloc(sizeof(struct wacom_hdev_data), GFP_KERNEL);
 		if (!data) {
-			retval = -ENOMEM;
-			goto out;
+			mutex_unlock(&wacom_udev_list_lock);
+			return -ENOMEM;
 		}
 
 		kref_init(&data->kref);
@@ -890,11 +890,12 @@ static int wacom_add_shared_data(struct hid_device *hdev)
 		list_add_tail(&data->list, &wacom_udev_list);
 	}
 
+	mutex_unlock(&wacom_udev_list_lock);
+
 	wacom_wac->shared = &data->shared;
 
 	retval = devm_add_action(&hdev->dev, wacom_remove_shared_data, wacom);
 	if (retval) {
-		mutex_unlock(&wacom_udev_list_lock);
 		wacom_remove_shared_data(wacom);
 		return retval;
 	}
@@ -904,8 +905,6 @@ static int wacom_add_shared_data(struct hid_device *hdev)
 	else if (wacom_wac->features.device_type & WACOM_DEVICETYPE_PEN)
 		wacom_wac->shared->pen = hdev;
 
-out:
-	mutex_unlock(&wacom_udev_list_lock);
 	return retval;
 }
 
-- 
2.25.1

