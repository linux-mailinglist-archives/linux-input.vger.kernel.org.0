Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7A0734E164
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 08:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbhC3Gmy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 02:42:54 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:15390 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbhC3Gm3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 02:42:29 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F8fwF59zQzpSwD;
        Tue, 30 Mar 2021 14:40:45 +0800 (CST)
Received: from localhost.localdomain (10.67.165.24) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Tue, 30 Mar 2021 14:42:18 +0800
From:   Hao Fang <fanghao11@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <xuezhiliang@huawei.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>
Subject: [PATCH] Input: misc - use the correct HiSilicon copyright
Date:   Tue, 30 Mar 2021 14:39:46 +0800
Message-ID: <1617086386-7147-1-git-send-email-fanghao11@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

s/Hisilicon/HiSilicon/g.
It should use capital S, according to
https://www.hisilicon.com/en/terms-of-use.

Signed-off-by: Hao Fang <fanghao11@huawei.com>
---
 drivers/input/misc/hisi_powerkey.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
index d3c293a..51f4ff8 100644
--- a/drivers/input/misc/hisi_powerkey.c
+++ b/drivers/input/misc/hisi_powerkey.c
@@ -1,7 +1,7 @@
 /*
- * Hisilicon PMIC powerkey driver
+ * HiSilicon PMIC powerkey driver
  *
- * Copyright (C) 2013 Hisilicon Ltd.
+ * Copyright (C) 2013 HiSilicon Ltd.
  * Copyright (C) 2015, 2016 Linaro Ltd.
  *
  * This file is subject to the terms and conditions of the GNU General
-- 
2.8.1

