Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB2D43F525
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 05:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhJ2DF2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 23:05:28 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:25323 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbhJ2DF1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 23:05:27 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HgRvB0j8rzbhKX;
        Fri, 29 Oct 2021 10:58:14 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 29 Oct 2021 11:02:54 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 29 Oct
 2021 11:02:53 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
CC:     <benjamin.tissoires@redhat.com>, <jikos@kernel.org>,
        <djogorchock@gmail.com>
Subject: [PATCH -next] HID: nintendo: fix missing unlock on error in joycon_leds_create()
Date:   Fri, 29 Oct 2021 11:10:43 +0800
Message-ID: <20211029031043.3330240-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the missing unlock before return from function joycon_leds_create()
in the error handling case.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: c5e626769563 ("HID: nintendo: add player led support")
Fixes: 697e5c7a34b0 ("HID: nintendo: add home led support")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/hid/hid-nintendo.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index c4270499fc6f..ddfb001a8fc9 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -1850,8 +1850,10 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 				      d_name,
 				      "green",
 				      joycon_player_led_names[i]);
-		if (!name)
-			return -ENOMEM;
+		if (!name) {
+			ret = -ENOMEM;
+			goto err_unlock;
+		}
 
 		led = &ctlr->leds[i];
 		led->name = name;
@@ -1864,7 +1866,7 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			return ret;
+			goto err_unlock;
 		}
 	}
 
@@ -1902,6 +1904,10 @@ static int joycon_leds_create(struct joycon_ctlr *ctlr)
 	}
 
 	return 0;
+
+err_unlock:
+	mutex_unlock(&joycon_input_num_mutex);
+	return ret;
 }
 
 static int joycon_battery_get_property(struct power_supply *supply,
-- 
2.25.1

