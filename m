Return-Path: <linux-input+bounces-13900-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED69AB20763
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 13:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A1EA7B6561
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 11:12:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 562DF2BEFFF;
	Mon, 11 Aug 2025 11:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pygxoH1d"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963D32BE65A
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910825; cv=none; b=kVml7mCHPA4zulNAlLkLD8gCjSz6+48AH/pH/W44e/gP06/CY3ZVgeATv8o4tnJnn0gz/RzgmnHe/omndc3L4aBadzG9QPCAUEicruef4Yn+5YQcfMxz0T9//qOg8k3oOOHuBx1NeLTtVV6Zk6vHtdGnVJAjzB9xMspjvyqu7n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910825; c=relaxed/simple;
	bh=UX0N+djpdMFrLMwSfXGN6kbOHJTu81y3bcRb/z2XUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2DbVyD2Lbj2MKWt5c24TASCSwcWfaZ50Oyza4VqBF7hPTsYIoRN6qst4br/iQOaJ3BIADnmeWf5l2vGvrdS5x1Odafx6NINUI1NAOrieIPVcVeHdg9xQMbOKezhYMvQcfjdJp4KPP+DWWvdpSFNseBZ5TSXZsVBVeMvVed1vKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pygxoH1d; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6182b3218aeso1483342a12.2
        for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 04:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1754910821; x=1755515621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE2K+2ZuImK+3i5KhTzlvfFepruAjEsa4XS1kJeheQE=;
        b=pygxoH1d5PzGGIu24mbpBrknYjiOcyo0Ugpgv3ztiCeLMk3JNSqVlSnXFzz0hhpoNy
         dVjHATacxImaS/7Ts/77da9R4huQ63OfkuoJ571j73nb7XQqzeGiRoTFhEHmL8p34R5K
         UelgXu+EUeff4d7HskP8VJ3NLMMPPw9xCWlQNxXwqxCEOzlYWngxXIAv0NrTtxOjJzJY
         foKw6WjEU5OJKX5Qqlk5mIzZTqD7BxkqwGmAjTvOQ7wCoH+1Sh1js4smHSI+XDaKvksA
         lxNnhEKKVvhCJ5+BVj1aWPI5xVsRAH1MBG71WatOx8iag03obrVXtzQuxpdbx49W/Iva
         tk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910821; x=1755515621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE2K+2ZuImK+3i5KhTzlvfFepruAjEsa4XS1kJeheQE=;
        b=ee/Tq+mRtU1n3VlyVSoiHzWOAg100xRojY/N4AK52A23hYcitLdNFEVlZDqpfRv7GW
         qwYHaiJBRjrW/NLiRnFy9DagJh0/N66d3dWj4QdUeOPgHgGZmg2k6cPT4OnNNj5vkPDo
         SHkJUGTFkFfSoeW5y63Brcl34DKpz1FJ5S+fpun7huYvJApjdmBni1iBTQUZJ22oeys8
         T3r1XehN5OvA//I+gFjyMQQ7wq3MrIszIypRqe0hF1SRZg6sH7+m0sYvwhS+PVAaKko2
         6xBFEYZTmssP8n8GidPoYi1d9JmXL3fKWw2OipYBwA+8jnK/4TppTJ+v0gYehiqFqWqM
         LTYw==
X-Gm-Message-State: AOJu0YwqYg/151KlPEFAmr+EDxK4PNavKbGDL8arxuGceEFPzHsqAc6g
	r56/JMPIkV0aPR4q9+bnVb/tQr0ccvVnkb8MxGB+zVp63cnoewr+0AL40HtwdO6fzfE=
X-Gm-Gg: ASbGnct6Cj3p58iwctZjMSYTs40tuKAhaeNoeA4Z7lBN4IVO8TRwOTCMCHnqS9YFAUO
	selLrBCCUmEyr6af7hiifju4tE0A3aEBPuv9pMdaGyE07au4/04Gd3joTlGmKKmdLT8IkertKoL
	P3Go1RleODPQINEIKMAkDdbU2EF8Pmelz27cX0639alVgwjOCAt7GRfTzwit44rdZcuR+HTXkcm
	PiKD0FD2vr9nMJYv6T4Ri2cogAjXRauqNtyld+4pkMSA4hZcDHxVjgF5xdfgMY9WbWPUssq+osC
	o2Qi7WuSsoT+4sHxVNQlbQHQIj5iaMjlqkIwHzhfw4f+pLo5z95OFN3gZd8Kc94nbaQDjVO+0SH
	1oCS0EqFdwJgeYwPvqe4jV5Keog7qtFV1gj/kWwMUCTuvKfiqnljdoQG4w+K98TlLJgrRSNmRrn
	0Uev8=
X-Google-Smtp-Source: AGHT+IHUNrs5ICyRttLZ4MBvQlWqGANX+fEiGFeSfSnY70D0xRdH+Hf+x8fR/7sL6Y2nP86DQTcQsw==
X-Received: by 2002:a05:6402:50c6:b0:617:b2aa:576a with SMTP id 4fb4d7f45d1cf-617e2b70dd6mr10647062a12.3.1754910819461;
        Mon, 11 Aug 2025 04:13:39 -0700 (PDT)
Received: from [172.16.220.71] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61821e562c0sm2467278a12.30.2025.08.11.04.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 04:13:39 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 11 Aug 2025 13:12:01 +0200
Subject: [PATCH v2 1/3] dt-bindings: input: Add bindings for Awinic AW86927
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-aw86927-v2-1-64be8f3da560@fairphone.com>
References: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
In-Reply-To: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754910818; l=1623;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=UX0N+djpdMFrLMwSfXGN6kbOHJTu81y3bcRb/z2XUPw=;
 b=G/haZsxAW3Uta/ivP+qf4w96lRdnPqBSEuvBIEv5bSUBM+FgC8/2/wi6zdwUPHNG542bTSlH8
 V4sH+Gtjwc4AWJeTwfiTqevrXKnhnpW6DQxLkXVhGeJ59bz3lyLvcWe
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Add bindings for the Awinic AW86927 haptic chip which can be found in
smartphones.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../devicetree/bindings/input/awinic,aw86927.yaml  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
new file mode 100644
index 000000000000..b7252916bd72
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/awinic,aw86927.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Awinic AW86927 LRA Haptic IC
+
+maintainers:
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+properties:
+  compatible:
+    const: awinic,aw86927
+
+  reg:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        vibrator@5a {
+            compatible = "awinic,aw86927";
+            reg = <0x5a>;
+            interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
+            reset-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
+        };
+    };

-- 
2.43.0


