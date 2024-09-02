Return-Path: <linux-input+bounces-6059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64857968F86
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:28:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C35F2B22637
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27CB9188580;
	Mon,  2 Sep 2024 22:28:40 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D14D187849
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316120; cv=none; b=fxGU62SqkZLlI4T3fkRcsIvj5oInfYSvrrgB9M2vSoA2rUa5oQbhqf306vWuVSOJDcUMkbzjvbYm4w+6MbyQrmvl2tot8yjiDFKp/ZOXw119Zwz8YkNMggwR6mT6LmclHbnwNflfRhloRH7phidOiq4USScZ4lzXjtljKEV4a8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316120; c=relaxed/simple;
	bh=QWPgIRpwXymjEgzsDh0vqG0Bdp+osf8cuQX3gO2Y+Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZzPLM/HxiiqzoUtHXfbvRCvW9LU5r7HAp6TuX8FZ7S7zJzLtbYRNA6axt1xhn++VqLKEl2nUMb68UDiTvZBJlBEvORONQksNeDcVRJXCQC2Ff8vQbTPUIIIu8oWMiJMya4U4P138jqFOSqdf0mV4ucpdM1LH+61clk9vuHdAm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id b1ab8451-697a-11ef-8ecb-005056bdf889;
	Tue, 03 Sep 2024 01:28:36 +0300 (EEST)
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
Subject: [PATCH v1 10/22] iio: dac: max517: Get platform data via dev_get_platdata()
Date: Tue,  3 Sep 2024 01:16:55 +0300
Message-ID: <20240902222824.1145571-11-andy.shevchenko@gmail.com>
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
 drivers/iio/dac/max517.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/dac/max517.c b/drivers/iio/dac/max517.c
index 685980184d3c..96781ae04f9d 100644
--- a/drivers/iio/dac/max517.c
+++ b/drivers/iio/dac/max517.c
@@ -143,10 +143,10 @@ static const struct iio_chan_spec max517_channels[] = {
 
 static int max517_probe(struct i2c_client *client)
 {
+	const struct max517_platform_data *platform_data = dev_get_platdata(&client->dev);
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct max517_data *data;
 	struct iio_dev *indio_dev;
-	struct max517_platform_data *platform_data = client->dev.platform_data;
 	int chan;
 
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
@@ -176,7 +176,7 @@ static int max517_probe(struct i2c_client *client)
 
 	/*
 	 * Reference voltage on MAX518 and default is 5V, else take vref_mv
-	 * from platform_data
+	 * from platform_data.
 	 */
 	for (chan = 0; chan < indio_dev->num_channels; chan++) {
 		if (id->driver_data == ID_MAX518 || !platform_data)
-- 
2.46.0


