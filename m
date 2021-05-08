Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59BD8376EF4
	for <lists+linux-input@lfdr.de>; Sat,  8 May 2021 04:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhEHCtD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 May 2021 22:49:03 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:17155 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbhEHCtC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 May 2021 22:49:02 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FcWqt19cGzncCN;
        Sat,  8 May 2021 10:44:42 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 10:47:50 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        Dmitry Torokhov <dtor@mail.ru>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] HID: pidff: fix error return code in hid_pidff_init()
Date:   Sat, 8 May 2021 10:47:37 +0800
Message-ID: <20210508024737.1927-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 224ee88fe395 ("Input: add force feedback driver for PID devices")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/hid/usbhid/hid-pidff.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index ea126c50acc3..3b4ee21cd811 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -1292,6 +1292,7 @@ int hid_pidff_init(struct hid_device *hid)
 
 	if (pidff->pool[PID_DEVICE_MANAGED_POOL].value &&
 	    pidff->pool[PID_DEVICE_MANAGED_POOL].value[0] == 0) {
+		error = -EPERM;
 		hid_notice(hid,
 			   "device does not support device managed pool\n");
 		goto fail;
-- 
2.25.1


