Return-Path: <linux-input+bounces-4927-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4E692C05E
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BB421C24024
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 16:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518DD1C2DD6;
	Tue,  9 Jul 2024 16:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lj4LpZ8b"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C811C2DD1;
	Tue,  9 Jul 2024 16:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542181; cv=none; b=U83H5tBGZDVtZ6YA8MMXP3BfStbMaheg9fJj8tOJanmyCynjocIAxA0JHrOWeMr3gG1T55h03gJvNxp1Fdw6R9jI88K35Wf49WhIPd6KkWEk94A1Qodmy+P7/s342+MAUZjQiY4PDRDNr6DYx4NOBWnQ+L/tzhPbUR4LsmsHyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542181; c=relaxed/simple;
	bh=W+urGY6Uc73Q8g6crOaHhFEqg5yat9Zh7W0xQVmu1Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4KI+MU3H7xHbHVOKCxBi6FIKHfWAf3Xk/gTVoOTeIqpIqTnSYBk+s+/d91CwihCp+3r/zvwLQtO3SuukiR4KWRw5VDOTfpnnbl/vZwRHHFc+vSuRqkpg8g4rQy033xWaxbxVj9jcYxu/IFCS9ChXLQhjPrEwMmtcpeVbl8cPds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lj4LpZ8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA1E9C3277B;
	Tue,  9 Jul 2024 16:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542180;
	bh=W+urGY6Uc73Q8g6crOaHhFEqg5yat9Zh7W0xQVmu1Xk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lj4LpZ8bMP7H4+KhshTSynjZjZlLOt6fSSGADNVwpSfr1EH+RchYF8dFMOSagIQly
	 KRQrQWbVNmaXJiPjUi+CdE6ZEuXfO+iZROlAlaK6ITzRgThC1UfTMVp64ML+sfHxAe
	 gnz/n/bLwcI0jDr5lEXDtzwqfBIS0rr96F/I7nyR2umXht9SgZpjdP8Bhg4YSN7/CQ
	 btDaarHa0eqF7MUkcOKwr5ISz7a/fx3riimniIJ+MWTv37yZ0GePXJZEPodGeXH3CR
	 ZFOxlf4Lp4Eepp5AbqXAJ6nmmtEyome1wX18eNzLPCEH/cnoExzKwfBQGQyHPpgH60
	 ARtwTHx8xM2pg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	gregkh@linuxfoundation.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 16/33] Input: ads7846 - use spi_device_id table
Date: Tue,  9 Jul 2024 12:21:42 -0400
Message-ID: <20240709162224.31148-16-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162224.31148-1-sashal@kernel.org>
References: <20240709162224.31148-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.38
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
index faea40dd66d01..a66375700a630 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -1114,6 +1114,16 @@ static const struct of_device_id ads7846_dt_ids[] = {
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
@@ -1392,10 +1402,10 @@ static struct spi_driver ads7846_driver = {
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


