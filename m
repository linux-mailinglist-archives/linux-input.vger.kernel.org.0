Return-Path: <linux-input+bounces-16589-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F95CBE918
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 16:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 277D330B525E
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 15:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656F334845E;
	Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXf41P+Y"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D74230C37D;
	Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809006; cv=none; b=SiVWXxhWzaRPcQcdkI1K0NQmWrQvi0BuufW8kLcIMhZnSA/vylo5/aJmki7ydoLTWvJms5MoPvCuVwyqsZgx2E9RP4No7X9CpNGPwFcnn90eW4tQPUDjaUEsaUtTT9L413/V+ffukFyz+AzI9bmUhXCOtXg7iEE1CmHMxNxfaVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809006; c=relaxed/simple;
	bh=TVMBoDrL66oVfaYiSBbPmPDD5+tqhVvfo29udD0zzsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OsZs8ooGiFu5tqKXq0TzmeyA5Ot7Encf2xh8Q+nXnLdQFGa3jek7lj15O5SZoHL8Rkt8zxG/G9gAil79MfSPCosBSYmpBPFS0PbsPOugUJ4+nO5gIPjROciyWya1UTdU0J+PtVSSZSJHr6txvG8+xnMlZYWTWp23K0j2X3Fwuwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXf41P+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1E61C2BC86;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=TVMBoDrL66oVfaYiSBbPmPDD5+tqhVvfo29udD0zzsc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FXf41P+Yh1GfPML23QnV7Bglz7xoYIrMdIqY3p175Xv7szqQCdVLjQXf52BYoLitr
	 3k1Np+HOL3rCMXcbwfETwgkudaSYmayHERn3mL2t7Z6036cHw/PyEflrWgnVe8j5CJ
	 k0Qu+SiopJ76/4/y6I6lAQ7uwerSe43igYYt7A7WTTvsM2zcsExH43uRl4tS24sNBX
	 gZ+aKwX+jfRPknW/VTcgA/F1bnaFkBMC9iqua7btgFJayNZDox2RFJFPD7Z5f4p9sY
	 IfjSDr/J9ufUKTHneCHD16VLZ1X7zodk1aIwoay4yZYNwTF77X+rSStoIT90f1smIX
	 ZL4647+5oNiVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82FBD5B176;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:04 +0100
Subject: [PATCH 4/4] Input: stmfts - use client to make future code cleaner
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
In-Reply-To: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Javier Martinez Canillas <javier@osg.samsung.com>, 
 Rob Herring <robh@kernel.org>, Andi Shyti <andi@etezian.org>
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=roHV704aaY9rcMfaAuaHi+mzFaL37M4mv+RVt1dZ7JA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrW0Sc0TA1KAN4LrhLHI2SDk8w1khRX2x3I
 BJwsriezd6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 choAD/9+4C7jcAftRIQrmL5PLcMe0RuAWm3WOJFJAENwF817DbTZ1B+tnoDmaq4JHk6tiS+koRK
 3UflGChw68pIVdGkPMb46OmqKMJDnMynFu0J4I924oEfXtIOBygHbGn9xYuD3QdX0YiaPJFFuw4
 O/OLlxo5UGd8ADmNvKnJZh+G9yeKrYnRj+hCW/cXex8+mJsPLILQTPWX0ct48oVfO6kAYF36jgZ
 6BlxX0mnl+7X36LhV8nbj5mh2/3ucXyJHw90gjQXS/AwbF9Ltgmfxc0G2CHrsu/8MzoeB9ZBlhW
 PfEctdTDsaDOhZYDRM8D4DE4MrTQPsgDsZTKaDZjoZXawdooPQ33nJCWIyRxBgIaNUcJvNbZ7B1
 cbsmz+RakyxukqjY6Ori/Jkfq99jL2IAihPjPVy20FWiVAS/NgyeRKMhuSh1Q5hwJPqc8MWAQCq
 1a2u7SexBs2sx/BeQ14OuEJOBphYTKjDaymVVPbV2/24pADHQFl73+9XdLiaqogU4Tk45ts9mzx
 NwAtPN5nIpQLX4g3F7X2diyHKHH5XrspYM30IozfcRsEN+hNH1/y8jLhkZ47f6Rze4WUUcHBo/i
 j1ajLbNS9B40ZPjanNwzbW4uaNPmTTNBvuqygoURHJV5kZi0a3BSLUWh533P7/3dKWAW1qz5gqt
 Lx2twOZKVbNUeBA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <petr.hodina@protonmail.com>

Make code cleaner, compiler will optimize it away anyway.

Preparation for FTM5 support, where more steps are needed.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 4b166b0a9a5a6..06845a00348cc 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -747,9 +747,10 @@ static int stmfts_runtime_suspend(struct device *dev)
 static int stmfts_runtime_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
+	struct i2c_client *client = sdata->client;
 	int ret;
 
-	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
+	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);
 	if (ret)
 		dev_err(dev, "failed to resume device: %d\n", ret);
 

-- 
2.51.0



