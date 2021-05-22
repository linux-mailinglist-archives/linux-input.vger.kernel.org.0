Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746B538D508
	for <lists+linux-input@lfdr.de>; Sat, 22 May 2021 12:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbhEVKLD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 May 2021 06:11:03 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5733 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhEVKLC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 May 2021 06:11:02 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FnJyg4xJmzqVGj;
        Sat, 22 May 2021 18:06:03 +0800 (CST)
Received: from dggpeml500008.china.huawei.com (7.185.36.147) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 22 May 2021 18:09:36 +0800
Received: from localhost.localdomain (10.67.165.24) by
 dggpeml500008.china.huawei.com (7.185.36.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Sat, 22 May 2021 18:09:36 +0800
From:   Hao Fang <fanghao11@huawei.com>
To:     <dmitry.torokhov@gmail.com>, <xuezhiliang@huawei.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>
Subject: [PATCH RESEND] Input: misc - use the correct HiSilicon copyright
Date:   Sat, 22 May 2021 18:06:27 +0800
Message-ID: <1621677987-11009-1-git-send-email-fanghao11@huawei.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.165.24]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500008.china.huawei.com (7.185.36.147)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

s/Hisilicon/HiSilicon/g.
It should use capital S, according to
https://www.hisilicon.com/en.

Signed-off-by: Hao Fang <fanghao11@huawei.com>
---
 drivers/input/misc/hisi_powerkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
index d3c293a..54cbfdf 100644
--- a/drivers/input/misc/hisi_powerkey.c
+++ b/drivers/input/misc/hisi_powerkey.c
@@ -1,7 +1,7 @@
 /*
  * Hisilicon PMIC powerkey driver
  *
- * Copyright (C) 2013 Hisilicon Ltd.
+ * Copyright (C) 2013 HiSilicon Ltd.
  * Copyright (C) 2015, 2016 Linaro Ltd.
  *
  * This file is subject to the terms and conditions of the GNU General
-- 
2.8.1

