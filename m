Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 668A54F6F8C
	for <lists+linux-input@lfdr.de>; Thu,  7 Apr 2022 03:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbiDGBM4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Apr 2022 21:12:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234247AbiDGBMy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Apr 2022 21:12:54 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70637180234;
        Wed,  6 Apr 2022 18:10:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D290AB82691;
        Thu,  7 Apr 2022 01:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F602C385B4;
        Thu,  7 Apr 2022 01:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649293850;
        bh=AbRLW6KpKD4tIN4tfMldWC0Y7qjHWvaSMDBU+t7g3Ps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R5JSUP+rx5nUwVraQtnucFOaZoEyT/Sr8SeB+97OeB8B+oulNy67ITuC+WEEZAg1A
         MwxifkgceBqePhGMIY8+A52W3ZwUdAoHCZOqJPYaq17n3zY5MdjexpjjSjzM7q+YAF
         mylISJiIALxWRL5CEGBCCjkgFRFLvfGk6aLtua/k3+LO95BPEyoWvcxPPx280i73xb
         X1iy+ePGPafnyWSQW89SBSkYmxM+RCwVhxbwy+SDhTo7f0R02aMsk2uFF/CnU8WUGW
         wdcPyh0w0Uclm5Hqq9mJfb4Ybc5mbGSh7nI+GacVB05hx3kkr+bol9eL/8RU1XbgfI
         PT1HusjdfCMfQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.17 10/31] Input: stmfts - fix reference leak in stmfts_input_open
Date:   Wed,  6 Apr 2022 21:10:08 -0400
Message-Id: <20220407011029.113321-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407011029.113321-1-sashal@kernel.org>
References: <20220407011029.113321-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Zheng Yongjun <zhengyongjun3@huawei.com>

[ Upstream commit 26623eea0da3476446909af96c980768df07bbd9 ]

pm_runtime_get_sync() will increment pm usage counter even it
failed. Forgetting to call pm_runtime_put_noidle will result
in reference leak in stmfts_input_open, so we should fix it.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
Link: https://lore.kernel.org/r/20220317131604.53538-1-zhengyongjun3@huawei.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/stmfts.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index bc11203c9cf7..72e0b767e1ba 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -339,11 +339,11 @@ static int stmfts_input_open(struct input_dev *dev)
 
 	err = pm_runtime_get_sync(&sdata->client->dev);
 	if (err < 0)
-		return err;
+		goto out;
 
 	err = i2c_smbus_write_byte(sdata->client, STMFTS_MS_MT_SENSE_ON);
 	if (err)
-		return err;
+		goto out;
 
 	mutex_lock(&sdata->mutex);
 	sdata->running = true;
@@ -366,7 +366,9 @@ static int stmfts_input_open(struct input_dev *dev)
 				 "failed to enable touchkey\n");
 	}
 
-	return 0;
+out:
+	pm_runtime_put_noidle(&sdata->client->dev);
+	return err;
 }
 
 static void stmfts_input_close(struct input_dev *dev)
-- 
2.35.1

