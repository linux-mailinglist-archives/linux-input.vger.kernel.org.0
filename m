Return-Path: <linux-input+bounces-14554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90059B4A187
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 07:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C264E0E55
	for <lists+linux-input@lfdr.de>; Tue,  9 Sep 2025 05:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AFE52FCBFD;
	Tue,  9 Sep 2025 05:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJZeJDM/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60DE2F0689;
	Tue,  9 Sep 2025 05:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757396969; cv=none; b=eic8mSAF/Riv9+59XiB7YK0Tto9RTIGCac0tVHCpPzjrPfk3ZFLi7cFLbGx7716hY1GVQuZ+c3InVUYxjA95RU1V9gaVVsj4DkD+kfQRTonjMulgMgHEWEYCGVUuHyw7xYFQ2O47X/wxB4g0BznHJrdiC7Wcb3qNG9L5+nTazRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757396969; c=relaxed/simple;
	bh=V4jn/bnwUga4D+MIY2bgmBw6U0giOdi9Se/Tm4UCgpk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tnJxm6oiObAp130EsjDE9nppICrc98u6XVOWD41f6hQyBodW7o2CKExPNcX0ObpYQwYLPuLrVCQgAVmic1owdQ63stxQ9bW98M+RZ/qs9rejiCkd/p8NFhcmxQmHIC5UAEzTiXcASEJwQlOtUBqKonBtyqKN6q1F6o1SIe0Bfpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJZeJDM/; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso6519787e87.2;
        Mon, 08 Sep 2025 22:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757396966; x=1758001766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0YyD3RevEZdoa7SIRzvNddkfWFMvskAUEdKz1BOuvo=;
        b=QJZeJDM/uMCbA0sFA60Puj11nRySsO0nN7jmEGBkEseJq1oUAo42RtYjQeA8tgQKTp
         ENIlwQNVrAKAnymouTDuCY4/1LRL6ZGdCsrtIcWG2bezSQFOoJR59xQqu3OrEnLr4iHs
         VcQVWTcZmctTw4BAZ73CWxe2NG2FuelJGYH9S5e2d87oZ9jUpQ2/Z22U1NY48b/icnwJ
         uoZqQ8nxBx+6j3KiIM+0IFPYnd0pa2bx0DN0bjKBwETr7ZhslMTtmt9FjTcCZdWUSO2B
         I/lmR9aiN6vo7rHF2GzjPqgrbqnfQmi4VcELkgM8t49PXwUN6xnA07hJ3kpwPrTe06bp
         JNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757396966; x=1758001766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0YyD3RevEZdoa7SIRzvNddkfWFMvskAUEdKz1BOuvo=;
        b=hgjZnUZTSQd7ZZIvJY05X3lbVqR6e1ZLMHYqGnS9m8x/9WXL5yTKVYDS69A00Xx6qd
         dD+Lj8ZchJu4z4VSEewZxLHtLiIQHlqt/GDUp96sDOdj+fxoZe5hfLnRuL+6+PYQgVeo
         dF/DeXPykI4K934rdw24KhE+vy3Hu6rfUwskIMk8PItdF6D9AfaeXkuQfuczlNEHDjU8
         xI1Y90QalwkMaoPT0Ez1pM1cniQ2tW3IZY37WVdbJztdSdDIRxU06ROvsC2os86bPao9
         Qaljw2XU9f9Bi6jPPVqaCCGOKvTm41nSJIbOzv/RnwSq4J1liYu0CdRbyuQUmXOrUcrL
         QD7A==
X-Forwarded-Encrypted: i=1; AJvYcCUg7qHfx/g0BSVKsjhUIQFQfKye1FYbgbjRDL9mWzZLxcZ5Ojf+UWKXBCzsxtVCnCRTY1hOJ0ltLacY@vger.kernel.org, AJvYcCV5faKfACgjwaNCDHuYESZOIHP4laJAbbXQiIc03wrE6+JGLDgdpeiaKNshU6ZLfZfkh5SCQUv83kPewXLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxWe8cTvipoQGkGmCf5qulBpMG4te5oL8D/Rc7TpT+9eRmLfhM4
	WajulEo+mMeRlrskTmebYqR06Oi2M4vN+5T+nNrmMeNMDoW4qI67g9EI
X-Gm-Gg: ASbGnctmDNoye1NOuDYXiZ82UFU5dSWgvVU4MV/N3ieO8DdBVAW/AvFqDCwUXcy357p
	NJDIYamGinPTmflqBUglHEPcr74EgM2uSXHPYq/aAWtNKN69qdrROkVEwGYdZknIjR7u1kv70vC
	xKbd1g/FTBLBwuju2rGR5RwsNj1caPusAPV2sCsWHufqdv9yFB2aVBkuazrOQb2ef7x6/gEbBWC
	5gOY4Lp9E4vEJ/XtOe+d0XCa9MO4rxC4243SfBXjuhLQObZPXKcH5MLItJunNcdRTV4lu98lrj4
	ByWdJ68xnV4/knE7vn7KaHz/5wgc845IMx6ISHji53LtBVgRnBG9VEJLgAhMZXDlh8NLMFPLr3B
	S6DqC2MPtoy3mKa+YkkGIAu2J
X-Google-Smtp-Source: AGHT+IG3PVQKNfUUYu2n5iMUtUoe9vG9pkUGVS/6QYtuxXztKJcL5/X4HlwQAP00Yq3PZhxxXhgLew==
X-Received: by 2002:a05:6512:3c99:b0:55f:4953:ae91 with SMTP id 2adb3069b0e04-5625eb95887mr3384025e87.5.1757396965687;
        Mon, 08 Sep 2025 22:49:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c4246e6sm277329e87.14.2025.09.08.22.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 22:49:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Nick Dyer <nick@shmanahar.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: input: maxtouch: add common touchscreen properties
Date: Tue,  9 Sep 2025 08:49:02 +0300
Message-ID: <20250909054903.11519-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250909054903.11519-1-clamor95@gmail.com>
References: <20250909054903.11519-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since atmel,maxtouch describes touchscreens too, it should include common
touchscreen properties.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index c40799355ed7..d79b254f1cde 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -16,6 +16,7 @@ description: |
 
 allOf:
   - $ref: input.yaml#
+  - $ref: touchscreen/touchscreen.yaml#
 
 properties:
   compatible:
@@ -95,7 +96,7 @@ required:
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.48.1


