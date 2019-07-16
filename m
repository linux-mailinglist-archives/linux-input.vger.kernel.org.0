Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1A86A42E
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 10:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728015AbfGPIsr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 04:48:47 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49040 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726465AbfGPIsr (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 04:48:47 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 99B11168B1921582D608;
        Tue, 16 Jul 2019 16:48:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Tue, 16 Jul 2019 16:48:38 +0800
From:   Mao Wenan <maowenan@huawei.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Mao Wenan <maowenan@huawei.com>
Subject: [PATCH -next] keyboard: remove set but not used variables 'sts'
Date:   Tue, 16 Jul 2019 16:54:23 +0800
Message-ID: <20190716085423.19443-1-maowenan@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/input/keyboard/applespi.c: In function applespi_set_bl_level:
drivers/input/keyboard/applespi.c:902:6: warning: variable sts set but not used [-Wunused-but-set-variable]

Fixes: b426ac0452093d ("Input: add Apple SPI keyboard and trackpad driver")

Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 drivers/input/keyboard/applespi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index c1a6843..548737e 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -899,7 +899,6 @@ static void applespi_set_bl_level(struct led_classdev *led_cdev,
 	struct applespi_data *applespi =
 		container_of(led_cdev, struct applespi_data, backlight_info);
 	unsigned long flags;
-	int sts;
 
 	spin_lock_irqsave(&applespi->cmd_msg_lock, flags);
 
@@ -916,7 +915,7 @@ static void applespi_set_bl_level(struct led_classdev *led_cdev,
 			 KBD_BL_LEVEL_MIN);
 	}
 
-	sts = applespi_send_cmd_msg(applespi);
+	applespi_send_cmd_msg(applespi);
 
 	spin_unlock_irqrestore(&applespi->cmd_msg_lock, flags);
 }
-- 
2.7.4

