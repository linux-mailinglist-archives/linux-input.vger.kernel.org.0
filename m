Return-Path: <linux-input+bounces-14706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA8B56AC7
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 19:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE16016116C
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 17:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461A425F973;
	Sun, 14 Sep 2025 17:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aYG61GA9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6320126B747
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 17:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757870180; cv=none; b=EcTQC5+tI8Vt64ATVawjyHBpLhUTaNp6xhseyey06BAnMSknnB2YLOaTyUW7qnZygbSQ2Y1ChXYn2UKRZc6uhScyh58WNtLOUP3gfVOnnNXNkIPnud3uW78bcAHsZLh0IDyOAVCvQp5n4w4ArMeAsDdMkY1xkRMNoHJFHJgfsPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757870180; c=relaxed/simple;
	bh=nftBCL6M74z8HHTn4ctuVWkq8xVvp0KWzD6g/yIisLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rx+Vl/cZRktTmMyjjW1C4cMElS7xVITOe9LEmeLf+AsnjuPT2XXShb+9l+mHsttJXPOjaTYAt2hcSVW+MRhSwKjWp1g5X3gMK+o7PGlW2Ic7prMYO28y4TNkgieJQrd4yI3hSWHytMBLFgMwDa4St6HI/lb9wty5sEgZ2Db1ttk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aYG61GA9; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6228de280a4so5467396a12.2
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 10:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870176; x=1758474976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=;
        b=aYG61GA9jSF96772jvHJL5h1+/73vwV5/VfeWiFpC+4jPSsJ0ZkiF2ixfJ5mVZA7BW
         iLF7BTmWLVLrhmpU/Odjakpcdw8nI17P3qpESWPWd9M+ICjMVholkokMLz3r9EWHfY8y
         HbKd6VCyCrDgG4QQ9DlYpsOUePoUbGvXoZ2dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870176; x=1758474976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BZMewSeCcTTiC1gUbhDF3UKkouTbS+YRMuO2NhSHUs=;
        b=IR08/85P6R4TYQVmftXrMUGUKHZRa8Yk0JbtQgyU2U0tBvbyCfqdbSHNBMK97dtIB1
         gS67z/teU/wfKKE/29TKwBti+FYKkxHP/cji4757cHYY/wP2hm6iueL8zrrpN8tVXfq3
         eik1lj4ll6sXx13+6wQWJk5WrWT4RDzIySM/r4j8MUgAkQR/6yJfCcOHZmvwP6fBTuP4
         +3FBArfLIjTR+vfIxdEQPOFArs8XbqYsWD6jc5uS/EtMdLziH9Bv2JC22TBO2q9QpmeU
         rQgEqd517c94kqC8EkDhh3+c54qa+hIRm7ZkJB+YOo9rckxc4tNe2dt9PjtFY5DP+v/Q
         6khg==
X-Forwarded-Encrypted: i=1; AJvYcCVsCS0Vqr3TgJISuSP37zRMByA64VdQwmlJ3JUh7mzqpa6E2NBjb82v76wn2ed/OB6Z0qPID3OHw0J5YQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUZa2Di2F/DQX34VKkEzogL2l5tkGArJ9r7aWIFF7INPPgbB3G
	QMvQPk35n2R5gCTvriEIgTRK++FI/PgMLCCn7Iv7eW96Lf+K5ZpaHC0Jh0Rj7lNraPw=
X-Gm-Gg: ASbGncuTDxGxgq7RFvqhBLgbi1HdA3lcNcWR/Duaie50HCmsVaSrrqhQlw/UeZvfSoo
	nVQL2sf113iDv9Dtc7QLTVO1EesWTQSn/nL83rxeycya6mgW8l6TaVrHXefoowD+5nZlOV0RV4x
	MkdOh0w7UzwwIVR3G6o/xX3YzVWG3c7/ixcK617fyg/8TR1daqyMM7dB3tgeSUoU9K4O1I4EFoE
	nI2PgqYcFLt7gW8a/q6QtTNXSVmE7wj5RVB1UWCeiGFMRlC0Glgf/lFhcvFPcSiz9W0Dfh+CPj3
	2iv5nj5qCeRuoDbNUbURD0uKdCZAmP3auJPOQc3cBF1NZAZ3ydBCDaNZoVUSYINRyfvOBc/Nq16
	U1vpWfhT5cwx9gXbl7Pd07brQL7tvu5aodtR9oDmiPDJ6mkFNc13DK5DxbbjZCjw27g+BTeRAWX
	8bX77m8tduRaloeZsrJcqP2n5hTqNPmT6Hx94EmnZcgAtwv6QEsqFxLXrzXI8r+tdhoz0F9HBC1
	tQ=
X-Google-Smtp-Source: AGHT+IFNtfhow60LKf3kFnxnyjXUZ4Oc4lyoGvrn1vqt8LXeEwCDevETYH1mO/LwuhCnJBRIxMl4VA==
X-Received: by 2002:a17:907:1b08:b0:b04:5b0a:5850 with SMTP id a640c23a62f3a-b07c35fb999mr990822466b.40.1757870175496;
        Sun, 14 Sep 2025 10:16:15 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:14 -0700 (PDT)
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
Subject: [PATCH v2 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Sun, 14 Sep 2025 19:15:57 +0200
Message-ID: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
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

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  15 +++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 98 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: df86f912b45c20e236060321c85fe35437e9325d
branch: tsc_de_glitch

