Return-Path: <linux-input+bounces-15006-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB885B9657F
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:42:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D12C16A191
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3E4242D67;
	Tue, 23 Sep 2025 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="LvNmLokf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E810248F58
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638274; cv=none; b=ZgXYDm2Dg9sZue5MsU9kwW1yIM40b7UMDx8VATkAYyDPQEDXOS7HvDnOHCp+2PSlOLCjH5c/SRXBTJ7XM8AyjGowI/Ow9sZHVMh5DTAdbjhv9/cSCQjNlzFYR50ULLTFWPh6mxu2zwNRKoKe7vkap/145wcozmqO1EVisegWfMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638274; c=relaxed/simple;
	bh=6I8cNrAL5aASSx+Mq693VRQEuVTbmLc4kgQcskbdlXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JpN5LDPBeWcyYCDrL63ep0EfGRdCzOIrataaHNA63VAU5SjoEhpuiEJt0FIOz+cBDYmHCaOOz2R1HOGR86Iec5PrblF2NDD1BWyjydDLzkTDlhlOFJuFOpBde9NLSjZ3WKRoQ5ZWAp352oDtBeMsh1mIFmGqZdyjROi7xppCw54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=LvNmLokf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b30ead58e0cso106460166b.0
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638270; x=1759243070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=;
        b=LvNmLokfI31g8NI5TgZwt/hZeM2rgaJrnHzKofxablCCFDLK36NsDMTSxhT7TgdNoM
         sP+EIRPf6h9U+w230bVh8ze+KnNdZJALMGyur5PgIJaxxXZ4y5Pjdro3wf2vFaZ4yE72
         DFEjQqDBXEkPEaXD2c4vJEXlU0tGeqxU/7k5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638270; x=1759243070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=;
        b=GeY+A3J3VF44zlpOmnkTg7k3RA4PhivZPStQb9StDKKlMpF2HqhCa8nOGdxdnEGSCD
         tzo4vbkc0rVYpbiKP09raLThJzppINir6+ar7mCbCznJph1iSPeW1Up6GuSSRrOv2u6t
         xRkpRWSSrbcW3lM1FRciRL+CIyayXl4rdK7/E2o5aeXoaTcvSjnha3aHuPpHsAdh0iXi
         oie+TFdB0iZtIMd0RxCFe7knba6J212n5M1xwq+nipSBvdw5dvUvE0j8fVLaxQx1rRTk
         rynXd8NazYqwkSegPi8cvqFOhdWEWjhLDBoKi38dUmvgNl+zIlJuWrgNEEa5eeD3a6y0
         hN7g==
X-Forwarded-Encrypted: i=1; AJvYcCX1AzrVyLHKAFyZ48eweFP7++BbDLlwWSj+UOOqorvJoucMPO4nBgaDI9bjpx2nKtBdCDjhAPen0IzZNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtM+geFWfD5QHy2wmN9VEwxuugNxh+DkaQPalGn+9wYA4fOg9m
	Cu11bCQlr+6d7Xouy/WTnyvrmJ6Dg0ZYdtrLckugQDiKxCSVvfy0xtyRsDizHsSlp3k=
X-Gm-Gg: ASbGncuqwzLSoDq6l0/9Js8p9pgBCzjUG/hW660D7yegnVYaduIzxMSEAUE6taBpQOz
	akLtyr6bCbqqm9TSqtolfoXhrA8HlVqnOPnVdz5RhP+ML5AAp05JIuudw2moEgnScQ2eB/S2H6J
	HoGOb34/E2o7yShFS1I+cZ5nSXn/gVrh0RGq6KwJjhHXa1vUsWuTUjvW30+PeBkZ8qIjvpCQ1DB
	tr3ez/Ju+zDz2maMiDmSykYZQeYSuYa/y7bWhgbe2yTwCYI/Y2Vuf3cIFI4sZ3+KzRjTM3V3+tw
	3si9oamTSh03f9Ka86lmNNju86M7zaRpqM+nJoM9f6r8IQkBfxL6rdig8EMTcD1i0p25ebtCf1y
	vFbusjwTkBGl6s/Jl09LIc4JI+6a5LfJxJV2WMGxPor44QBFzUC6XgMSSOx1cHmAH6gwUASywzh
	VhIOS4yMz2cyUjWelGiMwSGFrdB8MZJ5ZBDLuSsyjMjES6nuslovMUtRSEKvzws1Ud53Wh/ShRJ
	T7uY+XSQIuQzx22MOAcXw==
X-Google-Smtp-Source: AGHT+IFwttb50sZUcwgmSz2G3CQLQR5bfVABRjQhUNlQEOt6l2vdv9KmhVHV1IgxO1W1paqY4PecbQ==
X-Received: by 2002:a17:907:2d11:b0:b04:a1a4:4bec with SMTP id a640c23a62f3a-b302bd129eamr273054866b.58.1758638269935;
        Tue, 23 Sep 2025 07:37:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Tue, 23 Sep 2025 16:37:31 +0200
Message-ID: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
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

I didn’t remove patches:
 - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
 - 1/6 Input: imx6ul_tsc - fix typo in register name
even though they were accepted, to avoid generating conflicts detected
by the kernel test robot.

Changes in v6:
- Rename the deglitch property from touchscreen-glitch-threshold-ns to
  debounce-delay-us.

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

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
  dt-bindings: touchscreen: add debounce-delay-us property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 121 +++++++++++-------
 4 files changed, 96 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: tsc_de_glitch

