Return-Path: <linux-input+bounces-8007-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 312CC9C3940
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 08:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 638791C216FB
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 07:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5691F15CD52;
	Mon, 11 Nov 2024 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4mSbadJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE4315C15B;
	Mon, 11 Nov 2024 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731311452; cv=none; b=Nxo8jIPZu26A+9QkcFl36TGfIwvh78AIYQY1W4mr6lz60sAVl5+z5k9whznOxuTDaBioAA89pwpkIpGgMytTiDPLYyPAn3tUvjGBgAhrviRgF7C27O5RiRo1/+VPPIHu9IjeG4EF3ls2F2NWgc1gp3ZbayBpviX9H/yV4jz80tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731311452; c=relaxed/simple;
	bh=7B8rgNk0xIB2DZIRdN4VBbTtsMQ2tmsRQHywMaS5Pg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AMuFhpLg0jaKk2xC08Tmw/41l2vKtZ+T6UPSE/5D2VnvajfgA64dnZ7aGNdjaq0bK+jgVpcscEUH2GV/gCXYJ1wlFQbM2UKEAZXUVmvfkajMcT2LOYnjYDVzr+GeoaVz+DZjiso52bCvLSlK7OKXYTRmnwFxnCJ0GfoEMXGkM3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4mSbadJ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso3165884a91.1;
        Sun, 10 Nov 2024 23:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731311450; x=1731916250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zC6ip2qwUCDI5jyGzbtDI4HvIASASQ60A9sbrc+tJT0=;
        b=G4mSbadJ9RfeQol5/mumw7k0OQlNtan823UmT2GOg82NbE2ln2171B3QKnHHg+E/NW
         equptGhS7EFbb20AVLt/cZuqChFPsWwszed+RWH0p9r52UeP0pdtvhqNtDvJuaQ3e1F9
         0gRMWAMPtA2OuZbN+7dbocmWuPc7rX+WRDtgH4S+pU3NZ21WwQ513rrTTWA5yadH7tDI
         mRIxF9CJ3CvC1MoWpXBWcYphntzGTzMmC32KHcCOpcLWsXokNz78gRB0PlT4dlEFq8RR
         ZCWaebXtdQupHbhFYSqzRSJIRSGFUOBwZ230IhiENdiXNWDXZt8CXri1Vts+i95L3ffT
         EZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311450; x=1731916250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zC6ip2qwUCDI5jyGzbtDI4HvIASASQ60A9sbrc+tJT0=;
        b=LMvVjnK8X5TCw0vkHVkmYmgPhftlOVukPyHDUZUCA56JFwsJBKM4+LAqs0I6bi7JhP
         oae/PqgnrgCWtweHkTOJ8QWX0SacYgulNSj24PWyff7fym9q/0kHYLvyZ/HFU8wCj0qI
         7b9se+J5dvFrXVOegooFsaLN+DZQ56gxAgWAMoH6s+P6Jv3jKIuZnCIAHRudSIucY6i8
         8+2UR6vNg8MmxMVRwBec44YOpXuNjluJpYpMvengb34Y4e+DxXx4iUjdQIX6Pkj87M0Y
         VUQUWYxXNVvpsKapzs421NF4rpbS1KwL4RP9nMlQi8p/roaHT8XXbzjN5UVgCnCYdco5
         YCVw==
X-Forwarded-Encrypted: i=1; AJvYcCV72aDt8TrwS2ZRavN5gx+aZc3u0SQnlKtrphuL32+oa4sAuZY3XaYdjEdz2hQU6UN6e9BiW4jTyyxQvu+R@vger.kernel.org, AJvYcCVpVrJe8/g5wEiO1t1YVGX+4YxDwhbuJKAxk0l7chQEKUE1BHTSipgn2vsrEqEXxtJhk+0OXngo7MSl@vger.kernel.org, AJvYcCVtUL5feOOQBqbI8riz+Xdsieu9anvb5XoJhieXrzRwXWKoSOHQCfd9sfkEIBLf5lcbR002GG4YuXySDVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZThE2CwfFfHk4cunYhgMt6MWgpio4dfnK5gby2HH93I1t2ncd
	lAfkGJ6zxUUT2GnP/eFYALYdhzBklQ2tpFAkFCH+6oAzHomsmiIx
X-Google-Smtp-Source: AGHT+IGJ2s8nCbv9giuX4TsUPyFRZ4W2qwEOYpL76NC6gsnIfuPFTfJNMVD3zLtIJ+LCmxUWrF9log==
X-Received: by 2002:a17:90b:37cf:b0:2e5:8392:afe7 with SMTP id 98e67ed59e1d1-2e9b14dc341mr16113763a91.0.1731311449998;
        Sun, 10 Nov 2024 23:50:49 -0800 (PST)
Received: from ux-UP-WHL01.. (mailgw01.goodix.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5feb222sm8951522a91.52.2024.11.10.23.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 23:50:49 -0800 (PST)
From: Charles Wang <charles.goodix@gmail.com>
To: robh@kernel.org,
	krzk@kernel.org,
	hbarnor@chromium.org,
	dianders@chromium.org,
	conor.dooley@microchip.com
Cc: dmitry.torokhov@gmail.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Wang <charles.goodix@gmail.com>
Subject: [PATCH v4 2/2] HID: hid-goodix: Add OF supports
Date: Mon, 11 Nov 2024 15:50:00 +0800
Message-ID: <20241111075000.111509-3-charles.goodix@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241111075000.111509-1-charles.goodix@gmail.com>
References: <20241111075000.111509-1-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the following changes:
- Adds OF match table.
- Hardcodes hid-report-addr in the driver rather than fetching it
  from the device property.

Signed-off-by: Charles Wang <charles.goodix@gmail.com>
---
 drivers/hid/hid-goodix-spi.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-goodix-spi.c b/drivers/hid/hid-goodix-spi.c
index 6ae2300a6..80c0288a3 100644
--- a/drivers/hid/hid-goodix-spi.c
+++ b/drivers/hid/hid-goodix-spi.c
@@ -20,6 +20,7 @@
 #define GOODIX_HID_REPORT_DESC_ADDR	0x105AA
 #define GOODIX_HID_SIGN_ADDR		0x10D32
 #define GOODIX_HID_CMD_ADDR		0x10364
+#define GOODIX_HID_REPORT_ADDR		0x22C8C
 
 #define GOODIX_HID_GET_REPORT_CMD	0x02
 #define GOODIX_HID_SET_REPORT_CMD	0x03
@@ -701,12 +702,7 @@ static int goodix_spi_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio),
 				     "failed to request reset gpio\n");
 
-	error = device_property_read_u32(dev, "goodix,hid-report-addr",
-					 &ts->hid_report_addr);
-	if (error)
-		return dev_err_probe(dev, error,
-				     "failed get hid report addr\n");
-
+	ts->hid_report_addr = GOODIX_HID_REPORT_ADDR;
 	error = goodix_dev_confirm(ts);
 	if (error)
 		return error;
@@ -790,6 +786,14 @@ static const struct acpi_device_id goodix_spi_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, goodix_spi_acpi_match);
 #endif
 
+#ifdef CONFIG_OF
+static const struct of_device_id goodix_spi_of_match[] = {
+	{ .compatible = "goodix,gt7986u-spifw", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, goodix_spi_of_match);
+#endif
+
 static const struct spi_device_id goodix_spi_ids[] = {
 	{ "gt7986u" },
 	{ },
@@ -800,6 +804,7 @@ static struct spi_driver goodix_spi_driver = {
 	.driver = {
 		.name = "goodix-spi-hid",
 		.acpi_match_table = ACPI_PTR(goodix_spi_acpi_match),
+		.of_match_table = of_match_ptr(goodix_spi_of_match),
 		.pm = pm_sleep_ptr(&goodix_spi_pm_ops),
 	},
 	.probe =	goodix_spi_probe,
-- 
2.43.0


