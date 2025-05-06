Return-Path: <linux-input+bounces-12179-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60390AACD03
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 20:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4EF1C40DE1
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 18:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8852B286424;
	Tue,  6 May 2025 18:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHvdqk+R"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACCE278778;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746555529; cv=none; b=Mqv55+IEo0ywp/uih69/gSnlX2C3dJuQLJ8CplZ/fqNA6AuwN7eWtRRN1QAPsMYN2IL+FuhACcrHXlYfEPVJxfUZjb1gxWCwa6PIDWHLUiCRPI0NpX4drISkIvoWyL4fRHaWLQY2TLIaKEvYw02AKcf1+wr0yL9yOzcs7faO220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746555529; c=relaxed/simple;
	bh=AAwL5uoOTe6wCwpJpDywIRpKXFmiHBgm7TpEJavHXSQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f2m8+FDVRSFkGj09QA8ffWvi/dqwGmm9wBlW/h8i8aIxSCLG8jDonZkaOp2ivNKxaIDL+het5xBqDBQ032IEAdtyM4THjUVzpTvfZ4zAWgyYoH+5MHkxNQwNIhZi8bAFblDKx0hTRZjJcY8uAJvXUsL20VpsMEVj2T9JdyAvQK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHvdqk+R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15ABC4CEE4;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746555528;
	bh=AAwL5uoOTe6wCwpJpDywIRpKXFmiHBgm7TpEJavHXSQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dHvdqk+R7rdmoZ9kFh+KjtQ1zUblgOvfZCiBYbKbDX/JONpmEdwpFfISCL69w3YWK
	 ++DIbe+3bUNJ+sdCqMe68Vf/Q9qZNKvo/OuN6dWNO8RdNTTRsUPc8iOp2mxEzO86Du
	 G9aH735ezk6iHbnmKRR/OHGyWjcR5351ALAVqFTM1LJzzqOyAMu2nj8FJh5hz5zwDt
	 FWV4qzrk78a8n0MUSrLgZ/ZOptScAFoFD9qaft0kSeg+Xuv26Wj5GQFvp7FHBenjWi
	 BNlWPfIEpk87NqF6aNFVZ4eLSDuTI7/1mYocYuNVt8RRBx3els0zBCg9rKRvXPG9sT
	 kHig0wjF/l31A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF040C3ABBC;
	Tue,  6 May 2025 18:18:48 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Subject: [PATCH RESEND v4 0/4] Add Xiaomi Poco F1 touchscreen support
Date: Tue, 06 May 2025 13:18:37 -0500
Message-Id: <20250506-pocof1-touchscreen-support-v4-0-bfb53da52945@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH1SGmgC/43RPU/DMBAG4L9SecbIn3HciYGuDDAiBvtyIa7aO
 NhJBKr63zEBBAON2O5Dek5670QypoCZbDcnknAOOcS+NOpqQ6Bz/TPS0JSeCCYUZ8zQIUJsOR3
 jBF2GhNjTPA1DTCMFo4XjlYAGBCnAkLANrwv+SO53D7u7W/JU5l3IY0xvy82ZL9v/8DOnjDZec
 i94zWvQN/uIh4yH2SW3v4Z4XPRZ/IiC1auiKKJ2FRojLbbqkii/Rc0k46uiLKJrGQfpJfP6kqh
 +i3JVVEUsiUqPHqRV4g/x/Bl2wpepPHD8Sty7jLTsj2HcboChr7SyCrVtbC2Vaw1491FWwqJl3
 HihHS/Y+R3Z4NAbFQIAAA==
X-Change-ID: 20241007-pocof1-touchscreen-support-c752a162cdc2
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746555528; l=2842;
 i=foss@joelselvaraj.com; s=20250506; h=from:subject:message-id;
 bh=AAwL5uoOTe6wCwpJpDywIRpKXFmiHBgm7TpEJavHXSQ=;
 b=INuU4+qYGCE/v6P5oMl5xtD0ThiZimqH3pLqAa6TCOiX0ZoDbVdCM1e4NImNyO0ctlVed4g0M
 hbERnbpVHQsD5B6sUs9tlg3rRW1vCour20TigfYe5jd2MBnHgYkIOKM
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=/jk63vyofgC3YCat+t/kcBv+rlSEVcI4PLN/LN0SQlQ=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20250506 with
 auth_id=399
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



