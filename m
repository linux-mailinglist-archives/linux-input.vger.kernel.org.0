Return-Path: <linux-input+bounces-11707-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 900C0A8464E
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 16:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 584921B60888
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FC428C5D6;
	Thu, 10 Apr 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmjHWr4x"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235F42857E5;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744295304; cv=none; b=idGrMBaefVWdb8q+ewcshj5hGHbzz5cmxMGqfBvKirPsV8twnE1RM1YkYQIsT/tb4k2Mlt698DMwgZXSfduyrH/Y2WVP3pnpr6sgwncqgadbrO3jsqOIDof4OAUWOUHP/TR2Y4Pd+EuMX4Mj855GtdPkbBWTntWdgvaJZzU9wiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744295304; c=relaxed/simple;
	bh=/tO0SoKjbCbkR8v6jdjdLMXE89gyw76G6Sr/g9tT82U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fWQXJsKDmvNRiBE6xdj+TmKQ+ysYpjvG7f53LLBvv83sCrfoxaSAFP85qfencR2Js+yC7RjnLpJ1UwzJXzLbhcZTwmxqm1wm+ifsy37/kfA1hPqYCFz0vxzwjAU8+6dqZ0l7WTwM6OoXQtVR23jFDtPFyviLn2f4HmncF5SMa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmjHWr4x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B93DC4CEDD;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744295303;
	bh=/tO0SoKjbCbkR8v6jdjdLMXE89gyw76G6Sr/g9tT82U=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kmjHWr4xrxBrcyeBTdeNU3MMsiqjOvrHf/xgahsfHtE1pS6jhLJ6tV/i+Zxx3VkJ8
	 xgb9r2o3oGVPu/FFAmt4NNmJYiuH/bDlf/hdOK3+1sqx5zjCsQVwuy6XgCrYfRiIqD
	 wnpM9qiVWa3PNDtOgTle2nCu8Qpuz4NelCSdIlBX3O5njmiLaAaBEayvVgXKbwqUlP
	 xcen0FltKNzAFzc3yGgyDA1xR7odxHQb5S3SLJbfE3RZHS4TOnpXig1H5KSEqAO6tQ
	 o1r9iy/aDxpAZY05lXqjCQx4IHs+Yq8U6xQU3iq7RFHMATUURSbO2E66FVw5SKrWxb
	 fL+khUcpOGP+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77893C369A9;
	Thu, 10 Apr 2025 14:28:23 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v5 0/7] Input: synaptics-rmi4 - add quirks for third party
 touchscreen controllers
Date: Thu, 10 Apr 2025 16:28:18 +0200
Message-Id: <20250410-synaptics-rmi4-v5-0-b41bb90f78b9@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAILV92cC/3WMQQ6CMBBFr2JmbU2ZtgKuvIdxQcsgsxBISxqQc
 HcLGxbG/NX7yXsLBPJMAW6nBTxFDtx3Ccz5BK6tuhcJrhMDSjRSyUKEuauGkV0Q/s1auEKhxSZ
 XjiwkafDU8LQHH8/ELYex9/Pej2p7/6aiElJgZmpFORZlhXeeeLy4D2yhqA9ZS/yRdZIza0uTR
 uaqD3ld1y8WzIt/5wAAAA==
X-Change-ID: 20250308-synaptics-rmi4-c832b2f73ceb
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4115; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=/tO0SoKjbCbkR8v6jdjdLMXE89gyw76G6Sr/g9tT82U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn99WE9RF/CMC6RDJvOfBi3l6BAkYaMmRTN+BHV
 9jqZ9/JbjmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ/fVhAAKCRBgAj/E00kg
 ctAPD/9FK83ZOyeYstNrBozlnX+P4jxX+eYt9835Jxhey5dtkXJLljtQDGAK1ChlbNpUwhlj7iF
 NBlOMdjk9ZFydI43/wNRQAbv3yvlDt3qWT508SSzToya6e7yQBxWLACea6Y90goTNG7Ckgxiw16
 U2S+SF2oAlnBRxLijGI8Q0GbMnjaiPdwiEir5YENbnz6BAPOycxC0tz2mY1IsoWJJX9WP/P/lLS
 nLCbY0VMTZEuEtE4ypdjOI2zEvf3lT733NKtXfXjiTQzgm7qCaBtcNbinatoti/b4h2W/jpjulB
 gfMcgtOCAZTTieH/aHi+YecMK06iUjLkUFv5s1cR6MKY0FeMCsaRymgtykd31wCxwm5p9wfOtk4
 DP4u2ZmP1AFEPk8YqLCIQF9Fzu+0ck6qH7CVIkpI8YvWnFZzeaftmgjLSS4QBKnr1YdQF1/qOR6
 l93B/cvsC3dZA7XImakLjl+vu/iQ5SnThMSKhHmj7Pb9gPkN2d69+B8CdwFA/MPxxi8XGx+z7dX
 bNIyUwXsAa7pMtuC6kPpzdoLdFTGVgHl2al1EJ8/9qWpdL02HWLH/3gDLOD66J9QjS64ZY4xul0
 Zbci45+a45BuhCDJ+rT3DQLh4HVrMihl2dRtozD37K0IOjqpGLg2MB/RRU86NjnytKTNpXX2cM4
 ybyEzdqNCu7pdAw==
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



