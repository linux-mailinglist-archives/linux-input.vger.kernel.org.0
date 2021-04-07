Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3230356245
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 06:07:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhDGEID (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 00:08:03 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:25186 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229505AbhDGEIC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 7 Apr 2021 00:08:02 -0400
Received: from localhost.localdomain (unknown [10.192.24.118])
        by mail-app2 (Coremail) with SMTP id by_KCgBH0PgNMG1gwH_RAA--.27407S4;
        Wed, 07 Apr 2021 12:07:44 +0800 (CST)
From:   Dinghao Liu <dinghao.liu@zju.edu.cn>
To:     dinghao.liu@zju.edu.cn, kjlu@umn.edu
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Fuqian Huang <huangfq.daxian@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: cyapa - Fix rumtime PM imbalance on error
Date:   Wed,  7 Apr 2021 12:07:38 +0800
Message-Id: <20210407040740.20257-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgBH0PgNMG1gwH_RAA--.27407S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtr43Jr4fXr1UAr1xuw1xZrb_yoWfGrX_Gr
        yruwn7uF15Kw1DtwsxJwnxZrZYva4v934kuw4Yyr42kr1qvrZ5GryUXF4DAr4kXa4xGw15
        Jw4IgF9ayrW0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
        wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
        vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
        8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
        Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
        xGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxF
        aVAv8VW8uw4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoGBlZdtTQGhAALsL
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When mutex_lock_interruptible() fails, a pairing PM usage
counter decrement is needed to keep the counter balanced.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/input/mouse/cyapa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index 77cc653edca2..e411ab45a218 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -904,8 +904,10 @@ static ssize_t cyapa_update_rt_suspend_scanrate(struct device *dev,
 	pm_runtime_get_sync(dev);
 
 	error = mutex_lock_interruptible(&cyapa->state_sync_lock);
-	if (error)
+	if (error) {
+		pm_runtime_put_noidle(dev);
 		return error;
+	}
 
 	cyapa->runtime_suspend_sleep_time = min_t(u16, time, 1000);
 	cyapa->runtime_suspend_power_mode =
-- 
2.17.1

