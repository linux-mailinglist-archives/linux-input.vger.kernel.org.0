Return-Path: <linux-input+bounces-10646-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B47A57AE1
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 15:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 789991890176
	for <lists+linux-input@lfdr.de>; Sat,  8 Mar 2025 14:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D9D1B4F0B;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wui7PiEI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB974EB51;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741442924; cv=none; b=V/38NZQs+TVYBckXmMJgXkLyg12YEDiHroc5ybJM24II+5Ez4QgH9bHKM2C7ELjjE3fMJl3uJCePmUHr5fUZ1DqYeNtna9Nw3bQGww5z5w4XP1whQA4QzY9Inx7wr9ekuCWEN8jqoilc9eGN2kxRSF8bUjydaC52aV8SItQv5xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741442924; c=relaxed/simple;
	bh=EILwc20FJUVaX/R/Iit/qz8nLHvsosl7hxmzh0DeI04=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tqLjt6deYYm9BcslEnj19qBpr0/crCGwoRN/drqv3pwqxUp1ew0R2lRQznSMfJcTlAYZtUC6K7MDeV4nEDlpfdVsHoGDbbwzgj+MeSqjnAeDh1Q0EE0Pu8iw4uqolDUAGaG5G9ApaQX338z2ECm8yMwWlFvW7WpQpcXsLBLNXsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wui7PiEI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08981C4CEE0;
	Sat,  8 Mar 2025 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741442924;
	bh=EILwc20FJUVaX/R/Iit/qz8nLHvsosl7hxmzh0DeI04=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Wui7PiEIuqULBmE4aVjtIfM6DtTpetyRmK6HSqsaJpYZ2ihJSbdvNdeU1aEwFH9GF
	 qiHMrgHIBzyK/RsN/oQQ+dCwX78jcwSR2J7D1Ru3Jk3uPXlvtTHT7vEVrOk4zYC6/P
	 bTZJBtib0RkJHzC0TbGTSmfZ82S02sVr98qeCY9SQbM/GIyd+K6sYQhFGNYTKebRqK
	 A6Jw1HpVZbNwnINvRUiKShcCP50Km3YFNYNRIS5zVM4/SeKz+ed72YArR8LygHvAJc
	 WvYSIOHf8iKIQpiBmKMLI71CaWq0z/2+UszON2gWJrR6lbVb9p25y3BjpdOsap5/ib
	 VFhEOaGajK49A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CEAC282EC;
	Sat,  8 Mar 2025 14:08:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v3 0/7] Subject: [PATCH v3 0/7] Input: synaptics-rmi4: add
 quirks for third party touchscreen controllers
Date: Sat, 08 Mar 2025 15:08:36 +0100
Message-Id: <20250308-synaptics-rmi4-v3-0-215d3e7289a2@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRPzGcC/x3MQQqAIBBA0avErBNEi6SrRIu0sWaRiRNRiHdPW
 r7F/xkYEyHD2GRIeBPTGSp024Dbl7ChoLUalFS91NIIfsMSL3Is0kGdcEYrq/ygHVqoUUzo6fm
 H01zKB8KQ9FxgAAAA
X-Change-ID: 20250308-synaptics-rmi4-c832b2f73ceb
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
 Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>, methanal <baclofen@tuta.io>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3256; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=EILwc20FJUVaX/R/Iit/qz8nLHvsosl7hxmzh0DeI04=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBnzE9piUOrZt/9h39umR5cq567BjSbkxwrdqprg
 z+IZlDhzlmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ8xPaQAKCRBgAj/E00kg
 co0GD/4rCpeORL/DsgUepfWCaCPkAK4uSZ0tlJ+HleoBRbnifPTMulhwr2VCdkITUttzvtcgRQK
 D5+u9eEhQZJK4kyOEty78WvX5OzXPyqVb4nDmes6xDhX8hdE7oIDNSrN6LiWC/6ZIdN7Y7N6cbB
 SMErNaSO02ltb2fou9SqJdj/QZ5pQwmMOs96UeZtBC6YK0gMoKQI9eJAzvTrOhpPhWsBu8MmIx/
 yudpGvSm541GtnSc5vuG5FzgfClKwGm4MbGbbtGd2iqX9HclWrD/bin6NRr9z9Hx6nGWflfc77Y
 11zEAZW0+GYqdHeNu72y7uUNCr2hpB4vYIPnsYfZYildcqtl1IhGED50/wX0ZZkXVnQQ/TJe9d6
 HDlLzRfqlzsyk1+o0st26SCMR05XqAbciD3XjBPVFjRoTxNdUyGECz80HbsR/Xcdv0JVP9iwp3q
 OsvsxqzbCRoFLt9UFbq+0vkEMgpowuu7FXLPTY/Zygnm3RSxA3o31BKGmu3VtyUv7Ky9SvaC3ET
 0z3BBEjbrJ84c5OlIMjdW9oW5xs4aHgcr3NUtYHjyZi9mxdkEFyydVjpDwMaRfedfpGua+e8iWI
 s1tD1I1SScfv7QKCq2SDCUTFeA3RrY6yk6PeAdz801RUH8nQ61Q5G7d7Ag5bCmV0ifOzOzgOp7j
 sh5Wzz9xZ8b70sg==
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
months, and they are known to not cause any regressions on the OnePlus
6/6T (with the official Synaptics controller), however I don't own any
other rmi4 hardware to further validate this.

---
Changes since v2:
- reworded dt-bindings property description
- fixed the rmi_driver_of_probe definition for non device-tree builds.
- fixed some indentation issues reported by checkpatch
- change rmi_pdt_entry_is_valid() variable to unsigned 
- Link to v2: https://patchwork.kernel.org/project/linux-input/cover/20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org/

Changes since v1:
- Improve dt-bindings patch (thanks Rob)
- Add missing cast in patch 5 to fix the pointer arithmetic
- Link to v1: https://lore.kernel.org/r/20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org

---
Caleb Connolly (2):
      dt-bindings: input: syna,rmi4: document syna,pdt-fallback-desc
      Input: synaptics-rmi4 - handle duplicate/unknown PDT entries

methanal (5):
      Input: synaptics-rmi4 - f12: use hardcoded values for aftermarket touch ICs
      Input: synaptics-rmi4 - f55: handle zero electrode count
      Input: synaptics-rmi4 - don't do unaligned reads in IRQ context
      Input: synaptics-rmi4 - read product ID on aftermarket touch ICs
      Input: synaptics-rmi4 - support fallback values for PDT descriptor bytes

 .../devicetree/bindings/input/syna,rmi4.yaml       |  18 +++
 drivers/input/rmi4/rmi_driver.c                    | 140 +++++++++++++++++----
 drivers/input/rmi4/rmi_driver.h                    |   8 ++
 drivers/input/rmi4/rmi_f01.c                       |  14 +++
 drivers/input/rmi4/rmi_f12.c                       | 117 +++++++++++++----
 drivers/input/rmi4/rmi_f55.c                       |   5 +
 include/linux/rmi.h                                |   3 +
 7 files changed, 258 insertions(+), 47 deletions(-)
---
base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
change-id: 20250308-synaptics-rmi4-c832b2f73ceb

Best regards,
-- 
David Heidelberg <david@ixit.cz>



