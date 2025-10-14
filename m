Return-Path: <linux-input+bounces-15456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B584CBD867C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A7E5B4F8DA9
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A5F2E7BC2;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZrdcrRav"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC7B2DBF40;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433641; cv=none; b=tub7O5TqrEbxXsNc7IhvIQl6d7KDmJoYsuu7ukK6XhqI5gXd8aSsqU5m3V8VfDIELZDvvkD1NAOQlcYQJN4cj0ZpQZ31/Pevq3qldJWalToxpzxcPqX1CNjHoKgD38pCsNbnm5BSMHvvt/t5Ikx7Vhm8wdbdzwBz6T/bk6j2rU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433641; c=relaxed/simple;
	bh=NsvPz3eeiUzykuYNbrmqimhNSjFlj+QITEVnMeVM70E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ds+Lho2sDfTji6ymXbMCi2+qI1YBqxUJQgLV+EJOq8BNqZaBOedSbJSBfngZ9ONnBX+0FjgDx1ykhGK7qH/5N8aG+eM8mmxLFJ+jYOUsK/PikLjXkPngTTDhyf6o0Juq5aTdHX3kZRlPSD2iHujzIfHItmPtx9eYle3nwV6ECQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZrdcrRav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5A41C4CEE7;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433640;
	bh=NsvPz3eeiUzykuYNbrmqimhNSjFlj+QITEVnMeVM70E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZrdcrRavo8QWeMTxSfKByW3jq6Fy+ld/Sug7JM4RIQ+uWkCO4iADN5FhsAU6Sc/FY
	 zEPsoAbGeGfaiw2uobr+mC/8e6oP4wm6jVBYSzQDkwcAxQi4YcDb1CyTnEwlJZfdY3
	 wudYxTSTc1VbVhaCP9DZtwzpPGunHrDmFXyyyIbhA5KerAm+ddzRA6nMYTFY4YOQJz
	 gI2dADYDOl6t3OPW/0NHXslnEfywrlGWUTL1ZwZ2T4Vwib91LcYYmaB0gtFXKN8Sau
	 O0lcpN9bkerkAeDJSShSpKnrQAN1ZjoBHcblQ+usbgtnTd1GN5zLoVeFmI/VgucgQd
	 2NdAwXBdzaHfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43D0CCD184;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v7 0/3] Add support for sound profile switching and
 leverage for OnePlus slider
Date: Tue, 14 Oct 2025 11:20:32 +0200
Message-Id: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAV7mgC/3XOQW7CMBAF0Ksgr+vI43jshBX3qFikZiAjVTiyX
 YsQ5e416QIVieUf/fc1i0gUmZLY7xYRqXDicK3BfeyEH4frhSSfahZaaVQGehkmK3NkmfKQSdI
 JBoUDAGgU1UyRznzb9j6PNY+ccojzNl/M4yp8KBQbsM4prQ2Y5sK5SWGmeOD43Yw/4gFL+79sO
 1Qd9G/KuJXf/FhQKmlMC9op1yG4A9/qir//Wfu0roVXa6tF23uN/st3Xj/tuq6/jsM2Lj4BAAA
 =
X-Change-ID: 20250419-op6-tri-state-ed1a05a11125
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 Gergo Koteles <soyer@irl.hu>, David Heidelberg <david@ixit.cz>, 
 Casey Connolly <casey@connolly.tech>, 
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NsvPz3eeiUzykuYNbrmqimhNSjFlj+QITEVnMeVM70E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo7hXnC5WjMyUQ6uq8eAgtYhKt3jxje1nMI49Pw
 nBIerSNcdWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaO4V5wAKCRBgAj/E00kg
 cu08D/4yPNgeVepF9WCgyg2jwjC2U+BJP0XyW0YUmoypKiod7skNFNLy+gNkSky+Uv+gx9vjx8E
 9GLaW5lfQIOIWhBunrW2yydsqCWqHA7LKS76Dnk6TxnGnBkvxo5lsF0IxsVPrBVgV1EVu5I8siR
 xpoAKm1fmZrAU41bRYpd8jummStaO456Soq9Sc5tpGfhfrJDg/03VfX/utgCMwmBLL+iGYkqL2s
 ilwGt8Ysxq2WM4eIKn4G0bX2gLzhMotoaoBJqD498im9F+iomRvVaN3tiUWimWLlRI9kgoPoxtF
 tyUHHSlVICRGqOjEwm2rFlwQ2shuHB7vo02eLmN1r0bE6GDpMy4syXORApsUz3xRe/95BxvBe0e
 3txQnvvfNcGB2dCP84O0T1RrsCKRKMu12SFpdC96G7hleRd70Cs0bHGU/tl1KT84oHbPoZIDSdO
 9zzOoG8xQuYnOmtOz16NrHSx91Qtxzz0KOABzCcx5yXPSXdJI5COVKiMdPyFtO1czJq6uWpqYgg
 XamZfsDqok/CXGUVHe8MTQwwGk116kzQEG41XqKTtHKz4emnGWq3de44opIP0jZfIDKyCA0+hxT
 YQuN4611WWnhBNCqEEQv4HVDocVoA/UPz36YXrQG617Erm3ZWXoodSMOlmP/jw0VYTT9P8TRGmO
 qlEddzkPRU41Dkg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This series add initial support for OnePlus 6 and 6T, but other OnePlus
phones contains same mechanism to switch sound profiles.

This code was tested for two years within the downstream Snapdragon 845 tree.
It is now perfectly integrated with feedbackd in the Phosh environment.

The series is also available (until merged) at
  git@gitlab.com:dhxx/linux.git b4/op6-tri-state

Changes in v7:
- Separated GPIO number fix from the original commit
  "arm64: dts: qcom: sdm845-oneplus: Add alert-slider"
- Rebased again next-20251008
- Link to v6: https://lore.kernel.org/r/20250731-op6-tri-state-v6-0-569c25cbc8c2@ixit.cz

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

---
Gergo Koteles (3):
      Input: add ABS_SND_PROFILE
      arm64: dts: qcom: sdm845-oneplus: Correct gpio used for slider
      arm64: dts: qcom: sdm845-oneplus: Add alert-slider

 Documentation/input/event-codes.rst                |  6 ++++
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 39 ++++++++++++++++++++--
 drivers/hid/hid-debug.c                            |  1 +
 include/uapi/linux/input-event-codes.h             |  9 +++++
 4 files changed, 53 insertions(+), 2 deletions(-)
---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20250419-op6-tri-state-ed1a05a11125

Best regards,
-- 
David Heidelberg <david@ixit.cz>



