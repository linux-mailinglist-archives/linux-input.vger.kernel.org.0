Return-Path: <linux-input+bounces-1389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D24837032
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 19:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D73CA1F22069
	for <lists+linux-input@lfdr.de>; Mon, 22 Jan 2024 18:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D641A60BA3;
	Mon, 22 Jan 2024 18:08:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB91605CA
	for <linux-input@vger.kernel.org>; Mon, 22 Jan 2024 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705946909; cv=none; b=iNFpWUCuKzoiXye9ItU2qhQCY3hsN/SzwlSFgzvTPzBt7FywGC+Lrije7ogc/tuWKcdixa3xirz8APN9D1I00PL76cLVKj0cWsvZs5jJFoTxJP3cvcRDY3dWZP4CSGHHUUs5bmyMm/H7wh9vZ4TqyX5CX1+s4pG59Ee4Jw8wV0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705946909; c=relaxed/simple;
	bh=8drcgdb3m/yT4iPvJGL3OsM8domsXf3+QeiZTDg4ie0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbaka1i6a5xyO3Kn1GjYRkzTnJAvbXTq4tcbzp5uDpqXL3KtcGb4NNoZOCualew07kvdULA5vPmEc+NbIhWV19bj2NVslRJSLmEzY+W9U+KSdvH7UA9ou+F0ANX3Y41Hz1EPbjIvb2DC0bDQMBTyOa8qiE/Q5108TpVwAAK7rjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiV-0001lg-HG; Mon, 22 Jan 2024 19:08:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiT-001ePU-MB; Mon, 22 Jan 2024 19:08:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiT-005Zx3-1w;
	Mon, 22 Jan 2024 19:08:13 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Cc: kernel@pengutronix.de,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH v2 05/33] Input: synaptics-rmi4 - follow renaming of SPI "master" to "controller"
Date: Mon, 22 Jan 2024 19:07:00 +0100
Message-ID:  <e72a577c4a2df17854644838544682b25b15b26a.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1054; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=8drcgdb3m/yT4iPvJGL3OsM8domsXf3+QeiZTDg4ie0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7IUbynclwAXQvEaL/CG4Lh7UWDH5qA1DZQ7 6tqvqZk2feJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6uyAAKCRCPgPtYfRL+ Tt51B/4uJxNpLR4s72YJFagumenuXQIHLuy74DdFvoURweuBaSRJj7E5IwTE59HFW6PlBG5jPNS RI9a9DIHj1bHFzTeOGCw+F1Nok0uxbljEvT+vl5RdlUOCgWjdMCvQmJZveofQlCHtY4FfBvwUzJ Ddx7FzUO6e+5TsDYA8B3vnEp453ZT8D43ITCOKXqLLwQvAyLWs3escllTBH+lqek+mFOWHlzF4n lMWLa8ps4ucmro75obZJne2gAOkW1eoj6kNRc2krJjrTZFLoxmQHu9Kv3VpAsl/k0bUWvMAxwtY TJ7grt5Y1m3z0nAwMxQ/l9RX8ni8RHI8b8+XtODGBw/x0Sqx
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
some functions and struct members were renamed. To not break all drivers
compatibility macros were provided.

To be able to remove these compatibility macros push the renaming into
this driver.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/input/rmi4/rmi_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/rmi4/rmi_spi.c b/drivers/input/rmi4/rmi_spi.c
index 07c866f42296..9d92129aa432 100644
--- a/drivers/input/rmi4/rmi_spi.c
+++ b/drivers/input/rmi4/rmi_spi.c
@@ -375,7 +375,7 @@ static int rmi_spi_probe(struct spi_device *spi)
 	struct rmi_device_platform_data *spi_pdata = spi->dev.platform_data;
 	int error;
 
-	if (spi->master->flags & SPI_CONTROLLER_HALF_DUPLEX)
+	if (spi->controller->flags & SPI_CONTROLLER_HALF_DUPLEX)
 		return -EINVAL;
 
 	rmi_spi = devm_kzalloc(&spi->dev, sizeof(struct rmi_spi_xport),
-- 
2.43.0


