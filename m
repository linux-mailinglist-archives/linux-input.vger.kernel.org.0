Return-Path: <linux-input+bounces-6074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 840D5968FB2
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 00:31:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F6241F24D39
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 22:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB04A188916;
	Mon,  2 Sep 2024 22:29:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF1418BC17
	for <linux-input@vger.kernel.org>; Mon,  2 Sep 2024 22:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725316166; cv=none; b=BsJ+1V5o5kuwG3I9VME+//GfZdXGpAlnWXtlfV3SPqeUmMK7DQfYoy+IYltIyYTlF5kZAZVZ6smITsjIzYTPzG3drICpuMaZF5SWo1U1QCAiVRnu/nLMPkhSxBYnF0KSafo4MIbEHux56OXsbyNd+OjomuG2jOiZfUpr/dWIouA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725316166; c=relaxed/simple;
	bh=q2W2x5oyaNvC8UUAdV6wNNKiWrB5DlPCM9Iu48dwc60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcy11wfgMjXBcNg7jLMPGqdBGmLAuTfe/IHGfcUfPpQxiMvzs+2lBU4fcnB5vRfLHQRSctNWk4DwhS6wHU9mJD03POXEYbyiFGxao6k+oKjs+Es3CLXy8ER7ImRNVgLNk+0nqeg4ocZeyt2y3do9XihkHKhLRWWSZEDTyAZDGmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-87.elisa-laajakaista.fi [88.113.25.87])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id b77fda6b-697a-11ef-8ecb-005056bdf889;
	Tue, 03 Sep 2024 01:28:45 +0300 (EEST)
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
Subject: [PATCH v1 21/22] iio: position: hid-sensor-custom-intel-hinge: Get platform data via dev_get_platdata()
Date: Tue,  3 Sep 2024 01:17:06 +0300
Message-ID: <20240902222824.1145571-22-andy.shevchenko@gmail.com>
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
 drivers/iio/position/hid-sensor-custom-intel-hinge.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/position/hid-sensor-custom-intel-hinge.c b/drivers/iio/position/hid-sensor-custom-intel-hinge.c
index 76e173850a35..63a9f2fcada7 100644
--- a/drivers/iio/position/hid-sensor-custom-intel-hinge.c
+++ b/drivers/iio/position/hid-sensor-custom-intel-hinge.c
@@ -263,9 +263,9 @@ static int hinge_parse_report(struct platform_device *pdev,
 /* Function to initialize the processing for usage id */
 static int hid_hinge_probe(struct platform_device *pdev)
 {
+	struct hid_sensor_hub_device *hsdev = dev_get_platdata(&pdev->dev);
 	struct hinge_state *st;
 	struct iio_dev *indio_dev;
-	struct hid_sensor_hub_device *hsdev = pdev->dev.platform_data;
 	int ret;
 	int i;
 
@@ -344,7 +344,7 @@ static int hid_hinge_probe(struct platform_device *pdev)
 /* Function to deinitialize the processing for usage id */
 static void hid_hinge_remove(struct platform_device *pdev)
 {
-	struct hid_sensor_hub_device *hsdev = pdev->dev.platform_data;
+	struct hid_sensor_hub_device *hsdev = dev_get_platdata(&pdev->dev);
 	struct iio_dev *indio_dev = platform_get_drvdata(pdev);
 	struct hinge_state *st = iio_priv(indio_dev);
 
-- 
2.46.0


