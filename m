Return-Path: <linux-input+bounces-5530-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7394FA34
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 01:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56ACF1F2349A
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 23:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C03198858;
	Mon, 12 Aug 2024 23:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxQNZOUw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A977170A0D;
	Mon, 12 Aug 2024 23:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723504992; cv=none; b=BfQSR3Or4qIBBKN2W3hUMdCNNTd+ogFsLAYDxoggyCTvQVaRs7APhoC8MOd/s+dQuQN4oaikwEp+NcZCWFThKVXJvhfYJpqYFzYqZ3SPaDsjv04Zqgm1DQ2XZqAPGvzTKTTph/zrD1n3ZnE62qHqZxBPJ6mgG2PhcglZwy7F7ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723504992; c=relaxed/simple;
	bh=naCP7W+uip3xJaCkH3MKL1eWQwYyLGMXaxnPz5uo7FY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bTr9Iw6fzZm3iHYEM+uCV7r1BxFnQaakgoDpOBC6QhiFqCjysZRlEKivilfhXHqb4bZLJHxBGvVx646/lxCEeTesqmueXHzs14hwP9cbi8l4p+V4Nv97HYbr1Ite8xXql5LPygKSvxBHBwfA6Kgjl29egEEkFMkt2SMuBa/Vl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxQNZOUw; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ed741fe46so5246476e87.0;
        Mon, 12 Aug 2024 16:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723504989; x=1724109789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFtuDJMLRvgSiUx0bRk0E6OEeNTtYJZdxkeoBXd99FU=;
        b=kxQNZOUwIdGedxqMcyMHhGfy+4d+fJfdaaDqSBh+NDEi8udS2MMFhvZ8Ur0vZ42cqB
         0XwLA38NXorN+zkmMH6bePkEDDBejqCdOhXjszGRl/ZFzBRlf9nt2Iz3FDd6fh6eP4KI
         jbvWPB5s9V/2bwwMRkRKkfWoho0868knxhUGzv4tHPTEmmi5+IM8UK/YraY0ESO9wQf/
         yliw03WoBakPhHAhw+p9gtHJp6XObG7uioD+AXHgjgqBpetlhwGP9rJFjmhAGVxAvzo0
         DGmMmQ62Q0bwV3zCBxRjqIiamIvTZSwD2QvADr5K/A6zvQwFXoRSESnWx+XGpE0IORrG
         aifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723504989; x=1724109789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFtuDJMLRvgSiUx0bRk0E6OEeNTtYJZdxkeoBXd99FU=;
        b=Uy2rqSsi3sXKUf6tHSIHIVLTvz7aKBNCxTOcJRS3VaqtMSn9aoUo6Xht6HJZyysz0v
         +hANoINe8RclS24bwQOr7w1g83TGDGx/U/nCW393oo5RmnJq/37wJXqNDE7MvVoVdbwS
         ZVKwm1SuNwyAOEin75xB8Kr3Him6pG3WdTyT+ilwnCctemmhAhZZkkWNRg5MfdIw40im
         JFGYRkup9/T5w9vkun7gaKBiHZHk+VDbIMvTHd1CaRLXSE9v4nF9m7Oqy2xGFQxv9LW5
         0Y2EGkqYsF09JxjiDXqBZg36X5EAXDwYpKvlmbN3fXOrbC8sOXrj8biz5JXT/cWX6EOa
         pdDg==
X-Forwarded-Encrypted: i=1; AJvYcCXhbDZK2tC+pFs1EJZDcFyqpWn/XxpbFykpUUbk0DHy0yrauurhIgsgffQ6JmzcGilQ77iJi3oEpuGscpBRyzbn2EqGX/1CWmjsZRWLR6K0omD7239ccHa5qAjnbbpwwS/RHUTPmknzog==
X-Gm-Message-State: AOJu0Yyi7oHLukBMkGMZ549pspopM9IUmuCk8NAM+5UxISp7VE4SYM7g
	S833O6RcTiFalWoH0RgJ9MmJ7kPCBcRvhbU7562x6N6EmDiC8XUVcRRBHh3D
X-Google-Smtp-Source: AGHT+IGacPiMcuO4ACZN4Y0XJgms54O6GWYuZrGxsff/KpgGXQs0b/kj9yxmPT2+P4W5yrO3bt3UfQ==
X-Received: by 2002:a05:6512:ad2:b0:52c:dec1:4578 with SMTP id 2adb3069b0e04-532136b3133mr1002564e87.60.1723504988261;
        Mon, 12 Aug 2024 16:23:08 -0700 (PDT)
Received: from [127.0.1.1] (89-64-30-233.dynamic.chello.pl. [89.64.30.233])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f1aaddsm869265e87.182.2024.08.12.16.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 16:23:08 -0700 (PDT)
From: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Date: Tue, 13 Aug 2024 01:22:39 +0200
Subject: [PATCH 1/2] dt-bindings: input: touchscreen: add Hynitron CST816X
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-b4-cst816s-b4-v1-1-78a03cbef328@gmail.com>
References: <20240813-b4-cst816s-b4-v1-0-78a03cbef328@gmail.com>
In-Reply-To: <20240813-b4-cst816s-b4-v1-0-78a03cbef328@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, igor.opaniuk@gmail.com, 
 Oleh Kuzhylnyi <kuzhylol@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723504986; l=1876;
 i=kuzhylol@gmail.com; s=20240813; h=from:subject:message-id;
 bh=naCP7W+uip3xJaCkH3MKL1eWQwYyLGMXaxnPz5uo7FY=;
 b=q2b1mJVgHXDIgtg+2+Eezb9SvANpgRgOZn//3758xBnRDyu2/lmPu9Ur0kHXPDm7x5qvf6Tph
 gSoMI6vQbh5A4eV03xdAFnKuBWwE/nfqtxWXsfSEpD/YLMzMPLpvOGC
X-Developer-Key: i=kuzhylol@gmail.com; a=ed25519;
 pk=/eJ3W7RpmVR/qw4I/gsAD36uT8x/VUHRj7nyehKlG2s=

Add documentation for the Hynitron CST816X touchscreen bindings.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
---
 .../input/touchscreen/hynitron,cst816s.yaml        | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
new file mode 100644
index 000000000000..ac9f1d8e8fc0
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Hynitron CST816S Touchscreen controller
+
+description:
+  Hynitron CST816S Touchscreen controller for 1.28-inch 240x240 Resolution
+  Touch LCD Display Module
+
+maintainers:
+  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    enum:
+      - hynitron,cst816s
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@15 {
+        compatible = "hynitron,cst816s";
+        reg = <0x15>;
+        interrupt-parent = <&gpio0>;
+        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+        reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
+      };
+    };
+
+...

-- 
2.30.2


