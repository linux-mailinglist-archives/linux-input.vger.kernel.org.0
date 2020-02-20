Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7FC1661A6
	for <lists+linux-input@lfdr.de>; Thu, 20 Feb 2020 16:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgBTP7W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Feb 2020 10:59:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47604 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbgBTP7V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Feb 2020 10:59:21 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 17FE62951A1
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Collabora Kernel ML <kernel@collabora.com>, groeck@chromium.org,
        bleung@chromium.org, dtor@chromium.org, gwendal@chromium.org,
        pmalani@chromium.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Ting Shen <phoenixshen@chromium.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Fei Shao <fshao@chromium.org>, linux-input@vger.kernel.org
Subject: [PATCH 2/8] Input: cros_ec_keyb: Use cros_ec_cmd_xfer_status helper
Date:   Thu, 20 Feb 2020 16:58:53 +0100
Message-Id: <20200220155859.906647-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200220155859.906647-1-enric.balletbo@collabora.com>
References: <20200220155859.906647-1-enric.balletbo@collabora.com>
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
2.25.0

