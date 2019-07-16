Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A0906A277
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2019 08:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbfGPGyg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Jul 2019 02:54:36 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38266 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726295AbfGPGyg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Jul 2019 02:54:36 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E6947CCB46D231A8D0B9;
        Tue, 16 Jul 2019 14:54:33 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 16 Jul 2019
 14:54:24 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <allison@lohutok.net>,
        <tglx@linutronix.de>, <info@metux.net>, <dilinger@debian.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH] Input: psmouse - Fix build error of multiple definition
Date:   Tue, 16 Jul 2019 14:54:11 +0800
Message-ID: <20190716065411.56780-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

trackpoint_detect() should be static inline while
CONFIG_MOUSE_PS2_TRACKPOINT is not set. otherwire,we
got building fails:

drivers/input/mouse/alps.o: In function `trackpoint_detect':
alps.c:(.text+0x8e00): multiple definition of `trackpoint_detect'
drivers/input/mouse/psmouse-base.o:psmouse-base.c:(.text+0x1b50): first defined here

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 55e3d9224b60 ("Input: psmouse - allow disabing certain protocol extensions")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/input/mouse/trackpoint.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index 0afffe8..77110f3 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -158,7 +158,8 @@ struct trackpoint_data {
 #ifdef CONFIG_MOUSE_PS2_TRACKPOINT
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
 #else
-inline int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
+static inline int trackpoint_detect(struct psmouse *psmouse,
+				    bool set_properties)
 {
 	return -ENOSYS;
 }
-- 
2.7.4


