Return-Path: <linux-input+bounces-16588-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0ABCBE568
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 15:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA0A830157CF
	for <lists+linux-input@lfdr.de>; Mon, 15 Dec 2025 14:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E167348452;
	Mon, 15 Dec 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mVlvm8DG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278CD347FFB;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765809006; cv=none; b=KWkHasvtnKpjBHleBI1P2kbEKZskBnRCPBFV59+uthur5FCXU5b9y895N4Hzr94mbgI765E1YC+E8/uhYlU8081pPY6IPLanldJC3nncmorNH0FRivjWgplKX6cCuyz/Op5qzjth0M1j8UrBfOkws56Kv0da/O0bWSvKYE69kQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765809006; c=relaxed/simple;
	bh=wFu7HDRMAdpVlowB+kOuTDIm7pWaAUtn4h3uu6I0uGU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MyocbPvt6RFESZnrdeNYshZGcbCv4r6nZewmTxSuubdPE3hON8QQl7C4B8gcOPCdzTBvSojHcq9n/6MXYrqOxvqVJnpuLMYa2YNeTukUnx1LWbXjQn+hp/tDWfUOljQVEAYzPbOJmwVphCDK6mHq9WJbAWuL/Flbfep4nMxBUME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mVlvm8DG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA977C19422;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809005;
	bh=wFu7HDRMAdpVlowB+kOuTDIm7pWaAUtn4h3uu6I0uGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mVlvm8DG13DHRlf6pbQ0CwxjRX7e1QBXoyQ4zS6YYr4pwOUdlWxurFqgBKXGDtIsG
	 Ez78EesXd/mLsNT5lLW3o2DgVPlG8fXDRuygtDjlC154UDHiNbkrgyxRkos3ifCrnm
	 BYtZfmOevor613ejDsdJLsT503qrS/i3kIiDOeI0rCKtyuiSExeO4oJtDzwu/jXQoq
	 QfKqhMSvajMBTbvKgpO1/iae3BGh4HstWrVKUe8Z+MhE/kjrUYyIs01+Tg4pvauLLH
	 RQNyuEVC+c2Ed4ZKOOTFpQoOSzRoVo/n+/bg1jVEOYLMn/IYYduvNv4iePGnlhqdCk
	 44CJUh4W1+RoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2CBDD5B16E;
	Mon, 15 Dec 2025 14:30:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 15 Dec 2025 15:30:03 +0100
Subject: [PATCH 3/4] Input: stmfts - use sysfs_emit() instead of sprintf()
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-fts-fixes-v1-3-8c1e3a63ebf1@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2787; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3xHAswUTtGvoQ6NmHBshFsBrqnYL61pqa0b3OMWeB7I=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpQBtrnuNSlCDEp3U0AMCL9StDPaBZkQm8UpZo5
 tdO7QEjWDuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUAbawAKCRBgAj/E00kg
 ctYxEACflPTTG5VIeyFgwBgtxU3aAkYDozrwSyYm7rqhN45yyb+3Lj+UkzWI1NLtbuG1vk1o8Ql
 wcRbmjLeFtLKzOWvGprKN57MWOeQRduWiYWua/ZES83aVbK9SekWaxB3r7CAdMrPwjegBrDu7Lc
 cJDIz3yMv1AIEpwlN/eNxj85cpJP7F8+URLSuwE4NEGZcQ+AS/+nOmG0ri9WXvMz1WCs7GwZSL6
 AbOfbbHS0NVVJnSI0BqY1IlSzqBeQl9JSvGVqxgPiWXatmDFaWw+R/MDOiD/Eebfg6/S6onh4+Y
 K7ALIXs8jyrwovmA1FU0vVeHi/hRTvfQONG4G4r1vM4XceEVZyd8u4VHoN7O3M0RGIpxRa+X48/
 JYrrw0Bfe7tNzsl/m6tin9niNbdOQ6IULtAfRbA/E2PVaZDvm5VYRA5bIbb9fmWTnARq0vjshS9
 Cdk5P8sbVjT9Z5AACXDF/0cMszhIU1lnq6NA0rfIO2wfqgPqTPOI8sRdld2lnG0rz7F5NM/Pc6X
 nioeug9YnEXFUKhdPAfEGq/xFPNyE6nukMO9zV10WU/Duc0uE1n5gapGiXvuiwVUlbn+wYGhqpx
 D8vVJvrBlXjrtEtD15BONuFCNhJLSfMOrccvCSbTWRQyChqsrIOVVGkMHzQgZknDgF7OMM5pXMq
 kci2Br62lLhawTw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Petr Hodina <petr.hodina@protonmail.com>

Follow the advice in Documentation/filesystems/sysfs.rst:
show() should only use sysfs_emit() or sysfs_emit_at() when formatting
the value to be returned to user space.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index ad363b3c344cd..4b166b0a9a5a6 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -410,7 +410,7 @@ static ssize_t stmfts_sysfs_chip_id(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%#x\n", sdata->chip_id);
+	return sysfs_emit(buf, "%#x\n", sdata->chip_id);
 }
 
 static ssize_t stmfts_sysfs_chip_version(struct device *dev,
@@ -418,7 +418,7 @@ static ssize_t stmfts_sysfs_chip_version(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->chip_ver);
+	return sysfs_emit(buf, "%u\n", sdata->chip_ver);
 }
 
 static ssize_t stmfts_sysfs_fw_ver(struct device *dev,
@@ -426,7 +426,7 @@ static ssize_t stmfts_sysfs_fw_ver(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->fw_ver);
+	return sysfs_emit(buf, "%u\n", sdata->fw_ver);
 }
 
 static ssize_t stmfts_sysfs_config_id(struct device *dev,
@@ -434,7 +434,7 @@ static ssize_t stmfts_sysfs_config_id(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%#x\n", sdata->config_id);
+	return sysfs_emit(buf, "%#x\n", sdata->config_id);
 }
 
 static ssize_t stmfts_sysfs_config_version(struct device *dev,
@@ -442,7 +442,7 @@ static ssize_t stmfts_sysfs_config_version(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->config_ver);
+	return sysfs_emit(buf, "%u\n", sdata->config_ver);
 }
 
 static ssize_t stmfts_sysfs_read_status(struct device *dev,
@@ -457,7 +457,7 @@ static ssize_t stmfts_sysfs_read_status(struct device *dev,
 	if (err)
 		return err;
 
-	return sprintf(buf, "%#02x\n", status[0]);
+	return sysfs_emit(buf, "%#02x\n", status[0]);
 }
 
 static ssize_t stmfts_sysfs_hover_enable_read(struct device *dev,
@@ -465,7 +465,7 @@ static ssize_t stmfts_sysfs_hover_enable_read(struct device *dev,
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", sdata->hover_enabled);
+	return sysfs_emit(buf, "%u\n", sdata->hover_enabled);
 }
 
 static ssize_t stmfts_sysfs_hover_enable_write(struct device *dev,

-- 
2.51.0



