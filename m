Return-Path: <linux-input+bounces-2575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C3788D7C0
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 08:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A448B1F29F93
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 07:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F104C610;
	Wed, 27 Mar 2024 07:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4UH5QRx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4B4C619
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525523; cv=none; b=tUzBMcdYeMp0yyIcHF5KgpXh2eqDPSvJTMoB0zqJ/qXLSMhKv5QUNTuME9C89tekrmoYhcJzm2bvGLTUyjV8XYX4pjTYrbTX7nJpI13C2nnXEnlyMpxkFU5elKXwu5EAJo2mGHiGe7+Iku2cHKu9Nc5WWMs2z+zOdYajsVTm4O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525523; c=relaxed/simple;
	bh=1PHM2e0wsxA3Uj1VkzIBPCTuFK6Jh8lVYsMYYTUFi6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PIwvOy80tMc854vvQ/awPWCKHS88HVWFTyF3mFsY3Xi0Ssvwm30F2L8W3eFVYHLFs4WX1S4aGQ1pOb/5XSZCH9RdUF+fxH+bhDnleYS7tl/sI+Fz1r3vRijEqBqHiDOZH+lmA3kKIfzIGXOqABx/rN6eFDZRgHuEKIEe1PIWW5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4UH5QRx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a4a393b699fso93524566b.0
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525519; x=1712130319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9x5KXrMkGCI5XWmP7phpN2hPRBytXrTYldJCysrdH4M=;
        b=W4UH5QRxcqKVfl/LyXtSedkERojChomXvWPSUrI06BTz718YSczlOzRJ5BJAyzDNE7
         +jKpgFxU0J39aFYSJwMVU01yRBYH17Pte9wj3IQKyMWPXaQ6pc48d92vEfq5QI/njjzD
         pgdknRV65Gh2P3f2EUdBcjapO1EAiFEp3acVYFnVfDZFaIQuLwOEC/wwK9hCSECmKG5e
         wDvJPaBeenEnffIv0Rr+DD1GXbtrtQfF+aalxgQ6VOcfWPN9LHij6Dxz6cNaUfXTU3f1
         nB8tAKmvf9yXyK/c30eMlw1/qTFk+ZkVz8TWVNVXuaKlvS4u+A4I4jBGaBFB4fKeZUaj
         ZYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525519; x=1712130319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9x5KXrMkGCI5XWmP7phpN2hPRBytXrTYldJCysrdH4M=;
        b=iMDITMnaiz/GZDV7M+bPJQblWjuQCaQFk8yd++SVLlrZFqJ6WC/Q+q3QCSVGTZ4I4l
         8t+C6ZNHoiiYOQn3BWz/PxXVsnP0pdcNsIALP1AQp16l4P1yyKC4dMtKrd94o8n5aM/a
         XdIdIM1PHe0iqQ5alfVsmEjcaNXymkFoiucWETlrvSPp/nBcSS6Sb98XRObR+qZ4Bqj/
         UCEhdc8K6oXhaGdEO2tyPBOYL+MSwYQICfI9Wi5T5JnpKpu5OXh0WkcWDRugkSRdTYQF
         iBL2QfvGP1bbts+X2Lain/AA4IcXYHqE5ZBqSEDWwHjmWTvES7HpFa0QF4tfM9JUlZcE
         FSgw==
X-Forwarded-Encrypted: i=1; AJvYcCVHSKfuq6H3ehQjuSqAiH1gxQr5o+/P2Brmf1+WePGHYne+ibzuG3zj8Qm512yFX+iZabQhipkb6yYHv2M57qBXMQKJlH71nn7a5x8=
X-Gm-Message-State: AOJu0YwoZ43u8MNsKOgotKx2QC9QbyVYNvFScgJWuuxOxLytSLp41Elt
	QGUAArxPNKqnMdU+jM823llWXxX/vcqGD4Q7svCRWEbilus+VQgKR/pE2XOmQjc=
X-Google-Smtp-Source: AGHT+IGUZVId15l2V8zrqWjVp2OSJJdjnfqpmVblzlabr906yKn6uZlea2HCTefmgDYcMw27xN5Bnw==
X-Received: by 2002:a17:907:9716:b0:a4d:f635:b7db with SMTP id jg22-20020a170907971600b00a4df635b7dbmr3744939ejc.24.1711525519373;
        Wed, 27 Mar 2024 00:45:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:56 +0100
Subject: [PATCH 09/19] platform/x86/intel/rst: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-9-725241a2d224@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1PHM2e0wsxA3Uj1VkzIBPCTuFK6Jh8lVYsMYYTUFi6w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85SfelodN5WDCpPu7IQ/MSd2bqFhtOMIk1dX
 Ppxe2ScpSGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOUgAKCRDBN2bmhouD
 1w+VD/93clNn+/kXjdiiABV4GEk35rFvm1cQ+jqPu1K55WJH6DLOZjQhRCFpus0DAbgq/VF4JGD
 D5269FIJpD3FwKPFYxgHxClK9t1tfuFI3okWjfO0z/PxhzVybHByZ1UIJGguKaVi4Sxwl/dTTWH
 gAIuW0+qYsqWSuD2gXOcAKb/ET0fITW/EYGnkV4uEvo3H55cPfH+oH4sEeF8hMOEe/WflpH1/Ar
 NbE0oFBu3JL0/VWu/kZAMAxcganCGuaHoiwS7BDj32xJDV/L7ZSehdOplVIwEOxAia4wnazTzG7
 fglnEQClU6RSPIvG/Ejvq/i/9kg3Ckq1cSUkOTE3w3sd+x+Zsy0sXk30H4IDwzLmkd33OCmoinK
 Vex0cIQDM089YXzD1uvkATAhfLwzF0A3BXtif+guBs2Uc2laTuV8mmKmHZto00y/Li/Upn/VFlA
 0gKekbP3xy2uR2uFuHBcJWR8joHYMJcW+Dck9P8KDcR889NamSJYN3iYD05V/j4y1lygog9N9wN
 C27ES+xZ2le2hI8lMBetXbyfuHe7oAXFix5traHwIwNVH8OcOFRJRB/19TtDlOU7U0kkTuu+GQv
 cdlbKEStsTOg6U9y6p5BpQ+88DLzBtqv03u5PqWdMPPoLNWZtCUtAJg9IM88DawehV6cJXezaiK
 sczoxDt0xaJO2+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/intel/rst.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel/rst.c b/drivers/platform/x86/intel/rst.c
index 35814a7707af..6bc9c4a603e0 100644
--- a/drivers/platform/x86/intel/rst.c
+++ b/drivers/platform/x86/intel/rst.c
@@ -125,7 +125,6 @@ static const struct acpi_device_id irst_ids[] = {
 };
 
 static struct acpi_driver irst_driver = {
-	.owner = THIS_MODULE,
 	.name = "intel_rapid_start",
 	.class = "intel_rapid_start",
 	.ids = irst_ids,

-- 
2.34.1


