Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA239325BC9
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 03:58:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhBZC6d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 21:58:33 -0500
Received: from m12-14.163.com ([220.181.12.14]:34853 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhBZC6c (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 21:58:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=UMYcB
        nHHvwt1Ha69WtrsgPCO3uvo8qpZsUihGSnvsRc=; b=FX6vpckGLYAIfwDr/EX6w
        o1ej4AJ9bOqNfXlLz6O8HQjtS/Xm9zsfnk0aig8LWA/jojAuttzlA7THG3KJe6y1
        q7XeEoPy4wL64H4A2ug5MVjPxPkQJZT70cH+RQP3xGcm/A2LrVm0MzyLlDjQhs6K
        MnII3tq2g8N0MeVFzrV/VE=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp10 (Coremail) with SMTP id DsCowAAX_SmoXzhgOYlgmg--.13443S2;
        Fri, 26 Feb 2021 10:40:41 +0800 (CST)
From:   dingsenjie@163.com
To:     dmitry.torokhov@gmail.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] input: touchscreen: fix reference leak in stmfts_input_open
Date:   Fri, 26 Feb 2021 10:39:46 +0800
Message-Id: <20210226023946.5168-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowAAX_SmoXzhgOYlgmg--.13443S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw4xGr1kXry7tF13ZrW5KFg_yoWfZFc_W3
        9Y93Z7Cr1jk3yqkwnrJwnxZryvvFW8Z3yxuwnYyrW3Cw1YvrWDA39xW397ArWUWr4UZryD
        AFZ2gF92yw1xGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8KZX5UUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiZQ5EyF8ZM5FgVgABs0
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

pm_runtime_get_sync will increment pm usage counter even it
failed. Forgetting to pm_runtime_put_noidle will result in
reference leak in cedrus_start_streaming.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/input/touchscreen/stmfts.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9a64e1d..b91a59b 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -338,8 +338,10 @@ static int stmfts_input_open(struct input_dev *dev)
 	int err;
 
 	err = pm_runtime_get_sync(&sdata->client->dev);
-	if (err < 0)
+	if (err < 0) {
+		pm_runtime_put_noidle(&sdata->client->dev);
 		return err;
+	}
 
 	err = i2c_smbus_write_byte(sdata->client, STMFTS_MS_MT_SENSE_ON);
 	if (err)
-- 
1.9.1


