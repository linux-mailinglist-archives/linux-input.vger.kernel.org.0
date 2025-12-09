Return-Path: <linux-input+bounces-16511-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07CCB074C
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 16:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4585B3074775
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 15:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB15C22D4E9;
	Tue,  9 Dec 2025 15:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kWQBMqKD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B751B2DF143
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765295238; cv=none; b=B/I2mWW+3KSPzShXzPZP7my6PUvpC5JuAT14koJQvrRPxDW/PdCj3Nn69iNDnFOSbybXMUUkPJSVOwsAgx9eaf+hYOTRO5Y+Q1agzLXUvOyfvC1q6q/erHGcv8wPIBEspxJtzK2PFeVXFC3QRBsyyzZynwpA+iq25MIUGa/xvXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765295238; c=relaxed/simple;
	bh=Mf0n1LHXScTwDCBqeKr4+XmfEBe8ouhRSTBuNlOqDjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0KZf2j7kvnR3jigfLKcJqo3tuqhsfTnIjhRslIbQD/ubjKuAmxuZ8tmrXzVUUt21uAvVXgefYQ8ElY931M21lVDFNSHiDmmllqS6SESMsh7M9urRbbkf8OR0jkDw8L27nqsm0lO9wYctScmTCagEnfJxf6mH8qaKVzJFj1ouL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kWQBMqKD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47118259fd8so47387035e9.3
        for <linux-input@vger.kernel.org>; Tue, 09 Dec 2025 07:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765295235; x=1765900035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddxV9ehu0GXJ9iiWNjTlWwirsEs0puBXrIAVzil+rQM=;
        b=kWQBMqKD402nuq8b35mqJ5CHUQmg/0HA9OEanCp/7buLTcPRfkekqTLA5RL9cwiLBn
         +ES3yPIgieoqiEp6eDQEtio2IR1LmXhlfHarXljfqdgxJ1UMYLMLEjSzu5tG1UR1D+wk
         gcnCrHrxcbaAdm3sLQIWXjqGacolkvL2Uz/4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295235; x=1765900035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ddxV9ehu0GXJ9iiWNjTlWwirsEs0puBXrIAVzil+rQM=;
        b=iHWNxdKRZ+W9GzZa0TqXDzSshliO3W0BKFu7k3DXMjMlf2FiJQ+A2/KkWdwfOrythK
         2JNy5rV1lyXHfnbqUr+8FCIhXBPfzTZW4Cam+jlYs+/bCvw35Zg5rjcrV+mBVO+5qOZJ
         8KeEJar8RzMc01WaRlN1hPGuxidImGC0EA6QWp/ayOJHVIjR+GQi42GUba2sNgz+8JSE
         /n9XQF2peOtorTgoqnMNi6CIS+rVbyuS7UQq6y4MCcm1yd3WGm1Njejy8/jWR2II3d98
         3OSmOTlpO4P418glJ4i7ojRZ+BylTrueI19I6rLK2EO2U4eUUHtMx4BWqaociliIM048
         AGbw==
X-Forwarded-Encrypted: i=1; AJvYcCV7RCFV/iTj8YmBKSv9BN485c+9lf+/0GofndTP3IniXBsYazn0EoQEbxhwZDPTia4NnnPr/wIDcaUGJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOWsHhHdkdKZ9H6ksri5FD52tUZ6SOIDAaQHN9/hkqlBJUFt9s
	PUZb65D+4XBUFPtedoqgLc0PEceP+q74cprzSqwOJ2+ioFGTdR2CCHoxc7cRXaV6mQ==
X-Gm-Gg: AY/fxX68qXA6XM0K/4+P84Hh5dgz9yh7aO7J2x23n5u+wnC0cQ2M9E9ZCvaI8VFDIyp
	SEyjazrVOegLYVpkkOi+QsRmQgXq1QcG8/WiUamqUreYdp2xtupsoiCxixRWIJn/DOkWT5tw0yL
	k3KGj4F4HaeN4xFCAWtdszGJIwVICCpU7qG/pFWFjUDPIH8BOrlnK+NJgPHwqHjLrtobRUEx6XN
	BRBiajWvxkDMQiBCJMwFOIM2fAM2cYo30R+SB/ItHA1JBEdk1kbz1wYml2DBk2hfu+rUv2IEI23
	oCBGlPG308Lxj1gL0XYWY6kZqc4KZyseW6q4fcC5dJkpzq7l5TYKWNNrlKcIFy6zh2bWAo5jqyh
	fpAwp9VOcZiu4Y59RzeLZkv3j1ru5sLY68VjiPqBmS6efunbupR6iaWrCz6gdaTcg0iXkV6ytBt
	Wmc7/C5I2zylDTK5Y4KnmHt10mnw==
X-Google-Smtp-Source: AGHT+IEKi6UxypeqPOH+18lDVXZJpB4iIoiaagxsyYSesPihG4eCl/CaHPqW6Gig0ydpspXkZ+fjYQ==
X-Received: by 2002:a5d:5850:0:b0:429:b9bc:e826 with SMTP id ffacd0b85a97d-42f89f6e838mr12441377f8f.53.1765295235028;
        Tue, 09 Dec 2025 07:47:15 -0800 (PST)
Received: from balto-ws ([37.228.206.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353c9esm31097881f8f.40.2025.12.09.07.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:47:14 -0800 (PST)
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
	linux-kernel@vger.kernel.orga
Subject: [PATCH v1 3/3] dt-bindings: google,cros-ec-keyb: add fn-key and f-keymap props
Date: Tue,  9 Dec 2025 15:47:06 +0000
Message-ID: <20251209154706.529784-4-fabiobaltieri@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
In-Reply-To: <20251209154706.529784-1-fabiobaltieri@chromium.org>
References: <20251209154706.529784-1-fabiobaltieri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding documentation for the fn-key and fn-keymap properties,
verify that the two new properties are either both preseent or none.

Signed-off-by: Fabio Baltieri <fabiobaltieri@chromium.org>
---
 .../bindings/input/google,cros-ec-keyb.yaml   | 60 +++++++++++++++----
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index fefaaf46a240..56adf9026010 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -44,6 +44,20 @@ properties:
       where the lower 16 bits are reserved. This property is specified only
       when the keyboard has a custom design for the top row keys.
 
+  fn-key:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      An u32 containing the coordinate of the Fn key, use the MATRIX_KEY(row,
+      col, code) macro, code is ignored.
+
+  fn-keymap:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 32
+    description: |
+      An array of u32 mapping the row, column and codes for the function keys,
+      use the MATRIX_KEY macro to define the elements.
+
 dependencies:
   function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
@@ -51,17 +65,28 @@ dependencies:
 required:
   - compatible
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: google,cros-ec-keyb
-then:
-  $ref: /schemas/input/matrix-keymap.yaml#
-  required:
-    - keypad,num-rows
-    - keypad,num-columns
-    - linux,keymap
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,cros-ec-keyb
+    then:
+      $ref: /schemas/input/matrix-keymap.yaml#
+      required:
+        - keypad,num-rows
+        - keypad,num-columns
+        - linux,keymap
+  - if:
+      anyOf:
+        - required:
+          - fn-key
+        - required:
+          - fn-keymap
+    then:
+      required:
+        - fn-key
+        - fn-keymap
 
 unevaluatedProperties: false
 
@@ -132,6 +157,19 @@ examples:
             /* UP      LEFT    */
             0x070b0067 0x070c0069>;
     };
+    fn-key = <MATRIX_KEY(0x04, 0x0a, 0)>;
+    fn-keymap = <
+            MATRIX_KEY(0x00, 0x02, KEY_F1)  /* T1 */
+            MATRIX_KEY(0x03, 0x02, KEY_F2)  /* T2 */
+            MATRIX_KEY(0x02, 0x02, KEY_F3)  /* T3 */
+            MATRIX_KEY(0x01, 0x02, KEY_F4)  /* T4 */
+            MATRIX_KEY(0x04, 0x04, KEY_F5)  /* T5 */
+            MATRIX_KEY(0x02, 0x04, KEY_F6)  /* T6 */
+            MATRIX_KEY(0x01, 0x04, KEY_F7)  /* T7 */
+            MATRIX_KEY(0x02, 0x0b, KEY_F8)  /* T8 */
+            MATRIX_KEY(0x01, 0x09, KEY_F9)  /* T9 */
+            MATRIX_KEY(0x00, 0x04, KEY_F10) /* T10 */
+    >;
   - |
     /* No matrix keyboard, just buttons/switches */
     keyboard-controller {
-- 
2.52.0.223.gf5cc29aaa4-goog


