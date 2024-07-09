Return-Path: <linux-input+bounces-4923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A2B92BFD6
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E5D01F2305B
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9771ABC55;
	Tue,  9 Jul 2024 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYvVF0cG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A248A1ABC4F;
	Tue,  9 Jul 2024 16:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542053; cv=none; b=MLkMze576BjWrk0s4HFa3AfIlOeNBKJ3gWgpZqFdpRchkVB8eIhaqxKvoXihv6BdMXAxNmdfefgcWCa3U0y1LOI2OtBmzqqr0/CzWLbuiPkCeDrrclW1XPN643gF2Qa133SK+kH3DnWRxTwHxorR9jGXpazrdPUki2N8Pb9hhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542053; c=relaxed/simple;
	bh=DKBwWJOniIY2A2Y9VaFIIBbdLvz3p/Q5FsGMztwQ/G4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jjb93+vzVjfq5bnuwkpdN+EjWkGIbxiBzFBsUQXA8pbwV5E43CKL9sxpXQaPC5Fz/Eq495OKnLzX+QMtCFvG5IGaQVUhZIWQc0noFmO0pwuqh5Kdojh8tjnbZy4xxVu8XRP5jnFwnKdi5rIQQM4tLslcsNboOwxAlRy7Hb3HYiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYvVF0cG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD939C32782;
	Tue,  9 Jul 2024 16:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542053;
	bh=DKBwWJOniIY2A2Y9VaFIIBbdLvz3p/Q5FsGMztwQ/G4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYvVF0cGpQFnaq9/7M59gvr7GA4T0eiqZTeausOjwGQ9sV/K5Cj0so5whXR7Xu7fG
	 YouiMKX+M6WVQMkjUiIyitV2eF5YBLecAPUxi1J5V02qxPwOTuQisXyL1rxllIij5z
	 BsazKUIpGnOgMc+MMQbF8cgKL06spCdQU2l+3tVEwrc71pwP/WPduuTUUaqZML3RWz
	 vXzZBAnmeMkyfR9celqrnz0H+rL896tlPhh7R8m/i9XiwOe/zaufontt/DwEtQdKnM
	 kiuO6udvihtco31DdxU7/WQIoJQvRvuhl80WLDrLsFB+MGtlMMt3Jo9RGacuOp0/yZ
	 60WhxoB3yWeuA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 20/40] Input: ads7846 - use spi_device_id table
Date: Tue,  9 Jul 2024 12:19:00 -0400
Message-ID: <20240709162007.30160-20-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162007.30160-1-sashal@kernel.org>
References: <20240709162007.30160-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.8
Content-Transfer-Encoding: 8bit

From: Alexander Stein <alexander.stein@ew.tq-group.com>

[ Upstream commit 7c7b1be19b228b450c2945ec379d7fc6bfef9852 ]

As the driver supports more devices over time the single MODULE_ALIAS
is complete and raises several warnings:
SPI driver ads7846 has no spi_device_id for ti,tsc2046
SPI driver ads7846 has no spi_device_id for ti,ads7843
SPI driver ads7846 has no spi_device_id for ti,ads7845
SPI driver ads7846 has no spi_device_id for ti,ads7873

Fix this by adding a spi_device_id table and removing the manual
MODULE_ALIAS.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://lore.kernel.org/r/20240619122703.2081476-1-alexander.stein@ew.tq-group.com
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/touchscreen/ads7846.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index d2bbb436a77df..4d13db13b9e57 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1111,6 +1111,16 @@ static const struct of_device_id ads7846_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, ads7846_dt_ids);
 
+static const struct spi_device_id ads7846_spi_ids[] = {
+	{ "tsc2046", 7846 },
+	{ "ads7843", 7843 },
+	{ "ads7845", 7845 },
+	{ "ads7846", 7846 },
+	{ "ads7873", 7873 },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, ads7846_spi_ids);
+
 static const struct ads7846_platform_data *ads7846_get_props(struct device *dev)
 {
 	struct ads7846_platform_data *pdata;
@@ -1386,10 +1396,10 @@ static struct spi_driver ads7846_driver = {
 	},
 	.probe		= ads7846_probe,
 	.remove		= ads7846_remove,
+	.id_table	= ads7846_spi_ids,
 };
 
 module_spi_driver(ads7846_driver);
 
 MODULE_DESCRIPTION("ADS7846 TouchScreen Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("spi:ads7846");
-- 
2.43.0


