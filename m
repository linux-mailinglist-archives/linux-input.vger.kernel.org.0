Return-Path: <linux-input+bounces-2087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FD58674EF
	for <lists+linux-input@lfdr.de>; Mon, 26 Feb 2024 13:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A3C1C243F0
	for <lists+linux-input@lfdr.de>; Mon, 26 Feb 2024 12:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431B1605CC;
	Mon, 26 Feb 2024 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zvxlmbc1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE0605A1
	for <linux-input@vger.kernel.org>; Mon, 26 Feb 2024 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950581; cv=none; b=CvVW8XboxU7dZa2PCCRrzZYXB20AefPGDXefJlEpeaxRKxoyG/4JhWo8NNhOBOtysJC4v6rAS/WbkSB02wCDIqVwbqt7wCRu+Igpes+yqcDc8Fdn3rBUUGs1rcfD4RaCXgb0EtJ8flmThVXm9xeSplQ+nNeV9FbQHZw2Z9+zezY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950581; c=relaxed/simple;
	bh=/yIz5oyLBfSA++ON1dY6EPVob2yea5MQlWsNhAmfIVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YEUVwHUzKqfYKN/JXd3RGgZlegsez+MYsB3g262FhR3dAEvuj3Or78CehhPhoyFKsYbmFSzOvJI0sbMXfUFxVhMWCKtveB0lDLwSixX2+yvmzRXwtDfGKa60w+WnL9jJpPqp79WyRCSpg+at6L7PDf8+59H1CmX28bI2VKuSJhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zvxlmbc1; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564e4df00f3so3817039a12.3
        for <linux-input@vger.kernel.org>; Mon, 26 Feb 2024 04:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708950578; x=1709555378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SUO6wmBtkv4ffo/uxOeQsK49ucl/5uSltaqOCTDJPag=;
        b=zvxlmbc1hoLmUsYE3vC2ANVf9Ser6/fe32yCoRTtB1xN43g9yN8TNVacuv4No4SzO9
         qcT+aZaV4ZiKvw6kqI1jPhynrkMDjfuUwwySb2bglXUU2hZT3km4K/rTG7ovaKuU2y/H
         mZDgRhX2rW82Gf0z8NUQeUv0vO+v688WX5I2tI1hxLsD6McTeApY4+5jbrHbKcJoVAcB
         LiOS6Kd40bzld+sf5sjtDIuTrQ2e02JRmsBbNLiJZEHkH75vPcju8Kv2kPJFzT/eU02R
         HHPhGXG+McoYDTsEwuUOz6uVlqWhmjmSAkwwbKXfqI8/DMUKmaT+lwSPqdmpnsYQPTSf
         SyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950578; x=1709555378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUO6wmBtkv4ffo/uxOeQsK49ucl/5uSltaqOCTDJPag=;
        b=j9SfNLJPlavJxT5omFrNoYd6tBl56oxZepqzoW9jssiXTay/F8fM3u/ZfIGCYhaBVN
         LjoI5KowIXoEImVwgIlINzjkyyH42+EkmlKN67s17ZpHN6NvgJ/x4D6VjtYaGJyRrr4R
         uoQqzHiFuLQoaxyCBOFLGftnohJ3E3YWT3Qpgl/yRtK1bYsaEIBNmCdlgm4qxw7XRPP3
         VQab6wVSLYVsQl0qaLCBBFCSxWaVlZxAyOFd+dOzp4bQpsjQKS/KFp0fdxQB9LcUDN5k
         aCSfqv4RdvHfUDjNlSip64vo0HaJghcmq2BGs8Oy1FLRkEDn4oFbk6OXJ0Mgm43PSndM
         Oydw==
X-Forwarded-Encrypted: i=1; AJvYcCW1Cbj0Je4bGR2ttcJoJRbT6XP29ruCHxYKYeMhT3y4zr3tY3xjDJbOOMmHJfwSz+KJKDasEnACkDLRAGEAMHdlTUgrmzHrVGm0IBw=
X-Gm-Message-State: AOJu0YxDc9aqA7Pmtb0uxlDxJSiyaauLeHTxuWzPWX5t2gqTRiHr/YIn
	ASo9wZ4VVWDdM3NS9eJK6ISxHU3wufW9z3jBuSXC3qJRfv5NtwwOT+rX/9F1n3Q=
X-Google-Smtp-Source: AGHT+IEG45l2x++PIZXi1hnUpUUkA/1s8de6YMCGRZc2XdUxmEusGFOlqs4MacdMEgFnjeNKBj1UZQ==
X-Received: by 2002:a50:ef08:0:b0:566:ee8:8b1d with SMTP id m8-20020a50ef08000000b005660ee88b1dmr869351eds.24.1708950577837;
        Mon, 26 Feb 2024 04:29:37 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s17-20020a50ab11000000b0055f0b3ec5d8sm2422683edc.36.2024.02.26.04.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:29:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: allwinner,sun4i-a10-lrad: drop redundant type from label
Date: Mon, 26 Feb 2024 13:29:34 +0100
Message-Id: <20240226122934.89257-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema defines label as string, so $ref in other bindings is
redundant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 5efceb313879..c384bf0bb25d 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -49,7 +49,6 @@ patternProperties:
     $ref: input.yaml#
     properties:
       label:
-        $ref: /schemas/types.yaml#/definitions/string
         description: Descriptive name of the key
 
       linux,code: true
-- 
2.34.1


