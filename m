Return-Path: <linux-input+bounces-4468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2916690EB1B
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 14:27:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48C71F21CDD
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2024 12:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31FE1422A2;
	Wed, 19 Jun 2024 12:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="E0k1+2Lq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jtFWxLql"
X-Original-To: linux-input@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784F913AA51;
	Wed, 19 Jun 2024 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718800033; cv=none; b=pXnjRLcRvQgDLrii10JJSkAuFV2bsO12toO6XiqsyATNzddpGZF+OTQpq9jQt1JoKSi1eyVu6wC6m6h9IJlNDfF+gck8cT0FQ/Yn2IcFr3Brb6g/c50VHwEwr0nnoKCDyJhCYButyLq+AdYzp48QGxm3jbsBXx/jPxb3qYZsAyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718800033; c=relaxed/simple;
	bh=gRdkF7mZaNLgISxMnEZRh0igfQ2rhmP3se3KFsPnfPU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kQxfDs8vuLqYPAWZABJ58dCFcX3U7mbj7qfWtNCQtjdzZMXr68R1Lvw1dM9YibBTSzZIu1rbiWI6Y2Eitu/su8A4RdTZrRxlVjaMc4P1haXQTmRwFROdkfUmQWzSqDCb5uSRZYVB//N23EdgBotd4LjdE2UUd7x88YB5ZpNYhQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=E0k1+2Lq; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jtFWxLql reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1718800030; x=1750336030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=byQ4uziYan99fHxdyCuRDt0WvxLvcZqE4rHrS7A3/yo=;
  b=E0k1+2LqfNTUv7zQWQudjJPb9u9kajprkqb5R6Tf50m+g4DfXBsCDq8b
   yysw1IclrJXshVLLws8efRK/Qc4jBKYRb/ixylK4qUUNPwS1xWyyWDJqN
   m4j0vY9B8bP+815Ob+Eq42aD19dLl8GQBuAaZUmDzWXsKarwxTGCm9nD4
   r2HtjzmlxM86B6HbcJVt4CPd88notibsPNzisALY81qwCA7A6SamCArPV
   465TA+CxWRPdLqHBUi8uy9RruE6bhB4ekp5wMmVRTc0aIvJ5su8guamqk
   vtzsgiZcC89miLxKXv+Fb/ortQTYktr3jeQaLtLgcb74EFJILiH5c7PcX
   Q==;
X-CSE-ConnectionGUID: MeeSjGaKSr6816QEtHAzMw==
X-CSE-MsgGUID: rpSzCAnURkGollncxAo/4w==
X-IronPort-AV: E=Sophos;i="6.08,250,1712613600"; 
   d="scan'208";a="37476419"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Jun 2024 14:27:08 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAA69166A94;
	Wed, 19 Jun 2024 14:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1718800024; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=byQ4uziYan99fHxdyCuRDt0WvxLvcZqE4rHrS7A3/yo=;
	b=jtFWxLqlPAtanWAeudZUrzhoGaFv1/IKXR/75+XopLBCivCCLxwQWZ1uqKVKudc4AvaRQW
	3mhvoHCZBOvRdHTmfk9//Gwc2cd8AsT4YpxVMjZWFs85Ey/Axa4e7yz+LGUSBUfySUiIk0
	tr7zfvLrfYTj+hpS/TjP49RmKuk1jSAzOo2zbjdFZkbMDIbPHt/utTme0H1f8ekJAIc7VR
	SUElD14DZ8MMUiteYL0QDjPT5GQJ9cvNrWYqoIDKzb4cCSDE8hf0Hya85tf9stq6lfTroq
	WaP9zUNQ9Tg7s4erkhvNTEAw1xcRWDMHT8VwRu8nxnqF3Fx9YYF1abKhpJvnIA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Input: ads7846 - Use spi_device_id table
Date: Wed, 19 Jun 2024 14:27:02 +0200
Message-Id: <20240619122703.2081476-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

As the driver supports more devices over time the single MODULE_ALIAS
is complete and raises several warnings:
SPI driver ads7846 has no spi_device_id for ti,tsc2046
SPI driver ads7846 has no spi_device_id for ti,ads7843
SPI driver ads7846 has no spi_device_id for ti,ads7845
SPI driver ads7846 has no spi_device_id for ti,ads7873

Fix this by adding a spi_device_id table and removing the manual
MODULE_ALIAS.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
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
2.34.1


