Return-Path: <linux-input+bounces-10732-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBD7A5DAB3
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 11:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F9D3B359A
	for <lists+linux-input@lfdr.de>; Wed, 12 Mar 2025 10:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DE923F381;
	Wed, 12 Mar 2025 10:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VQPrXnrk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2012223F36A
	for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 10:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741776237; cv=none; b=P6Ms13X4s8aR7EKq5aDcVjopJhD+jY2JPFYiFLbpt38zY0UFOLbVObPoE1FqpGwe/qBfgDVR9TsfveDMYIj3+RjvzpDYfS7Yc7Pfh/VQTjdsQhND+lsxaooGZVb/KkxbIyo8qLr67IKe/brskSpmeR7Xbrn5mbyaehqgUi5v5rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741776237; c=relaxed/simple;
	bh=3DmkBeiH+EVYQGbZv+HVXY4sUC3b266LNBE6ycsAuV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/lZ4up+v6FiraTbQM252gn2chqhmkGpV7WcPHKCMYFPzic71Gd9B0UBUhas+Teu5um57mGMVQkSajugZSN4c3vS1+b+Is/8CQlTRs6OcfTZmF2vpQbI/nix1CYnmEAK108iu5lBfkPEKvk6aJRK8q0hMzohFf0aXnLL99HQqo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VQPrXnrk; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3012a0c8496so94113a91.2
        for <linux-input@vger.kernel.org>; Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776235; x=1742381035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=VQPrXnrke5aU53sQy//AONm+nq809/wtDpWLQIqTKPTSTr5pls9koC3Bb7XVAuNSoN
         PSUtRCeWFOLy75qlnx0uIyYxKDyy4IuShbHffYZGx3KR+xeaj6fnfzcKLxP3KrI4U8Yf
         PDo0hmQI4J9STpCDMaMsNxmI1tj6KoWuVdh4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776235; x=1742381035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1sMzDBP5vuN2BAfvXEAvEWElSEvZrTJL7A1Fg+i1ek=;
        b=ZO846q0ofWgar5lfy7yDxtRy7Skkr9ybnMZiTrBFikagIGlcqLotqtWuDAkli8ZWor
         5RIVgDqjl1G4iTFIaNZjZuLxqO5ihtdNmN1QKWyfVuAzdBexzdNg5aRLILUtlZW69xyF
         mj2pNE5CgXyNMVXtpr3NxDr7nvgF2Uk+EsQoHxRkfBZ1hjX8bV71PcCOF1w8XgKWxlgY
         zPN39vOKPxnzv6D7AZttvIUCxZtW2No1pgZ4Qafbe5oX9V9eynzDpjQg7YDQQcNOpO5/
         yPn8RRE2rJn4chV5kLZWLTmNpPgavlhtq8s+3p8B6UaHAwvUYPVi6w0TqC/Qj6OQtUWW
         Hurw==
X-Forwarded-Encrypted: i=1; AJvYcCXrIYV3SssyNgQ8U7gN1nE+5K/IRY0IAYSjZy8sZqB/7qtTW7oG1U9jGTzBngycBT+qeXqlzEqE3hU8FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7VQSEvp3DS0TbDYL8w5PpgLcsPjOVvwTcaRYgrpRL+JDkqxRX
	O694sYtbIBx+Mg8SUHxj11fU1R3s9Hj3VrdpH4/0f9mP9L3BYCKtFtewlGKTSg==
X-Gm-Gg: ASbGnctNd1l22EEGHLPHU7AA1VdlFN551gkNrDJSiSzERiNiiAR+mESYy/+KFxOrv/n
	BLFitNZftR6BTG6PN5aRAKj0YFMHFq6d4A2eSFJdeP0EJIvdJULL/0bf+TCUxJ7ujcyqdVKcHEy
	Ga3TGjM8xqDXETmy4IsiQeZ04zGCebp21/JGLZBg09hgqgt4iDt6yOc9ws352VAKhzWeemtLY1T
	z1UyBfra4teR1tuoZicKIRM9MirVNBJFH/OkFelqFbVDEo7euQFr5D7NwONDpwoa9ujwDuM2vWY
	ThFWVpuY05HgumB7OXeWfjeA2CT2r1y4TVU9ebNR0N5iV3rA7vYAmaDa1SR3E+Pavj9dGSGTiQ=
	=
X-Google-Smtp-Source: AGHT+IHVXoxHlRkSlosQqT/eYj9vz6fvVJZ92k/ncUOz6qh5Nk9iYgHkhQ9d0PdxTZIJWqbKDgo8qA==
X-Received: by 2002:a17:90b:2d83:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2ff7cf22df2mr28755341a91.30.1741776235345;
        Wed, 12 Mar 2025 03:43:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
Date: Wed, 12 Mar 2025 18:43:35 +0800
Message-ID: <20250312104344.3084425-2-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250312104344.3084425-1-wenst@chromium.org>
References: <20250312104344.3084425-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
longer boot-up time. Power sequence timing wise it is compatible with
the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
enumeration. Enumeration and subsequent operation follows the I2C HID
standard. The eKTH6A12NAY requires longer times for both parts.

Add a compatible string for it with the ekth6a12nay one as a fallback.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../bindings/input/elan,ekth6915.yaml         | 29 ++++++++++++++++---
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
index cb3e1801b0d3..81c391952ccc 100644
--- a/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
+++ b/Documentation/devicetree/bindings/input/elan,ekth6915.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/input/elan,ekth6915.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Elan eKTH6915 touchscreen controller
+title: Elan I2C-HID touchscreen controllers
 
 maintainers:
   - Douglas Anderson <dianders@chromium.org>
 
 description:
-  Supports the Elan eKTH6915 touchscreen controller.
-  This touchscreen controller uses the i2c-hid protocol with a reset GPIO.
+  Supports the Elan eKTH6915 and other I2C-HID touchscreen controllers.
+  These touchscreen controller use the i2c-hid protocol with a reset GPIO.
 
 allOf:
   - $ref: /schemas/input/touchscreen/touchscreen.yaml#
@@ -23,12 +23,18 @@ properties:
           - enum:
               - elan,ekth5015m
           - const: elan,ekth6915
+      - items:
+          - enum:
+              - elan,ekth8d18
+          - const: elan,ekth6a12nay
       - enum:
           - elan,ekth6915
           - elan,ekth6a12nay
 
   reg:
-    const: 0x10
+    enum:
+      - 0x10
+      - 0x16
 
   interrupts:
     maxItems: 1
@@ -58,6 +64,21 @@ required:
   - interrupts
   - vcc33-supply
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - elan,ekth8d18
+then:
+  properties:
+    reg:
+      const: 0x16
+else:
+  properties:
+    reg:
+      const: 0x10
+
 additionalProperties: false
 
 examples:
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


