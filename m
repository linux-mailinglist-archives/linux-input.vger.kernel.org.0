Return-Path: <linux-input+bounces-6061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C06F968F87
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A018B22049
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3FD18755C;
	Mon,  2 Sep 2024 22:28:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EF4188005
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316121; cv=none; b=BP/sfoa3IjqJRzfhHHIb1ilxuVWZUyqNaRZq1xlLtAtBnULXLmVT0Mih9PmMQ/RQoKKVgoMCpMw/RvZmYt3Q7FFDE9jnFw6mQGaRDq7nNl7hJq/f/YE5bl0hxosLCV0yGkKfEAYIiP7JqNsIdB0mag2Ny8pu4oU+m0m4OlP7A4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316121; c=relaxed/simple;
	bh=uSKyNDS6ptkIR0DYYsYfkgq3QP3Bq+QfzQYD1avZxDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPuvrjgdHxXc84dJ3qJUHHReXJlpq1+3M9XjQfx1mVn9a1mB18j6N4tm/HeU4XLL41KSaZgKDAjrm0svmH6cprUEP/vPd9VGz04bAteqcvTtfN34gkltW2iOcr7qZ1ruYpKOP3HS8wBOl4zn37/0z/QJduP9auv78i+48QddCyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id aca308f4-697a-11ef-8e8a-005056bd6ce9;
	Tue, 03 Sep 2024 01:28:28 +0300 (EEST)
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
Subject: [PATCH v1 01/22] iio: accel: hid-sensor-accel-3d: Get platform data via dev_get_platdata()
Date: Tue,  3 Sep 2024 01:16:46 +0300
Message-ID: <20240902222824.1145571-2-andy.shevchenko@gmail.com>
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
 drivers/iio/accel/hid-sensor-accel-3d.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/accel/hid-sensor-accel-3d.c b/drivers/iio/accel/hid-sensor-accel-3d.c
index 9b7a73a4c48a..caa183637422 100644
--- a/drivers/iio/accel/hid-sensor-accel-3d.c
+++ b/drivers/iio/accel/hid-sensor-accel-3d.c
@@ -328,6 +328,7 @@ static int accel_3d_parse_report(struct platform_device *pdev,
 /* Function to initialize the processing for usage id */
 static int hid_accel_3d_probe(struct platform_device *pdev)
 {
+	struct hid_sensor_hub_device *hsdev = dev_get_platdata(&pdev->dev);
 	int ret = 0;
 	const char *name;
 	struct iio_dev *indio_dev;
@@ -335,8 +336,6 @@ static int hid_accel_3d_probe(struct platform_device *pdev)
 	const struct iio_chan_spec *channel_spec;
 	int channel_size;
 
-	struct hid_sensor_hub_device *hsdev = pdev->dev.platform_data;
-
 	indio_dev = devm_iio_device_alloc(&pdev->dev,
 					  sizeof(struct accel_3d_state));
 	if (indio_dev == NULL)
@@ -424,7 +423,7 @@ static int hid_accel_3d_probe(struct platform_device *pdev)
 /* Function to deinitialize the processing for usage id */
 static void hid_accel_3d_remove(struct platform_device *pdev)
 {
-	struct hid_sensor_hub_device *hsdev = pdev->dev.platform_data;
+	struct hid_sensor_hub_device *hsdev = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct accel_3d_state *accel_state = iio_priv(indio_dev);
 
-- 
2.46.0


