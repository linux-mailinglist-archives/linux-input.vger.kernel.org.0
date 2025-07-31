Return-Path: <linux-input+bounces-13746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED878B177E4
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A97A1C273D1
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F7E256C76;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsSjK7Nw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BFE17DFE7;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996623; cv=none; b=UtDCvDtMKDrnVilvjPq+nlZwXpg3h2lO4oeo9oJNAp06coGXJYeKm6knGstrFAv/IjCVXaA6b9glGXGLZx52cK1/AW0QJaG0+/j6/5s3oJY5tZ7Ovm17RDyOGJCo5sgIHEwINlddZQn0dwjAzhSPzyjyHJIM/azeceN3MhuVtMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996623; c=relaxed/simple;
	bh=8SuWb864/uWU83a12ckbpPsM3Uhs8t6j416NiF5XSpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fyz0A5JuY2b7thHbfr8n653/eKYK4UqzTO8HI3KsNgn5P48rYWXdawCFXq9bXNfN+cyvPWZoTHaCHPjOL5XSK29vZ0YoY7uC9FI8wP2qD6kVuROL+DZZuFex1WAE1lkjdqLG8txYyZ1qpA4xTwAT+RhKVpPMpgRNNgZYCWfbX1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsSjK7Nw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32A51C4CEEF;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996623;
	bh=8SuWb864/uWU83a12ckbpPsM3Uhs8t6j416NiF5XSpI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DsSjK7NwHn9LsRaEI8WqkipR7+E24+UbP4gqrizQCdiBu1ZD2OxeiAlYmNTjOkomC
	 5x7Ga7lJQ4+QQCYuF/UY4UD8fwVzNBNAotRmLfyHrWHefP08u2pmfaJ2qUITPcQKND
	 6ulVnko9Ik35vW8Bx/I6y5yOTVd0lzfi/0rhAOE3+1o4Kil+taMAjvqGoBw3IWiSi6
	 37tr6Co2BOuEwiGG6aMydlxl4noVDAxuQck6iM88tO6YH54beQIVYUIim7wwRKdMVj
	 TR/hf7Lriu775qVAvFNHdHhDcWyzmtlipnmrajdRTJyBnv44bpP4WLvSZxwAO/HRLQ
	 4MWWquzEdEgrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 262AFC87FCA;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v6 0/2] Add support for sound profile switching and
 leverage for OnePlus 6 slider
Date: Thu, 31 Jul 2025 23:17:00 +0200
Message-Id: <20250731-op6-tri-state-v6-0-569c25cbc8c2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEzdi2gC/3WOQQ6CMBBFr2JmbUmntBRdcQ/DguAIkxhq2tqAh
 Ltb2Llw+Sbvv8wKgTxTgOtpBU+JA7spQ3U+QT9200CC75lBSWWkxotwr0pEzyLELpKgO3bSdIi
 oDOTNy9OD56N3azOPHKLzy5FPer9C7xL5AitrpVIadTFwLIJbyDfsn8X4hn2Yyl+5qo2s8fJHN
 of858dkhBRal6istLVB2/CcK/0H2m3bvl/SvYkCAQAA
X-Change-ID: 20250419-op6-tri-state-ed1a05a11125
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Gergo Koteles <soyer@irl.hu>, 
 David Heidelberg <david@ixit.cz>, Casey Connolly <casey@connolly.tech>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=8SuWb864/uWU83a12ckbpPsM3Uhs8t6j416NiF5XSpI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi91NepPoeRso0VfQsB9G3tgPSIydZzZaZ3VgN
 BDzr3Shw0GJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIvdTQAKCRBgAj/E00kg
 cgimEADPsbp2OaDvw/jFddmwrciOXrdq50N8DxtkY7kMlIpJjqVltG3L2ezKBx3wKNlk5bInzcZ
 0iGqryZk7wJfvduW/PqEeqRaYeAcxOsBiNdbNknmgr09uNhlmHmFaYS9fWo8RbQHHzoQEcM9qrz
 dWmaR3XJTc7Gdf9lVuDo8CfS0YAI4GWcwlTvXakvlTI52XvL9uMNC4frPhrLwU68oRwvHcd7N9c
 dyabiTU0dikGbktk0vmh2cL1JC/eAxUFs2cdXAhZUwafvj3bJB9ESkmwRhKbBYUBpnnCHXWS0DG
 /+S3fcXomsocjBfNvPh0tea3yLFWzi1RVCAM6+W5d2Sa9pTz3aWCSmLPe6otOm1EVdENMo1hoNZ
 yBlGiS7Q3xQbiQ4MzA1yYl6yuUn1BGkkkF+7jScd32BF1vQucnigwJSRKAEdrRr5hspB4/UVpQt
 /YIRuE0eX7Gxe6VIahN2XwyaYvaEf7oB6aMxsjMnGR0RGiFBkYvQY9VrhXgoOWcmNPaAB/EnFM8
 1d67YDsKTTiuUrb5cYsJZP+HOq0OGw1N3PQgltr/hfn3kS2AMNFvBR/+TyqqJPmuGTPZe5g2EIq
 zvC3UQux5wEozKpegUn1WUHAtmSBqq44q8YiAJVHU73gmN+BGk/j9zaphOpBkcBXuUAtK3kIsQS
 c/dGVilpwT3w7yg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This code was tested for two years within the downstream Snapdragon 845 tree.
It is now perfectly integrated with feedbackd in the Phosh environment.

Changes in v6:
- Rebased again next-20250731, otherwise just a resent.
- Link to v5: https://lore.kernel.org/r/20250419-op6-tri-state-v5-0-443127078517@ixit.cz

Changes in v5:
- Dropped merged
  "Input: gpio-keys - add support for linux,input-value DTS property"
- Link to v4: https://lore.kernel.org/all/cover.1677022414.git.soyer@irl.hu/

Changes in v4:
- DTS: use default debounce-interval, order alphabetically
- Link to v3: https://lore.kernel.org/lkml/cover.1676850819.git.soyer@irl.hu/

Changes in v3:
- rename tri-state-key to alert-slider, fix DTS warnings,

Changes in v2:
- rebase to qcom/for-next
add SND_PROFILE_* identifiers to input-event-codes.h

base-commit: 02ac8d2a011b630481d959298a1cc76ca0717f3e
---
Gergo Koteles (2):
      Input: add ABS_SND_PROFILE
      arm64: dts: qcom: sdm845-oneplus: Add alert-slider

 Documentation/input/event-codes.rst                |  6 ++++
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 39 ++++++++++++++++++++--
 drivers/hid/hid-debug.c                            |  1 +
 include/uapi/linux/input-event-codes.h             |  9 +++++
 4 files changed, 53 insertions(+), 2 deletions(-)
---
base-commit: 84b92a499e7eca54ba1df6f6c6e01766025943f1
change-id: 20250419-op6-tri-state-ed1a05a11125

Best regards,
-- 
David Heidelberg <david@ixit.cz>



