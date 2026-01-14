Return-Path: <linux-input+bounces-17090-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB0AD1D8B7
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 10:31:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 18EA5300FEC1
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DB93876DF;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5MW2VGN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525537F72B;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383071; cv=none; b=Ba8zx1RyhW8BiBVTiiT8FtQi39XdqJeo4P2CM0Et3RHJxoIyoSRTJVrM62X2O6iRFTFw66yewxpCByIqNnwCWAKRdiV9+nKFAydKWWHbRwJCxqU4AHn4qVCl4Bw8iPrtWzEfMkKuzyZtT+b2qGe6xR7rW8i35ITdQL2jhd736YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383071; c=relaxed/simple;
	bh=TG1VRK73rsFwkrCWwreBjkTZ7tI5mr/BPnHTVBIyQOc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wr8YVECk+yxdttsDyX4cxxgCrghCqp4o+6vqpyY5w7rDZ6O9Pq5uSgDuZAFTFJFTIjOEF2EucMHEsas6XTWuy05VMZOpiFjhWRYt1aQr/dbWPYuBrylxYG8/u47AdHLiCfK6QsvU5mGnDxgpvL/vxKVZYCJMT3Fl6mKCJzilxlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5MW2VGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06D7BC4CEF7;
	Wed, 14 Jan 2026 09:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768383071;
	bh=TG1VRK73rsFwkrCWwreBjkTZ7tI5mr/BPnHTVBIyQOc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=m5MW2VGNjYQlRdYD3jEUu3GotlLJiDaKbAzveF6vUae+hYWB7uvFkAAPRdRS9tqZg
	 E9xy8TECbqD+IeLw51ZotKaNrUvREFYJaPoos1OU3aT6GsAaA+hhFtIpyVxyoEIACi
	 O7DEFK2M4Sc1mD0xZyVgpEZINKzNKLeA57R/VyPI1K9ibEM1I2uiYYZnt3g+fEGB9I
	 W178czGaoe98tk6j3MxeBAVCokwwkZ/8EVuhX6KhwNuL3frYMxiSl1zRYdC50CsgN5
	 p0wdi9tmQq/rFXVp48xFAUPjhki3YjJsP4zrwA5JORmzQK2FEy1ety7Y9AxMsKE7iL
	 VsZ7v869UGAHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E73D31A04;
	Wed, 14 Jan 2026 09:31:10 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] Support FT3518 touchscreen in xiaomi-laurel
Date: Wed, 14 Jan 2026 11:31:05 +0200
Message-Id: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NSw6DIBRFt2LeuDSAwX5G7qNxwOchL6ligJo2x
 r2XuoAOz0nuuRtkTIQZ7s0GCVfKFOcK8tSADXoekZGrDJLLjgvRshJfNmSbEGe26GIDZmbQSCU
 745Q3UJdLQk/vo/oYKgfKJabPcbKKn/3fWwXjTAt+UxffSueu/Thpep5tnGDY9/0LbwYJOrYAA
 AA=
X-Change-ID: 20260113-touchscreen-patches-beb2526bd5fb
To: SzczurekYT <szczurek@szczurek.yt>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768383069; l=1085;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=TG1VRK73rsFwkrCWwreBjkTZ7tI5mr/BPnHTVBIyQOc=;
 b=F/5PBPJdxPQpBNNxG38MLAbRTBNoWnxPPrSXa4s05zXS0dYj/Rr2EsIW2vsj+0efBdDb9Hlm9
 lkJahEN6cS0DPlYAHRwsyNsJA4BgojCuRCD68MU7bEF/Zee5NBVltJu
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com

Adds support for the touchscreen in the Xiaomi Mi A3 (xiaomi-laurel)
 smartphone, FocalTech FT3518

Original tree was here:
 Link: https://gitlab.postmarketos.org/SzczurekYT/linux/-/commits/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v2:
- Fixed name and email in signoffs
- Link to v1: https://lore.kernel.org/r/20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      drivers: input: touchscreen: edt-ft5x06: Add FocalTech FT3518
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  1 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 34 ++++++++++++++++++++++
 drivers/input/touchscreen/edt-ft5x06.c             |  6 ++++
 3 files changed, 41 insertions(+)
---
base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
change-id: 20260113-touchscreen-patches-beb2526bd5fb

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>



