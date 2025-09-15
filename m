Return-Path: <linux-input+bounces-14744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCFEB58596
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 21:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E7271B2512A
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 19:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E416128D829;
	Mon, 15 Sep 2025 19:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="o1sYXDm4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC79428B4FD
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 19:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966038; cv=none; b=EKL/V/of8V+h1NCFdw0XBCd2TBQP4FysJhlyaykslKhi6DFCLBjcbSnEmhkuMt2UHBFZdYVkEBZWeaJXt/xIPzdgSbjsbhPTtrB7mRxTSuv30Aa1zQNdC3RLspAkIKgO7W8kJ/gGhcuAhUW/omXD5OAtwjaG05+9LbTgwti3jUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966038; c=relaxed/simple;
	bh=osi8lZqw36mnUV7ANOU6dNqrRojLcplRBpUBXvUliAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fx8vzdWxMjv/eSzbBMiSjlr4nprGYrZg2FaH/iQ4cdY5KcLG4WAX8D8JcWz9ZgDdwl3MYb6jLye6jn31fVn09PjdGdVqN80ADeL+6ksb4Eiqm3oApFgDqnUn+xIRgBLemzADGsoOCdT05rrUWnoG+P3eQ9whP3T/7cEiVLsJlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=o1sYXDm4; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso3150219f8f.0
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 12:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966035; x=1758570835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmFa+COnAgPwES0uM9A7F5hfXb6EgxmAXNl0CdhTVj8=;
        b=o1sYXDm4EQHgeqE+sUlroS/wcNcfY3037sJ/QaR2P1jC/BwELsjryPsBoRhFa9CwJk
         9yaFLCuL+O3OdLTp8w9oqoCSOl1heBgVFDcivlnyq28Z0+V76YESjJoEnUPjlhUrFVC7
         pIZm5H2d9dWIKWkkZRAaFdJkvku4uWST5B6p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966035; x=1758570835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmFa+COnAgPwES0uM9A7F5hfXb6EgxmAXNl0CdhTVj8=;
        b=hfcY7ajrNCtnV1d0uc9rYmIWAQIOrxle5KU+y6Tl2/18KlyIftM7232HrWuIVLkhgt
         NVvvJASX25NEdYzseCfptrOXfEjKju+fyqBthqdTIFdvWy1J1OwpdO2nYRsqfGyspOq5
         +KD/4yRzzronyXkHyNWkBxSVs9gNSiQLpNZToTvLwbo/4T30g92N9pQvptATTFALmxx/
         ajwXZGJXI0bgP5teGhVpnbOAVg/KXwUWJuxuLTor1a/Ff2NY1Ai0OZk95yZyVxwKgPcy
         xL0mUg0K1DREfzDqogXvA408F378dUzmcUuvyu5Z5tLfkFI5lFUYLnjCoEbnMIBYNNtq
         YdkA==
X-Forwarded-Encrypted: i=1; AJvYcCUCigbEcdeeoeWyKTp41dybnWoD76Mqy+DDpIgLYJTJfwcn9JuOL8eQlOjnYte8XJu7zL5bFW8EPbIitQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiRpfSwgKI3E+kzXEmIOMmsflPL38OvWAiUOLZNRp7uU5v/Jal
	ZOMXs9bngVPmTjVre6EO695+hcWcIBkG8HvzAjXHiNuMI6ZlH2v22EHiJWjphbjUleY=
X-Gm-Gg: ASbGnctRoqY+48dmd6LbRw3L12E1l7DW0bjpoLSjz7W/aTXLS+7a2hq57mQBH/9330o
	pRZsYgvhgClDc+XLqgsXOGxNVOA7fCjm35V63pveNBDUaHKAkR8rwUocQXitjt+Telv7yHC6w5X
	CZfxlO8S1TyGqxGwuK9koVQCJnKcPOpD/0O0fFWzsKWpVL27GVU18txZo9bl6iUfXNkZpbCWFCo
	bH9YsVD5/eXNG1QkZtNESB1bFEoS2YyNGX6ZDFwcW4mtVNNGr+VJDlCol35KuNBATmTjcbqd263
	4WjKmeOlmbQdaXcoQGQzufyvgqMX3V/Hd2VR4GeY4MsMaW0ABcmisj86rerXJBHhOsDONSCaU1R
	rmh+PETaOjIfCHzrhlw/lrPxk8DW3taNONGnEs+3UCveIDfODzsfgDJ6W1R/h2Q+dmV1PnYwKP5
	uzzBhtFXpw
X-Google-Smtp-Source: AGHT+IHgPVqq/VbNUTCtXpuQZBf5oSQihvNkja9owWSYGdvunXVj22DIYhh2VXxExfJ6E1JEJCRPRw==
X-Received: by 2002:a5d:64c9:0:b0:3e9:3647:baf0 with SMTP id ffacd0b85a97d-3e93647f7a5mr6656144f8f.50.1757966035186;
        Mon, 15 Sep 2025 12:53:55 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 3/6] dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
Date: Mon, 15 Sep 2025 21:53:05 +0200
Message-ID: <20250915195335.1710780-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v2)

Changes in v2:
- Added in v2.

 .../devicetree/bindings/input/touchscreen/touchscreen.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
index 3e3572aa483a..a60b4d08620d 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
@@ -206,6 +206,10 @@ properties:
 
         unevaluatedProperties: false
 
+  touchscreen-glitch-threshold-ns:
+    description: Minimum duration in nanoseconds a signal must remain stable
+      to be considered valid.
+
 dependencies:
   touchscreen-size-x: [ touchscreen-size-y ]
   touchscreen-size-y: [ touchscreen-size-x ]
-- 
2.43.0


