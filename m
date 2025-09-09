Return-Path: <linux-input+bounces-14553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE61FB4A184
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 07:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EEA94E0C32
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 05:49:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04FD2F99A4;
	Tue,  9 Sep 2025 05:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCWynHEl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DFC42AA9;
	Tue,  9 Sep 2025 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396968; cv=none; b=jFiwlUKxxto60mQouOrYd1ZKPX3eE0yQP+2jPYyysl5JI+24iEEITy10/LwOPB4K4Lq/v7r2MLdrmsNIfXVHpKCDxoC9vd20/nosfKnKHhYxQt2aaKy6F10y/Adl4nxP3jsICCvXqj4PI8uDKmWk8zNF/BV59LaYWY4TFuqXNkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396968; c=relaxed/simple;
	bh=gNaVrITcHxbVrFKumOQa6kuiH1WAJEIraMTKKCctlh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPXz88j2fMTyjNZZlg6NT3aiW2Oj0VfqOcvifWLq/1Rr2BR7ZQDqf+kdIzQTCU5KDK6wiIwRtVnufvbpLhtosylSAPSqyocSYvDFKhV8wegcMGCX9EHM/DahwXzyQhImNUZkIWPbkPTmIyz1RjTqDTVMszLq5ln37gbCvE0YZ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCWynHEl; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f78e3cdf9so6376231e87.1;
        Mon, 08 Sep 2025 22:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757396965; x=1758001765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlURL4suE9kM0nL5mT8ylSq3F6ShFoYI11btb/wdMLY=;
        b=PCWynHElkQWsK30vLoJOn+bPDons/l8yHBM5THJLojdt2GGKzGpcvhJTNPPeE+T7HI
         stj5ySLn9oX+OhgQQF+3h2VzBjStcnRKfB+BBT6xrR8B+AxC9EtpNkS1V3zVekDuhCkM
         VtsgwGJ3x0uF9+fQyDgQ1E5OYUjuwIS1qdDqXhWO5ombEaNruC88LRYwJxt4BfHPJlhB
         B+PORqclqJgEDhTkkVoZevH+gVt9P8+S4/Rb836br12DVlhyjNiYKHxVTEElfZXt8E3n
         8Q/P3Pj73e5fdeBtLNd9Azt0YqjqIHtGkIi4vL9BduAGGq7pxsj3T8gGlN/KWmm+njkW
         4qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757396965; x=1758001765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlURL4suE9kM0nL5mT8ylSq3F6ShFoYI11btb/wdMLY=;
        b=UgyC1S6E0OMEwKNdS1Ehd/QiMW5DMna3XMzSst/tfzKZWOvVSk9hqJzUC4Qxw/whf9
         r589AIS9o5/BD4CAG4RnIeKqr3J7Waqj1KweN6xXGaIizCi6hHaMMCPXDQ7iJ1gzxFVj
         1hWtJ1TDXri2AZ7mwm+1/MA/Csy9OHgHG7vocp2Lzy0uTdCC1GLwO/0JnRbaXJETuQH4
         EIqK3hIhX1oS2n+Nj4pKCfZXGRZ21Id2MzBs+UM4IEvdyUOsGFyu8MUr1MAOZnrZcdOs
         LaY/Z/NiflMs1VKdfkfdqJw1JekfF7Qaf9aZbfSkTQOoUJ7KwmsWKjB9/OxCbej9dZkZ
         ZeEg==
X-Forwarded-Encrypted: i=1; AJvYcCUIjrrA0gM+p6sxbid+5M5JVhYhSzxdE+xNaGR8WcHQE4SjyBgH4jOeoQU1b+vpyKqmSy8IKsJc1QYeRRTb@vger.kernel.org, AJvYcCVS2qjqbrXSfxoRbBfWlA74kPmHvoeepPbRZbTyLjM5Mnyx1LK06+tt0FG070eJwVmXEumUHeqAjpDg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj9ttnfEJsj+i5EJ+2wj9BQLQ1E6bdailU5dH58OlNERkFPe2r
	U4ywjwmsrbqCHGce1BZFHCZSRRxojYcD5V5Fvts9yq7SoAEoFlLx6js+
X-Gm-Gg: ASbGncuAX0ry5XSLdwK+QBVL7GyIBqVpOTKa325MwogJD73cTGNodNvmQRwjrSM8dhd
	0WRh1niPwXv0Lmajfk1HWfVFw2CjgAyUHqZpM5p4t27fFvD83w9X2/9iCGjaQE0sXeO/HrlFAND
	FYBU0V0vHr2GEhGE/tI0KLlgFt3EJXPEkFDyMO6+z3coXJ/+QuvLC1X+dwANgExpAkpRPMOAWCk
	vgfrMbl2ygyCg9/xPqD3ukuvaprBP12mIHeY4w0y25MkbYxxdFr8j+wg5xRvTCZCr46mDXzC2iF
	Oqa5uSD8aF8FavMpc0OJLrGdaK4Pxs2nmYH27qVpAaj9F/oiWYXcdzJLm9FCJJSRdwnTiHJUO0V
	3VDDILhWKfXWkbzd+E6JKC0rx
X-Google-Smtp-Source: AGHT+IFeE47smSUbmvYTOsf+XqI2zzeg8y1ApBl5TTOJrtWWY2ZfFKabI7GEyW69fGX1EVIVZoFhLA==
X-Received: by 2002:a05:6512:239f:b0:568:2583:9485 with SMTP id 2adb3069b0e04-568258397f9mr413494e87.41.1757396964668;
        Mon, 08 Sep 2025 22:49:24 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246e6sm277329e87.14.2025.09.08.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 22:49:24 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] input: touchscreen: atmel_mxt_ts: add support for generic touchscreen configurations
Date: Tue,  9 Sep 2025 08:49:01 +0300
Message-ID: <20250909054903.11519-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This provides support for generic touchscreen configuration options like
swapped-x-y, min-x, min-y, size-x, size-y, etc.

---
Changes in v2:
- added schema adjustment
---

Svyatoslav Ryhel (2):
  dt-bindings: input: maxtouch: add common touchscreen properties
  input: touchscreen: atmel_mxt_ts: add support for generic touchscreen
    configurations

 .../devicetree/bindings/input/atmel,maxtouch.yaml     |  3 ++-
 drivers/input/touchscreen/atmel_mxt_ts.c              | 11 +++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.48.1


