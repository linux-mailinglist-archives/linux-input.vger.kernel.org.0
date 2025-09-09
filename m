Return-Path: <linux-input+bounces-14567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A8DB4FEA5
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 16:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ACD21B248DE
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 14:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F18423278D;
	Tue,  9 Sep 2025 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bEe6PMM5"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA87229B12
	for <linux-input@vger.kernel.org>; Tue,  9 Sep 2025 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757426623; cv=none; b=Ctd1+AAoNRg8wUHJ+gmgValgAoswadVSu2zkf270hHHgR7IPjDW1wy2pmSxoPMA7gmyTDi1hKgucKPmBVWFYhMHigsUmIHeiyuYrfxji8Ac7eon264RTA1Z4sAnbBvM58BYuSfSZLAKVdMYdtTr0Fh/pX0YAHTqDR7+ZkQhiBVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757426623; c=relaxed/simple;
	bh=kg5Xw/CZm9HjqXmiEvNrDXQY55QrcPnRUdquA+eckKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r5hycQBoFDnAxBBDDpgUp+lI9XpmUf/Aq3ffZIjXwl/cWrvfibOaHcR1X/ziNSPlxu/7pDAGouCiQsxck7UpPze5ytJcAfSG66tmK1VKbXE/XmWK6rBEQqIGi+ExHHRaX+jFLyj0loK9o8gKAzlUN4vNQ851YVuj3gWVVHgWfh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bEe6PMM5; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b046b086599so104748966b.0
        for <linux-input@vger.kernel.org>; Tue, 09 Sep 2025 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757426619; x=1758031419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=60uLhSl/0uAu4Ftj/dSCCuqQiKJnyoS7V/Oz88gSfnE=;
        b=bEe6PMM5Rr9StCp139WXkYQPg0zF46pOAL+dMhrAjwKJTvOMFnd7BGMXIlkiycyTAE
         DHMs4tzTZ3nQHpVGipNg7phWCQMTxkVlPYrMBHeN3su7m6YMTJr18pzzFNWtX6bK5Ncl
         6+nVUylsXhuWaeA6EZ/+Eb5C1VuqX3n4TKkivKpeOPpWTChyUB+LV5GWvN8/I7UJPi+I
         0qJZ99lqo4WwFbiMigRlsubU9lei2vV3gQettwHvA1d15oT+tuNhQxhDOJEJLMRmsP3e
         MWh70SCbIJ5ftqEunyKioQxbvCC10NsIlxFQivFtp2tNdeY8jiPN8xZNJb9YE4OFK29K
         zjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757426619; x=1758031419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60uLhSl/0uAu4Ftj/dSCCuqQiKJnyoS7V/Oz88gSfnE=;
        b=a6p111mdLZt1/1PENBmyBVYLKLAKq4bshOOLrAoHPLMr3Sk9jNAqX0AlOTSrGAnw87
         enFImYNurkZo8lG233goHbEQewLuo5Zui6Vctt/Av3wvjt6/hKmhrt7AyHq/eLvgz2Nx
         o7BxTvrFTmX0OFkDp3hQ/ub4GQf8CY0XJK9hSuyEMOZaKr4ZJEtxx7wg0ew20dAxvxkU
         R+H4IETmuODO6UgtF/Dq2wxwYw4Vkg1SSVimVM5y+GpkqVg8Cd4S+HaWcJaZz65cGuw1
         10soV8jR2jnaLIxtkEA/mX+h2MGO9OHHZn2su6XfhJ2g4VMNsabAvd7mWH+X0/Ek+vk5
         vMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUxv76ttVyyXpWvw2+KeQ+aARor+4OsXht43V59P0i8BEStPhnaPKAIJkVxMA+xPKQe7Na/zsH0F8g+GQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv/q35Hk4UypZ3uqcvfIAjSZEqrhQGWbALgKY7e/tI8LN1oqCX
	URP/RFywx2N91ygqHOtTF+RqLGord5eX9gfzaQC1OQMHVW2xE6BILLd6zktvEpOdJ8I=
X-Gm-Gg: ASbGncvI0V5GZByC7Cj5NZaLWFxAek+mRFyp7LtFUZKH1/TMoyLoKKyYqYTkW2/SOjN
	QaLWAHVd/f0G3DLfS2IqzVFRS2xgHBAJI7HAOQh3RWtQhGugotiVVp5xKQb9ldWk2fXXkiz96zE
	t7sgNYL8hybkJKxUZU+a8+XW59KvMWplB22ff0KIYGpeB9x7PKU21oZ6kA1vV42Sb43N4zdf5ce
	CO1LJBQ4iSyWj6h1m6jCPkiOeny7TOS8+rH6AM68uFhjDA/ezwQA8645W2+3J/JSgx/RgDgmjP6
	anUsH3dVyyFtTR9eKoCuvUwnPhx6KScKWJI4MsOAjqmi2KwjGITFoUscNApRPI+qcNgno+ZyDW5
	jhD9MkGIC/v8shPsvnm9jSkP9z0BDfkZBHLSIARycwvv+
X-Google-Smtp-Source: AGHT+IE9xCVTVdqT2u9dI/G+heLKnP1NNhdiI9CtfIYdTO/CcYuKZEAr3OR47E5E6uuiPGrWVXyIcw==
X-Received: by 2002:a17:907:7f8c:b0:b04:36bb:54e with SMTP id a640c23a62f3a-b04b14d6129mr621629666b.1.1757426619229;
        Tue, 09 Sep 2025 07:03:39 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b048009e7d1sm1279289466b.69.2025.09.09.07.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:03:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Courtney Cavin <courtney.cavin@sonymobile.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH] dt-bindings: input: qcom,pm8941-pwrkey: Fix formatting of descriptions
Date: Tue,  9 Sep 2025 16:03:32 +0200
Message-ID: <20250909140331.69756-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1947; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=kg5Xw/CZm9HjqXmiEvNrDXQY55QrcPnRUdquA+eckKc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBowDOznk95c0Z2ZGr5PsOvUnj4a2XFn7vxsxxot
 4eyTXL72xaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaMAzswAKCRDBN2bmhouD
 1+oiD/0amjqhOpCCqQyOcDS052xCbmMJFa9awROyI+2qZYsLiZa2bRsoj+J6oZc31GIyk3emynV
 bauVh0C6YYcEHOEMwdMkjKiqGnri/hFy0KKGNFRh+yQWhh6c1iPPrDMJmYMJgzGfwB08VZSFyJo
 EcqFOOf+jbJk/kzR4OrvxNIHViWHz32K6aMdEmZr2lfXuSFH/KxGsypCPrKdtUbGpj0EYwAXPSD
 7dJw7Vfk4MmvGnUW35LzGObHr1JyEg1EccKcEnJjpJqpXf+9h1fUdopcDFvq0IdhuBsjDDA5aVi
 yUw+SPefzELS6/iwsZXjyMuFQwigViJz4CybZfiU9TEdG3W1nTWIalcNzt5aUPHMzUPf5SImIHW
 hQ8qyKapvmWFISvvY6bEF9E+gbVtAWryzAwQun8ESnS86NDcyNj3eBObvrG/j0laBAfWRK/3U8Z
 +JLh/PZjSUb01X8K0SEJYa4nJ8tXo//iJ444iu9lgCNB0T4T0Lj/gdTfgIKROpqMJWWTT2APyef
 0ckgejAHxUN3Jp22o5kOZNq87DV16P9Q1IEa9cgLNelQsoddu7na6YzvBZihean0tPdlqLy5/si
 cPPjqIsuHhRxsOpmppCyhfgi7N4BXeBGgPcyOo60VW+eNU3aK6bvQh7NgL37HyycKDyvX0wxglr GJzrKLUuqdPXDxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Property descriptions should indent with two spaces and they do not need
to preserve formatting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Luca Weiss <luca@lucaweiss.eu>
---
 .../bindings/input/qcom,pm8941-pwrkey.yaml    | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
index 62314a5fdce5..72006a14fd41 100644
--- a/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
+++ b/Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
@@ -25,23 +25,22 @@ properties:
     maxItems: 1
 
   debounce:
-    description: |
-          Time in microseconds that key must be pressed or
-          released for state change interrupt to trigger.
+    description:
+      Time in microseconds that key must be pressed or released for state
+      change interrupt to trigger.
     $ref: /schemas/types.yaml#/definitions/uint32
 
   bias-pull-up:
-    description: |
-           Presence of this property indicates that the KPDPWR_N
-           pin should be configured for pull up.
+    description:
+      Presence of this property indicates that the KPDPWR_N pin should be
+      configured for pull up.
     $ref: /schemas/types.yaml#/definitions/flag
 
   linux,code:
-    description: |
-           The input key-code associated with the power key.
-           Use the linux event codes defined in
-           include/dt-bindings/input/linux-event-codes.h
-           When property is omitted KEY_POWER is assumed.
+    description:
+      The input key-code associated with the power key.  Use the linux event
+      codes defined in include/dt-bindings/input/linux-event-codes.h.
+      When property is omitted KEY_POWER is assumed.
 
 required:
   - compatible
-- 
2.48.1


