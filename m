Return-Path: <linux-input+bounces-6065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA7B968F91
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 884D4B2284B
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48D5188011;
	Mon,  2 Sep 2024 22:28:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507A31885A0
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316135; cv=none; b=aLeW0VOgzN9xnwBtadmqR2m4iyvrDSHGxO4v31KFZspbVzA7Zi/xvyOp+sDW6yrr20N7mbaw0IOfwqCHd2ZQiSwGqf8uPv2+8kxINVb3mqnOowHm28EordZDuM1d1bIx2wQnHnUcTpveWmntyZtwnQXVqiuJfvPlsFv7aULodLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316135; c=relaxed/simple;
	bh=bCouMPCfZo5pf56gbl+7wP0aa2XkCRIomN3pfQ0D6fw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t12E9WJU1J9BAdl/my3j4E9b4BnXVBQTy7csIWIkZobQjfJmN5363CYPt+0LyiTn0mXFxsxNwIoAwYCaHnAwROLOHWpZC8uys+wW0op1T2N9XftpV9sqZnS2IfatPEvrb1hAAzInkjizI1ng6QAI5PaisBijCaZ6HjulgMZReME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id b05ac0f2-697a-11ef-8e8a-005056bd6ce9;
	Tue, 03 Sep 2024 01:28:33 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-input@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 07/22] iio: dac: ad5504: Get platform data via dev_get_platdata()
Date: Tue,  3 Sep 2024 01:16:52 +0300
Message-ID: <20240902222824.1145571-8-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240902222824.1145571-1-andy.shevchenko@gmail.com>
References: <20240902222824.1145571-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Access to platform data via dev_get_platdata() getter to make code cleaner.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/dac/ad5504.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5504.c b/drivers/iio/dac/ad5504.c
index e6c5be728bb2..305cd58cd257 100644
--- a/drivers/iio/dac/ad5504.c
+++ b/drivers/iio/dac/ad5504.c
@@ -270,7 +270,7 @@ static const struct iio_chan_spec ad5504_channels[] = {
 
 static int ad5504_probe(struct spi_device *spi)
 {
-	struct ad5504_platform_data *pdata = spi->dev.platform_data;
+	const struct ad5504_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct iio_dev *indio_dev;
 	struct ad5504_state *st;
 	struct regulator *reg;
-- 
2.46.0


