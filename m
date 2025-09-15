Return-Path: <linux-input+bounces-14741-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C116B58590
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 21:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52F232086F2
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 19:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1FF828750B;
	Mon, 15 Sep 2025 19:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kRXhSUag"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBD12874E4
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 19:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757966034; cv=none; b=r/XlLrTo8CsappAjDl5f3a7D0cUJpRFjFX56hWyrSmg74mDArvXZ/EIj7x5X98oUrzQ/e9ORyqXGFWZLO4SvT1BWQOuiSmRb7LqP0e48nluFvfDZcY/epjQg/O7eqFzuVMEFsCmUDiWA1zHV6RUrA1QoajlqVACKsTH/a1JtY/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757966034; c=relaxed/simple;
	bh=4+yxs60OAVC+egyNAJiQPoNAhkAmxqsLILpbkalQphk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d/6fKCm7TOO/YdYOFwFU031aDKXSqFdJPUOn1O0zIi0HKMJ3uTt7DYx/ya+X412RXc30vZ0sFQ5DxjF7LykN6WD5U9bGvuPU77aMUWXs4r/pa0nnGld6okQXy6A4Hu238obBWMi8TUhYEVx7bwagNxn8dESen6WFw0PBdt13ga8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kRXhSUag; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45de1084868so25586385e9.2
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 12:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757966031; x=1758570831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=;
        b=kRXhSUag1/nS8E9xY2G9KRhCheSE0I9o3LyDArUUJ9sVex8XnMOTPmJaWjvSV4ALEK
         SZaLC+2giSK4D2kZvYU0ypTQ8oCHwxrzeQFZMA/gPUSNR+dNU08usJm0cbJ3xaayW65i
         41E7e56XROM4SCpuC5RjugIL2go9gKfviWSV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757966031; x=1758570831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJhLIV1mYQqcST1oL+DWVlUO1Mmv/0wElK+MzmN2lAU=;
        b=BGyKK3xYgaE3N2+4YWdsWzbRM/h7qoRRDQc1GNFGnkLBiOdtsgXsBE0vtpXZ0HJEH2
         7SaQKYROIGF89JxdmKzEF+R/LkH46j7BWe4RZ6tQRsMsQ0ZeubWRh7duZ4HQ11AmaFRY
         BU3E3WaQ5fv+rJKMVaPzvpDUuiGiM6vwuZKiPDotgko7yTP30vH3QS4iWU5PWZ6hrYP+
         KARhaYYIzHz0x23iqx4FXm1xOOWkZIkN4ugN6XMUfOu0cogNEXtNmFLgzVMBrSLz/hcH
         1enXd0Z+IjHXs9NXw8OUDwnGfhHXE9wHEuvE4qtwMGDQlztEiwKpqfxhJXjay7nbVnzN
         4CNw==
X-Forwarded-Encrypted: i=1; AJvYcCVgJGJ6sv6mjQ/SnsquQeXW7bm/Ud3uL97VhdtYRuVxacbzSU7yX0Ias8VF86WJqGzUIgYRNHLZgr3u9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXOv6ynEN1/DCKwVF9FvaxZkeKKIXsyWeWUhRGmq1J8czKJ7sy
	HAUVLNzpIP3TXAHkjIO2LG5RP9mJoS2NnfskBIofE5vSabrBL1NqpPs1PCaLJvF3vYc=
X-Gm-Gg: ASbGncuQMsiEvf4Mj15tDuL82WdlxWYOlpTAoVFo0tZxuGTcMyIjX+nfJ2bQ3TecjD7
	/rCogpbXgTG2LQm1vSeF6dG3uAr0wrwH4hEmpvyHubHo35Re2CHCzvAxUzEH0y5g0pwir/PmG2g
	3HkPuZy3jJubYOPdzwCnFFscWDKxU/bQBO2H1tj9Y1U7ys0jufewnS8jwm7fRhAHod7GXnFX+RT
	G7elHgh1fJzNK8/WV/HlqmEzbMzuzfPJdhpKI5UWY9ab6QLF7PVhh2IL4sjtH5VEpoAPz4L7iU6
	btMNXUO0tPD0lLq6caycuMrepbvAOC9sVoYhB/Efn3aXeiGQmA9YH2jFWkoCrc/s6N7TDvQl/lU
	zroDBGuQyfMYOuK9zt5AKmygo+atCS8bNyEpnJuSjVfcqeXaF78QPOsaO7L7/3/E=
X-Google-Smtp-Source: AGHT+IG7qHwPsEqR9IHaKIK+gqJMIa/E+Jy05PFsgkH/KUwCOfGsFJPue2mRPxnFFVk+CO6qHeKm9w==
X-Received: by 2002:a7b:c44b:0:b0:45c:b5f7:c6e4 with SMTP id 5b1f17b1804b1-45f21202a1amr79796525e9.35.1757966030718;
        Mon, 15 Sep 2025 12:53:50 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45f32640f49sm530985e9.9.2025.09.15.12.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 12:53:50 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Mon, 15 Sep 2025 21:53:02 +0200
Message-ID: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.

Dario Binacchi (5):
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  12 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 95 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
branch: tsc_de_glitch

