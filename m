Return-Path: <linux-input+bounces-6079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62166968FC2
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11E9E1F25826
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCAE188A04;
	Mon,  2 Sep 2024 22:29:56 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C44190057
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316196; cv=none; b=Lhx8NoB9GMwNUKkZwzYTP19DF22v+9pFo4FxX6Dz4wrWCou8fTopTRksW77ScTGuSXrbZjjVX2AxDNOxJBcqtP+aW0PONPTWtIZiXUolqCHek9pJwSsXlPl//7Ow7E/5IpcdmanYqxX4AehIBvbKaXB4mIz4nevGEtbIpXu83tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316196; c=relaxed/simple;
	bh=6s0/uK8OpJ0JPPuTa8tnsMtjG6IVSRGiOMZJleFz5mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fldaz7khFEbX7dci7lc8xdeY2a6LDEuoHh5FQ2CAc0DM6U2MGYUc3Ux8w64dH/cgJ43ADB8Av67ldltJQ4aptJL9e0wS5wcxwnpN/0NGIVb2Q4GArB9X13ULmmn1BmerR7IvXq7aouJsE5Ypq/bM8cUb8M/OqV+eL4vJ7ZAZofA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id b0c0841e-697a-11ef-8e8a-005056bd6ce9;
	Tue, 03 Sep 2024 01:28:34 +0300 (EEST)
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
Subject: [PATCH v1 08/22] iio: dac: ad5791: Get platform data via dev_get_platdata()
Date: Tue,  3 Sep 2024 01:16:53 +0300
Message-ID: <20240902222824.1145571-9-andy.shevchenko@gmail.com>
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
 drivers/iio/dac/ad5791.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5791.c b/drivers/iio/dac/ad5791.c
index 75b549827e15..553431bf0232 100644
--- a/drivers/iio/dac/ad5791.c
+++ b/drivers/iio/dac/ad5791.c
@@ -341,7 +341,7 @@ static const struct iio_info ad5791_info = {
 
 static int ad5791_probe(struct spi_device *spi)
 {
-	struct ad5791_platform_data *pdata = spi->dev.platform_data;
+	const struct ad5791_platform_data *pdata = dev_get_platdata(&spi->dev);
 	struct iio_dev *indio_dev;
 	struct ad5791_state *st;
 	int ret, pos_voltage_uv = 0, neg_voltage_uv = 0;
-- 
2.46.0


