Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3BB11A8D3B
	for <lists+linux-input@lfdr.de>; Tue, 14 Apr 2020 23:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633574AbgDNVEr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Apr 2020 17:04:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48184 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731698AbgDNVEo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Apr 2020 17:04:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 423B22A1C3A
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
        bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Fei Shao <fshao@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Ting Shen <phoenixshen@chromium.org>,
        linux-input@vger.kernel.org
Subject: [RESEND PATCH] Input: cros_ec_keyb: Use cros_ec_cmd_xfer_status helper
Date:   Tue, 14 Apr 2020 23:04:34 +0200
Message-Id: <20200414210434.1534982-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch makes use of cros_ec_cmd_xfer_status() instead of
cros_ec_cmd_xfer(). In this case there is no advantage of doing this
apart from that we want to make cros_ec_cmd_xfer() a private function
for the EC protocol and let people only use the
cros_ec_cmd_xfer_status() to return Linux standard error codes.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
This patch was initially part of this series [1]. The other patches in
the series have been applied and remains this, hence, I send this patch
alone as a RESEND.

[1] https://patchwork.kernel.org/cover/11394361/

 drivers/input/keyboard/cros_ec_keyb.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 2b71c5a51f90..fc1793ca2f17 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -347,18 +347,14 @@ static int cros_ec_keyb_info(struct cros_ec_device *ec_dev,
 	params->info_type = info_type;
 	params->event_type = event_type;
 
-	ret = cros_ec_cmd_xfer(ec_dev, msg);
-	if (ret < 0) {
-		dev_warn(ec_dev->dev, "Transfer error %d/%d: %d\n",
-			 (int)info_type, (int)event_type, ret);
-	} else if (msg->result == EC_RES_INVALID_VERSION) {
+	ret = cros_ec_cmd_xfer_status(ec_dev, msg);
+	if (ret == -ENOTSUPP) {
 		/* With older ECs we just return 0 for everything */
 		memset(result, 0, result_size);
 		ret = 0;
-	} else if (msg->result != EC_RES_SUCCESS) {
-		dev_warn(ec_dev->dev, "Error getting info %d/%d: %d\n",
-			 (int)info_type, (int)event_type, msg->result);
-		ret = -EPROTO;
+	} else if (ret < 0) {
+		dev_warn(ec_dev->dev, "Transfer error %d/%d: %d\n",
+			 (int)info_type, (int)event_type, ret);
 	} else if (ret != result_size) {
 		dev_warn(ec_dev->dev, "Wrong size %d/%d: %d != %zu\n",
 			 (int)info_type, (int)event_type,
-- 
2.25.1

