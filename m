Return-Path: <linux-input+bounces-4489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EA09108F5
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 16:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10E7CB23AEC
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2024 14:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE4A1AE851;
	Thu, 20 Jun 2024 14:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b="E9rXJphZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.kaechele.ca (mail.kaechele.ca [54.39.219.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FFD1AE08E;
	Thu, 20 Jun 2024 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.39.219.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895036; cv=none; b=OKtuNqa/R8ht6WHzQ9K3RPtI+Xcoh85sxqJWgfVYkb3g9eL9uVCo8tFvSf3KDtYo3VWPB2xU2vPDGcTSrkZw/uCtg2XgGL8AVeOf+45zD3hBx1rLH/cBNDXjz69Q5OhelwV+YeJ4wkiqWE3atwOxlvfoQSRRj4TTCZxsax7Q9wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895036; c=relaxed/simple;
	bh=2DzxvjV6MvKhNUdCZmu80xYkWaZG1Zm5C2Gtma+Iq1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r1z7vxm16aWWsCoMmwL3+GFjfamk6HJIFdeb0dHs7LqRyq32dJhs2k89mkgRaihwAjfJWf2rVRBb9F39yje0ofFdO5r2zz4EKhDBLYDXt8WW+eCb2aP7jxmIYk5qT7H8L8MX7da6+uUV8K+tX8ImJWBjPshw7xR0wqOXkU/9U1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca; spf=pass smtp.mailfrom=kaechele.ca; dkim=pass (1024-bit key) header.d=kaechele.ca header.i=@kaechele.ca header.b=E9rXJphZ; arc=none smtp.client-ip=54.39.219.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaechele.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaechele.ca
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60CFDC0072;
	Thu, 20 Jun 2024 10:52:13 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaechele.ca; s=201907;
	t=1718895134; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=K6yI03A8YX5AxufGKnNrR+pc9BLu4Q5cOZcnXlwV5G4=;
	b=E9rXJphZGhN4S6CmjEvA6PdMbMcrSpFkJaoiDBfr68ID8nM6Iw15+dWQv/AXLUg7MsF156
	E660eXuJftvqEpcp8WtJEY/1XwKXT0IWDxPDIu6HMxcFgUMmoCjV0UsntS1ae7fHIEStOn
	jZR584DHqM0+FnSHDq53ilscClvaWLE=
From: Felix Kaechele <felix@kaechele.ca>
To: Job Noorman <job@noorman.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Paul Gale <paul@siliconpixel.com>
Subject: [PATCH v3 5/5] input: himax_hx83112b: add support for HX83100A
Date: Thu, 20 Jun 2024 10:50:06 -0400
Message-ID: <20240620145019.156187-6-felix@kaechele.ca>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240620145019.156187-1-felix@kaechele.ca>
References: <20240620145019.156187-1-felix@kaechele.ca>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The HX83100A is a bit of an outlier in the Himax HX831xxx series of
touch controllers as it requires reading touch events through the AHB
interface of the MCU rather than providing a dedicated FIFO address like
the other chips do.
This patch implements the specific read function and introduces the
HX83100A chip with an appropriate i2c ID and DT compatible string.

The HX83100A doesn't have a straightforward way to do chip
identification, which is why it is not implemented in this patch.

Tested on: Lenovo ThinkSmart View (CD-18781Y) / Innolux P080DDD-AB2 LCM

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
Tested-by: Paul Gale <paul@siliconpixel.com>
---
 drivers/input/touchscreen/himax_hx83112b.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
index 5092a357c332..9ed3bccde4ac 100644
--- a/drivers/input/touchscreen/himax_hx83112b.c
+++ b/drivers/input/touchscreen/himax_hx83112b.c
@@ -4,6 +4,9 @@
  *
  * Copyright (C) 2022 Job Noorman <job@noorman.info>
  *
+ * HX83100A support
+ * Copyright (C) 2024 Felix Kaechele <felix@kaechele.ca>
+ *
  * This code is based on "Himax Android Driver Sample Code for QCT platform":
  *
  * Copyright (C) 2017 Himax Corporation.
@@ -35,6 +38,8 @@
 
 #define HIMAX_REG_ADDR_ICID			0x900000d0
 
+#define HX83100A_REG_FW_EVENT_STACK		0x90060000
+
 #define HIMAX_INVALID_COORD		0xffff
 
 struct himax_event_point {
@@ -288,6 +293,12 @@ static int himax_read_events(struct himax_ts_data *ts,
 			       length);
 }
 
+static int hx83100a_read_events(struct himax_ts_data *ts,
+				struct himax_event *event, size_t length)
+{
+	return himax_bus_read(ts, HX83100A_REG_FW_EVENT_STACK, event, length);
+};
+
 static int himax_handle_input(struct himax_ts_data *ts)
 {
 	int error;
@@ -394,6 +405,10 @@ static int himax_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(himax_pm_ops, himax_suspend, himax_resume);
 
+static const struct himax_chip hx83100a_chip = {
+	.read_events = hx83100a_read_events,
+};
+
 static const struct himax_chip hx83112b_chip = {
 	.id = 0x83112b,
 	.check_id = himax_check_product_id,
@@ -401,6 +416,7 @@ static const struct himax_chip hx83112b_chip = {
 };
 
 static const struct i2c_device_id himax_ts_id[] = {
+	{ "hx83100a", (kernel_ulong_t)&hx83100a_chip },
 	{ "hx83112b", (kernel_ulong_t)&hx83112b_chip },
 	{ /* sentinel */ }
 };
@@ -408,6 +424,7 @@ MODULE_DEVICE_TABLE(i2c, himax_ts_id);
 
 #ifdef CONFIG_OF
 static const struct of_device_id himax_of_match[] = {
+	{ .compatible = "himax,hx83100a", .data = &hx83100a_chip },
 	{ .compatible = "himax,hx83112b", .data = &hx83112b_chip },
 	{ /* sentinel */ }
 };
-- 
2.45.2


