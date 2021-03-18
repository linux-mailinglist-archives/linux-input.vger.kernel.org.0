Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91D33340091
	for <lists+linux-input@lfdr.de>; Thu, 18 Mar 2021 09:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbhCRICa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Mar 2021 04:02:30 -0400
Received: from m12-13.163.com ([220.181.12.13]:35548 "EHLO m12-13.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhCRICI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Mar 2021 04:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=V02Pq
        ZVID06iZ/hC95FGGMwLgBVeFFRBupktkBJQcf8=; b=HsQsyituT4UvTm794JE1F
        zoQPsg9SAlLbIWWPOkpbBsq3Q12XvVd+YuJS4n1l4oJvh/Q7OplpY/DqlVA9Z08j
        nJqJmTtCi+TQM5mLBk3eDLjPpVkKkc/4sK5Yyiq1ZxvnlsVZBbgE5bo26WbWjZm6
        HqQkft7l+iJMc0NKcfkZ10=
Received: from COOL-20200911ZP.ccdomain.com (unknown [218.94.48.178])
        by smtp9 (Coremail) with SMTP id DcCowAD3fY6zzFJgkcUlBw--.22258S2;
        Thu, 18 Mar 2021 11:44:59 +0800 (CST)
From:   ChunyouTang <tangchunyou@163.com>
To:     dmitry.torokhov@gmail.com, wangxiongfeng2@huawei.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        tangchunyou@yulong.com
Subject: [PATCH] drivers/input/mouse:modify mutex_lock before mutex_unlock
Date:   Thu, 18 Mar 2021 11:44:48 +0800
Message-Id: <20210318034448.616-1-tangchunyou@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAD3fY6zzFJgkcUlBw--.22258S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur4DKw4rAF4xWryxGry5CFg_yoWfGwb_ur
        yfWFn7Xw4F9wn0vwnrCrnxZrZYy3Za9ry8ua1Fvr45Jw1UAFnxXw1DZFn7Ar48Wr1xuwn8
        Kr9xCryfAF1jgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8pVbDUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5wdqwu5kxq50rx6rljoofrz/1tbiThtZUVUDIQT9AAAAsT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: tangchunyou <tangchunyou@yulong.com>

mutex_lock should before mutex_unlock

Signed-off-by: tangchunyou <tangchunyou@yulong.com>
---
 drivers/input/mouse/psmouse-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
index 0b4a303..d01798c 100644
--- a/drivers/input/mouse/psmouse-base.c
+++ b/drivers/input/mouse/psmouse-base.c
@@ -1923,9 +1923,9 @@ static ssize_t psmouse_attr_set_protocol(struct psmouse *psmouse, void *data, co
 			return -EIO;
 		}
 
-		mutex_unlock(&psmouse_mutex);
-		serio_unregister_child_port(serio);
 		mutex_lock(&psmouse_mutex);
+		serio_unregister_child_port(serio);
+		mutex_unlock(&psmouse_mutex);
 
 		if (serio->drv != &psmouse_drv) {
 			input_free_device(new_dev);
-- 
1.9.1


