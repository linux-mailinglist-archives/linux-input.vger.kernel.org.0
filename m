Return-Path: <linux-input+bounces-9402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2850A16C69
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 13:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC5113A6A99
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2025 12:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC161DF98B;
	Mon, 20 Jan 2025 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njszSGAy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7606F1B86F7;
	Mon, 20 Jan 2025 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737376447; cv=none; b=hX0K7nGCr4afX57etd+AXyRjx1ebM9eYj6hclIYYJOInRqbrubqDKv6IVM6Rx0b5UFWNJPXqrUhvaFr7bWZRu/EFjz9I5T1wFAllCxsiSyT1ABr3GMvSTTrQTiRnCXJ9dq0SaWUiKyb8CLJo8R4P5GPGHULmJrqyDPfIhEQinwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737376447; c=relaxed/simple;
	bh=yAEGnFq1fPaXAmVZjlGJVKmHOFgrUr8C7FYb/aComRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Es9S81JLRRjXU5sw8wf/kjYu2UdVhQsRUdhdmQKHtgiu1KrZQCwiTXYX2jGE0yRR3PTqsKTVRT6Ogx4/LvVsYlnh/PTK5TTIjZ+hg+InmTg2h4/vlHEBPEA1lwuGzAXEn3iuBMxkRxdcYeIqD1OAD5pH/cOKVCuPtAWf29DJubI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njszSGAy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-219f8263ae0so77325925ad.0;
        Mon, 20 Jan 2025 04:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737376445; x=1737981245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rVha0vnwTsgyqq719hlczMyoarwoABW1JsVuks2CDC0=;
        b=njszSGAy355o2/zAVyiPv44uB0opBBctRB4BSQSGJNLInUGiFWI/sOVkUqDua0u4CQ
         ArMgW2BeODQHWoLL/v+CDuUydKZpJpHUbLp4Scgak9pahAzN7zrp/6YjArfTjtvQQW6e
         98jbnsf/dfGMnkDairDdBfyXF+ZYf8HnqrqVursxrVUqPCI1SvzI8br2PlIA2QOy4MPD
         o13DKJ59Mh+3XIhBG60L2ADVtw/oURbGPoVDSpsWpmsCVrQVB0UWoHFdGb+Q8cl153dY
         B1Ul+AhdXeSTHXj9n+ug93YM0/6T2hp/wM2wurTTn/xKbgdNVzo4jsiGUhbedgSBRNJo
         l7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737376445; x=1737981245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rVha0vnwTsgyqq719hlczMyoarwoABW1JsVuks2CDC0=;
        b=jlAiu7TkbPsohcXRnGEQ+8VhvBZGGmSUzR+UuX9Sq661VAsjwI/cle0SMZfJRgrLVy
         sUomD2Y0YcGZw7o3HxeBHZL9k6GpWx0ZmpQlPd83L9E0x8h9s2Qawzi5KsfxJDRqLFlp
         aQ9nIfAig/7vzspsSuF/yatqloMTbY6NjbKL8neIz9cOxQYfkB2dCI+89il6rcxHQA0f
         VIsE6c1DYCnAEj1MLyPklewMzMjqTritzJRRMUlKLNg3OU2uZencSimp8JF7S/nUzAc7
         muAijX7FM4Geawub9K/8W7ReZ0lVmMMqpYj7AzFL1UhZ37ed7PHc9tP+fNr7lmJOWQk+
         RqeA==
X-Forwarded-Encrypted: i=1; AJvYcCVZz8BAya0FOzc5XLW11YMRQt/trCPiTG09VG3PgHBJ9DNKo6tr2o0yP1i39z2d6zjrowwjB6N/szfzUjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS0F/Xr/yriBmq3wQOIX3CtYxm/uhgTwhOniHQ+KEFfIupHY4h
	dfb3Knv0Hsn70mdMleyQPLTlrgPIBp9R3J9sC+6lMOwiEIOLmIQJHTkHse4g
X-Gm-Gg: ASbGnctTS6SF9X+KYM6icODPc1wyPRG5deqgHnmHQdlH6/jfirYMzCme/mSl+tkPar0
	pLv4v/k3pFLzRPmUWd7s3Vw/ZLZj7wrFon4HRdKkbQIfIEgl7pGTjYF1IJwcGs0D5yF9Qk66A+i
	NoxSlUw2GQ5KK/MQU3c3uA9u5ZLzNJgcyrCJL28L9t5HexO9zt65KSB7yS9X+hcVxs++h1iOdGr
	uoKHrzKM21dmwkolZmqDjDuJitHkN7F+KNkFaGfOTn2gKLigdPDO0SWvWaT7lgDk4yMsCMHEeA=
X-Google-Smtp-Source: AGHT+IF+WZBnwbRtPhon5LlqN6IjHO4m4PSNHFs1Gav1oY2C8Wv8iviEFAA2VpszZsmuyKChr6G+Aw==
X-Received: by 2002:a05:6a00:4615:b0:725:f1b1:cb9f with SMTP id d2e1a72fcca58-72dafad530bmr19151874b3a.20.1737376445508;
        Mon, 20 Jan 2025 04:34:05 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.203])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab81336esm6988126b3a.38.2025.01.20.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 04:34:05 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	visitorckw@gmail.com,
	jserv@ccns.ncku.edu.tw,
	Yu-Chun Lin <eleanor15x@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: google: fix unused variable warning under !CONFIG_ACPI
Date: Mon, 20 Jan 2025 20:33:58 +0800
Message-ID: <20250120123359.2471882-1-eleanor15x@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As reported by the kernel test robot, the following warning occurs:

>> drivers/hid/hid-google-hammer.c:261:36: warning: 'cbas_ec_acpi_ids' defined but not used [-Wunused-const-variable=]
     261 | static const struct acpi_device_id cbas_ec_acpi_ids[] = {
         |                                    ^~~~~~~~~~~~~~~~

The 'cbas_ec_acpi_ids' array is only used when CONFIG_ACPI is enabled.
Wrapping its definition and 'MODULE_DEVICE_TABLE' in '#ifdef CONFIG_ACPI'
prevents a compiler warning when ACPI is disabled.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501201141.jctFH5eB-lkp@intel.com/
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/hid/hid-google-hammer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 0f292b5d3e26..eb6fd2dc75d0 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -268,11 +268,13 @@ static void cbas_ec_remove(struct platform_device *pdev)
 	mutex_unlock(&cbas_ec_reglock);
 }
 
+#ifdef CONFIG_ACPI
 static const struct acpi_device_id cbas_ec_acpi_ids[] = {
 	{ "GOOG000B", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cbas_ec_acpi_ids);
+#endif
 
 #ifdef CONFIG_OF
 static const struct of_device_id cbas_ec_of_match[] = {
-- 
2.43.0


