Return-Path: <linux-input+bounces-11477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD281A79549
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 20:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29F011894BA4
	for <lists+linux-input@lfdr.de>; Wed,  2 Apr 2025 18:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A421DF759;
	Wed,  2 Apr 2025 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbyjZYmW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506C1DDA18;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743619497; cv=none; b=X0nELYGvKhBYNZPHVCOTBzFXaPkOGGT2n2ne+Tainu1B5+r9GdfmjDElhORzaz3e/NQGy1FYZZjpj2ja201olzK+2Fi9aQ5xqV91OnWF6eVn8FGG6VzZ8DlnAfpurGoOWdBZg1P4eA1XeyD8kp3Ws5K4KV/9UsAqlWH5+So2cVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743619497; c=relaxed/simple;
	bh=pIWHLhDHIvkDvzeT0c9GVKxW7jhxM9Ip1jV2sZ+5hpI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bPWnWpuRJUYo3unSJhpHzHSLB09q4niRvELY2d99PWSgkTTQP0iOF/L4Tqik2BnD2lhlHDk18OwQWtkqaj1cJ8Nfeee6OWGbvPSue9sFUcOnQQwndbBp24ENiR6wQErn/63qY1/g3hMRpywmQ7qMRxoD1ASf2hfyIR9pgo+83zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbyjZYmW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B075C4CEDD;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743619497;
	bh=pIWHLhDHIvkDvzeT0c9GVKxW7jhxM9Ip1jV2sZ+5hpI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WbyjZYmWT3/Pqy/j2crputn4GHUuJTcAKfvfxkgQzG60toYVxzrleW+KCvJzTd8vv
	 oZw0zNoty9YO2fUh+SX9YuNBpYwaY5r5kBzFfn89qWsalMpVOqv63Z+uE7T8EuFbgf
	 mqK1qbiy1w2QmNXMSAoH5iLGI+Mh7RZtpdi4SDCjM3zbpizKaSClbiYvjOoIdlOd7n
	 pLE1Pn5fkxpCjWhP7TuaajaL7Q2Z34hd6CIxlHWw9U1hYnCzyWFMhflDttnssuTYkR
	 jLpFkydhvUeGzq/7OxUOGWJ0kDmnDex6wvN539pDT/oG/b822jwFXloAMR7BIH/QUO
	 P7rjgwRgH2mQQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C46C28B20;
	Wed,  2 Apr 2025 18:44:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/7] Input: synaptics-rmi4 - add quirks for third party
 touchscreen controllers
Date: Wed, 02 Apr 2025 20:44:51 +0200
Message-Id: <20250402-synaptics-rmi4-v4-0-1bb95959e564@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKOF7WcC/3XMQQ6DIBCF4auYWZeGDhppV96jcYE41lkUDRCiN
 dy91H2X/0ved0AgzxTgUR3gKXHgxZWoLxXY2bgXCR5LA0pspJJahN2ZNbINwr+5FlYrHHBqlaU
 Bymn1NPF2gs++9MwhLn4//aR+618qKSEF3ppRUYv6brDjjePVfqDPOX8BuTQulaoAAAA=
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
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3953; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=pIWHLhDHIvkDvzeT0c9GVKxW7jhxM9Ip1jV2sZ+5hpI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn7YWmuQ1rjT3O6Af1rG12h0ug1JyFw6mOq7FaZ
 1gEJuEvVj+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+2FpgAKCRBgAj/E00kg
 cnB8EADGb26JxIaacAPG1ZzutxzjVacHj0ib/WBo+suGhyKhFrLvtG2XzdJCNEqj7HtT0SpdciE
 Rzj8+5SLNhVBjOOTgJkJtwjRWWVvNRF5TfIP2llzqqPPJl7ITKDByzHHaUkYbgyL3ChgsFEWC25
 G8BR1iLAig2LYM60N4mgauJ2hMkZ4JQWgx8DJNU0SPXbsaB0nz6G4wOfPqcNiVUNmTxEiwojgk0
 5L4rAOxr+n4UpSeuhtFIAvnla4bkyvI2QdsigkHbRu1E2CMboSMJ8QR6nWV4mbfXE82k3nFrpEn
 FEsONqz+JDD+l7429efJ7Kfdu4ilYEVDpuf97Uf2s6fGDmHQMFqab/Gc0MYIQ70pFQHRjXcw6wA
 uOrxiLWU+SGa/L39Z8P7sxTV2n5HG4b07SaqIvUS/mnS/T8qz344qG5NGe0xQcXrh9l3ouilpUJ
 WcnyLCAtY07j0IDn/kHYPSlFaigRqpMrpt86DTCDyi5grevKb53k7UtkW14yzd+9NtIUhtbLT5P
 GpUJ8rmWU1xY5TaJwTxrFuRp9BuScQpjhX7e0HS/9YLr0SP5qjzMDdm4DDzFdQbupWKXZJ2R2In
 cbsHe4Bjd3wx3WETgWeusTilg+QyNXX1aJTIcKq/cwnRZq8muNTjuVH8+BNPKtkBVDm2gOm2xm2
 Qg8qT8/nWyfFDBA==
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
      dt-bindings: input: syna,rmi4: Document syna,rmi4-s3706b-i2c

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
base-commit: fefb886b1344e222b3218f3c0165b0fd770e8b88
change-id: 20250308-synaptics-rmi4-c832b2f73ceb

Best regards,
-- 
David Heidelberg <david@ixit.cz>



