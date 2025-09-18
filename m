Return-Path: <linux-input+bounces-14856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F211B85AEC
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E152166492
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7464314A75;
	Thu, 18 Sep 2025 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="nQCh3sjg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB1313E20
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758209803; cv=none; b=IKGWMEc7+i/OBxn2lngp7Ei0OwTXSc0e94wsDB6xpRCVTDc0ZTNCGNXWCy7R6vIbzHouh4p+gUbtoyFLR0/tMahQil7vyyZOMe3iTtTepJlbnqzwiKUHoMiTlLcavE6b/v6gzxj8BnDtJpoc9UQ0tnk5QmET2vqrncxL3/QwhIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758209803; c=relaxed/simple;
	bh=+49SRGaRIxmipz3ICarmrQvVbL7KzASPcS7C4Boj4ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZ6LqjAlut+qMd4oo78xc1d/YVUGfS1+MdRNzmx0J3Z63IoAt/vzJGsbwyIpnhcZ07G6LRLlO3IJkBfLcB4XIO0D85as7LzrglEQPhXgyH8St4d2jjIQc0J7Ov5KTjg922iQUDJp27Y8G0glyQDcgAiekNs3aUDJzwOTeETZaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=nQCh3sjg; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-62f4273a404so4229510a12.0
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758209800; x=1758814600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNO/I2yItTXLiDSbQlltWztaUTi6rNx8Ylu9Dt/JXIk=;
        b=nQCh3sjgMTF+hR9c9mSPdRxBkTXSzRYyUenWhRdAPG2b/9AkB7/+2hQQHPPBsSk7vY
         CiQTYtwmpqRasZc7uFyeUaXH7a72F93SZn1/0oTHcI/YrHI8vgSkBd5in2rWH39VIUqT
         gIf3vEdRVgjlcVJ7mUmrjp0hcj6M3AeAmtXH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758209800; x=1758814600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNO/I2yItTXLiDSbQlltWztaUTi6rNx8Ylu9Dt/JXIk=;
        b=kjh+oHY+NUPmnNZooge0CuVCGYJUUFAYyRv9ghdbw22n44LGYfyeBpl+nMmU/NCE98
         n5tPavAzq012CVA7IzJeD7Z/Yi/EDlR7N6UNHPfWZZGygbPbmW/5UnZYmxKvRTe5bGCh
         rcOUn4cTCHizPLrDk7k/B3SXeE2pkYC0B4ROHA/hLQt4eUwzDQG82+wunaWY1lpCzjuv
         zylvc5lrGPpELearkGozGV/DLVwvUcc4hO2B55/GF8xlJhvcDZS/DNZJWxn9nZ8ak3eR
         U2Ze8mDotPc8h6SVEMEHHou/wweg6ASPm9YnW0EgGEtBeXNZAmv8PjVsOWQ6fuXZ4WEs
         ictw==
X-Forwarded-Encrypted: i=1; AJvYcCXauTLOEsn/w/CZ7LpNlSoRI4E9yDcRSEjo8LkFxxqUTYRCxCtGVzn4DaOE6/CtDARjEjsSuA8+DC7orw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzteKOcArYfs+R05nLy48rgicPW3olku+9ivnu2R2CdgP862f3m
	IR/jew3AaujxcoCxw46TLy5mv78YsrOgnYQbPHUqoLHUgvUKddCQpXnN7HrxXsbRXX8=
X-Gm-Gg: ASbGncvt3gbx6wfsbQVALdpzE6DHbqmp5esZFLgzaVTi7ubf1cGF4faWy27ZAPpaZ9d
	ZD0yQCoPxJ6tq33fwJ7Yoi2ia/VZVkxd15n16tRuRYv+AZPo6Y5siQjR5+xuSH7iNI2q+0Xs6nk
	0kmKPpgTqH4wEZo0iIKMDlxZcx+qmFKGqJ1dgKSgxNSjfnf1VHg6S802Lz4Z+y7D4eJnfKauEiB
	OI5rsX1MFqNbgms6kLSB4YlA3jfl22pKWYtIawtfrrt0FQjt3R6u6qY/CPnlINOfieca+1d7m3B
	SY7G2Wh9bAzY+uOKNKR/EKsaZ5N7vnbOIvrvfEqbHILGJtUB3scqh4l+oci6HlLM1u8xUGJeXlx
	zRRSj6jVsUpLg+34tIOfZQB/xsVQOeufYb2i0IxMDSQ75a9lXKeVh/xdHBmOYQByBz0cUdnCCTv
	cU8fTc0M6YUiuu7f3duWD2xJpA6k6xf41vTsu8UrCaATpKhdyqVG7IKdhXrUgWDkziLelhOWbrh
	8owOWt2M84SeULPP0jg6g==
X-Google-Smtp-Source: AGHT+IHHoXU0i3krxfj/ayKHEAuFsB7LewUpC+X2Hw0TTk9jlaDxf33gzR19IirWjjXDnMMeOUQg5g==
X-Received: by 2002:a17:907:60ca:b0:b0d:95cf:2eae with SMTP id a640c23a62f3a-b1fa8359440mr456702266b.5.1758209799966;
        Thu, 18 Sep 2025 08:36:39 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd272026csm212430766b.102.2025.09.18.08.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:36:39 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v4 5/5] dt-bindings: touchscreen: remove touchscreen.txt
Date: Thu, 18 Sep 2025 17:36:10 +0200
Message-ID: <20250918153630.2535208-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
schema") touchscreen.txt is no longer needed, and since no other file
refers to it, it can be safely removed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>

---

Changes in v4:
- For rohm,bu21013 bindings:
  - Drop description from reset-gpios
  - Simplify description of avdd-supply
  - Rename bu21013.yaml to rohm,bu21013.yaml
  - Add Reviewed-by tag of Krzysztof Kozlowski
- For zeitec,zet6223
  - Drop "Phandle to the" from vio-supply and vcc-supply dscription
  - Rename zet6223.yaml to zeitec,zet6223.yaml

Changes in v2:
- Update the commit message
- Add Acked-by tag of Rob Herring
- Add patches:
  - 1/5 dt-bindings: touchscreen: convert bu21013 bindings to json schema
  - 2/5 dt-bindings: touchscreen: convert eeti bindings to json schema
  - 3/5 dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings
    to json schema
  - 4/5 dt-bindings: touchscreen: convert zet6223 bindings to json schema

 .../devicetree/bindings/input/touchscreen/touchscreen.txt        | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
deleted file mode 100644
index e1adb902d503..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ /dev/null
@@ -1 +0,0 @@
-See touchscreen.yaml
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

