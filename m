Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297274F6FF7
	for <lists+linux-input@lfdr.de>; Thu,  7 Apr 2022 03:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiDGBQF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Apr 2022 21:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236515AbiDGBPv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Apr 2022 21:15:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D9818F23F;
        Wed,  6 Apr 2022 18:12:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D88E0B8268B;
        Thu,  7 Apr 2022 01:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A275C385A6;
        Thu,  7 Apr 2022 01:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649293921;
        bh=AbRLW6KpKD4tIN4tfMldWC0Y7qjHWvaSMDBU+t7g3Ps=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PID9sYRsUmqsq2arzi+5mQnEshNgjc6DHUO0XZy7DDUrGCZ2iLGAIIOUjDm4F2Hdk
         5DZlukckzvbPgVdcu03/NfnljoxA4kKMo5u7cFaaQV58z9gJvg7QPf/Pdxe4WYWFyJ
         6RdjRtUrLPQwK+Xhm7gNlPmjkkQ0SOXcODMBV/NlA1tupoji+XJFbUj26/eHSxP7Kj
         YTC0Fie+vEBfWs79hI8PXLaPdteQyh0OrRTqSyAs+doiwJotGra6iF7EhemyIx3vEF
         sxU/+ZAFJ3L90lzLeq2tCB8yw0KvNmZxz5uipq8jzNi+pxHtZQ/Xy8RmOT/DWd7Klk
         GvfS3T4ci6rJA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Sasha Levin <sashal@kernel.org>, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 5.16 10/30] Input: stmfts - fix reference leak in stmfts_input_open
Date:   Wed,  6 Apr 2022 21:11:20 -0400
Message-Id: <20220407011140.113856-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407011140.113856-1-sashal@kernel.org>
References: <20220407011140.113856-1-sashal@kernel.org>
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

