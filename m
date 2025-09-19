Return-Path: <linux-input+bounces-14894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B69B884DC
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 09:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EBC21C87B20
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905A32FFDE1;
	Fri, 19 Sep 2025 07:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZXyVQWmP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16EE2FF15D
	for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268712; cv=none; b=fP5e41ZOIWi77GXgTIPhzPiHeARDEquP6r7UGbhKZDYb/JlnvVx7NVMdtQDgfBvUkkcL1V3RYhOwstl1SW+yhISGPUwPVWIADq8tH80w15lllCIyTqpuwChHt/2/e40qu1aolr7eiP5NEGOCp4AsHblG6RCYL6lZgL5Sokxqdi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268712; c=relaxed/simple;
	bh=l92OkncAkN7CQH5Yv/FMs4byey/iHXNBxiKHSxhWJmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R/0XdaLLSzZeDSF8EnpKXMGaPvtMWainqLc8Bb24nUr28If+jPkTDN/mDCkPuMPnuNH0FaJlY6wC5VvYL70dyDSlFRdVi1oaYNO6MZZXX8ihGI6luIx7EfZ1DafFiJcwiiMf4GR3ghiHxUYraswJ8KCdYtje0rw8vZjWjzCuDpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZXyVQWmP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b07dac96d1eso426535666b.1
        for <linux-input@vger.kernel.org>; Fri, 19 Sep 2025 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758268709; x=1758873509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/F5R/2NOqkoymo9zvAsteuAQQNJ4xYdq+NdFZB1zNk=;
        b=ZXyVQWmPavnwHO3frbL8P+xuZUywheVdlZZrQQBwhMfqJTXyPYPKVmP/+uObnHk/Zm
         XWoQp7Y+tT0l6vXK7jsKjP/pO9le8YpmiDZGaYgczIyc+6mVDCkrTp+NwBf77IsfEGTM
         nh7BVORtmrZNC+GKLfapW7Z4o5D/h0mekxv5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268709; x=1758873509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/F5R/2NOqkoymo9zvAsteuAQQNJ4xYdq+NdFZB1zNk=;
        b=woSqqKzzsaM0OEeoh95sR6WduSLGu7jj964gbWg9ff/iPAiinmymEVWv26bmuWLFqV
         NYe0ddaZsTRUYV6qsdvtE+I5IgMy2YonI9cruFnRnHggdrwAC+Gp+D82n/Mm5X4IgZDP
         P4hUxZi22lwv9Zt+WXaczM7QYj5ZyH7dIvYR584dieuYPN8NsHQZ3RFVMRoVOLFX02uZ
         +n9bUGD7tlmC7DB8xh+ZO8vBDYwjNTzwibHqZrqG+VT0HTaYICnaY3xcZxMQnJCyPAHq
         50fy4YxO3ldLSijV5KmiFWLePUZakXRZ+/KamX4j0KiMusA3HVLuxKJH5+h0xW1Vz90Y
         Ogow==
X-Forwarded-Encrypted: i=1; AJvYcCVTp9wweO5NP65l8AJa/BLmqqWrVKuVqoD7qhrUTzVzRsI6tBsb4HD/O7gtg0cTIFK3NLLME3KK6wfNYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVK+QESg6flim4O9Ml+z0sDTl+dTQVDn3YSS+nHt93l6wjJVle
	5EgoUbfRKF6CKQcYMnsARuxUqcBXqA/1OGaklGOQLi4wtxFFvWaDekKYB0iZcM6KaEg=
X-Gm-Gg: ASbGnctFE9ivU2ldzwSKTuaLeK4Oiz7oCl5eUZR66BjrOAwp4GTCSUbmBsanWnPaqGV
	rkitzc793G9pB8e+yvsEdV7fD/qE32bJWVRNvswrS54RT0qAlxQBTpPiatnxA4HIe7b8PCAlFLw
	dcViqwfrNgeYKcHUExJ2M9O7W5ri6BIichOYXR0xJPdqmh7Bzchc9PO+OUcl8qgyuFrft53DkK3
	CAMx24rE6fdhDu2Tk5BGmYF6Y/SRsRwz4ZOBp7luGJCleU2SFvO4NL/5Nfxy6Ejntshvsy+F0na
	9KsE4CiNDwiWywshsW3yJvvizbeyamiC1n4a1jRIG3OuoVRA/a4Riiu5vB2oWz3ulSTk2MVJHVd
	EzJSSpZnyHsah9bScA4zQmfRiECI5uWU6f15Yt/ShIxcOb7P0B/j7UWjQJ62ZKt46pzLvgSCrel
	+b5qdWra40k+nwdYiGSzqpM+G/hq3VEG0S2pZvqnDRfVBKqsigJqEUXyS92TizknXC
X-Google-Smtp-Source: AGHT+IFWBJ0JF07xrrg1AEfrd/lNei6bNWfdewxHUBTlYbJy0+2ZBEssQAE3DyJkSIWh4hsDeA90Kw==
X-Received: by 2002:a17:906:2e8e:b0:b26:40bd:66fd with SMTP id a640c23a62f3a-b2640ccbdb9mr72789666b.10.1758268709023;
        Fri, 19 Sep 2025 00:58:29 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc890cc98sm384693466b.49.2025.09.19.00.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:58:28 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 3/3] dt-bindings: touchscreen: remove touchscreen.txt
Date: Fri, 19 Sep 2025 09:58:11 +0200
Message-ID: <20250919075823.2557865-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
References: <20250919075823.2557865-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
schema") touchscreen.txt is no longer needed, and since no other file
refers to it, it can be safely removed.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>

---

Changes in v5:
- Drop patches:
  - v4 1/5 dt-bindings: touchscreen: convert bu21013 bindings to json schema
  - v4 4/5 dt-bindings: touchscreen: convert zet6223 bindings to json schema
  because accepted

Changes in v4:
- For rohm,bu21013 bindings:
  - Drop description from reset-gpios
  - Simplify description of avdd-supply
  - Rename bu21013.yaml to rohm,bu21013.yaml
  - Add Reviewed-by tag of Krzysztof Kozlowski
- For zeitec,zet6223
  - Drop "Phandle to the" from vio-supply and vcc-supply dscription
  - Rename zet6223.yaml to zeitec,zet6223.yaml

Changes in v2:
- Update the commit message
- Add Acked-by tag of Rob Herring
- Add patches:
  - 1/5 dt-bindings: touchscreen: convert bu21013 bindings to json schema
  - 2/5 dt-bindings: touchscreen: convert eeti bindings to json schema
  - 3/5 dt-bindings: touchscreen: convert raspberrypi,firmware-ts bindings
    to json schema
  - 4/5 dt-bindings: touchscreen: convert zet6223 bindings to json schema

 .../devicetree/bindings/input/touchscreen/touchscreen.txt        | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

diff --git a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt b/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
deleted file mode 100644
index e1adb902d503..000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt
+++ /dev/null
@@ -1 +0,0 @@
-See touchscreen.yaml
-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: drop-touchscreen.txt

