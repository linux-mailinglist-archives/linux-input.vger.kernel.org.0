Return-Path: <linux-input+bounces-3560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C1B8BE67A
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:49:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065AD1C23622
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A867165FDA;
	Tue,  7 May 2024 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHnrMSKP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C724F161336;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715093330; cv=none; b=C22g4AdFsmgkPyzfMoaMli0pT9VJmpuK9UMM40vEGUvjI9jDguJpzmmK549+CQs4ikZmjZU6zgkULGHV1sh/4ECny5UxtCzqgBkNW3TVTgg9vbLzk5t9112LNHzGA2y990/sJ7K43Cx0vRYPIaKjFuvIGHmYgJsQ4C2zQIyqi3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715093330; c=relaxed/simple;
	bh=yUKF0vOKySzX0i3skMdUAskVsEKGqMSmVaxqmiM/wrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jzKrRK9rbbZaEbxLccjma4u7VpGHtAPcwoW0Ik22WhdKV/bTBCM4fE8161TdC3X5GTKljGQO9sg79HdLxDTuIGY8XmYWfvBgsMaBEnpHa8R2sLwNhOt49B5VHKaICaF+tY937GXLtBeAz/Bed/ORuJmqP0ZGGMu46SPLEGXWlv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHnrMSKP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CBAC4DDE1;
	Tue,  7 May 2024 14:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715093330;
	bh=yUKF0vOKySzX0i3skMdUAskVsEKGqMSmVaxqmiM/wrA=;
	h=From:To:Cc:Subject:Date:From;
	b=kHnrMSKPu/3b7txA0FRvWa4P1k2QMO+cjAf5ukUF0wZPI/Q4kWMAEayobHHC6b0UU
	 C+rxxbSBZ+xwqadlmjeG9aQEefBYn1eTCrc+lXvSo4yTDxPsuRsrd5O7tfxTF8yY4t
	 t7NNEaLvQFW0Xb+5+aO/bX5pEKdquNyX8FkmPprWELal9ThweladBc2tC3CUrEQStV
	 KEMMQiOs5FezxrWiIP/6ZkQtOk2GOzaZJajEgt4SaK4Y+gLyVqSbbbJwjn86JMETgC
	 ORD0hb0eCOaV0fXlo+iqbz5M1N9uSV2+09Z4PL+yeylBPsct4gxMBbXAnOBbBp05ml
	 xcZlVgsufXezQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s4M7f-000000003Cm-225g;
	Tue, 07 May 2024 16:48:52 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/7] HID/arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
Date: Tue,  7 May 2024 16:48:14 +0200
Message-ID: <20240507144821.12275-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
before sending commands after having deasserted reset during power on.

This series switches the X13s devicetree to use the Elan specific
binding so that the OS can determine the required power-on sequence and
make sure that the controller is always detected during boot. [1]

The Elan hid-i2c driver currently asserts reset unconditionally during
suspend, which does not work on the X13s where the touch controller
supply is shared with other peripherals that may remain powered. Holding
the controller in reset can increase power consumption and also leaks
current through the reset circuitry pull ups.

Note that the latter also affects X13s variants where the touchscreen is
not populated as the driver also exits probe() with reset asserted.

Fix this by adding a new 'no-reset-on-power-off' devicetree property
which can be used by the OS to determine when reset needs to be asserted
on power down and when it safe and desirable to leave it deasserted.

I tried to look for drivers that had already addressed this but it was
only after I finished implementing this that I noticed Doug's reference
to commit 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line to
true state of the regulator"), which tried to solve a related problem.

That commit has since been reverted but ultimately resulted in commit
7607f12ba735 ("HID: i2c-hid: goodix: Add support for
"goodix,no-reset-during-suspend" property") being merged to handle the
related case where the touch controller supply is always on.

The implementation is very similar, but I decided to use the slightly
more generic 'no-reset-on-power-off' property name after considering a
number of alternatives (including trying to describe the hardware
configuration in the name). (And as this is not vendor specific, I left
out the prefix.)

Note that my X13s does not have a touchscreen, but I have done partial
verification of the implementation using that machine and the sc8280xp
CRD reference design. Bjorn has promised to help out with final
verification on an X13s with a touchscreen.

The devicetree changes are expected to go in through the Qualcomm tree
once the binding and driver updates have been merged.

Johan


[1] The reset signal is currently deasserted using the pin configuration
    and the controller would be detected if probe is deferred or if user
    space triggers a reprobe through sysfs.

Changes in v2
 - drop redundant 'items' from binding
 - include a "should" in description of 'no-reset-on-power-off' property
 - always assert reset on probe
 - enable elan i2c-hid driver in arm64 defconfig

Johan Hovold (7):
  dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
  dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
  dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
  HID: i2c-hid: elan: fix reset suspend current leakage
  arm64: dts: qcom: sc8280xp-x13s: fix touchscreen power on
  arm64: dts: qcom: sc8280xp-crd: use external pull up for touch reset
  arm64: defconfig: enable Elan i2c-hid driver

 .../bindings/input/elan,ekth6915.yaml         | 19 ++++--
 .../bindings/input/ilitek,ili2901.yaml        | 66 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  3 +-
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 15 +++--
 arch/arm64/configs/defconfig                  |  1 +
 drivers/hid/i2c-hid/i2c-hid-of-elan.c         | 59 +++++++++++++----
 6 files changed, 137 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ilitek,ili2901.yaml

-- 
2.43.2


