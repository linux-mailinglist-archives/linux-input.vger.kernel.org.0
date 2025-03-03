Return-Path: <linux-input+bounces-10509-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 946A7A4CE74
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 23:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEF591740FC
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 22:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9905D238D32;
	Mon,  3 Mar 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PioO9/WV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5F02343AB;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741041424; cv=none; b=TALTsYLrGqbtkYvwuqKj7M4j1zChMomZAdMeua/DZOaZE5xmeYqTk7QR4CbtaxPGSSXt13sgQpWVNBnN8joppWaIkHvcki83VW+0GpMDpzJptz7AlN34/R5s4CCOuA9w3qD4r9wmWmjNDmcaK/JLPHZg2Aw0ufgO70/3DwJubIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741041424; c=relaxed/simple;
	bh=AAwL5uoOTe6wCwpJpDywIRpKXFmiHBgm7TpEJavHXSQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IiQamMuX8lp5UB+hX39rDl0zKPf6hB9hy7HvNHBmmP6Ctdg9bXIkn7Fd82EzPNyYjzTDnzOLSoSL4o+wYd+RKRKgd4MOSpjYydoFjMTePThDW8Gg8e9BJt9zB4oJ1BWIG9vFDpZKp5IFaxNhcF3ulTB5St9lO0l+loSB+zpixls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PioO9/WV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8463C4CED6;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741041423;
	bh=AAwL5uoOTe6wCwpJpDywIRpKXFmiHBgm7TpEJavHXSQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=PioO9/WVs4P4H3kkPurA8Vv7zCUThGkYiQ7u1KbDRPHAq3xeJMhyvswGrYgAk1WYB
	 44/xgXM28ekWTMpUPcecYzzK1rVuqEshuSyFA59LDF/mN57ovSOEhPlNmzZ7A+2m0E
	 AVvXpcrlNOqcIVm9Sl15KwUTrDjHDGWGbcg33yjZGUmE+84qaHUnATzVvlOXGZjqHM
	 Ic1UB3Et7C3yEzo2iDrqJjCD62rhmNksFaFfw9ZZHoyUA2y074tYFasHF6isj4PVtD
	 z76W+qkysJV1JToKDNUKSACNwxeGfZB3ND9NKcLF8Nm22Jf4hHo+sFdaaBZQV2huQT
	 eXiSeoXHJBXsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC0CC282D0;
	Mon,  3 Mar 2025 22:37:03 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Subject: [PATCH v4 0/4] Add Xiaomi Poco F1 touchscreen support
Date: Mon, 03 Mar 2025 16:36:54 -0600
Message-Id: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYvxmcC/43QTU7DMBAF4KtEXmPk8U8cd8U9EAt7MqGu2ji1k
 whU9e44rRAbqNjNm5G+kd6FFcqRCts1F5ZpjSWmsQb91DDc+/GdeOxrZlJIDUJYPiVMA/A5Lbg
 vmIlGXpZpSnnmaI300ErsUbIKTJmG+HHDX99q3scyp/x5+7XCtv0XuwIXvA8KgoQOOjQvh0THQ
 sfVZ394xnRim77KH1GK7qEoq2h8S9YqR4P+S1TfohFKwENRVdEPAlAFJYL5TbzeK8l0XmrN870
 XFnwhXu+nOO8aFBRao50m43rXKe0Hi8FvYysdOQE2SOOhYtcvdPVsB7sBAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Joel Selvaraj <foss@joelselvaraj.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741041422; l=2842;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=AAwL5uoOTe6wCwpJpDywIRpKXFmiHBgm7TpEJavHXSQ=;
 b=ZETUobULmmXhyhIGzHqdwoGOGOnpjPs32JZM3DQR8vuUwgI8D/VvKYwj+oxKlCx5C2iXlL90Z
 CL4KpMOKJXWAOcF5NglFXw9lc/krCFjR5hbvNpZZCOjiTA+o8ZhlNA2
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
Changes in v4:
- Update the dt-binding patch's commit message to be more accurate
- Link to v3: https://lore.kernel.org/r/20250301-pocof1-touchscreen-support-v3-0-af01c3b30b55@joelselvaraj.com

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



