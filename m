Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49711FB437
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 16:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbfKMPwN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 10:52:13 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36983 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbfKMPwN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:13 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iUuwD-0006Cs-8q; Wed, 13 Nov 2019 15:52:09 +0000
From:   Colin King <colin.king@canonical.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: alps: fix indentation issue
Date:   Wed, 13 Nov 2019 15:52:09 +0000
Message-Id: <20191113155209.95908-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is an if statement that is indented too deeply, remove
the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hid/hid-alps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-alps.c b/drivers/hid/hid-alps.c
index ae79a7c66737..280f1962914b 100644
--- a/drivers/hid/hid-alps.c
+++ b/drivers/hid/hid-alps.c
@@ -525,7 +525,7 @@ static int u1_init(struct hid_device *hdev, struct alps_dev *pri_data)
 
 	ret = u1_read_write_register(hdev, ADDRESS_U1_NUM_SENS_Y,
 			&sen_line_num_y, 0, true);
-		if (ret < 0) {
+	if (ret < 0) {
 		dev_err(&hdev->dev, "failed U1_NUM_SENS_Y (%d)\n", ret);
 		goto exit;
 	}
-- 
2.20.1

