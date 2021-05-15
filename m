Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149A5381559
	for <lists+linux-input@lfdr.de>; Sat, 15 May 2021 05:01:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234117AbhEODCZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 23:02:25 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:2925 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233403AbhEODCZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 23:02:25 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FhqpW5PSTzBth4
        for <linux-input@vger.kernel.org>; Sat, 15 May 2021 10:58:27 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 15 May 2021 11:01:02 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] Input: hil_kbd - Fix error return code in hil_dev_connect()
Date:   Sat, 15 May 2021 11:00:53 +0800
Message-ID: <20210515030053.6824-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Return error code -EPERM rather than '0' when the combo devices are not
supported.

Fixes: fa71c605c2bb ("Input: combine hil_kbd and hil_ptr drivers")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/input/keyboard/hil_kbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index bb29a7c9a1c0cf5..ca38e8e20bb5484 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -512,6 +512,7 @@ static int hil_dev_connect(struct serio *serio, struct serio_driver *drv)
 		    HIL_IDD_NUM_AXES_PER_SET(*idd)) {
 			printk(KERN_INFO PREFIX
 				"combo devices are not supported.\n");
+			error = -EPERM;
 			goto bail1;
 		}
 
-- 
2.26.0.106.g9fadedd


