Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8BB2741D1
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 14:09:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgIVMJe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 08:09:34 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51470 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726543AbgIVMJe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 08:09:34 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 601AE1EE3159026A3696;
        Tue, 22 Sep 2020 20:09:31 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 20:09:24 +0800
From:   Xiaofei Tan <tanxiaofei@huawei.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <hdegoede@redhat.com>, <kai.heng.feng@canonical.com>,
        <vicamo.yang@canonical.com>, <daniel.playfair.cal@gmail.com>,
        <admin@kryma.net>
CC:     <linuxarm@huawei.com>, Xiaofei Tan <tanxiaofei@huawei.com>
Subject: [PATCH] HID: i2c-hid: fix some doc warnings in i2c-hid-core.c
Date:   Tue, 22 Sep 2020 20:08:04 +0800
Message-ID: <1600776484-31742-1-git-send-email-tanxiaofei@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix following warnings caused by mismatch bewteen function parameters
and comments.
drivers/hid/i2c-hid/i2c-hid-core.c:331: warning: Function parameter or member 'data_len' not described in 'i2c_hid_set_or_send_report'
drivers/hid/i2c-hid/i2c-hid-core.c:331: warning: Excess function parameter 'len' description in 'i2c_hid_set_or_send_report'

Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index dbd0449..01e9b36 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -323,7 +323,7 @@ static int i2c_hid_get_report(struct i2c_client *client, u8 reportType,
  * @reportType: 0x03 for HID_FEATURE_REPORT ; 0x02 for HID_OUTPUT_REPORT
  * @reportID: the report ID
  * @buf: the actual data to transfer, without the report ID
- * @len: size of buf
+ * @data_len: size of buf
  * @use_data: true: use SET_REPORT HID command, false: send plain OUTPUT report
  */
 static int i2c_hid_set_or_send_report(struct i2c_client *client, u8 reportType,
-- 
2.8.1

