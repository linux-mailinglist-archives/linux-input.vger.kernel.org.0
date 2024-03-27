Return-Path: <linux-input+bounces-2582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E7388D7E7
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 08:51:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1431C25D65
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 07:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E34E55C04;
	Wed, 27 Mar 2024 07:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjsbFOam"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0830055C14
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 07:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525548; cv=none; b=lygKYP1i3yxDXZIaw1v6aaUsdFcCIIc/oQkpUCJ3pd4UBRYcql3C8Mt4XTQfsEUd/ft9xhA7bz1Y+evymyJ5oMkwiAMJIPVrQP9AJFb6Mlc00AwUp1+Z9qREZjBdT1uW3wYquIMBLC8iz10MeIlWwnlFlSHNSa4j966Yv0Ghnyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525548; c=relaxed/simple;
	bh=Zx0wi3rFfB5CnS9b/ptAljW/d4Zkz66ZQzHmpzkPedE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V5eQqn/9ldW/Gl58am/sKU0eAeTB+uRoxnJ/iRx91ofRrlAFi9mi1FpRr9P7E+7sYbLp6KXQM0OF26DQbIUuC4Gy9ASfxPm362GBG9AjfK1gdKuCmAXLx0fYC2+HtlSGFS1bc39yK7bOBRR0r29JPoqAW6rArSZ9p8LQcxVAQxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pjsbFOam; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a4dfe6564b6so89299666b.3
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 00:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525544; x=1712130344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zG70YiT9egGjOLl3lGO+ZH4pHURJ0IQAUlSvgklEFyQ=;
        b=pjsbFOamv8AK9u7jvtjQgVHGEY0QjsHCUadx8IEbzkI4IWW5XYlpBKk+JYhLRJVUBS
         VCcNG8d4W8t0aPg2sbiMDogbJUeZxUvGYzBKHAG2cReMUxIWs09R3f+nEKCgw1ih/5wS
         fP5NTgmOcOc9lzdxVAZ05+DVSU7UVAympHscqrcEInXOhzqTGcQDwY5m9R89SoLMVWyW
         M0ODIYokGcOVeoKBcnlIBsSdQHjvb+pn667YDTpKe6i48qqfbQnIme3B+0Pu67SHrixr
         SgGpMW/9QSm4mQLtJb7kMrjLlnGvYoyeml6DJHI/xcYO4Sps7L8Qg3n+JyQ1xiafWclN
         SRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525544; x=1712130344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG70YiT9egGjOLl3lGO+ZH4pHURJ0IQAUlSvgklEFyQ=;
        b=TBunrW562kaYaUf3Je6ypjmKNst/cpVeyIds/4DLkA8u852rbsSWcAa8znxe4hqGX6
         FPOPrhWk1BQ7pIgwoycC2CX5migS7PGCA66B8j+sIZdV0j+PoQ2+EPRuRFVN4VuOyls3
         umiAlVee10NkiPlZJhNjuelbceauzPJuDQVSUBQZPtf2HMCV7qHAd8mVowZTBQOTRj2m
         zy5x1rfM8TjYE2jb7yRaj0pXoI9UTo5S8i2Yo8tIPEhDV4rTTzq7qjhye4N1Pskhx9SS
         fC71lKVaEz5+1xnrVRlwiHWAqng8zxybwN3z8GzOT8OKsDdz9pJr9RUmm9NJSxC6k1iX
         xvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbkb6tKy3/j8h44IBTbdnXI0kEytdwhVoOYxhIU7yWqtOs5kpCmskdCaC7zAQJBSWI06Eg0AxEJ8ieetww6jk4Aa7yxq3YrXDO5J0=
X-Gm-Message-State: AOJu0Yzy5bAikOiilTUgYqbqmjtIOy6hLKdkhZItMhJHiVsbnPM0jVQ+
	kRsuJrpSyastQCNIbOAqvIoG1OmW9bMSvgThiDM2XEbr9xbuBwrEeyhYIiyiXd4=
X-Google-Smtp-Source: AGHT+IEdPY3LuVSgs0UDByUus6gLDym8Cuv2HPa4H0W8OAUyKB99UpqvYvZ1t0/ybyDX014ile6PaQ==
X-Received: by 2002:a17:906:b30b:b0:a47:1d3f:b2ac with SMTP id n11-20020a170906b30b00b00a471d3fb2acmr2424983ejz.76.1711525544496;
        Wed, 27 Mar 2024 00:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:44:04 +0100
Subject: [PATCH 17/19] ptp: vmw: drop owner assignment
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-17-725241a2d224@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=593;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Zx0wi3rFfB5CnS9b/ptAljW/d4Zkz66ZQzHmpzkPedE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85ZSxixKbx3fbuPIe41N6juVHLvNXO2Sfq5q
 JWcaEqsb6+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOWQAKCRDBN2bmhouD
 18fCD/oC805nu9JPP4dJcArJiLpIDPaFZPIQpxuXB8MZUkhTjJx/ZbZoBjuuE93Ahg1hK32xWDU
 uyw70gENI6B2bc3IZtCognUXM3FxlXxPdlKY2XVqX8Ag0BffT3plE839Xo9Ffjhq0n6UitExRgh
 0f/iXZbajnuPZ6hu8U3uYdsgbtg5DgRvK1tf92qPwPOlSL2iDH7lZRC6n41mBurES38vMtCE32J
 58DIspcT3yt7IIlv0G2tRKbP/1g751XJCtfBdQ0FfEZsI/YYfhGVKP7y16uybFHKUhYAwlgChKZ
 wD/WzKOXD4zom8jOpl7FxeRKOcdzGfJMt0+62R25/cpv+G0o83tRBQ+Ai0qc21c2XGuXqEW/Xmy
 p4/WUc+R2cC6rPlCgYarWwoUmMRfcIHufm4GvWCuSuT4ubc0gM252VR79AZ4ew/zNZjwtKGrjtf
 qYtdJtJfMHJ16g4vsaabC/jFr5x5nQNXqNJ5dQKkKn1kjOWSzNPTNWQjJHsZ+1tuCjeendf1VnH
 +i04nBCV4lQ+jnG5LgE0edtikosAfXaP8nPPNWDSuCJnnZNfMdiP5fTFD52ovryTs+w94/OvpMP
 M6BPWQCt/RuEWB1rFmlsKzqHNYaNsAmIlSeFARs5U6iLXWCPkhGYQEhpYBQLQnTon2mhuWgrrVN
 X75/xfvCZ/jiKfg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ptp/ptp_vmw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ptp/ptp_vmw.c b/drivers/ptp/ptp_vmw.c
index 27c5547aa8a9..7ec90359428a 100644
--- a/drivers/ptp/ptp_vmw.c
+++ b/drivers/ptp/ptp_vmw.c
@@ -120,7 +120,6 @@ static struct acpi_driver ptp_vmw_acpi_driver = {
 		.add = ptp_vmw_acpi_add,
 		.remove	= ptp_vmw_acpi_remove
 	},
-	.owner	= THIS_MODULE
 };
 
 static int __init ptp_vmw_init(void)

-- 
2.34.1


