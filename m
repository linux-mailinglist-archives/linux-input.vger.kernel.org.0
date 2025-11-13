Return-Path: <linux-input+bounces-16094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA53C58B99
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFEC5428346
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C46F2FC013;
	Thu, 13 Nov 2025 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZA9qpnyh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75942FABE0;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049785; cv=none; b=VhSeip2r+OSQtY6ns37V1w0TzLmkWwClJQq2E19er3eGCp1OZundaACoK5ZAhGWvH3nPbdmCSEsQBY8Lx5ddzLCAB9UdoxkqLWUIazGbJh2mVBw2su8o42cShS3D92JQpETf60qOXg1RB42D/T43ZmzG8PNvt26OHsuFFYAMTrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049785; c=relaxed/simple;
	bh=rRvKv1BEPoPU3+9Q7iKmxRtmjJdSj7+9UCKsshojBhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kZNiuX6MoFhL2f5+JAXcELqRBuv/fux/1jN4zYHBWEOQusPaUedQ7MSXmpOgPZHn/9jPQVjwmoLFyC0xAV4+T4lsPQ0M3X6rN7LHtP7ff0vvrZRfuS8zBSQH/JWvXvPJOruUS00joQ7dJ+GXSgw1U/DG+VK1ZeY3W1OaASOYFbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZA9qpnyh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 107DCC4CEF7;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763049785;
	bh=rRvKv1BEPoPU3+9Q7iKmxRtmjJdSj7+9UCKsshojBhg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZA9qpnyhKG6bYSIwToSRzBFTz7OxJc5h2Mz3DANWgwV1OV7O3Vq4JZSv1Yy2/8OFq
	 8oGy0yF+W8h1Vcn9EAZs48YGVMbyhu60vDYMH8wLxD2Ev7kDuCWrVr4ywFD57M00WX
	 URgz5zF8ju3Oa2pvoMU9zlGdDMxvjbhJ6AzCaxl3FZJu0A/SLnIKCc6NPCHbh/kdjj
	 fn9OUaaL75q2Sg0g3sBXfghOScPTWrmWM3aWjbMKtMExJC0VewpEgzF+Ks5B+LH0B1
	 /6JqBz23ygpVJNeBKPdQ92B0H8b7zWDOum/RY2w4M98pLxCuucTR6dzcGsI1CKsevp
	 8AKK+4UfElImg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC08CD6E7A;
	Thu, 13 Nov 2025 16:03:04 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v8 0/2] Add support for sound profile switching and
 leverage for OnePlus slider
Date: Thu, 13 Nov 2025 17:02:57 +0100
Message-Id: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEBFmkC/3XO3WoCMRAF4FeRXDdLJn+TeOV7FC9iTN2B4kqSB
 n/Yd2/cQkXByzOc7zA3VlKmVNh6dWM5NSo0HXtwHysWx3A8JE77npkU0ggNnk8ny2smXmqoiac
 9BGECAEjDujnl9EXnZe9z2/NIpU75ssw3fb+yOLWUB7CIQkoNejhQHcp0SXlD+XsYf9gdNvVct
 s4IB/5N2SzlNz82wwXXWoFEgc4AbujcV+L1z9qHRQWv1nZrrI/SxF10UT5b/LcgQL9a7NYrF6y
 yCB53DzvP8y+mjsEDegEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2102; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=rRvKv1BEPoPU3+9Q7iKmxRtmjJdSj7+9UCKsshojBhg=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGkWATahp+QLvY5EbJpC8VGhVDtZLOC4cLheywBEIOy+YgvZa
 okCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJpFgE2AAoJEGACP8TTSSByO5kP+wXy
 EmuWaWzET8c4cNnuAyL6BN2gCaJyUuz1Uox4XB1k7a1pWrElwGw81BpG90wfQEhjFenO2ivub92
 yMwVkGiVqw1PLLJGG1y5leEQAJrG0cDH0V1JTsCS2nyCA4F/v8R7KwRQM/KSHwg2iOOKd0kFb+N
 iQOnW+MxHuf/WAHBjffc7w5Qz9gNUJ0R2M7IdylRGFlU88gZ5560kdds6yjnpHWwPtZpmPy520A
 XQcN/1t3bCudUNClNnRoBwW6DeP346SZ/dxg0KHb4d5Y1TDqRR3JD9cpumzs2qxBiq5t/dHgSnF
 RTItqsNptFi2PmkC6SoNMdJQoWis4fDbpK8zcf6MgMaqDzSbmEMjllm2ZOZ33gwnls3KM7Gp7Fa
 HQQlMP17WK83M0iGQmCvyUCwPXpFgMommp1fLqLQBCWEj8PcXVA86hDYxSfs5JiNwhMptAj7ROg
 BDZW96yc8HXZtzzyq7UXIaL+DuCY1Q3rqbFb8eJ7WFsRN4oG1JYKAjjTusUHSFlehUMu3pNlrzF
 xZkpiT0iEyDgax2b2P8Q6w1gKwlTdus8/2DhG+RCfVDYoZ8wm7DQg4IC3UC5ZWZL97WiopIa3MA
 Q0LpJP48/7mxsdRhMBbD7LoeQBlBj8gHmCT3nc69dJzqqMzAAB5rQyfodjNAIsrysDAw+pVDAW9
 A0Q0u
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
  https://gitlab.com/sdm845/sdm845-next/-/commits/b4/op6-tri-state

Changes in v8:
- Rebased against next-20251113
- Added R-b, T-b trailers from v7.
- Link to v7: https://lore.kernel.org/r/20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz

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
Gergo Koteles (2):
      Input: add ABS_SND_PROFILE
      arm64: dts: qcom: sdm845-oneplus: Add alert-slider

 Documentation/input/event-codes.rst                |  6 ++++
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 35 ++++++++++++++++++++++
 drivers/hid/hid-debug.c                            |  1 +
 include/uapi/linux/input-event-codes.h             |  9 ++++++
 4 files changed, 51 insertions(+)
---
base-commit: 6d7e7251d03f98f26f2ee0dfd21bb0a0480a2178
change-id: 20250419-op6-tri-state-ed1a05a11125

Best regards,
-- 
David Heidelberg <david@ixit.cz>



