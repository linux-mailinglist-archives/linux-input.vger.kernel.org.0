Return-Path: <linux-input+bounces-2584-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EC88D7F1
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 08:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EAF71F2A32A
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 07:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE9E56748;
	Wed, 27 Mar 2024 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zp3K7ZAg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6414533CFC
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 07:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525552; cv=none; b=HMmeZ6CpwB+A0/1AH0V0xtaqsWEtkNY7qH/0dohKzt8F9dyeMjwN5YeyzePvKraoErjJiKawruCCY47hNxrTvlsUgcYsF91M0aVjF9LCdUMGrN2vPYSETdRCGvvTeMOaGdZePNQG37eSQRWuztXIngSsxf4TUbPaRUHsoCByQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525552; c=relaxed/simple;
	bh=rTr4+VR/jSpIv/sMvw3QDS+RzZvQaSAXby24seNWm5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKD40dmHvjU1QY17ObGYI7mqzd1guEUijsMDZo5HPQSXlaUnllaYLSOParH8TRc6O3x0Rx51umG4CdItlUeAUKR8FckbGxEcVuZtaqjWcfi/bOP2h0amau8PMAPibyJBFLVtP0BQyDdw5QwY7LqpPn3WaWlxd1tzXhPA6qjC7h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zp3K7ZAg; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-515a81928faso4067629e87.1
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 00:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525548; x=1712130348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9UcXCFoByy8TCDpd1FKhEA3Ix0HKizwo7uUFTdX1fr8=;
        b=Zp3K7ZAgegKHeAj8epPH3BtZFrtnee1lujL47bK2UWRjfypgfFu20/kPbi3z6Ph9MV
         s5ksVbAZ/O1/+G2vIL4CScv5NOHSIT8qnDivqi1pA/yMnich1cwgSFOioGiqWazJQt8p
         k/pfsOV25vtbMQEdS0Jixb1OMWsQB35ptIVUUEkmNzPXgG1cKEOB7inf+BZWfC0bBdiM
         WrIbeFtdvwuv6nHLkBTySr9J2fgtd6QUp+KFTmzJ0jEMyZlAbzeXNWPshOTtmSlVo+WW
         0Pmo1eyx/6LwNLuCR0qr/LKocG8k9UUV+ps2Ns2vyQQrqbmLL0/aegKDdXiY0wAslm9B
         ILLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525548; x=1712130348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UcXCFoByy8TCDpd1FKhEA3Ix0HKizwo7uUFTdX1fr8=;
        b=jDKNnNv7vppjWmL3uVdewKQcXimz6gX0xNCA5TcTxHqoXcyyPO+JennwWKryZBH1tI
         prjNzg1fdJbY4rV80HkfOAG56DKy6Y6Eatu5D810l1xx5REZsJuEn+D4nPX77ut7Sqxd
         DHmnposcdrWEM0GLJNCnAB6ATfu6yDbo8mVDaJrJTV2ZIopr9LoGaBkEhf5JErlA4iQp
         VafEUo6SEOgp1R2Pp82/p7ozoHJ4CA9dTe1tRhlGAwskXCtpdx2nnt0hbZ4cJC0eNQJz
         ZL3mCwU4i5JDIv0iKMrh3MN0ZCOBUWxktz/SELv1kNQF3v6hhfdsoUpBNmMKuHtTsqu3
         ahRw==
X-Forwarded-Encrypted: i=1; AJvYcCUblJgQ8eCrBkgSI4odyrlgB4r420qjNFra+AjWYWvp786Ao72C6haCLWt66Ej4C/alWbRJrZ9jrJ4CXWHbnARwTI2nCotupT1AM1Q=
X-Gm-Message-State: AOJu0Yx7SK24ma1JFKIPKqmLxw6d3wFy2yd2mYF5Ty/A+FBgSrCTv8xu
	anKsfrijC2pVDlS50ke/4C8t/HzwwTyY6NJ2/iCyZcv/l8EdCZrSPLSpvMLwArCkR1UsdbzpGOq
	9oP0=
X-Google-Smtp-Source: AGHT+IHatzJql1atlaaaDzBZKXPbxstbJY5MbJZUna65M1tpSQYVh1MH0tU9aeh6VIRQQNo2ORsL8Q==
X-Received: by 2002:a17:906:6897:b0:a46:6804:3542 with SMTP id n23-20020a170906689700b00a4668043542mr1956805ejr.77.1711525528210;
        Wed, 27 Mar 2024 00:45:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:59 +0100
Subject: [PATCH 12/19] platform/x86/sony-laptop: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-12-725241a2d224@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=951;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rTr4+VR/jSpIv/sMvw3QDS+RzZvQaSAXby24seNWm5U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85VwTTtD9fxC6V3OBHEGzTpxWF87AdRz3YGM
 LXjdEBjRM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOVQAKCRDBN2bmhouD
 1yTAD/sH1bH8ovgnHtbSS402LCXv9pl2ngwI6WvRYTo2H1cvWaCYvGlsGJgxBT5Ezc2XBqx3MrW
 g/ccuKq6LsP/URyaw+MLQJdPUB9/0+r+Mt4RXQYm+SMoPldVnmMdC0dtd4m40SW5G1OtKd0mhwM
 veY5fF+eE4p/9QfgmjowkUxgbszM+plI1AfHja3UF3N0/azkMN5AiPPeJhHJAxsiyPy8Sfvlp8Y
 mLCWA684zJTJgCoL1kra/VRGJGmLBIdJXRjmUlHJ8AW+kGGFGwiZrtuK83ZyuvrDE809VM8nPze
 i2xNnUV6hIGvpoZN/1BoEOeHr+lLvA8/ew6Vd5gcj02u06sNbqEE3QPkRK34XM72aZfqWVCXEbZ
 4oYHafACVNYQH8HGW5rVTuuAT3K8e2qqDxdI2KUqyEQnFvyw5U325VbILYvg4aPZlIrwbRdqidW
 W2w23HFbyFERRqqLlkIFLDgR/CZIVJyXgDJImiuVWfTINPRJ3kAwa0DgybvDcKQOy34+jtVTpx8
 bQoF3ce8SqthQtAulRD53cal1K3x/Uq0Y2ge8oFVCuslXln+J5aOnGYlyjGS/rdcxh1Oq63XdTE
 rMF98ME3bEDlFtRjNzvxvqj1aeWtNG58oZdEG5JZ5RvZ07z1+Rf23rK4fwqWR5ZbTBup8tglpCt
 hbebGvB+jzH4tDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/sony-laptop.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 40878e327afd..3e94fdd1ea52 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -3303,7 +3303,6 @@ static struct acpi_driver sony_nc_driver = {
 	.name = SONY_NC_DRIVER_NAME,
 	.class = SONY_NC_CLASS,
 	.ids = sony_nc_device_ids,
-	.owner = THIS_MODULE,
 	.ops = {
 		.add = sony_nc_add,
 		.remove = sony_nc_remove,
@@ -4844,7 +4843,6 @@ static struct acpi_driver sony_pic_driver = {
 	.name = SONY_PIC_DRIVER_NAME,
 	.class = SONY_PIC_CLASS,
 	.ids = sony_pic_device_ids,
-	.owner = THIS_MODULE,
 	.ops = {
 		.add = sony_pic_add,
 		.remove = sony_pic_remove,

-- 
2.34.1


