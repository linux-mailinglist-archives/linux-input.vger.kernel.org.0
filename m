Return-Path: <linux-input+bounces-4319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C23904AFF
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 07:42:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E0601F23465
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 05:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4CE36124;
	Wed, 12 Jun 2024 05:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ6Nx+Vh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2395422092;
	Wed, 12 Jun 2024 05:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718170957; cv=none; b=F3Vzvf6YZDGNRi07vO2tBneXFeEoDTvutuMpX+bWv09lVXT4NKmtKKJG5HM8ALl4ALiC6YcVyqUzQlhpKCBpwzvsDYPO2kR4MJvDt7t9RlFfxWTTJ92q6pSaamBF3HqylpGmRKNPe8IqSbd7ZHbD9yA7U5cSZBzQL8WHgH0dXLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718170957; c=relaxed/simple;
	bh=3eTHdH1CLexChiBsmBR7oeS5IoJk5ge3XGY2CXt1GOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmbuxqgwJSkxvtJkCDCF8SWFu7PtDamledybd5R5m/ScYxG+pQBIPzAOXQnqgTXrzHa3lO86u3OtAEnpkubXn1TwUL56UoXIHK+KIWgpryJ1uq76ddw5iz10nHexj0a1rGBazfhtrLNIBcQFLlr8VaZjhcM46MbdL0+NJZNki8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ6Nx+Vh; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-6818e31e5baso5309755a12.1;
        Tue, 11 Jun 2024 22:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718170955; x=1718775755; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOLVUBLo6Bm7rFnndVTWve69iEQA2tjI5eQ9qpYaawU=;
        b=lQ6Nx+VhuThrnG3SuMytHqlg0/nzPJUarU+jxdSX5Uz5BcU+OLa6V8zNu2z2kGX6Le
         fBuZVM4nekBW21K57B2ZInTMAhyCTobmOg/4A65YP7rZz/4apbkwjeZPGKNit34Vqc/Y
         vB6edSQCGte1GoPKSBfG08p11aUxJ80kSNGn3gPEFUfwB7sPZ9a2Ho8C7MSJMwAgeBAh
         MxInrcGcAfr8MEMh1Ff5AhyvSbZN/7JAMaPct5R2lwfTa6Lga6hsIHG621dKoN9azNS8
         1W1MLxyvCpgikg8ttUzTGPflW13kWqVc59+WocPQiCaO+IJnHzG+9F3CoKwrfgYNFHbs
         U7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718170955; x=1718775755;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOLVUBLo6Bm7rFnndVTWve69iEQA2tjI5eQ9qpYaawU=;
        b=aKpVnOmUZjZ8SC7msuNyKbDgLRoqwko97+WECyvCemYQsH09SYpT7fPLNCKmYuEMuR
         AIXgtkiLyo90W56t6WEIziVpEoQMFGZd+KkqE6wXzodcn/HyRNYQTM5AnQbT0zzwnpx/
         k9B020txeryLN2/Vyr5MbGkOoc6zPSKIKQU1KNPTgR/NBWj/WLbU/EBk31lTrB8EKAl9
         LN6lrjw6z48m+3Itfq8cJ/X3ZT0EFAjva0RlSNPpUmayWY8PNohBj1K2QAxlZTyeTyod
         taT19pVyMOVBQudL5D3yB5JGCbyvW8zvzePvDaYOo+ZzvBrqbJizjgT9dovWij+15ee6
         cc1w==
X-Forwarded-Encrypted: i=1; AJvYcCV15wbxhOqdLm7A2BSu/RjlNAJr2CYUHHORgUVskscSgh1v8DmnIGaqSS3bdE7x2ZkQViuR+Gre/btvVn+h8rZx/zyc+VMEpTS2y2/T
X-Gm-Message-State: AOJu0YxiuKF0eqhQR6N2ow/qw6ZlOps9JCiRSq8hFF1p7vqtMNkMcwbZ
	p2mXnrvSD5kLR9u0vA5TfxWV1pOduSjaH7QbaY36zbG00cF2AbWu
X-Google-Smtp-Source: AGHT+IFF108IBExi8ESRPaaskRirkTJnMv0sYa2Lt7pbAmuJH3hOvGjfRpVCXAISZ+1gMdz159mabw==
X-Received: by 2002:a05:6a20:748e:b0:1b8:622a:cf8f with SMTP id adf61e73a8af0-1b8a9c7d554mr1147172637.57.1718170955232;
        Tue, 11 Jun 2024 22:42:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:3077:52c7:3e56:8d61])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71b9dec2bsm42794015ad.186.2024.06.11.22.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:42:34 -0700 (PDT)
Date: Tue, 11 Jun 2024 22:42:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: goodix_berlin - use __free() cleanup in SPI transport
Message-ID: <Zmk1SGwVt3rIbbMU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Switch the driver to use __free(kfree) cleanup facility instead of
freeing memory by hand.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/goodix_berlin_spi.c | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
index fe57390975ee..a2d80e84391b 100644
--- a/drivers/input/touchscreen/goodix_berlin_spi.c
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -36,13 +36,14 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 	struct spi_transfer xfers;
 	struct spi_message spi_msg;
 	const u32 *reg = reg_buf; /* reg is stored as native u32 at start of buffer */
-	u8 *buf;
 	int error;
 
 	if (reg_size != GOODIX_BERLIN_REGISTER_WIDTH)
 		return -EINVAL;
 
-	buf = kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size, GFP_KERNEL);
+	u8 *buf __free(kfree) =
+		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
+			GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -62,12 +63,12 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
 	spi_message_add_tail(&xfers, &spi_msg);
 
 	error = spi_sync(spi, &spi_msg);
-	if (error < 0)
+	if (error < 0) {
 		dev_err(&spi->dev, "spi transfer error, %d", error);
-	else
-		memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
+		return error;
+	}
 
-	kfree(buf);
+	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
 	return error;
 }
 
@@ -79,10 +80,10 @@ static int goodix_berlin_spi_write(void *context, const void *data,
 	struct spi_transfer xfers;
 	struct spi_message spi_msg;
 	const u32 *reg = data; /* reg is stored as native u32 at start of buffer */
-	u8 *buf;
 	int error;
 
-	buf = kzalloc(GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN + len, GFP_KERNEL);
+	u8 *buf __free(kfree) =
+		kzalloc(GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN + len, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -100,11 +101,12 @@ static int goodix_berlin_spi_write(void *context, const void *data,
 	spi_message_add_tail(&xfers, &spi_msg);
 
 	error = spi_sync(spi, &spi_msg);
-	if (error < 0)
+	if (error < 0) {
 		dev_err(&spi->dev, "spi transfer error, %d", error);
+		return error;
+	}
 
-	kfree(buf);
-	return error;
+	return 0;
 }
 
 static const struct regmap_config goodix_berlin_spi_regmap_conf = {
-- 
2.45.2.505.gda0bf45e8d-goog


-- 
Dmitry

