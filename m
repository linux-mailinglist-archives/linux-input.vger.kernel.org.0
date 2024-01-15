Return-Path: <linux-input+bounces-1251-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDF382DF55
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 19:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B7BE1F22C5B
	for <lists+linux-input@lfdr.de>; Mon, 15 Jan 2024 18:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313CA199CE;
	Mon, 15 Jan 2024 18:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/8g6Nuj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C985199D3
	for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 18:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a28cc85e6b5so1076398466b.1
        for <linux-input@vger.kernel.org>; Mon, 15 Jan 2024 10:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705342860; x=1705947660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yC2xyFUISb0IkOhvfcovWkWsLnq71surBiWkKTVQGT0=;
        b=B/8g6Nuj5OJrli31+2SJRhF77Qp1XO2+fmHqq5SAQ8GWn9t6F5pHpjet7vfKE13uQn
         GgECunRcxjIK/pQBLvx07IAyf9InLHQrluG3pj8xXd+sRdCoo1ctBB2W2oF4m7qT+PWO
         Sia4h32rvk+esDh+U49UEjpw/cmaE5K4cnyKDr4J4/tczHhEkMtq2BHQ1JtbkGJgKRUg
         lq9Xm/g/CZwwwAXF0qRwoVX9mdav8hAdZ6HJft/ikKKL0Vs0BCkseIYQo1PlxJZXYUu7
         VS3AMFvpXnSggh3JIusGuRfQVXsaYYcSPiZkpSvcl4rrpAeCWVXpRXLwANwwJ8RVpMej
         R0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705342860; x=1705947660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yC2xyFUISb0IkOhvfcovWkWsLnq71surBiWkKTVQGT0=;
        b=Bg1yBy4Q3xl3KbciKn9S4JnROwOTwplgDFwZGZObwky7gbw1DA5X42KVd3powx42fU
         7U5hXShJ9eCv8eoIB2Vjfq77fz7CmEzaGEijDkPUrPpStB4kVZ+kboLzRU7Uw+9pHzWi
         384rP6R0DhtPYNtWQWQTwxMqXo5kC7bezVDemdHvjhiwkpLmd5EUSgQHhsQS9pIjf0Iy
         Y7O6qd2QCyaq8yX7/9Ygbe1l/OFnCQhZO3QRy9DNDCDz2L24d5bQ9Wyb4Cm747nwNPi9
         Yclbuu3+Ce0w+tt7FNaQgMhUP2YMmFB3qgI7e8az2VKkfsm8AopJtyc1kb3Vo1CE0uN/
         RJtQ==
X-Gm-Message-State: AOJu0YzLScEXi1GE4m+J4MLcR/7TAXjuyZHiLr752u46UFforr/JidWL
	9U24Nodbz7hidrN0DrlHrQ6R5ng7qeVqHnQZcVfwSkLoLM4=
X-Google-Smtp-Source: AGHT+IHuehd+Ath+q26b0iCYWIHVrRKBBl34yztJzpBl9VLQAw1YZyBaq5SwHv4MR7kgx5tnyEedbg==
X-Received: by 2002:a17:907:1115:b0:a28:f816:c4bb with SMTP id qu21-20020a170907111500b00a28f816c4bbmr1876808ejb.117.1705342859983;
        Mon, 15 Jan 2024 10:20:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id w14-20020a17090652ce00b00a19afc16d23sm5530420ejn.104.2024.01.15.10.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 10:20:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: input: silead,gsl1680: do not override firmware-name $ref
Date: Mon, 15 Jan 2024 19:20:57 +0100
Message-Id: <20240115182057.1610195-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dtschema package defines firmware-name as string-array, so individual
bindings should not make it a string but instead just narrow the number
of expected firmware file names.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/input/touchscreen/silead,gsl1680.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
index 95b554be25b4..5381a96f4949 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 1
 
   firmware-name:
-    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
     description: >
       File basename for board specific firmware
 
-- 
2.34.1


