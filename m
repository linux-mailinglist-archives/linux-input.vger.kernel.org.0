Return-Path: <linux-input+bounces-10572-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345CA54880
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 11:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFAA01895019
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 10:56:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009D1208973;
	Thu,  6 Mar 2025 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fN5c6zP2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11802204C17
	for <linux-input@vger.kernel.org>; Thu,  6 Mar 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741258587; cv=none; b=bd0MAZw0YYOuNYIRkYY07XK9xkTkbVBTu1jFUg1K9bydOCr5qD7mMsr44/oK6qUYPQFm8q1Z5uOhtEd4QdgEHg8e/k4KBOR4aMLz2HeLcj53LQ5G2lV54rkzKp3gaqHJPJkRxVb2ebP07cPQXdO8OBX1Vzgd6kcDcsH3MR05OmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741258587; c=relaxed/simple;
	bh=P71o+WVhxYn8Se0AGo5XXf4Chk/tu5d7gpsoPtCEyy4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jC4byaWt6Zt3fjVqLXwkdN7qfcyRS+ONpSB15ywy88LNecLlo6z/Qkw8qDFJKRTeUrl9cgZKchgf22wRJA9KmmX9eUL0WYmC6LES1ZBgtuigvoL10Nv74hEjS18BW/Q/auAt96cPBiYwR2+BPRI2vTobk/nC4EbMzeFmJkaLXWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fN5c6zP2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43bdcd0d97dso2638395e9.3
        for <linux-input@vger.kernel.org>; Thu, 06 Mar 2025 02:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741258584; x=1741863384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LxBaNed9RSMl/yW/MAlaQb2l44+yRXzgp7zH4r9ij/k=;
        b=fN5c6zP2ff/XI10MuSKo/u2HPpgI+MqN5mZrRquTHW/fS6Kk1TwbeYhbwEN0bHDxlv
         yLvsYK0aw3BHSzOittEyyQV1s+MQN4qHNzK1hdYHPi0YtOG0rXMNmYWcp5wa7qqT44b2
         ZldUvHkPykJ62pG+iZERELMKFzQKIVwVfhfhmdrnCEv5yFkIkPQyKmElLbHK0F42QhxC
         xKdtg65/ygpHBOk+y6uBhNeQHqv5aw9hjBFOAKuAi+GxeqltvusNsj9EZpq0izxdVI8B
         LOOK7tiImFRRzBHyxkj23csieuZR1U3Z7owzpSsCSPYubdtawVqlOPm7kDN9J2SBXq1c
         jqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741258584; x=1741863384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxBaNed9RSMl/yW/MAlaQb2l44+yRXzgp7zH4r9ij/k=;
        b=Hn6QE2UkqxOEJ7ywxEVJU52cEyvW8Y8L7eFUkexx24iTGZ1WE4XTHuVcujUI0nFHbq
         WzusHmp7ul2CvJb4Cl+Nr4liyxamT/gENWUQuJhhfTv1BBYg4ZMMbHClKNYirCE/+y2b
         EEomFcaNiu/Ff+243L0CxZDszZ2ly+CZIiMtUI34JmVi+iY511eVjGqNun3/1GKFDFz5
         tCbLVPyYFTlN7GxrW3QkCI8O/swaPIXrgEsBm/KA1dqvk5mmipdTe2zDaU1jnZAgXfy7
         SgJx0q2OeHassHw2NNWy8WxsVF4Tx01PYUDlSB5WXsVtihiSFz8ra10NLWE5nQjWK/Fh
         eeeA==
X-Gm-Message-State: AOJu0YxZ7lXufZZS/p5hJ4B1atdyVIciThk03z2a/IHoMLAjU2jbv7bJ
	FLj1cQe7w9TIsW7Id/6OBwlOJT/9BhnvEitOabKowM1kqQQaf4niwvpcWHcz/cE=
X-Gm-Gg: ASbGncsazT/LLFnQPHgOZdB4IKYP3e0EpbOaFx4yEqcw1K+T+30thZXwPPFGkXgM/x9
	RZ3UW2UiR9x3Xc5Ip/QE3nZO/u+jAjARvHuM5v4H2z3T/1omTmbusNzr/GikWYePna9h6fw+a1x
	TXEAiGbYvLDu44bIv2/PXI8OE3Si/xF0SPGosEyzw5+1L7sTh4mtTv/bkw2Ky3Xkr7LiiLnCunb
	uBRf5V6CI77CDiVqagRQtW0bdbsT1qpqy3iJmQobioiwjaf12ZqlrY3i98ls+GMdnXYScRogJz0
	11hQe8ZH1a3zODAKxaekdesKQWklhvK+3XNcxdjYaLujeYm97CdPmS5c4z7BtT6AbQ==
X-Google-Smtp-Source: AGHT+IECRN+bvTx+8pm4GOrYZ5/1UypaJFOSp9E9046SWdeMqENayv/oHV7TP5Iul0p4eNzKyHKWUg==
X-Received: by 2002:a5d:6da2:0:b0:38f:451b:653c with SMTP id ffacd0b85a97d-3911f72fe43mr5103677f8f.7.1741258584233;
        Thu, 06 Mar 2025 02:56:24 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd831719sm17406675e9.0.2025.03.06.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:56:23 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 06 Mar 2025 11:56:20 +0100
Subject: [PATCH v4 2/2] MAINTAINERS: update dlg,da72??.txt to yaml
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-topic-misc-da7280-convert-v4-2-2972c4e81cb5@linaro.org>
References: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
In-Reply-To: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1039;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=P71o+WVhxYn8Se0AGo5XXf4Chk/tu5d7gpsoPtCEyy4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyX9VcGMUWuU5jZ1YXvxkpZFrAABVDhICGdek8KCx
 BPGWbWaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8l/VQAKCRB33NvayMhJ0YNMEA
 CWQ0pe8i+7H7rezUyIlfPbhcXFUmUor+5YvJ8DcfHAhHZ3hKAGtCbpIkjGeGH5E88m5EgnH4AprVCl
 +B78O9t1OB4tXX/uFchdJTdybm1Rmrn50HPEuqXbuww2mIKnvvXUY44qz96r1irR8Q7OtfGcH0Jonl
 +7RpVfvwfw2afEVhP/1vTWJ7p5PZLkrBHDw/IDuR+Ut+UqZkaQD2vnzubKvmZZVj9evyhzuj0ae8oc
 cH6X8sYFRx4ItwRRpy3dKU73hD74GuKmwSkYdwoEzyddksKfbYj+zfjLjvVHEGo3eondbK7VU1kauG
 WDUV3zjIPHlCRzFreXGXxomGILTKn81qBxv9rcZrVC2xig+locIeq0zhcrT9Y01gMdUlQTmHQ/0tQy
 BHuF/y+XAQW4CcHwoOQMw9pwyNMIAkEkGgopRZYYzc1rt/yVxA7/pAacrH+Z+n8joo2cPBv1GM2nOF
 hmBk8Fg6luOAcByOhRDLw36bsGXgEdttPowaotKTmHxywvc2znNcIKW98n7vOJA94mlM4R9pmO1W9/
 RtYNaj7wO7pUJGLJ8uZK7Co+CE3I2MpWHr1ep61v2DeKiz5xVSDnwugmaF/gn5B12DS5REDmrEAIJ2
 m3WBmtFMHCdQ1OVd1YHwvmS8yVANYssFYHgtyAbhyILfJ1Kx9Qrbje3csEFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the dlg,da7280.txt file has been converted to dt-schema,
update the corresponding MAINTAINERS entry.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412070625.zZpw80SM-lkp@intel.com/
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7109a562c96fe22314201f691f1d3d8e8b231f0a..302c27df1b94d5fd579c2855a6ba57be8b34db17 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6808,7 +6808,7 @@ DIALOG SEMICONDUCTOR DRIVERS
 M:	Support Opensource <support.opensource@diasemi.com>
 S:	Supported
 W:	http://www.dialog-semiconductor.com/products
-F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
+F:	Documentation/devicetree/bindings/input/dlg,da72??.yaml
 F:	Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
 F:	Documentation/devicetree/bindings/mfd/dlg,da90*.yaml

-- 
2.34.1


