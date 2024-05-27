Return-Path: <linux-input+bounces-3852-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8128CF813
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 05:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4780B20932
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 03:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E27F179F6;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYWza3G5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F84523A;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716780395; cv=none; b=IlH88wAPQEVspP28YMo8YJnhBeAegmxkBHoujNr0nr5xHeKdjAKc/HHmMJ1cS3ssXxN/wYQ6C7EK1oukt9VG0ckJPfoWLyxXTGvIvEz4Ej5JNbbrj6+l1saOvB9W+LrTBQzwyJaS3O5zjxO5f78aca9gqdq0ZX4ahTBHOhGBZ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716780395; c=relaxed/simple;
	bh=prpzGhuCLwgnWK4gbCVzha4BTqIB+FEnrv/OgDMS0Wo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TaO34Q9//TScKshyqDj/Xk6vLUmardZYJdcEGv5Ln5hocSYvlIWsBTdJHYxCCXwnW4dyhtQn53LFfUiGz51XO4DvET8Lu76/90ykknnIP30iUhQitsuduFh/dGH1dlcNW5IyvrK8X/imHg8R7DNz217OlkmjBq+/lyGHSO+lDrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYWza3G5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D2CAC32782;
	Mon, 27 May 2024 03:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716780395;
	bh=prpzGhuCLwgnWK4gbCVzha4BTqIB+FEnrv/OgDMS0Wo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uYWza3G5RYCQbY4pRMoOX9ZzFMHiOMekV/IPr+tKi9UlyT7jM5Ky1Fk50AHgx4SCg
	 SChjAn3JVI4mSwmwA/FdR9uFSmKuMAHK1/SoJH7ds5zs+98DOqsU8SF3sqSe1NT+uk
	 wzYzkov6A00jXKT4PW/H3VNJqXIoRYIZK79/BQaXDUuTuo/z3LKXeUpkCDN8/GS762
	 IJxRMz6iaO+OBLOm+RyhVvaat3sQyM1M0dW2p1oeoYapTEcJIJ3m7Qka037lraT4SO
	 5JzY/myZM5D8AsGRyO0vqBETyP+8cUSQiq5ETQWFjI5MXZ40OZJn91BoBY/+q+tOaP
	 mqwKp7ncCCIEA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F253BC25B74;
	Mon, 27 May 2024 03:26:34 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
Date: Sun, 26 May 2024 22:26:23 -0500
Message-Id: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/9U2YC/43NQQ6DIBQE0KsY1v2NIEXtqvdoukD4VRIVA0jaG
 O9eNF24dDmTyZuFeHQGPblnC3EYjTd2TKG4ZER1cmwRjE6ZsJzx/EYrGGOA4EGnrcLgEMFhO/c
 yWAd+nibrAkhVI6+bspJUkCRNDt/ms788Xyl3xqf5dz+NdGv/PqOn/Eghh0qXQihR1FrJRztI0
 1+VHcjmR3Y0+TmTJbMpec3LvKgU50dzXdcfnJBIUSoBAAA=
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716780394; l=1813;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=prpzGhuCLwgnWK4gbCVzha4BTqIB+FEnrv/OgDMS0Wo=;
 b=/fj7cXabk4wL0lsditJEpA4IcJz+MDBlkYvmeKV7ZakhUe2pAOaYB5BunAAFWZyMK1asPVk6U
 0mMUttIFJD+DIWAlBX0us4ScW6BOZJhEl19LrrsJtvDud2tEBRvI9NG
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

Extend the novatek touchscreen driver to support NT36672A chip which
is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
Added devicetree support for the driver and used i2c chip data to handle
the variation in chip id and wake type. Also added vcc and iovcc
regulators which are used to power the touchscreen hardware.

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
Changes in v3:
- Fix indentation in the binding as suggested by Krzysztof Kozlowski.
- Picked up Krzysztof Kozlowski's Reviewed-by tag for the binding.
- Link to v2: https://lore.kernel.org/r/20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com

Changes in v2:
- The generic i2c device id is now replaced with the correct IC variant
  provided by Hans de Goede
- Updated the bindings to reflect the latest changes and also incorporated
  the suggestions provided by Krzysztof Kozlowski
- Link to v1: https://lore.kernel.org/r/20240521-nvt-ts-devicetree-regulator-support-v1-0-8d766c639dca@gmail.com

---
Joel Selvaraj (3):
      Input: novatek-nvt-ts: replace generic i2c device id with specific IC variant
      dt-bindings: input: document Novatek NVT touchscreen controller
      Input: novatek-nvt-ts: add support for NT36672A touchscreen

 .../bindings/input/touchscreen/novatek,nvt-ts.yaml | 62 +++++++++++++++++
 MAINTAINERS                                        |  1 +
 drivers/input/touchscreen/novatek-nvt-ts.c         | 78 ++++++++++++++++++++--
 drivers/platform/x86/x86-android-tablets/other.c   |  2 +-
 4 files changed, 136 insertions(+), 7 deletions(-)
---
base-commit: 6578aac6a270bd6deb9f9319b991dd430de263dd
change-id: 20240518-nvt-ts-devicetree-regulator-support-ac9e49b78a16

Best regards,
-- 
Joel Selvaraj <joelselvaraj.oss@gmail.com>



