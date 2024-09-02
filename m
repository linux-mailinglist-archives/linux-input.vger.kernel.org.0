Return-Path: <linux-input+bounces-6076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4284968FB6
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 130BD1C23E26
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AF118C346;
	Mon,  2 Sep 2024 22:29:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFD0187FF7
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316173; cv=none; b=AI0i9tg/BUk3eJy52oqD/QKZ9BhdI5useQ6PYHdNFtbZhN2C+jTLRN0AQbm+rDB24SwJ4kFnVyrYuFR23Ne7/atB9u2LWXN/WFPjopN6/EVhV5cBQwMBHtapm9UkmE7v0OOgWDAgAOqs2O/s0ihSuvn3+XZSh7FYI4j21iktGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316173; c=relaxed/simple;
	bh=JbN8T71a/PZKhOL1QNhERt7e8cyfCWMB8Ep8u0D95s4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvblGuZnfEaA27/TJg8VWcchyhyUPqVv4ZE5KfOqjo1oWpxA3UUfP2SjIEEEqftkdaKCjuO8fiBrClo8GTVzQus0XI6DtAWQqSesNP0QuUy3KBZIpMqViNCMbuG3r1wiaGdX/Lg4XT+pV8p325WYedtbNebfRr1JYdE2ltDvpYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id aff40cbd-697a-11ef-8e8a-005056bd6ce9;
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
Subject: [PATCH v1 06/22] iio: adc: ltc2497: Get platform data via dev_get_platdata()
Date: Tue,  3 Sep 2024 01:16:51 +0300
Message-ID: <20240902222824.1145571-7-andy.shevchenko@gmail.com>
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

While at it, drop duplicate NULL check that iio_map_array_register()
already has.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/iio/adc/ltc2497-core.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-core.c
index 996f6cbbed3c..ad8ddf80310e 100644
--- a/drivers/iio/adc/ltc2497-core.c
+++ b/drivers/iio/adc/ltc2497-core.c
@@ -168,6 +168,7 @@ static const struct iio_info ltc2497core_info = {
 int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev)
 {
 	struct ltc2497core_driverdata *ddata = iio_priv(indio_dev);
+	struct iio_map *plat_data = dev_get_platdata(dev);
 	int ret;
 
 	/*
@@ -200,16 +201,10 @@ int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev)
 		return ret;
 	}
 
-	if (dev->platform_data) {
-		struct iio_map *plat_data;
-
-		plat_data = (struct iio_map *)dev->platform_data;
-
-		ret = iio_map_array_register(indio_dev, plat_data);
-		if (ret) {
-			dev_err(&indio_dev->dev, "iio map err: %d\n", ret);
-			goto err_regulator_disable;
-		}
+	ret = iio_map_array_register(indio_dev, plat_data);
+	if (ret) {
+		dev_err(&indio_dev->dev, "iio map err: %d\n", ret);
+		goto err_regulator_disable;
 	}
 
 	ddata->addr_prev = LTC2497_CONFIG_DEFAULT;
-- 
2.46.0


