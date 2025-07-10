Return-Path: <linux-input+bounces-13460-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA305B00107
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1400716C71B
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 11:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7522586C7;
	Thu, 10 Jul 2025 11:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAMad4P1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA143220F4B;
	Thu, 10 Jul 2025 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752148724; cv=none; b=CEp8zDjACCdxP4rMj3yjHvkcUaVvonqe7zDVNhdje1v5Gfx4XlHN2BnCbIe8N2ySGaeLD+Lq8xNwxZuTXXe4ebhXUrtNz7K7iyV//aOBhgsbxgIjoxswVs+9JuRf/TasMVUBppp4lYnWDzlrods/QWHINuZ6fpHRhQqzyhPlEk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752148724; c=relaxed/simple;
	bh=F3cEkjMAlY9CzTn8kUfjsYAtJDTf0ennnUamxkmnMB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nr50KaXYH67Hm/H0/1g5jD0U9ajrUGXQzGnaHO8+Qbj6fuD7RXjQ0dIKhTb9tQmZ2qoifAaYcvseVolftCiyB1hOOcmTp1vIqnk7i7Xcom4QIjb8MobwCJdTiy07vuFnHsekpeyJPIWkgvOi7t9UukTvllojHNqOlwAQP31Vjj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAMad4P1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235d6de331fso11092175ad.3;
        Thu, 10 Jul 2025 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752148722; x=1752753522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rF4yPZG4SHaEfZAMnH9l8Af9yrE36s9i5aUs3DY7JFo=;
        b=fAMad4P1sUH0SCwpJDWKFaCkD/E3UJ5o3rQaZLMLfMO9RZxH9kI0+ZP+3e2dVeKT26
         4QexMxdVNMT7NlG6qDsDRGEie7PEaYZLXpzPyKB5RgvKJUKZbB9v5ikapppl6UlYjeA1
         jyfZP39BjJm7kDUDXqMZqG9g49voJT87aI3wFIIXa48Bo7j4/tq563fNZiUTSCYTrJPV
         G/16nvxYHjUzNkEZ/3ykfmBDRxhhPYXvrw0J6lVWJAQ4Hd8Y5CMS4jww7noy80/q1tHn
         HL0waic1TOyeiA11FgUsBhWlaPiiPsTmbhCPGev5ufvvttVlliluxv1c+yx3oO/n4Aln
         JcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752148722; x=1752753522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rF4yPZG4SHaEfZAMnH9l8Af9yrE36s9i5aUs3DY7JFo=;
        b=ldZpi5tl+Ba+N5OJQmGvyZLgSb2pTzTAXLGxbny4+IRMUS6WT4DeExwwy0PrfahCwl
         gJeBEuXFLsUNkTW4reRmoPhnlSYZdQDZfTlT4gSDq4cV6ILhj9UMDdvLD0rebGK4lK1W
         kBG1bjPX118QlAdpi3OmfgGrU/UhJV+foxBl8H7PEuVbxQ56F9IHCxnI0MN5KnaOr10B
         HuFTdWpy5jx8UhYmOX74B2QR5MD3m6ojTid4ZJFTFjW5EJgAIIyypwit89JDrh6pdkrJ
         x+06Hi+CWU7IN/C9otFEXFy6m7QTHXW9ytx/JyaMNUiF5xttirSfqUnxTNuNJByzAkPU
         06gg==
X-Forwarded-Encrypted: i=1; AJvYcCUs7hUPJbHtNDJNiSkzlFUOGllJ8QLi/w2x+ZUBu31rmD3iqf7CBSC7gOKwTwIXIzDjogrNjUD6zDJS@vger.kernel.org, AJvYcCVsgv62L1u0IFzp9Ocueu13pcg44TSRb0v4vrUkyrcR3tWXd+GbV3BL1bCZC7FA3kZfZoaVey6JihLpprs=@vger.kernel.org, AJvYcCXagT7WvG/BIs08uszKcOYx1TACKnFPs2Lyz6uqO1OmbHt9e4sSxS8lNi9Fu9rOSPygSQFUtLquCpKzEOXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwiPDhVOQLFlhPM6zcR720wssAl/0ndkmC/X45SRaylx+kLCiM+
	s1PfGS9xv1EZUJe6KUOkZSjlnAPsoygCa4Xe0QJemhiBuXE3sxZV4TEH
X-Gm-Gg: ASbGncuSyFGx7M1LDqHalIRZSKPK73TXUZhMcPlKxBnR/OlKI2Bq4V2aqdYNnjntgCr
	2CSKfVKxXs7QRVuFet3jQEDil/XkQqLXrpwbK+4eRCunlB+yGOYP/gN1lN6wqiKfpipEHWmvkVH
	lYFDAvGd0uPvpVChhydoGfPFPwAuykEZmuODOVr/K0S8Lw9xYLgCtMgE23FguvS86Fmb4pcDp7w
	C0fApuTF5uVDfkKVFXv7/C1A6MiQRAefuC1n8y5MdkmjMqaK7UwjfMsl6y0EXG+QWBmhqHdrpXg
	jXyuoqIhAZCIjyOXPaQL/pd7XlUgALfM7SPrj6GE45DFlxweL4JcYms0hdmufdI=
X-Google-Smtp-Source: AGHT+IEoeq+MI0UrHZdgtMean/gwZbPVk21ZjHWw3JYe40FZy+iBRCxR54sUv9or1lUnK96j1nRtMQ==
X-Received: by 2002:a17:902:d482:b0:234:d679:72e9 with SMTP id d9443c01a7336-23de480ab6cmr37955455ad.12.1752148722057;
        Thu, 10 Jul 2025 04:58:42 -0700 (PDT)
Received: from nuvole.lan ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4284732sm18510685ad.10.2025.07.10.04.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:58:41 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Len Brown <len.brown@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Luke Jones <luke@ljones.dev>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Eric Biggers <ebiggers@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Charles Wang <charles.goodix@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: input: goodix,gt9916: Document stylus support
Date: Thu, 10 Jul 2025 19:57:32 +0800
Message-ID: <20250710115733.226670-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250710115733.226670-1-mitltlatltl@gmail.com>
References: <20250710115733.226670-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document stylus support. Optional support for DT properties:
  - `goodix,stylus-enable`
  - `goodix,stylus-pressure-level`
  - `touchscreen-x-mm`
  - `touchscreen-y-mm`

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../bindings/input/touchscreen/goodix,gt9916.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
index c40d92b7f..e56d74ae4 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/goodix,gt9916.yaml
@@ -43,6 +43,18 @@ properties:
   touchscreen-size-x: true
   touchscreen-size-y: true
   touchscreen-swapped-x-y: true
+  touchscreen-x-mm: true
+  touchscreen-y-mm: true
+
+  goodix,stylus-enable:
+    type: boolean
+
+  goodix,stylus-pressure-level:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of discrete pressure levels supported by the stylus.
+      The reported ABS_PRESSURE range will be 0 to
+      (goodix,stylus-pressure-level - 1).
 
 additionalProperties: false
 
-- 
2.50.0


