Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C483F376E26
	for <lists+linux-input@lfdr.de>; Sat,  8 May 2021 03:51:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhEHBw0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 May 2021 21:52:26 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:18365 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbhEHBwZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 May 2021 21:52:25 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FcVbv0kPvzlbx1;
        Sat,  8 May 2021 09:49:15 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 09:51:16 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     <linux-input@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] HID: gt683r: add missing MODULE_DEVICE_TABLE
Date:   Sat, 8 May 2021 11:14:48 +0800
Message-ID: <20210508031448.53445-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/hid/hid-gt683r.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-gt683r.c b/drivers/hid/hid-gt683r.c
index 898871c8c768..29ccb0accfba 100644
--- a/drivers/hid/hid-gt683r.c
+++ b/drivers/hid/hid-gt683r.c
@@ -54,6 +54,7 @@ static const struct hid_device_id gt683r_led_id[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI, USB_DEVICE_ID_MSI_GT683R_LED_PANEL) },
 	{ }
 };
+MODULE_DEVICE_TABLE(hid, gt683r_led_id);
 
 static void gt683r_brightness_set(struct led_classdev *led_cdev,
 				enum led_brightness brightness)

