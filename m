Return-Path: <linux-input+bounces-14858-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48023B85CB7
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 17:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2C3AB4E219C
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 15:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B97F23B616;
	Thu, 18 Sep 2025 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZQV5awpy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0AF31283A
	for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210767; cv=none; b=Yxx/HiOmsItXzLs6ipCeRXT6lmBKOMlPscqZi1D+C/JC1vhUsmPivfYsVxtNUtNuztf6Pm8Cidbl1cVWurr13pT10d+4elFBhWzTE3jMQOccaeJuNkBXz3FP8Ku1EUuuzHa66Ln9m5ywwfK/rl3eI7rpaHd8UjigSR6ZsyBBXiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210767; c=relaxed/simple;
	bh=XEbVT5cHI/ZnCfuYl88356BThxY6qeHy1joKNaxu4iE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mfdPUKv3x3kGKlXK8kT5ULJa8odcAErbsT8KQcHjOzZF6SENk041m5bphQK6Dwiedj6Q0ynS/fk0s5znenbrlMcx4IgRIwkm/RmFGtt2pK/P3omO5EHgumZt7JymlYsnuFeG/nox1BsmAkNXAmNdYvUbICKkG5RgiZWviAtrg4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZQV5awpy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd2so2338136a12.0
        for <linux-input@vger.kernel.org>; Thu, 18 Sep 2025 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210764; x=1758815564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=;
        b=ZQV5awpychRztLaM28B//NRni3sBVO0CZHnvdb5eCqu/8ok4slX9R8bCmSekCJMp5C
         Vyfi49ackacPUutjM21YsZgir3x063OJ4ZQM2eizO1ENtXDl05e9NSuPjYFjEZUxVJnr
         cLDg4PxdH8BOwYfESx+sSDIlLDhhgU8uPZsks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210764; x=1758815564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=;
        b=LVNaCv4L6JczZZdZeGpQH77kMS9vB+eKhgw1+7D36wTlVhTEM1ENwokgKSCvFaGEVz
         9b14gUo08XjL2kIwbGdA9nX7h2buv/LvWlzrN9EQ1yCM2lktlNlE2rDOW6k0HAD3kxwk
         bhA1H3khxlLR3q6ivb52LHn6Dz+VtiZpFHgfytZX8kvmr0w/k3rPiAAM95wT4HKHySky
         4lXc89kZQoQxdCV1BJn/kqeClPhJfvexeEwpt7gdcXNfpFl/KVzRaec1Naq3l0swEBDZ
         wc3Enye/XzvJ32dgUkrPK4EX+NpO6V0+cIgaoT0t7qgJSD6EcCiZMLksLktp+CyRdD+u
         MdlA==
X-Forwarded-Encrypted: i=1; AJvYcCXjA62Sgy5FDACk1AhJiwl/huWDre9klOjqHQR2estBF0Z82KzN/lFOqAeLyt6Z90HRYK8/tyRwg+eaEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ1zPCH7CJAJ8bqbWtaOMtbqL3+lfqvXxRBEpAMcemDYL70GlA
	tXDZbgK/rtJDYAQm2afoPWqRd3aN3UdR8FIC/FaaptXFtktwX9Mc1i8Zi2+TCExROYU=
X-Gm-Gg: ASbGnctcVdugA4eEkHhGFQzCjR3DkO/ISagppb+IHlB3LfXOgY4xmjDHppn10D+uYw/
	qrEi0839W5zWi8RiE6S5SF4zyQTiyyl1WDsh4RyKrrPqvAh4v/Q5I5htuNHt1WL+n2C2/9FS0Ts
	PBxnXTCWMTFCkO1Z0WJGGp0DmaTrbncs1Y9TRTB09MDYyuPTYqwNf2apj/u4+vdVQy6V9vA+99w
	rskmjd39GS0n5PuXP0rVQUEV5D0rzGtc6V+aCOmwSM/ukJp8dXuJYeuE+f23B0TC6AFEiREWgrd
	DxamNUVZlZI0P7lLgKjSJcSzU1Tigp0EstHjyuCEgukJ+ytGgtA107yuclH3CZFYCgqrry6Ts8I
	/QpBS27eCrkUDB5P/EhYbMWkGwsqib/VvIYrhcLltbVJKtMm+vNE7xE/7YkFSbEitZHchwfKB7Y
	bYoUGod3IQ3WKDwTt+vj1KIkWhYXEuT6TqK4vxWJas71T/upxqc2f/UkZ1nFlH7qdd/O30I6a6w
	fE6jy84AFs=
X-Google-Smtp-Source: AGHT+IGEnllZKc46D2GPpX8tp6qlYesswGm+zRYFM4v7XWzLwEmIplTDvSQ6hbelWc77fsdE9AoPPA==
X-Received: by 2002:a17:906:d145:b0:b1d:285d:185d with SMTP id a640c23a62f3a-b1d285d2b12mr512201366b.0.1758210763485;
        Thu, 18 Sep 2025 08:52:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:43 -0700 (PDT)
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
Subject: [PATCH v5 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Thu, 18 Sep 2025 17:52:28 +0200
Message-ID: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
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
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 97 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: tsc_de_glitch

