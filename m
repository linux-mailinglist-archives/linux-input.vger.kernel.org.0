Return-Path: <linux-input+bounces-8249-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 930A59D9E83
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 21:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34E10B278A5
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2024 20:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564591DF742;
	Tue, 26 Nov 2024 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9mYAE09"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C99F1DB958;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732654094; cv=none; b=gK9ir6KC+pM9iQXWCNXguu1jxXJ/H7udTgPReMBHn4XPCd+CFUPci5a+2LFMSi387ON1h9fzlozOPx0nJiwmjeLAxWDuJLAIXPEsyVVYz/nz6oGh7NiUn+R4AWYxVEg9P4wqEcAikVXnDPLy6Zx0yQf8mXr2ZItPKhKyVOS0ntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732654094; c=relaxed/simple;
	bh=ZBU8Fy8Sv/FwJD6yKpClEj3SItHuR1C5MYFPcenYJWs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s4clrTtUNVYnDs32OErz2LIerpXVhPACE7CGLPucpQzev4m0XprwB8KY2w68LuQ3lbWfuUiWdxHCD0ECSF2n0vZh1pOF/QxMaqz7rvro8WeaxLfVSZWjXFq2yUKESMVsGONKIoPXtH5mJMZ+ql9nYcZ+37Pf/mnsOC1NmBoCz+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9mYAE09; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5207C4CECF;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732654093;
	bh=ZBU8Fy8Sv/FwJD6yKpClEj3SItHuR1C5MYFPcenYJWs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=R9mYAE09x8YrOnYi92GSKx1q4f2idlS5Lh2wBvoWVjn8CkHf4dYC4rkk3PmgRsnDP
	 S2MzaitHsbalovHD1L6GQBp+BNjXs5CcOnRGlS9DJ8F9DPgEUfkw8MIGWuxHm6Bpgs
	 eEfmDm5CrF/LkXUyoskHg9YI08sBv5uPM+4loheiDVR7fzdRoXhlWx064VzUq+x4gL
	 kqmDoTiXXDQABaEWlRp03e26NAQXO8iXvqSv4oEbWHFhaAdJvgCOCSrVf+KjStgZYw
	 /CAYvzfZ4pUpnruipS1ayaKaCBP/uOrCppMM1mPjBItHP5hs+FtVp91bJihfqe50q9
	 5rJyNXjs5cEig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D5EFD65525;
	Tue, 26 Nov 2024 20:48:13 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH 0/4] Driver for Apple Z2 touchscreens.
Date: Tue, 26 Nov 2024 21:47:58 +0100
Message-Id: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP4zRmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMT3Soj3WQDQ6MkUyOL1ESDFCWgwoKi1LTMCrAh0bG1tQDHCvI+VAA
 AAA==
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732654092; l=1728;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=ZBU8Fy8Sv/FwJD6yKpClEj3SItHuR1C5MYFPcenYJWs=;
 b=EPyBrRhCz60QqrUaFxi1MkFuNhZO6e8bc/6+SNKD6Cylw/79q7NOFNe9CUIP+7jIQEFDrFVIc
 fsNWUEUOiIZCm7qEFDH18CdE4WrB+YB2/Z0k3HvMNvnkl3oL8QRhHrh
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This series adds support for Apple touchscreens using the Z2 protocol.
Those are used as the primary touchscreen on mobile Apple devices, and for the
touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
in charge of speaking Z2 to the touchbar).

Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
The changes since then mostly address the review feedback, but also
add another machine that has this specific controller.

The extra gpio needed to be toggled turned out to be a quirk of the
j293, normal CS is unusable on it, and a gpio has to be used instead.
(j493 does not have this quirk)

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  83 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  24 +
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  20 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 495 +++++++++++++++++++++
 9 files changed, 671 insertions(+)
---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-z2-c012b528ea0d



