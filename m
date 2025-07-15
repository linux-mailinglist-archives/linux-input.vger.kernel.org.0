Return-Path: <linux-input+bounces-13540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80900B05922
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 13:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 508414E2ED6
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 11:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF8E02DCF57;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITGIX+WN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE12DCC11;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752580152; cv=none; b=e23Uo6ykMthwba8hl1EDX7GSBLvf6OlaFlPJEIx2Dgd/FelHSKogTa/IUgthqHUIsrnt94xBkgH60YqQuzBGNxp8xXnjEeR5QewEHGlA0pY1mxB39+2zfGsQowh/+HvrGNxpuz8KAx1hC/bOBr6F6dlduAW+ZR+6ko0qSph5j00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752580152; c=relaxed/simple;
	bh=LAWsj8B0kZpkWTYcaklu6JjYiPcu/Ibm9OCN6A3MyZo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tsaBt6ly2XVe1frEanFv92q9TaQTdUbOrHAwuhLm8r3CTfdwTkspoWGAxlrg0x1bnP44rcLcJky+gnHjKUt/+qD8x9f6S/9TefcXRBexMyTQq4SZKXJfRSiWhfMaJD3+SRll9AlLPRy+OMvoBq5LjANMxlM7CuTeA42H1k7w6Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITGIX+WN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 148CBC4CEF7;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580152;
	bh=LAWsj8B0kZpkWTYcaklu6JjYiPcu/Ibm9OCN6A3MyZo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ITGIX+WNo9xpUY160HDV8JNCZ6zswFelT4cg1A/fnChYjkFGqaJpPF+odj/RilxC4
	 We276JpqL4w3hJLjBtw4LoUrUNKLY8Y3Z3gWBBFiqa0sxXNs8NbdDS1WA/gayQTN1x
	 5bz3XeqyifUNni1wXW3dpwr53+cex6ymYwUz3Zdteu+WpYD8XO8o+/hrXxgWi/FXt/
	 W1XLJCHW/HyFx2WvqkwC6G2Uv1m11b5pztfwOgsSvKOQKAqTW0anPVTc8y0s7DA/Qi
	 MXFOMt/6j0rpPJy79y0wmwIhJ6q/yMeM9cRUJc1Qo6S1nseAidLSg/soc93dD12LEj
	 I3Hc7Oa/MQKtQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DBFC83F22;
	Tue, 15 Jul 2025 11:49:12 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH RESEND v5 0/7] Input: synaptics-rmi4 - add quirks for third
 party touchscreen controllers
Date: Tue, 15 Jul 2025 13:48:59 +0200
Message-Id: <20250715-synaptics-rmi4-v5-0-ca255962c122@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4107; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=LAWsj8B0kZpkWTYcaklu6JjYiPcu/Ibm9OCN6A3MyZo=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGh2QDSh/25LnlqV1FkuuYKNXWdhuZj9fDkOKvUdnyqhoGlrD
 okCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJodkA0AAoJEGACP8TTSSByLH8QALUE
 WSF+7WT98vTyvyGF4znz8AME3OPfzJLIO8+KNmlLUVaiQDiLEMtRH9gOzz6l0NkAkbaAsOP5Ub8
 JWJWDYeBwJp2pRoDsV4+ANNHetdzVRCGlaKOei5lHu5fvzTdjHLrL/fqmVaTqNpJvtkr6c5v//P
 0teh01uaoGpdTq9jx4i62BV6VDOOY7iREnDzeH/eJ7YRGYRWdjQwLcsLqFrKBMjYOqFo1EIHzWM
 SLJn3Lyok+dIG4B3Fv74JlkMr9lRbFy816ZhWgFFaPe17nPZBJOziAjmLw+sgDR0RfW4A3Fw/zg
 Ggp40rbngFQmhB0TiM5D3sPPciebSJFW0uyg75LxU8dRtx7qpwhVOk3xEu9UCMMeSnJIfPRR5ws
 xPwSnfN5KbpHc63PL1inOaplP/j8RjlnoIlD1JSLF0y1iCkwYGqWMvn1vDfiSTXhwT6WDRstWe3
 DsiYf6saJUxbhRtqxIiNGhuVcMuapN12ozrO8s2ONZv2pqsyWBFH4WMoUmGlWIOgPb0kb7kVuFp
 jAh6cS3D6hWOla8BuxNw0llUdlCR/alUMHjJmFl3R1B6oB8uYL3JmkHrrkGTEcCSSIWHiQUmlIb
 SK4gG4I4OpH1dqz2XYZb4QD1Lqf6KWS2QvAsi1T1S2NnqINJsf3eYVn6wKwPXy9VW/bf8gPw8Zv
 SgdXf
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

With the growing popularity of running upstream Linux on mobile devices,
we're beginning to run into more and more edgecases. The OnePlus 6 is a
fairly well supported 2018 era smartphone, selling over a million units
in it's first 22 days. With this level of popularity, it's almost
inevitable that we get third party replacement displays, and as a
result, replacement touchscreen controllers.

The OnePlus 6 shipped with an extremely usecase specific touchscreen
driver, it implemented only the bare minimum parts of the highly generic
rmi4 protocol, instead hardcoding most of the register addresses.

As a result, the third party touchscreen controllers that are often
found in replacement screens, implement only the registers that the
downstream driver reads from. They additionally have other restrictions
such as heavy penalties on unaligned reads.

This series attempts to implement the necessary workaround to support
some of these chips with the rmi4 driver. Although it's worth noting
that at the time of writing there are other unofficial controllers in
the wild that don't work even with these patches.

We have been shipping these patches in postmarketOS for the last several
years, and they are known to not cause any regressions on the OnePlus
6/6T (with the official Synaptics controller), however I don't own any
other rmi4 hardware to further validate this.

---
Changes in v5:
- Removed -i2c suffix from rmi4-s3706b-i2c (Krzysztof).
- Link to v4: https://lore.kernel.org/r/20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz

Changes in v4:
- Replaced patch "dt-bindings: input: syna,rmi4: document syna,pdt-fallback-desc"
  with patch documenting specific touchscreen model used in OnePlus 6 and 6T.
- Fixed zero electrode return code (Dmitry).
- Switched the duplicate detection algo to bitmap (Dmitry).
- Optimized rmi_device_platform_data struct to avoid unnecessary
  padding.
- Changed fallback_size from int to unsigned int.
- Changed SoB from nickname and old address (methanal <baclofen@tuta.io>) to
  Kaustabh Chakraborty <kauschluss@disroot.org>.
  Verified ownership through the sdm845 chatroom on Matrix.
- Link to v3: https://lore.kernel.org/r/20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz

Changes in v3:
- reworded dt-bindings property description
- fixed the rmi_driver_of_probe definition for non device-tree builds.
- fixed some indentation issues reported by checkpatch
- change rmi_pdt_entry_is_valid() variable to unsigned
- Link to v2: https://lore.kernel.org/all/20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org

Changes in v2:
- Improve dt-bindings patch (thanks Rob)
- Add missing cast in patch 5 to fix the pointer arithmetic
- Link to v1: https://lore.kernel.org/r/20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org

---
Caleb Connolly (1):
      Input: synaptics-rmi4 - handle duplicate/unknown PDT entries

David Heidelberg (1):
      dt-bindings: input: syna,rmi4: Document syna,rmi4-s3706b

Kaustabh Chakraborty (5):
      Input: synaptics-rmi4 - f12: use hardcoded values for aftermarket touch ICs
      Input: synaptics-rmi4 - f55: handle zero electrode count
      Input: synaptics-rmi4 - don't do unaligned reads in IRQ context
      Input: synaptics-rmi4 - read product ID on aftermarket touch ICs
      Input: synaptics-rmi4 - support fallback values for PDT descriptor bytes

 .../devicetree/bindings/input/syna,rmi4.yaml       |  11 +-
 drivers/input/rmi4/rmi_driver.c                    | 124 +++++++++++++++++----
 drivers/input/rmi4/rmi_driver.h                    |  10 ++
 drivers/input/rmi4/rmi_f01.c                       |  14 +++
 drivers/input/rmi4/rmi_f12.c                       | 117 ++++++++++++++-----
 drivers/input/rmi4/rmi_f55.c                       |   5 +
 include/linux/rmi.h                                |   3 +
 7 files changed, 234 insertions(+), 50 deletions(-)
---
base-commit: f0a16f5363325cc8d9382471cdc7b654c53254c9
change-id: 20250308-synaptics-rmi4-c832b2f73ceb

Best regards,
-- 
David Heidelberg <david@ixit.cz>



