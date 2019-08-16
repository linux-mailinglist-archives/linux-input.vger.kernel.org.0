Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440698FE5A
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727315AbfHPIk1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:27 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42029 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727333AbfHPIib (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:31 -0400
IronPort-SDR: Ly78b6QebDGjPRsRWo/DQT8E5vqEupeRcJoVVX5/GPzdLaK6e1hSgco8Kv7Ksza2tf2nTdCPkI
 xPR0i8ZB7rmYFWmHKLcEZs2VOIXUL4I+2s+bUc8PcU9kOtHY8smrTzOiM6p6ls0laStrFYwdOB
 pmFVhu2Azydxo2i9bdOU3JN0PIpOig1F7nPdMD9hTXXxDfcXYN0/SLTg9iq2NOLYSIxqWPj5G8
 hiY0rUgYOJDt4med7lmRcjR2imzkp49Do6sotOFKHtyorND/7fIhE1jjPsY8PeVcB/hHtl5Gaw
 lsg=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507250"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:38:30 -0800
IronPort-SDR: 2k0m6Ynn8cFlHoqfMBk1ZPmQ1p0/8WV836a51VjtBgp0aKLZwqgoRrRF59OZQ8TeezQ1mHngvF
 V7ZO6eVqD+ZBGm3V7N8KLsJKtEE4r7k9stItbpaFGZQsFjJ3kfU2dteBy2b55HtvwdKbuZd0Kk
 IazP7mUAGkUm6ZJvsPRZ+gusfW/C3G8Er9WXYIZYzaSmGhPVm36Jb3H7U5yl6soBJvH6lkbkAz
 SKkXa1jR1hBPAXKw5WPkqTtIwn58ccM08YTsaRUsO5e+Qxh1y2YKSNalRMKXGL4RkAMXvr6MQr
 M0Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 58/63] Input: atmel_mxt_ts: Remove sysfs attributes during driver detach
Date:   Fri, 16 Aug 2019 17:38:25 +0900
Message-ID: <20190816083830.19553-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083830.19553-1-jiada_wang@mentor.com>
References: <20190816083830.19553-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sanjeev Chugh <Sanjeev_Chugh@mentor.com>

This change prevents a scenario when sysfs attributes for Atmel touch
controller driver are being accessed by userland while touch driver
module unloading has already begun. At present, sysfs attribute files
are created at device probe but they are not removed while driver is
being detached.

This change will prevent calls to generic driver layer when the sysfs
driver attributes files are already deleted. Therefore, kernel will not
attempt to invoke driver routines for showing the sysfs atrributes.

Signed-off-by: Sanjeev Chugh <Sanjeev_Chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 234e3031ba42..431c2c54eab0 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2255,10 +2255,12 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 static void mxt_free_input_device(struct mxt_data *data)
 {
 	if (data->input_dev) {
-		struct input_dev *dev = data->input_dev;
+		struct input_dev *input_dev = data->input_dev;
 
 		data->input_dev = NULL;
-		input_unregister_device(dev);
+		sysfs_remove_group(&input_dev->dev.kobj,
+				   &data->gpio_attrs);
+		input_unregister_device(input_dev);
 	}
 }
 
-- 
2.19.2

