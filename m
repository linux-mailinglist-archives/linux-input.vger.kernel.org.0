Return-Path: <linux-input+bounces-3823-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5638CE743
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 16:40:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 253F11F21BD4
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 14:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292CB12C7F7;
	Fri, 24 May 2024 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wb1kE5LK"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D6F126F06;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716561589; cv=none; b=bHTdiPReZB6lSlsDUjcYb4rbGXY9cIdN00NazB4Blb40tdQs7VuBvjt5Lcd2BiLIwzCAUQJ/zrFUizT5LyQKja3eeTdBwXQSsHD6fMIZTPxcQIoHfvbbi0+UVLb4BPL95hmTTlkbnx8XjLWyXR9n3gFj4RPoisuu0yZeQ4251QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716561589; c=relaxed/simple;
	bh=WnxLNupJVJOryf7l5yLGWQgD6VwnyCE/cZW/EX1xubA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jIiOs3np1N86zYdefiFTZPv3kG537VY7u8mtW7DcgWY5ZJw2MzpAQlViSaxubMZFAkqF0dmMyyOsnnLfx343L/Ii5dH2+G/rYsngj5K2CKXevCurDCItcmeuQcM3Vgb4lYgvn9Zrk8lrkAmjjUJKoe6CGjaM2Fl/ol1ZGwFDgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wb1kE5LK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6532BC2BBFC;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716561589;
	bh=WnxLNupJVJOryf7l5yLGWQgD6VwnyCE/cZW/EX1xubA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Wb1kE5LKILnkmLBG+wDmvOJDqaTj4+pJxrBEOlUcZKtTEwk3KYVBam7IEY3YwAnws
	 yUKP5NraFi+PVrXZMvlfFuQR47P15RDqrn/0TD4m1zLDYmWsCAT9t72ukt/FTfVw5b
	 e6a9EumNQucWW4BVQG6UwGiwqO8KoieJeK3p2u/cEI9NqBqbzZzFZRz4cra73rn4hw
	 lYBtH1GY+Y44nayz6nj2SKbm8WBKptiM0fvlEi2erbS2JdTPQsUkchER2xYUJsRCm1
	 DajB82XHirqaiu9IYuTguaKdtZTTgIqBBKdfIU/DgXqHgQQC+HVey1Wcm+az/cSlQo
	 ER6GooD+B+7Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB9BC25B74;
	Fri, 24 May 2024 14:39:49 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+joelselvaraj.oss.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] novatek-nvt-ts: add support for NT36672A
 touchscreen
Date: Fri, 24 May 2024 09:39:17 -0500
Message-Id: <20240524-nvt-ts-devicetree-regulator-support-v2-0-b74947038c44@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJWmUGYC/42NQQ6CMBBFr0Jm7RhasYAr72FY1HaESZCStjQaw
 t2txAO4fD8/760QyDMFuBQreEoc2E0Z5KEAM+ipJ2SbGWQpq/IsGpxSxBjQ5q+h6InQU7+MOjq
 PYZln5yNq01LV3utGCwXZNHt68Guv3LrMA4d8f+/RJL7rzy/FX/4ksMTG1koZdWqt0df+qXk8G
 veEbtu2DyHSnqzWAAAA
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716561588; l=1668;
 i=joelselvaraj.oss@gmail.com; s=20240420; h=from:subject:message-id;
 bh=WnxLNupJVJOryf7l5yLGWQgD6VwnyCE/cZW/EX1xubA=;
 b=yhyitQNPtgrT0jWpsno8N21dVyiLPhcYAPHd0sGgXsFN0PMSiHuIVxO2SpEOiZDro2D/VTryf
 9SdJ10nCtx2BpX/bW3ao1+v3Ng4dIejkaASvEqXOIGJOU/rbrPQ3aTk
X-Developer-Key: i=joelselvaraj.oss@gmail.com; a=ed25519;
 pk=qT4gsuVtlPE0Dpr+tQA/Fumm7wzVP6qfeVaY+6pX04s=
X-Endpoint-Received: by B4 Relay for joelselvaraj.oss@gmail.com/20240420
 with auth_id=165
X-Original-From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
Reply-To: joelselvaraj.oss@gmail.com

Extend the novatek touchscreen driver to support NT36672A chip which
is found in phones like Xiaomi Poco F1 [1]. Added devicetree support for
the driver and used i2c chip data to handle the variation in chip id and
wake type. Also added vcc and iovcc regulators which are used to power
the touchscreen hardware. 

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts?h=v6.9

Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
---
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



