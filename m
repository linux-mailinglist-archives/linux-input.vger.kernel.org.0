Return-Path: <linux-input+bounces-16685-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B025ACDCAB7
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 16:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546393016343
	for <lists+linux-input@lfdr.de>; Wed, 24 Dec 2025 15:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A39634D4CF;
	Wed, 24 Dec 2025 15:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kT0VxBN2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C98834C140
	for <linux-input@vger.kernel.org>; Wed, 24 Dec 2025 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766589770; cv=none; b=RfMQhRTiaevFEwxgxmmtfq4Y4cLoL6RekQpsqTVBDPuhavCcYz1ybIV/u4ai899F+/qrVklVM+2uoUpnGLkdUIJwGfJxlDr5XYYF4uK9EJ5ASGeAz7oYyEFxhCHVT0ai8OeEbnt/IKOlGwgUkIvzCAQqn7RX80J2m9eg+xTjFJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766589770; c=relaxed/simple;
	bh=E76HtQ/wOlk/iTdKNvwcIKzGwEJiphG6wBguNie0bF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CJe0cktzGZSNaBltZSb1Wo+YkmRWmw2+mJPsq0E011cGinWuyqhb4ogOQF8Z57J8CIhvpeH2bmuoWqQBIaHgWj90xyUFXHrM/qnWjavX5GJ6n5fAgRhGEmC5id66BvUKP34x6ix0Dc615tX2a3E3RveN9HvD5BZ8fp+T7oCBSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kT0VxBN2; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4327778df7fso119074f8f.3
        for <linux-input@vger.kernel.org>; Wed, 24 Dec 2025 07:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766589763; x=1767194563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=broTySSYLTvfYQKOi4uFtvxxGHeRyXiGXlc1qJUuO3A=;
        b=kT0VxBN26z8X7X52pg/GlagL459ncI1WlyfiSnSCrOFlFky2GxHeGYxHbb7C9NhoyK
         1i5uPjfg5hFSUzClqefPPWXeUb7BAISPWIs6M8s/NEUu3bQv1Af9Gu/QI5uw/iTqB7TY
         3gPhYp8njMjC/UQ+n52XvnLx6qPgi+OD3Kfws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766589763; x=1767194563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=broTySSYLTvfYQKOi4uFtvxxGHeRyXiGXlc1qJUuO3A=;
        b=FXafv1mX1r+eIwytekyq34h5jFLP9PDagyY1e2bjQXGECSVlkbpsHR3JVldJjbyJxK
         G7KTuuGbT3+e0nFfSwocTmipYztvnxNjEdJ5s4YE1uxqzD1sID0DzaSuULeSMs9hnaS/
         e0l8fD0qwApW7+qHSGAjS1tuRimES1VxxN5HcZVjiiS4p9SO7GoTBQ/oONkNitMQnHNc
         6x+uXbsy4qo1hKuOGXGu8IVaCRqI9UUCpje2+kV+DEplrdVGpcPUaszOEbP1sSiHwvRz
         v6CYt/uNwo2dzvj8nF2Zt934pAAhb7MaqD0TQQ/d4nEI0Yh/BDBEWfm2uCicBC6DqkQ0
         e6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWplTHn+wCIjYlkAXGlPR7eWyDZAwFA51ua1p6n2miQbjqqLXC9zLsQWTNmbcJnoUJDSFez9p/J6GaI6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5MRV1BRUnDcNulcysNxwY0HXSXLaeJef8GXFXRg9XVqX5ci4
	wV6G2BLRJJZAZysDz94Qo1bHn0TToOmN1xrDLFHoGUY0dsFSKDojqYPUNRW6KTMHow==
X-Gm-Gg: AY/fxX7cBm5YvWfHbqBsgUWeSxi1PNawyUNbDYTxcll5Hd0BLF7KkiRqAGbrN63Qy2V
	uLsNraWSmvH1BCcV0i8dclged+VGLn/5bjIHMQVzGiq80pqTVSA/VpUOSnqSAoetRs5Yq4kAaHq
	DAjntW7jGB9oHpzxojXAYeXxfqTaegVOyDlF/uqrKp1dwD90udFuGVJSKCyCpcONU7ZN33Qhh36
	vS9Gn04ocBKZC05uQWIA2mgBubBVpaIoAWR7VLghUR6Lg5pzn2A9IeIOZ8Vi2EydqYASdvavBvF
	QZdkYEnWjJ6yG6j0ChM33lNe44+VCq8XZ3suogTaD/+GkBinHKO6X8j3TGAgZbNjEkjwMWO5WKK
	YZQBXsojD9XvGn02HFaLk+HuRCWX6xG8wPFI1oLaSOp66/hQDt40BdjFdOrfDKQSp6u0up4FqwL
	Bl3bCJkFHzje8GL8w=
X-Google-Smtp-Source: AGHT+IHB446KR9bbT+6fe4P8dhCXUz9efTM0RI8RQnUg/3RKKGMv4Zs6DxHZ83wur1VVBkRdUAUQzA==
X-Received: by 2002:a05:6000:2586:b0:431:84:357 with SMTP id ffacd0b85a97d-4324e4fb143mr21280148f8f.29.1766589763244;
        Wed, 24 Dec 2025 07:22:43 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm34307363f8f.0.2025.12.24.07.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 07:22:42 -0800 (PST)
From: Fabio Baltieri <fabiobaltieri@chromium.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: Fabio Baltieri <fabiobaltieri@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Simon Glass <sjg@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: google,cros-ec-keyb: add use-fn-overlay prop
Date: Wed, 24 Dec 2025 15:22:38 +0000
Message-ID: <20251224152238.485415-3-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
In-Reply-To: <20251224152238.485415-1-fabiobaltieri@chromium.org>
References: <20251224152238.485415-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the use-fn-overlay property.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../bindings/input/google,cros-ec-keyb.yaml   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index fefaaf46a240..437575cdf352 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -44,6 +44,14 @@ properties:
       where the lower 16 bits are reserved. This property is specified only
       when the keyboard has a custom design for the top row keys.
 
+  google,use-fn-overlay:
+    description: |
+      Use a function key overlay. This allows defining an extra set of codes
+      that are sent if a key is pressed while the KEY_FN is held pressed as
+      well. The function codes have to be defined in the linux,keymap property
+      with an offset of keypad,num-rows from the normal ones.
+    type: boolean
+
 dependencies:
   function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
@@ -132,6 +140,23 @@ examples:
             /* UP      LEFT    */
             0x070b0067 0x070c0069>;
     };
+  - |
+    /* With function keys */
+    #include <dt-bindings/input/input.h>
+    keyboard-controller {
+        compatible = "google,cros-ec-keyb";
+        keypad,num-rows = <8>;
+        keypad,num-columns = <18>;
+        google,use-fn-overlay;
+        linux,keymap = <
+            MATRIX_KEY(0x00, 0x00, KEY_FN)
+            MATRIX_KEY(0x01, 0x00, KEY_1)
+            MATRIX_KEY(0x02, 0x00, KEY_2)
+
+            MATRIX_KEY(8 + 0x01, 0x00, KEY_F1)
+            MATRIX_KEY(8 + 0x02, 0x00, KEY_F2)
+        >;
+    };
   - |
     /* No matrix keyboard, just buttons/switches */
     keyboard-controller {
-- 
2.52.0.351.gbe84eed79e-goog


