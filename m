Return-Path: <linux-input+bounces-14709-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A72CEB56ACB
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E1BB189CFAB
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 17:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7DE2DEA82;
	Sun, 14 Sep 2025 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BR8gfHcu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777DC2DE70A
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 17:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870183; cv=none; b=onSV0H5eUiGpBgJbFG81MMDRh4EwT2CHcVBILFXEBcTKUnnKV4Cv85SJIYVBxlIJWc8KJhXP3fIPB47udY+iqee/E99GilTMCQP0kvAnglGPpxL0ezrLq4BP+zg29llDoDs0M+FIdI3KhieHIhBJ/T4C1MMnGvK1YRa8as3x+9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870183; c=relaxed/simple;
	bh=Jy5vrJ90AiD6jtnSaZVQFAUaOXKIYVVwz21RLq/eHTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZcOtpt7NeVh6DQAy7Nu3Tm7qy4kvFVoK27Cl7F4vX0Dx9kAsr8LL6/IMQnJ8VHKJ/ImOUiaRxAZ4kdfFUqmD1KjwvibpLgPZTykbeNRlUTPdzEX6t1RgWKtaY340mEGYatoNWYwZ1R0HYuccgG4/GpOm3cnuaoUMJFdDB9QiPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BR8gfHcu; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b07e3a77b72so186563266b.0
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870180; x=1758474980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sx0EwU0te/usZ13a8MurPgLe0A2g8omNenFnNxHAiqE=;
        b=BR8gfHcuRC32Q6eRp8toJOZf+lv58YU2GNNYSv6Oi+nbSLkourz+U0JSAXNA2kMsgH
         4BWqzb9rrtCEHGr3d4dTLqfeBXhbZGW5dJ98jT/NTlu1B2eZn76YsWzWwtef+FbIHFOT
         MUzRx/Xc0PpGvjlowZMLLXrUPq82+h5cRmAJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870180; x=1758474980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sx0EwU0te/usZ13a8MurPgLe0A2g8omNenFnNxHAiqE=;
        b=jfh4Iyo+SA/oQMX1y5ozRsQObs1XSccR7ldjaZXjng53eWXTLnukgUnjWddq7ztamI
         FR5uGP5V+ESqe675cn6ZcR2TjqfEGTfmeszpHUzOZrd2R9wfnGjzAVXaJbUXqDEn3mCj
         tY/4joaYjoNPRrQj0DRkOaHxdRAFLmY2UNyuS+2j/mQ/t/qlONEKAaatwiFaOuQvSx/u
         wxOqaPQemGuazSQzleqrgssYM3cYpYuPkyoOyw1QwIkDFRkyRV8yUPSQMyerROXMalKZ
         2c8yYJbDun1na64qi68Ex4jsJa0x7kUFGS9cynVOSMJKmr+ccOcevfle/vci/nTRO29/
         kxIA==
X-Forwarded-Encrypted: i=1; AJvYcCVBJHsyGsqQU3oQGPUzNFRLJaMPn3nnXSb5a9dafaMNUNSc0pPUA5nB/ZryVtuwdDoFprAEe+pZryxL7A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy22lD6jrYfBQGFVAravyW3/cwxPhuaMmOlt2Xczt4pHjfQtRjF
	kQVcxatg2Zg5AmUi2z6ubiuJondYPjXym6bkkHSKjoj2UrDGpr/HTP4ncoYO7m1jLN4=
X-Gm-Gg: ASbGncvUzSzW310D8Cx8zPTMR7Z86KSyB1c2h+LIUrHLcLOa7RGXisP6PZBR378pFlZ
	F3l4NBvN9SP1DfTp03rjDzj4M0w7Bbi/qALkWqmFDKtyBz9Esi9DRndyQKxQoSZqRRadO4HTksE
	zODXLET1CfFlrK8yThD3fKzqun9OpU5N8fTSHWpeR7kKH5ja5wSoK6R+XvHn+hNVSyKXT/19qoW
	kxxfLEs1QMFUVVVvJLlGBq1jTDyLBDKJoHr0tHvDELQxzmYaIqPkrT9OIgJvtkKycOhw7YL4zCS
	TZ5vvAbGTe9MbrDTvQ4SZ5ZTKDpdR/iRyQOZW3N3rNCUiTE8qj5ftYSPsw9mmcrEfVWFgvF+Sde
	JtT3BEVjcGX4yQH5VB50tAamuz4O8iCn7nqJSJuhKgBMvRewbzvKNCoOo8uuSQ+cB6ikl35C1bB
	mgvWTMDtvbL3w4CM9w6u2NylecyAl7HBeGR8mILdWXK2qKr9BcDsxsUUxQSJnQh7UsnPsPddK86
	4E=
X-Google-Smtp-Source: AGHT+IGg07tGI6gHsEGbzuf3VDSE6YFsTBt5Lon/+TCDORrB5jYkJHCYrktC1RHIPug9flWo1dwbuA==
X-Received: by 2002:a17:907:d8b:b0:afe:8de8:290d with SMTP id a640c23a62f3a-b07a629945emr1504682966b.6.1757870179840;
        Sun, 14 Sep 2025 10:16:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:19 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
Date: Sun, 14 Sep 2025 19:16:00 +0200
Message-ID: <20250914171608.1050401-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Added in v2.

 .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 3e3572aa483a..a60b4d08620d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -206,6 +206,10 @@ properties:
 
         unevaluatedProperties: false
 
+  touchscreen-glitch-threshold-ns:
+    description: Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
 dependencies:
   touchscreen-size-x: [ touchscreen-size-y ]
   touchscreen-size-y: [ touchscreen-size-x ]
-- 
2.43.0


