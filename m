Return-Path: <linux-input+bounces-15106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B6BA063D
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 17:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08C145E6C6E
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 15:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750382FD1A1;
	Thu, 25 Sep 2025 15:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EZwPqDhk"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB02F8BCB
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758814315; cv=none; b=jMcZz7OzuNZYF+aZaN8+s1spPiLGwn92KsT7tbubEIXjgFfPrWd/4AddhwnCw7WbZ3A4cITH8PTh3WxbvuKmfJVYEzZnGJJn9+eJpyamrj1ZO0QYQpEFjwTyoNpHVDLgVafdytUc2QBzxwvrqw7Gq2cLBKFfW8UK+Kb8nl3ZMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758814315; c=relaxed/simple;
	bh=q5aG2S5mYUlLQBqwqhP3YXxDUhZ1opyJOZ1oXoGgGA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUMFuIry6iaVrGX2Xl3Ffdg8vtPQ6nEih43Dq8gl61LOqu72BHQaKzFVsffG3wI2tWlu/FJu83jC90mhTq7njZv3cEsEX0+QSjfQiMr5zb8jBSf7aBOOmp1jMOEMejbmnCx2+ImTyDEB0tFB5bWBQ1RptydRvk2A3qHGjtBTKd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EZwPqDhk; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b33d785db6fso218484766b.2
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758814312; x=1759419112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2j6NXz/L1rjCXicECUckXAuwnbrEJeLUM7GD37RWm6Y=;
        b=EZwPqDhkxKEgMdXteaQFYfQ39dcFnn9f10C0sbwID+CyI1D1xza5k+ooeaMQ8+aJjd
         f1RXYXD/R61lhHVKErdXdJlBdQZKS0mb6fH/KobxM5nbOYwIz7oDL16bgkXiEs2P//V1
         cZ3HZ17jx6NK9Sm/kDsbIFrbh8g9CbX+v5GAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758814312; x=1759419112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2j6NXz/L1rjCXicECUckXAuwnbrEJeLUM7GD37RWm6Y=;
        b=gNffoXExjodyYM//nc/DyjZGpWtMfwDqeHpoOGVkaK2mw8E7kIyUKD+t7t0QuvNtcP
         yw1w9CZzAQNAAp9IvvzePyZAgGaAor+4DF3YDcA+REDVnlAxZjONF3vCYt/sVxOa67hU
         ypgc4YPBeIpOmRgKnNKbi1QHyi+6+QT5EWIHt/qVl6qDf9wh3SrmiCSIqHYyoAPmflUj
         WziqNTU6n4cYcYiZqgvRslu1KXvo97BwPmtv53Txwih7iALBtC5SJvqtCn8Ksbs4K5DZ
         trM36Hf3pOMU96QD5q2ReyD+D+xlOPyGN/xJFMNBa2dQcCo1fAulUpxXYUQ0maUpU1ir
         M4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhSGASLGeSKibfNAwpJDOJSiUiV9eVdeQ/c+tHTY6hyGqnm8+9NVIQV6jM/ItLG9LtoIUPYDS0GwNQuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynY5/UUPhlUbk56Rg+eK5Fie6D0W9bRQiRSCnKWNMat5Wx/wNJ
	TJLjwwHn7Au9EzHFLioXuTJJ5od1RL3t5L7Ap61YwL7WhuXdWvypID7Q4N2wm7YwSYEfj/1j32v
	/DJ+yk8E=
X-Gm-Gg: ASbGncsb8udcnceHJ9CQpgtjqmTbIofstGIWk/nQA5vYp7LjjvA1i+kprc4ufzvw4Io
	yav1rU2JynwWw8vF6IqfkdwMb4sqGrGiWvpfBUzCXVHpG46N7BfvFUVDefkFrpeE020T3kSiOxS
	fS+tL/z/K5q6k8T3hikjbnZSPV45I2aULwXDZGbMkC+Gi+v5dSAPAXDo3OGZC0dtmSEIkWKZ4L8
	5hgnTi/ILfsqedAwP/wVAOSg5hIE2xLqIlEobCTZfd40tp/N+wSgStcymH1KI0EALnCqLuvNwBG
	N6HbAdZEErS/PrWAYaZKPSqs+iYPWW97onHTGmQPXCSw5m+5J+rW61LQXSHxyJINXkatME2Blrp
	S+pjpQ91UT329ateXj3/Mv8kT9ykcL7m9Enj6vx60e4Re8ZjexMWf9echJyYEs6D2uh64r4+Bw1
	icLPm/FDd8W3Daqsk8FrPQM/dNnRc3dmoqiAsnxWyscRtZMDhxwU1NFRChSAW1BQtB
X-Google-Smtp-Source: AGHT+IE6hFumdlcUjZ/00Iv3aIuLUT9mICMj6k5jLi1LoqQpjx/Mu7By43eLrCshvtCsZpoRqZOBQQ==
X-Received: by 2002:a17:906:6a07:b0:b04:20c0:b1f9 with SMTP id a640c23a62f3a-b34bb50f700mr453534566b.52.1758814312116;
        Thu, 25 Sep 2025 08:31:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b36f410e129sm43924766b.89.2025.09.25.08.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:31:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: sebastian.reichel@collabora.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [linux-next PATCH v8 3/3] dt-bindings: touchscreen: remove touchscreen.txt
Date: Thu, 25 Sep 2025 17:31:35 +0200
Message-ID: <20250925153144.4082786-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
References: <20250925153144.4082786-1-dario.binacchi@amarulasolutions.com>
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

Changes in v8:
- fix conflicts on eeti,exc3000.yaml after rebasing the first patch of
  the series on linux-next where the patch "dt-bindings: input: exc3000:
  move eeti,egalax_ts from egalax-ts.txt to eeti,exc3000.yaml" has been
  merged.

Changes in v7:
- Add Reviewed-by tag of Rob Herring for eeti,exc3000.yaml
- Add $ref: /schemas/input/touchscreen/touchscreen.yaml# to
  raspberrypi,bcm2835-firmware.yaml.

Changes in v6:
- Put deprecated the properties added for the eeti,exc3000-i2c.
- Drop the example for the eeti,exc3000-i2c.

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

base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
branch: drop-touchscreen

