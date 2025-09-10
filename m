Return-Path: <linux-input+bounces-14581-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477FB5189A
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 15:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19B3563E94
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 13:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F0B321F37;
	Wed, 10 Sep 2025 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="RX3VqmJa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC1321F31
	for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512763; cv=none; b=eqys88THcaFhMEDOA3QueIolFPSmcvwACkHXYoZ4P9TbsgFWY03gns9k7dm1z5s3UPrtmvw00/rdhtV1f7VY+DuDJaP2zU40FVfDURBYtQNCtwfg0WcvuFo2itRdqHxrhuHn+ti/TKoHmdlcF/emo8QmGIfWsCug2xaWUbMI/Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512763; c=relaxed/simple;
	bh=AWJAwvgvveAZl1A50d2qJ+nKO1wYxvt7+BQ4m1FIVUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3ZB5DKjMKHkMXQcxgDBupw5JAwXKFslh9Q7dXKKC8noukAWFlM3+6XKHu7D71t1ys9L1DIiaTESot3Sg/VUJA491gREDUjWM5FpwLT4F5ByxP6NDi1Qyxybq2dEVDOQ5EA0Vc2txTnm59DLC/f0srdCq1Cb6O80Q2tnW5QDE98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=RX3VqmJa; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b079c13240eso45139066b.1
        for <linux-input@vger.kernel.org>; Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512759; x=1758117559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=;
        b=RX3VqmJa2b8O97kue4xrkVpuhLeNv4D9ml/AFe2APfEmDOQdSkzAZhdTPcCa6RJGIB
         HC0IsQAPjVWcysCb1nCZeQQ0i/GMIGXvoV+DpkgF+jRop6gF4N4eQ32MSt53eBzHQbCv
         39rzGJsWFL4P5SF/M2b3IEbnwvLqK2ECrRuXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512759; x=1758117559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3o5U5m9O7nE0eZDTkvDCuOBdIrzGojz2eY5IrxD0WOo=;
        b=NzyiPrZ36wmKVMkwat4Sjfht+RN0Qt0khk8IEfagLM03X9D6t+71Lsa3nW4FYwJriX
         NFslpMijNY9uq9+Q1+BrMNl+3lrIWWZ8lhsAdbl917w9tW1EQrJtNWBCPUn8WUjoIdnY
         tfVe4cbFSV66Q+3WwWL8Tr7urZMLY4F6OBlLay6CH6urbMCZr5+9q3ZuDAKf9r7WLV/F
         PwNleZ7hSrMbWPYOZ8rJdQlLXfedXPO0b3jBWEdfU+2ULgQbkdbKBpY0Aw1o5s0ek6BB
         x9MCGJ3hcr2z4OBFmyFV/TdNDPGC/H3TZj/pi9y7sXGZX/oFHBi6xPQGnQaCSKp9aQup
         JXCw==
X-Forwarded-Encrypted: i=1; AJvYcCUOV/+FC050jzcqlxb0M4qfX/BdlysS//JU/kPK3QafQksDEC1qqZH2oYD9jFR2wd4EVrr/c8DT6eu9nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgFIhL3Bko3jvDKzsc2X1FG50De8Dc9339qvYQOHnmHIVq3mH8
	JraI98ly5U1HTpdxgVXqOVVY6PvCViDnbokEdkwzXT5J0hPODHcC+Xy/KiOxWGKuWGQ=
X-Gm-Gg: ASbGncuYmkO3NLGG2/UJl962JlUzyp9y7Yawbu3M0eIvJ1HjwIfbuUjW1XdDT/lvnz0
	2oyVwkT2odgUwBc7bylMjhuLoPqFbh/9cJLw8H2BD+x7O6uXJDnGEKlYVkbLeqVyU+mUHGLSIji
	dufIIjHTaBTzO/kOLrub1YWILrOtRWc+M3Wps5iG1CwPVHWtdriakL942vl7dlr8+WMVR9Y9Y2z
	9aY9FrUTXKVdQaNemTl3kExIJOWH3Ppj1Qcmf1pmUGXZ76e7K96FBrB2VerP4vUXhlEIyCqRyNl
	yq1bw114W+d5C570Uryrk/qGj2H8IT9gI+mCqYqbQpKs0erVjLxaRWcyAxP2hU+dDi/DOlen8KF
	+LSBBgJlZszuOL+qZ1+TGQhfFUh0C9GcCepPH+1eu835WN3WJDufDwkwjTrG77zR9zL8yH1BjOK
	zLSHCRtLTrLc43u6r9oE59SXakDBcjtwOma1HSHgrDa03ijY5L5dU2htywdIO1IJILk33TjuLsM
	Gg=
X-Google-Smtp-Source: AGHT+IEM5i1cMh4aLi1EphlUfiAbqmiYBmZm0lNR7FL1Faw8bxW5JsLRVOWS0WjIXeABAYnQD9GwCQ==
X-Received: by 2002:a17:907:3ea2:b0:b04:1b90:8d7a with SMTP id a640c23a62f3a-b04b1463381mr1739025766b.27.1757512759136;
        Wed, 10 Sep 2025 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
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
Subject: [RESEND PATCH 0/4] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Wed, 10 Sep 2025 15:58:34 +0200
Message-ID: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.


Dario Binacchi (3):
  dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
    fsl,glitch-threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  18 +++
 drivers/input/touchscreen/imx6ul_tsc.c        | 112 +++++++++++-------
 2 files changed, 86 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 9dd1835ecda5b96ac88c166f4a87386f3e727bd9
branch: tsc_de_glitch

