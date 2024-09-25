Return-Path: <linux-input+bounces-6718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D8986728
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 21:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7724B1C2159B
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2024 19:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4AE1465AB;
	Wed, 25 Sep 2024 19:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gDPFTSuH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A689145336
	for <linux-input@vger.kernel.org>; Wed, 25 Sep 2024 19:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727293769; cv=none; b=D0xuWjoXJxdVME82w0znVCRq/51vnYSXyFUk3DjTx2rOKEhWNcepaC4AbttCOlPj6AbE7kIpPpKUkspfE+bHawrkfTOTz312ufs4FI/aLJxNJxfT/H1y2q+cbU+2Yu4UdlS0KtauGIRdUxNhkUITLXtqE5LVlJEbXzmfb+PSIJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727293769; c=relaxed/simple;
	bh=JMy6HzAy+taa3Pj/hIHV0nlXFH/c1wdgNTeuqyl5ahg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLJxQVprjiV+LU8DF0fLmDrM3kHDgJknLQbpNrMmHR0FrT3BOa6Vg3E6/qgZjaMAX2tmLmyii1wd3OCYpnB5NiZwkcF0OOPxCl22wI/lAZ8Cw0NO/NxUZmB1sisavadnU1LwTVSGTHfpjBI8LLBzwVgr0vgrY3XH47daGNwHr2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gDPFTSuH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c26a701185so16594a12.1
        for <linux-input@vger.kernel.org>; Wed, 25 Sep 2024 12:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727293766; x=1727898566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nnd6FOHE7QpKlvZPwQ8TrimhP2bKS/XiR5+tzZuq2mo=;
        b=gDPFTSuHCOB2mvwOVNuFSpuJ0T4hYvUP+AKikV7egYFPV0kjMSiwNtwsmpPorp280E
         KdAtUxQK9QeCoW7JO0Q9YJVXcinRpl2/VnaxodPK2Mju240SSQK9d9GxQUI/ymXptQ2K
         mapCvAA4daJGKSOPo/1V6HTXFjEf9zvCJ0EglNDLa9+KRaHav7D2oo/1+k68H1OcCC6W
         BOxP6mFycJvcgjYuH7aPaS8+IkjywiT/BfNhkjJxb+re84EpU+ccYXbPyiNLvGBgx3Gr
         T2gRwrUc7g7EAprtnpHXpkwZdZuG7c83fp/jy/qLBTGAemSsWvaLXhQOai9KAU6aP6jH
         4htg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727293766; x=1727898566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nnd6FOHE7QpKlvZPwQ8TrimhP2bKS/XiR5+tzZuq2mo=;
        b=XJapIRP0hXDn2yn26eyNBEmJ4/kHIT4Yi7hYpURr3VFf4ZJHk/dQeLWwczG7Dx9Cb+
         9cG5r0vooRsyXBD7GTElayr6zGYRWMnpf4W2GCvsjqkta7R9HeZhzLyez16soYT/08To
         QjcYNkbHBeQdjyVhHxWlnXtdP2ULgTuoUqTqlprEYjMT9Jxe2NvG9/krCS5GFrvhaU2R
         9Uyvn5n5CEuq3TR9o6BkDYzOyU93Zwov6XkG55rz6H4oQfSrCgONaxOfMyujXzOznLRN
         3MEFhAWnYZBU4BxKD1zkjs0lmpCb2jDN0qU9RCvst6GXHpfYwiscsxlvJtfTTCyXwEIa
         OQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWJuxH0vlR8Le7uR4ICo7JFny0LLQpxjKoZPevtN4eEQ13mU+YBVrwkZKXsVBeh8rfBSnp3uvNG50Es3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZrV+uTnb8lsDsAZ1wJx85uHLrVpNl6rLVpC3pZMb9dBxAY59
	nrLhw7Jm5u4CIcu5BM4cPq+RAanbbuPpiYVp2oHSnJoa42JqxdC7JdvPszAvdnE=
X-Google-Smtp-Source: AGHT+IFhMhS425ZHN+iwoku5iEmGy3G9tdLPsxDg5U0MGOkvPOPo+zPG0zZr24n8CjUQeLokaoSzuA==
X-Received: by 2002:a17:907:3e1b:b0:a8d:4410:3bd6 with SMTP id a640c23a62f3a-a93a038315amr170773366b.4.1727293765695;
        Wed, 25 Sep 2024 12:49:25 -0700 (PDT)
Received: from krzk-bin.. (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9392f50078sm252268766b.59.2024.09.25.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 12:49:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Charles Wang <charles.goodix@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: input: Revert "dt-bindings: input: Goodix SPI HID Touchscreen"
Date: Wed, 25 Sep 2024 21:49:21 +0200
Message-ID: <20240925194921.18933-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925194921.18933-1-krzysztof.kozlowski@linaro.org>
References: <20240925194921.18933-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID
Touchscreen") because it duplicates existing binding leadings to errors:

  goodix,gt7986u.example.dtb:
  touchscreen@0: compatible: 'oneOf' conditional failed, one must be fixed:
        ['goodix,gt7986u'] is too short
        'goodix,gt7375p' was expected

This was reported on mailing list on 6th of September, but no reaction
happened from contributor or maintainer to fix it.

Therefore let's drop binding which breaks and duplicates existing one.

Fixes: 9184b17fbc23 ("dt-bindings: input: Goodix SPI HID Touchscreen")
Reported-by: Rob Herring <robh@kernel.org>
Closes: https://lore.kernel.org/all/CAL_Jsq+QfTtRj_JCqXzktQ49H8VUnztVuaBjvvkg3fwEHniUHw@mail.gmail.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

It is sad that original commit author ignored the report for two weeks.
This should have never been sent to Linus as pull request.
---
 .../bindings/input/goodix,gt7986u.yaml        | 71 -------------------
 1 file changed, 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u.yaml

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml b/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
deleted file mode 100644
index a7d42a5d6128..000000000000
--- a/Documentation/devicetree/bindings/input/goodix,gt7986u.yaml
+++ /dev/null
@@ -1,71 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/goodix,gt7986u.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: GOODIX GT7986U SPI HID Touchscreen
-
-maintainers:
-  - Charles Wang <charles.goodix@gmail.com>
-
-description: Supports the Goodix GT7986U touchscreen.
-  This touch controller reports data packaged according to the HID protocol,
-  but is incompatible with Microsoft's HID-over-SPI protocol.
-
-allOf:
-  - $ref: /schemas/spi/spi-peripheral-props.yaml#
-
-properties:
-  compatible:
-    enum:
-      - goodix,gt7986u
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  reset-gpios:
-    maxItems: 1
-
-  goodix,hid-report-addr:
-    $ref: /schemas/types.yaml#/definitions/uint32
-    description:
-      The register address for retrieving HID report data.
-      This address is related to the device firmware and may
-      change after a firmware update.
-
-  spi-max-frequency: true
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - reset-gpios
-  - goodix,hid-report-addr
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/gpio/gpio.h>
-
-    spi {
-      #address-cells = <1>;
-      #size-cells = <0>;
-
-      touchscreen@0 {
-        compatible = "goodix,gt7986u";
-        reg = <0>;
-        interrupt-parent = <&gpio>;
-        interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
-        reset-gpios = <&gpio1 1 GPIO_ACTIVE_LOW>;
-        spi-max-frequency = <10000000>;
-        goodix,hid-report-addr = <0x22c8c>;
-      };
-    };
-
-...
-- 
2.43.0


