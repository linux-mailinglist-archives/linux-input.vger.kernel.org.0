Return-Path: <linux-input+bounces-10474-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9EA4AE6D
	for <lists+linux-input@lfdr.de>; Sun,  2 Mar 2025 00:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBE783AF571
	for <lists+linux-input@lfdr.de>; Sat,  1 Mar 2025 23:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 409A41E98E0;
	Sat,  1 Mar 2025 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwJGGqM9"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE51DB546;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740872605; cv=none; b=XP+gmBwlu+xupUJZRNDIHpCLwPjtPyMAcvKXWjTxNDCAlcUSI+XQLal9F1N6PuDfgu9DUX9ZMA0yp5S+fCrU8O9YuRvTenSY3v+yVNi+HI9nB76h+RwwtVAcIkGMiqZexivM/+wQp8NfnyGXwCgO8VZNRm7jZNGfqZyzXlXEoB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740872605; c=relaxed/simple;
	bh=K9r+CeRz9jBowVrKSobN2M/+LfenUmgb4FvoMordLq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=c5d+/TcQITI+DtzIJ5Sb6ITa7o6wsPF7vV64SwYp5yNs6Ii8gfu7yeVcV2aqWJgBjEkyh2Sl0WaVCFa1SHRF7piPhN7293UAlcrcHcWtuzXi8YrdtWE4jZm+bhWTy9AwukA4lEsNCHxuBcLqT0e+sNkXKo1cP5BaxRTqFad7Tks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwJGGqM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55CBAC4CEDD;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740872604;
	bh=K9r+CeRz9jBowVrKSobN2M/+LfenUmgb4FvoMordLq4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KwJGGqM9zIz5uDWkc9bJ2sPJWcUbMl5OSO3a/lwLsHw0KC62Pw4tnrDhW7absHTL/
	 eWNHbkUHg+ZRk5ufAGFX2x1eZ5rT9/NCmHlDDE17aPOEnx5zYdzGp/Z+yuvbTIbZxD
	 8o2SyW+l/EOlLbLNF2rm4fzlrCDOK+MKFG2flRnK5V78pPT4g2lNcnesz5xkpUAOqx
	 erIIpTmaSdnYAiYecSYEZCdzO2jce+sDZXL/A+0jBkAXlzBymLQ0Wxrqi8rAdfxRgF
	 7Ziwsx1N3KUVRr6RJeCIItgSt9zhL79XKT4g9gsMIyHuSXZYazcpW6SL0NfhYBVyVl
	 sKytPvQdW2wrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE21C021B8;
	Sat,  1 Mar 2025 23:43:24 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Subject: [PATCH v3 0/4] Add Xiaomi Poco F1 touchscreen support
Date: Sat, 01 Mar 2025 17:43:06 -0600
Message-Id: <20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIqbw2cC/43QwW7DIAwG4FeJOI8JnBBCT3uPaQdwnIWqDRkQ1
 Krqu4+0h12maTf/tvRZ9o0lip4SOzQ3Fqn45MNSQ/vSMJzt8kncjzUzENBJITRfA4ZJ8hw2nBN
 GooWnbV1DzBy1Ait7wBGBVWCNNPnLA3//qHn2KYd4fewqcu/+iy2SCz66VjqQgxxQvR0DnRKdi
 o32+IrhzHa9wI8IYvhThCoq25PWraGp+028Pw+I9LXVp+TnFczZRLzOzz4fGhTketWZjpQZzdB
 2dtLo7F72YMgIqR0oKyt2/wYyMb/xaQEAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740872603; l=2644;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=K9r+CeRz9jBowVrKSobN2M/+LfenUmgb4FvoMordLq4=;
 b=h5QRTpLlN5FZdTNMPQYqVJJpB7q3bFovbFwyIclaQOZoTTn2kogF5215WuTOkS4aWVdMwa6kH
 lErUZiNdq5nBzhIYgZlxtqYfyHx50a1jqG6l6QYNVpv5tWb2fAaLTCI
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

In the first patch, I have updated the edt-ft5x06 touchscreen binding 
documentation. In Xiaomi Poco F1(qcom/sdm845-xiaomi-beryllium-ebbg.dts),
the FocalTech FT8719 touchscreen is integrally connected to the display 
panel (EBBG FT8719) and thus should be power sequenced together with 
display panel for proper functioning using the panel property. Since the
edt-ft5x06 touchscreen binding uses almost all the properties present in 
touchscreen.yaml, let's remove additionalProperties: false and use 
unevaluatedProperties to include all the properties, including the needed
panel property.

In the second patch, I have enabled the qupv3_id_1 and gpi_dma1 as they
are required for configuring touchscreen. Also added the pinctrl
configurations. These are common for both the Poco F1 Tianma and EBBG
panel variant.

In the subsequent patches, I have enabled support for the Novatek NT36672a
touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
Tianma and EBBG panel variant respectively.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
Changes in v3:
- Fix SoB email id mismatch (suggested by Krzysztof Kozlowski)
- Use unevaluatedProperties instead additionalProperties in dt-binding (suggested by Krzysztof Kozlowski)
- Link to v2: https://lore.kernel.org/r/20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com

Changes in v2:
- Fixed the missing "panel" property dt-binding error reported by Rob Herring's bot.
- Change the "input-enable" property to "output-disable" in qcom/sdm845-xiaomi-beryllium-common.dtsi
  (Based on a patch suggested by Konrad Dybcio).
- Link to v1: https://lore.kernel.org/r/20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com

---
Joel Selvaraj (4):
      dt-bindings: input: touchscreen: edt-ft5x06: use unevaluatedProperties
      arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
      arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support

 .../bindings/input/touchscreen/edt-ft5x06.yaml     |  9 +----
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 +++++++++++++
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 +++++++++++++
 4 files changed, 86 insertions(+), 8 deletions(-)
---
base-commit: c0eb65494e59d9834af7cbad983629e9017b25a1
change-id: 20241007-pocof1-touchscreen-support-c752a162cdc2

Best regards,
-- 
Joel Selvaraj <foss@joelselvaraj.com>



