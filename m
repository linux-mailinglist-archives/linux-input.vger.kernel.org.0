Return-Path: <linux-input+bounces-14793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B3B7F8C8
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 15:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFB8D464400
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 08:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4823090EC;
	Wed, 17 Sep 2025 08:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KoeMk9ia"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD5F309F02
	for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 08:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096351; cv=none; b=F4/bfRMAFIR1I2IhGeTODVX6GpZvtEyvfbjunqxD3qOW89RbUIANTRCMee01ii4kSAg2OxT7+wxhofoFgnPNbqAEiIU3DmSVqULix7QpMr63SqKMz7B10M8Uf8zOizx97p3rXGFqipUexY09DOumlb6n8ezurYrMSGmUrYzg2os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096351; c=relaxed/simple;
	bh=osi8lZqw36mnUV7ANOU6dNqrRojLcplRBpUBXvUliAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pPwpX4NYYSAXkap1Y1d5GcjY7wu74UjmjzQ99OdnIbLCvv/tCH923PJht2AXY6dVA5ksBtUp+I8qfJQ+Np3bb2K4PlgBUtwz0rPilZNtQcvbLXxIxJEUWDB+wIZmm32rGbpUzl8oI3+XbxY54wKndsD2QIXF+DiMmN5NTtGzi/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KoeMk9ia; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so970794266b.3
        for <linux-input@vger.kernel.org>; Wed, 17 Sep 2025 01:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096349; x=1758701149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmFa+COnAgPwES0uM9A7F5hfXb6EgxmAXNl0CdhTVj8=;
        b=KoeMk9iah8jzMGfIie0rugEuOpXavPXj1nbM2KHHBJFxofAXyAgI/N0IN3bmctq1fr
         I05GAvD5/L05/Ey36+yqzc+fYTHkV/nTQQwQ67E78vMGdUOOrwfLWTpGUSaujh0C45xM
         KrVTvdmTl8NxTMLpw42XgaOLPV115ad4EVTU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096349; x=1758701149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmFa+COnAgPwES0uM9A7F5hfXb6EgxmAXNl0CdhTVj8=;
        b=h7w8i93MHrX1gmCoqrhoPztz9C8qmSpwpEV8ydPEBMaNCdLarorfWsNnrnAR3T6nOU
         ULyl6tprrKM5ugV3v4UF9s8NfukPdSBDhzFniS12DMWreBtpErmL/MvL2DLy4fODhEe7
         kyobjzhM0orkdgM2HVJHN7JJtta7+a1/VwMDVOmaIOxPMncYZ1I55yaF7cVwWYxCxsIU
         fEone4/7POp/YZQOYEXK90rAnlmtwir23z+rqyHHWdFEw051/e7EiGc0oSZi/qf5XOX0
         HcODtc+2ZJgLozf2zmeMUUPxQS5M6xUDfhGpeRqkBIRx+E1u5P7T+P6BObJTH+ZR9IC/
         5Ejw==
X-Forwarded-Encrypted: i=1; AJvYcCUsAMUqO8k47Jraf4FJ3bF5CY8haj4NgzYv3aS4h+5CFzVtVWsxK/cmSJx/vZrlWIeegWN1Hm51AtUgrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw280Ss2aoID7hV7tZ4cz+MBzS0haBAJ+mYPwRG7HYOGY0NeFPJ
	vLJHFvFrA1g4PDRmNm3oxw4DUGiddwOzcU5zcfCLaVAR+vlvdiSdpBzWmRKVsPbgveU=
X-Gm-Gg: ASbGncvXC230PrptlLajHF7ppkCGLvmywhqsXe98Bb2FsJsLA+NiJDfFA5RIrsHdw3C
	O0+/2LiGPsobqbupKOM6Efk3VtTPfF6o12P5Y21zqUK+a6UO2xQWmxTJiAk1uXJxkGvCfDZVSEP
	bqZOk/34PUF6jYMIcK4tk16fadjggcfSlDK8AYREWgdkucxdbILhd3eKvoIz1Kdxk+O4gtKvACc
	eeEMVHL57gAC0RoX7z3zIQVdBZJLz1B1VNEl9EgzEtxYV9CmzuWF5Ea9Qaa8k9gtChqtWRFVG+0
	YJk7MXLg3AaIVoRFSwHDUWEnFDzN/WvLpVOwAYVc+pGRctVtYix/9yObUAkqMIjJPEbzOXx0aLi
	8wqI/UDGU3ZQ7PtoUTv9XeoZWrERKMcPQSkdNiF59dljNqaHVSBTwt+gMGYk=
X-Google-Smtp-Source: AGHT+IGzyypKx+M7bACgg59eJNm7wQj1XbSrIEOljpQMYh6T60VBtLYsEF9CNds7ILed2NSvvzXcHw==
X-Received: by 2002:a17:907:7ba1:b0:b04:9854:981f with SMTP id a640c23a62f3a-b1bb9268e9cmr163419366b.43.1758096341586;
        Wed, 17 Sep 2025 01:05:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 3/6] dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
Date: Wed, 17 Sep 2025 10:05:08 +0200
Message-ID: <20250917080534.1772202-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v2)

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


