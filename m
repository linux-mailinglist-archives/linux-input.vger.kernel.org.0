Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823BE272504
	for <lists+linux-input@lfdr.de>; Mon, 21 Sep 2020 15:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbgIUNKU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Sep 2020 09:10:20 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42694 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727295AbgIUNKU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:20 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E839D3FFEA6E6DE235F6;
        Mon, 21 Sep 2020 21:10:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:09 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next] HID: intel-ish-hid: simplify the return expression of ishtp_bus_remove_device()
Date:   Mon, 21 Sep 2020 21:10:33 +0800
Message-ID: <20200921131033.92017-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index c47c3328a..bba29cd36 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -502,8 +502,6 @@ static void ishtp_bus_remove_device(struct ishtp_cl_device *device)
 int ishtp_cl_driver_register(struct ishtp_cl_driver *driver,
 			     struct module *owner)
 {
-	int err;
-
 	if (!ishtp_device_ready)
 		return -ENODEV;
 
@@ -511,11 +509,7 @@ int ishtp_cl_driver_register(struct ishtp_cl_driver *driver,
 	driver->driver.owner = owner;
 	driver->driver.bus = &ishtp_cl_bus_type;
 
-	err = driver_register(&driver->driver);
-	if (err)
-		return err;
-
-	return 0;
+	return driver_register(&driver->driver);
 }
 EXPORT_SYMBOL(ishtp_cl_driver_register);
 
-- 
2.23.0

