Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB91129AD8F
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 14:39:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752383AbgJ0Njj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 09:39:39 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:5550 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752381AbgJ0Njj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 09:39:39 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CLCVj6YnFzhcY2
        for <linux-input@vger.kernel.org>; Tue, 27 Oct 2020 21:39:41 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 27 Oct 2020
 21:39:36 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>
Subject: [PATCH -next] Input: joystick - Put the minu sign with the sickle of the error code
Date:   Tue, 27 Oct 2020 21:50:20 +0800
Message-ID: <20201027135020.66632-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The location of the minus sign and the error code are
linked together for better human view.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/input/joystick/analog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
index 2b625ebef914..f798922a4598 100644
--- a/drivers/input/joystick/analog.c
+++ b/drivers/input/joystick/analog.c
@@ -665,7 +665,7 @@ static int analog_connect(struct gameport *gameport, struct gameport_driver *drv
 	int err;
 
 	if (!(port = kzalloc(sizeof(struct analog_port), GFP_KERNEL)))
-		return - ENOMEM;
+		return -ENOMEM;
 
 	err = analog_init_port(gameport, drv, port);
 	if (err)
-- 
2.17.1

