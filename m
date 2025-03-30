Return-Path: <linux-input+bounces-11364-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1204CA75904
	for <lists+linux-input@lfdr.de>; Sun, 30 Mar 2025 10:50:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03D416943C
	for <lists+linux-input@lfdr.de>; Sun, 30 Mar 2025 08:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2165B1581F0;
	Sun, 30 Mar 2025 08:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyjzPC7A"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99603433A4;
	Sun, 30 Mar 2025 08:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324598; cv=none; b=Ko2HkQRHMEtfMEXkOrol2tcKBOuyRnkhsDa1PhCvJbGTFnevSu0EnBlSqHozX35ZEsHgpgXFYV/4celO0iLliv5SNEsNPgx9kDxuwNGdKFGnp8CPRadT8BqfYdUooEDN7rRHIIz97fdtwuVMSun9ED/SRW7zK9CyqZ0SBKXojvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324598; c=relaxed/simple;
	bh=+bKsd+lUz1xN+iEJQV8fzknCljZQm9eRGmS71BH0FEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qp1n6xHeMKewFlwEOcLRrXOmQH76EMZiT00E2y4xze/u+S13tKtwOLRGIk37T8EXh4SamYkclHoP+4yEfdCH9WmyQB+g+1Daf5ZSi0QBPIU83dSuNUFMMhaivLWds2we4Q2v8fSv71kD/bCNV2rZ7vo1hRIar2nKn4rzzxZW6XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyjzPC7A; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2240b4de12bso38267185ad.2;
        Sun, 30 Mar 2025 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743324596; x=1743929396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EmzCxvsOduwulsT5Wgwx5bMOIAHj7o4CdA5a/pTT+Dk=;
        b=PyjzPC7A0iOIIVe1HXPQmbnjqf15w3HmKsPeTMfIB1RR74TDfBQA5uS5+qvgwrgpAx
         FozlLek54RTJ31qZcCUTyol2fDck1jpn3X/CVOl6aoKxWyk+7EfX4SuhSPS/TmUtyn0A
         3UOWEHwbvY7kKXEZ6draVNElw7GR4CY9JMcZD6YtIiO3ZpAcKg1OBh66EroxtXaUuZoG
         84T6c6XoomHoTl50rRr/Av1YYib/dEwXrqNRbmi2bFDeK/3xt2XbxCuuLSt6XQP8t9nb
         rnHGtHgZL0jDilVKWOepkUuiLDDvkVFdPe4STVw4R8BZmUJlYjNgTdVsRl7RqqZ/7gW2
         vijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743324596; x=1743929396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmzCxvsOduwulsT5Wgwx5bMOIAHj7o4CdA5a/pTT+Dk=;
        b=FLDb8IlqRHd8lfY8b38zF54l6AsCFr5MbBHCXbqwNMe6GKfCLkF8v4CA5lbqgawU2h
         F+zgiCJc+uDxboBwS382qmG64Y2QtVxZuHitSLQPyNPmV0pBuqJXEufxXtLWOjplNMFS
         f0yYh016IOiuqI0LMl7foeaLM7o35IkZ4wY3/DvhD7+pkujw1W1Xbew5ECg/HEKyOrxC
         kWky2u6c+odmSXtlfouKlR1PIL1eGJ7KwvJ5tcpSgsaor6MG/BOy1+eEfu/SvgEyz/HY
         vm+xXtJjUK2aqYvDXH7zrgXCUZ5XBc7i30v0hZ6RrHP4Y35GhW1BEZCZ2ZAU4sPUJu9L
         7i/g==
X-Forwarded-Encrypted: i=1; AJvYcCUEZWaLFZotsgyLHH3mWy6NFlJf0RNfDKlB1PpZncvvE9mMKdCjQItvidSZDui9JL2wojUHVyaFH8lVx2xX@vger.kernel.org, AJvYcCVEfdX97/edyNNV1dkXtY+re/5znfNaG9cgAn9kKwe2QX8sMLbaK62KeEniBpShOhN9JUjmCzpFvW8=@vger.kernel.org, AJvYcCWSTxrLye+bXR/xWZRMLRaKHqj9S0ERaa2vIn0fRIGTZYlPrdSh3ZO7GObyV0dovsopHBRyoCtHXYHaLoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzwD9+jVKImanGV62CUKeiWbtEs0EQbEr4zh+DyQvJ/kzIkt/M
	Ret/khRa/4qAmHn3EJdL1SaQehaeN/HINNKx5WVw3xGxIT048YmY
X-Gm-Gg: ASbGncvyoyOMxPoA+vO9Mfp6065molzrpVwiSZ8+u77ZRw+6gVFJ3qjPbRzMkReAQsk
	l8aC5RuKeFeQ8MocpONRwlndRVeEVHhPbbGQg2VOP4kBzOLDNcSfmA3uDlxBcII5WcTLdUeld8e
	uv+OGeeVyCHE+0JOOhCqk7C+9QcSaqG8A0PQEVmjF1wsMNBJiJIsCI4v0cIErnMmNk/hQ99ewTy
	lCmhCcb024tUt9+AaHBR0TdPCihvqD7BF5CRCOrVHmv1ARDX5+HxSbJgugu+47TGOlpKtPfJDW4
	YRaXf9FAUnIUezo6JUQmr9grSx6PRsOYXh/XiBz5eRmkZMMZgHoXcdOJNuSL8HPjFvKt9HGiOfK
	U
X-Google-Smtp-Source: AGHT+IFSa6czLX5BHKoQR4RzOcx/YbmUF2SgaxAIgJ4HQT0OJsOtxycsYNBJibWU+vKZphORkcPWdw==
X-Received: by 2002:a05:6a21:c94:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2009f607a8bmr8922370637.13.1743324595736;
        Sun, 30 Mar 2025 01:49:55 -0700 (PDT)
Received: from salmon-ASUS-TUF-Dash-F15-FX516PR.. ([2402:7500:a17:45d:8f98:c8e0:143a:d5da])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b8ae16esm4434055a12.61.2025.03.30.01.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 01:49:55 -0700 (PDT)
From: Chih Yun Lin <noralin249@gmail.com>
To: corbet@lwn.net
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chih Yun Lin <noralin249@gmail.com>
Subject: [PATCH] docs: hid: Fix typo in intel-thc-hid.rst
Date: Sun, 30 Mar 2025 16:45:18 +0800
Message-ID: <20250330084518.20916-1-noralin249@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrected the spelling of "triggerred" to "triggered" and "flexiblity"
to "flexibility".

Signed-off-by: Chih Yun Lin <noralin249@gmail.com>
---
 Documentation/hid/intel-thc-hid.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 6c417205ac6a..dc9250787fc5 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -182,7 +182,7 @@ value and use PIO write (by setting SubIP write opcode) to do a write operation.
 
 THC also includes two GPIO pins, one for interrupt and the other for device reset control.
 
-Interrupt line can be configured to either level triggerred or edge triggerred by setting MMIO
+Interrupt line can be configured to either level triggered or edge triggered by setting MMIO
 Control register.
 
 Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driver needs to call this
@@ -302,10 +302,10 @@ waiting for interrupt ready then read out the data from system memory.
 3.3.2 Software DMA channel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-THC supports a software triggerred RxDMA mode to read the touch data from touch IC. This SW RxDMA
+THC supports a software triggered RxDMA mode to read the touch data from touch IC. This SW RxDMA
 is the 3rd THC RxDMA engine with the similar functionalities as the existing two RxDMAs, the only
-difference is this SW RxDMA is triggerred by software, and RxDMA2 is triggerred by external Touch IC
-interrupt. It gives a flexiblity to software driver to use RxDMA read Touch IC data in any time.
+difference is this SW RxDMA is triggered by software, and RxDMA2 is triggered by external Touch IC
+interrupt. It gives a flexibility to software driver to use RxDMA read Touch IC data in any time.
 
 Before software starts a SW RxDMA, it shall stop the 1st and 2nd RxDMA, clear PRD read/write pointer
 and quiesce the device interrupt (THC_DEVINT_QUIESCE_HW_STS = 1), other operations are the same with
-- 
2.43.0


