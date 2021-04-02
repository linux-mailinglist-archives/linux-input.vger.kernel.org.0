Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159393528CE
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 11:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbhDBJbK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 05:31:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15593 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhDBJbK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Apr 2021 05:31:10 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FBZW01rvZz1BG4y;
        Fri,  2 Apr 2021 17:29:00 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 2 Apr 2021 17:30:57 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>,
        Dario Pagani <dario.pagani.146@gmail.com>,
        "Jiri Kosina" <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <linux-input@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] HID: thrustmaster: fix return value check in thrustmaster_probe()
Date:   Fri, 2 Apr 2021 09:40:41 +0000
Message-ID: <20210402094041.3424285-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix the return value check which testing the wrong variable
in thrustmaster_probe().

Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/hid/hid-thrustmaster.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
index bfcd08759ba0..fada3536f60e 100644
--- a/drivers/hid/hid-thrustmaster.c
+++ b/drivers/hid/hid-thrustmaster.c
@@ -311,7 +311,7 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
 	}
 
 	tm_wheel->change_request = kzalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
-	if (!tm_wheel->model_request) {
+	if (!tm_wheel->change_request) {
 		ret = -ENOMEM;
 		goto error5;
 	}

