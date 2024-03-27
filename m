Return-Path: <linux-input+bounces-2572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D6088D7AF
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 08:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C9431F29E2D
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 07:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C283A297;
	Wed, 27 Mar 2024 07:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gzYe23MM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421238DD9
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 07:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525514; cv=none; b=fB2+wCJVZjNbMFzReSC2DWqW9OGSiSNIlypZAVV3+xcDavcTmmlmG0NdViMfv1pfoqoxCsQ1QON9EYcxNXC8TxzbKvIUh9Sf4IrrpDgPkWFUt1aXcun/HUEN5nafoyeXOFijamaTkuvzyCfFsCv09f2Z9BQOJ+9Cfkq/4RXnU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525514; c=relaxed/simple;
	bh=jVvTz/4XtpK8V6h+ZC6ATSj5H2YAdcoH6Ojomo104WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mA395BjdzZi8AQ/cQegVICRNHdRAS9YxacvsakQ5kTM7rjkoza7dM4/vKOy5WNv6CWtEE090MCSGF5bIQuu7nvo1TY/0qWL5Oq0pFLSS0gmH5n17CbACsl0GmbWtMtpRlVU8/ILYO2Ub6sBgW+xVCu1yJVrVZCwofVkX3zekIR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gzYe23MM; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4715d4c2cbso809519066b.1
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 00:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525511; x=1712130311; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTe518P+CBoFHdvJv+kQSKIa9d03W9jOgFL3c48DSH8=;
        b=gzYe23MMMFH2V8gV+sXRA6/rR0uYVutlftoudtaDK5paW9zzLuKDEnDOgA8lI5/UrT
         xchelbmx5FcSgMW36VB+JldodJVruYAKV840lmfpLGRumvOVG67M/JRuJxfEh5cRM8+k
         /INSbgLVRU5X+TqTyxq5zWoNVpL1v/81x7nW+2lZarolT+BewJhbc+/2e8nby4dyZUCZ
         O1c2pVsuYSAm16PJsQFCKemVT+FTfhLy0F1Zetk/27c6gOTrsvDkxBydH+shMU3Qrlyf
         UlwDF0crrTGUNW7ajNXhzMqtW0urKZwlz3C0dmMqUWK9VnMNIFc25YIMHb6Ed8B5lILe
         871A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525511; x=1712130311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTe518P+CBoFHdvJv+kQSKIa9d03W9jOgFL3c48DSH8=;
        b=fwOE/AYb+iTfxSJS7tRFWFkR5DAZ4Kzvr2w0cihQ7jGn92fewn/l+2bAEz4iMK9yK6
         /lB0sUV+Z8jkAHz5BSrGXPeXqeulVAkLXkseVx/aW/z033MMQ7YZEQyXW0amL2p2U7xI
         8Oec3ttOc+PjrEpatt2sjQo7+hadytu1PM4b80hfmd+4797TCr/OLZVsxDTlyWV+TQ/G
         GKFKC08xYk1vJcWWSi33ryqY+l++fCCGf1qCWF7EEimtHcZTsVCcvlikGSxTmkh8CSr2
         un+DJM2CFsZkfLDI68c9GIwjIiJHNOWIsaRYUxTrRrAV1c5U/ZgwkDHh1YKlZ7kVnp1+
         AQLw==
X-Forwarded-Encrypted: i=1; AJvYcCXM7/IyCMj+ElM/J+AdM1vwGd86X2RAdC4d0ZY8u7+shfPFr17KGl5+Nb3Vs/R+JPOJR+MnEvqeX2dikbbq5KUljXEEgoAAH5XmzqE=
X-Gm-Message-State: AOJu0YzabJ010TwjLkIQMaSdu6xVEv6XC1VbgSwDshSRmTBaL+IhpiBE
	79EFRHfQT+PaggY5tEClxBMaE2838S+f9hXNDRu030UYks8UF3z0rPD1ojX3pPA=
X-Google-Smtp-Source: AGHT+IFlR06qDg5BKJV2+CT1BhdtoTFGj+rxsS5177vnZTCP37lbIy3IZkv3HaF8xAuayvCallRQJg==
X-Received: by 2002:a17:907:985:b0:a4e:b26:5669 with SMTP id bf5-20020a170907098500b00a4e0b265669mr102442ejc.60.1711525510937;
        Wed, 27 Mar 2024 00:45:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:53 +0100
Subject: [PATCH 06/19] platform: classmate-laptop: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-6-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jVvTz/4XtpK8V6h+ZC6ATSj5H2YAdcoH6Ojomo104WA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85QLQrQEujrtDSXh0HMI0kzqx7rJQEwfZ0Pd
 +8TD4fAtH6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOUAAKCRDBN2bmhouD
 173ND/93zCStU3HCb7jMeB7WGWoFk2fo/hEI4U4aDXloWYBYguWy2w7TPRIjyLS74LwHq/X94Wm
 651HaMxhDT6CSRZecijb2+3BPZy798L+tLbbOrzj9qRhJLt49OaRv96YYMlXKL2Y/LrPpLzo99j
 CpEjQ12NwklrAFPohZ9OuwHgtKQ5jnWu1qj2x/BxOKXaB+Mi1tHsJ+HLOTfOl1U51hK9Q0vb1zk
 sdN94CVUFNPj/NzW9fM9zLqQQEVKT3RrAfBHuYdS5IF/DJoIRO9p0gszCOg/+9KIUZUucFri3Jv
 SjOFV2zfFnEMNH521/rVGF2iNWu/57Hng+4mqzdckk0LGqF2EpP9Xv29wbcKbCkbugIbntUJzil
 W7Zq6iFcGKUyA09aWkKOjgxkNB1MmrkKNLro94NKf+jlSU2qtmtNduZaMHn66iiGB3D+cN2KhR7
 e7SicLH/YuN7gdPGuXFXE5Vemny1lqCzgta32M6lL+Odnpelm/UGFjyUbuPmwC2uJaxGQamZAAx
 mvUE5SfeVz1lDjaZNmUwtLzOFRS2z7HwYMu1vFr/bkU/LL0qpl66hkVvXGX7YMJDAxTWhkBcz2Z
 toT1rVcP6NoG/+FigBCC3Oyf3Vi70Obs4gEb0r/FiNifUu/4Mw7IqCeE0YGqYxkLtWSapa1EuaH
 vvlbXFXLH/VHwGg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/classmate-laptop.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
index 2edaea2492df..87462e7c6219 100644
--- a/drivers/platform/x86/classmate-laptop.c
+++ b/drivers/platform/x86/classmate-laptop.c
@@ -434,7 +434,6 @@ static const struct acpi_device_id cmpc_accel_device_ids_v4[] = {
 };
 
 static struct acpi_driver cmpc_accel_acpi_driver_v4 = {
-	.owner = THIS_MODULE,
 	.name = "cmpc_accel_v4",
 	.class = "cmpc_accel_v4",
 	.ids = cmpc_accel_device_ids_v4,
@@ -660,7 +659,6 @@ static const struct acpi_device_id cmpc_accel_device_ids[] = {
 };
 
 static struct acpi_driver cmpc_accel_acpi_driver = {
-	.owner = THIS_MODULE,
 	.name = "cmpc_accel",
 	.class = "cmpc_accel",
 	.ids = cmpc_accel_device_ids,
@@ -754,7 +752,6 @@ static const struct acpi_device_id cmpc_tablet_device_ids[] = {
 };
 
 static struct acpi_driver cmpc_tablet_acpi_driver = {
-	.owner = THIS_MODULE,
 	.name = "cmpc_tablet",
 	.class = "cmpc_tablet",
 	.ids = cmpc_tablet_device_ids,
@@ -996,7 +993,6 @@ static const struct acpi_device_id cmpc_ipml_device_ids[] = {
 };
 
 static struct acpi_driver cmpc_ipml_acpi_driver = {
-	.owner = THIS_MODULE,
 	.name = "cmpc",
 	.class = "cmpc",
 	.ids = cmpc_ipml_device_ids,
@@ -1064,7 +1060,6 @@ static const struct acpi_device_id cmpc_keys_device_ids[] = {
 };
 
 static struct acpi_driver cmpc_keys_acpi_driver = {
-	.owner = THIS_MODULE,
 	.name = "cmpc_keys",
 	.class = "cmpc_keys",
 	.ids = cmpc_keys_device_ids,

-- 
2.34.1


