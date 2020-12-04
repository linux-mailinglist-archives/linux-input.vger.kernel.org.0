Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A880F2CE97A
	for <lists+linux-input@lfdr.de>; Fri,  4 Dec 2020 09:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgLDIXr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Dec 2020 03:23:47 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:8943 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728698AbgLDIXr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Dec 2020 03:23:47 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CnQgQ2XWxzhlyw;
        Fri,  4 Dec 2020 16:22:42 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Fri, 4 Dec 2020 16:22:55 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Masaki Ota <masaki.ota@jp.alps.com>
CC:     Zhang Changzhong <zhangchangzhong@huawei.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] HID: alps: fix error return code in alps_input_configured()
Date:   Fri, 4 Dec 2020 16:26:09 +0800
Message-ID: <1607070370-32319-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: c7083d3f5348 ("HID: alps: properly handle max_fingers and minimum on X and Y axis")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/hid/hid-alps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index 3feaece..17782a6 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -759,7 +759,8 @@ static int alps_input_configured(struct hid_device *hdev, struct hid_input *hi)
 		__set_bit(INPUT_PROP_POINTER, input2->propbit);
 		__set_bit(INPUT_PROP_POINTING_STICK, input2->propbit);
 
-		if (input_register_device(data->input2)) {
+		ret = input_register_device(data->input2);
+		if (ret) {
 			input_free_device(input2);
 			goto exit;
 		}
-- 
2.9.5

