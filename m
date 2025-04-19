Return-Path: <linux-input+bounces-11848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D60A9454F
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 21:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697843B6245
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 19:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12A61E32CF;
	Sat, 19 Apr 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCwfrPct"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE715CD74;
	Sat, 19 Apr 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745091988; cv=none; b=lLaQ3kNXU+GXEY/oMzNaEg/54MfYrvp1FQ3d1HZOPnUuo5J7IlyKxGnrqb4oU9CT6dfIm4VtGpO/YDT6fxplYOWagl4zjjXiPShZA611WxFQ3bmnKJS1T1b2u6a3qx1aEm5+fbCtrMAnu7RXTxis/ibXvZmrxCA2jaO10j+0rmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745091988; c=relaxed/simple;
	bh=74mO15uFIckJUXnXnTZxaEJt7loiHy0xGNx6hkYoLZA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZyZYC28UjUw0VtHpSJWUlz7oOHs1LGHIpOnVIEFtZPJ0rE+qMyBp2YaF2SNX2vfGKA85d6xW4xg/CdfvQz1XVMxOQIHln0Yrnz1wegRRiZ0OhxJ5CmTSmPmF3J/lk0YcijzgcSncmUmGW/nnvZk5YsIqwuccJEBhv8Z2ZIPWD70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCwfrPct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B07C8C4CEE7;
	Sat, 19 Apr 2025 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745091987;
	bh=74mO15uFIckJUXnXnTZxaEJt7loiHy0xGNx6hkYoLZA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=HCwfrPctLCTsWA+uXc4CGeVYSg/Bjs6JeROHrYRKpfFcWnNHiZbh0A1PxSNiRc+Ci
	 ralXOP6QbVoPf058iXXlg4R+nVPdAKD41w2ZzZ0xhHprbL8HAMNZUyLpq4yKoYRXnV
	 +Y0rQhccLF1VKwVCdFaUN9M7wWgUQFT+mwggd9dhJNd1FbbKA7PGwbYMm84oSz+A/h
	 Yg3AW3rSEfhjBmGEh4+rDjW20EH/uxSN+p+TFvHYKm+qeUtn+JGntE4YCvSuwO1Q33
	 aThFwcmNRmC3v/L1gcc1D96Beb9c/SNdOkCWkPpn/WnG/yTLmktVbAQ5I13svlGwjr
	 npG/dsST80VPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A503C369CF;
	Sat, 19 Apr 2025 19:46:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v5 0/2] Add support for sound profile switching and
 leverage for OnePlus 6 slider
Date: Sat, 19 Apr 2025 21:46:23 +0200
Message-Id: <20250419-op6-tri-state-v5-0-443127078517@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/9A2gC/22MywrCMBBFf0VmbUISkz5c+R/iIrRjOyBNmcRgK
 f130+4El+dyz1khIhNGuJ5WYMwUKUwF3PkE3einAQX1hcEo45TVrQhzJRKTiMknFNhrr5zXWhs
 HxZkZn/Q5evdH4ZFiCrwc+Wz3FbqQkaWu6loZY7WVAyUZw4J8I37J8Q27mC+/56pxqtHtn/O2b
 V9r8B5LxgAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=74mO15uFIckJUXnXnTZxaEJt7loiHy0xGNx6hkYoLZA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoA/2SkOtINWWfOxhOqR6NZROxrKFHxdFskpbDu
 FNfy0HVQp+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaAP9kgAKCRBgAj/E00kg
 ch7gD/429cSbsyDMFzlPEAsnkV+EoxRbi5H+Z04vttfsz+8YGmbLxZg5h3i99laliyXP1HJMBAT
 3zU/FYdRCH9O1xGML3n/I4Wb44Eno8gXsIcVdD5cZ5VQD+GBo7yEG2IWOoin+spVc9jjCr4oSmA
 E0JoGJdlzKuGJ8K0Anf4XenzGfkzo7gOBms9e4qCWOoyrxzXIlBBpJJGP+cwkBYW/tSYEsRb3On
 tcTElPPAIH98+2W35Q31o/3FKPZBejQfDGkR0g0H+fhC7zlpdwpVJ6FhXhAzr+O5scECjnA46nA
 3s/n0ZWsaI7CREY9BQnfqOrGXTbe4/rnQgFymttWICI5HIZmQp6dE1h4xxKX8Oo1hDPpSN/ofSf
 jW0trUt4jp++VLAMdRn1sQp1gpidEwzfQR4u1WaUuImEh6UK4wPA+hwf1VPuAXBzlmDuPUBGgJU
 w4YEv23EuurQkX0UEbj2GRT0DQakl+t9fdKjDRRm24Z80dBKuJ2rSJ0ve/kjJ1mbj8AhT3a9BkD
 0stv+1V3vmWx/EH31W7fojf6KWwfBsjcoPhjMmv6t+DBc3NQlILPBuknrDcYb9ulA33zdfYYV2A
 1yKnNX/IoI8NTaAvWG3VJivL9wIJXx7i4rlFAdVI9I9aaHwxxUkDGUO5+Xei7eW399gF9x8AnLV
 bd6PX14Edlsf4jQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

This code was tested for two years within the downstream Snapdragon 845 tree.
It is now perfectly integrated with feedbackd in the Phosh environment.

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

Gergo Koteles (3):
  Input: gpio-keys - add support for linux,input-value DTS property
  Input: add ABS_SND_PROFILE
  arm64: dts: qcom: sdm845-oneplus: add alert-slider

 Documentation/input/event-codes.rst           |  6 +++
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 39 ++++++++++++++++++-
 drivers/hid/hid-debug.c                       |  1 +
 drivers/input/keyboard/gpio_keys.c            |  3 ++
 include/uapi/linux/input-event-codes.h        |  9 +++++
 5 files changed, 56 insertions(+), 2 deletions(-)

--
2.39.2

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
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250419-op6-tri-state-ed1a05a11125

Best regards,
-- 
David Heidelberg <david@ixit.cz>



