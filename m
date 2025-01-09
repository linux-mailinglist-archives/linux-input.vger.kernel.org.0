Return-Path: <linux-input+bounces-9122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21209A0824B
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 22:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2875C164B04
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 21:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45F1204C39;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OsAf3xTl"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940232046A3;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458702; cv=none; b=jG119R1rdlrcl739jUcDqwHjcSoIwaPvk7c/IadLWfGhkVI/nHbtQAm9EagL6cqgkSypy0eRy/ujt1b5CbPIaUt1XelX9pyxegKAdoxPlCXVpabtXW4/FeVK7324Zjzlos/ng+1bbF1qoMpQP1Dv8BHhQjkjtCuMkakDHEDdvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458702; c=relaxed/simple;
	bh=iDynsn5T3AIRd0fuaDAF6TG+oOSwkul/fDifxm3P8PY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mnLtmgg0aIkeBqiet7LkSO+bwWIHXVRDBcV69MCDkB6P74tmC56nZpbjBbuOVHfkcdoPrS7CnOTVB/A9EgWY8Rezf1kxhEjbEvaf125Wf24/g4hYgEYajjt/M5IsYPwtowWZTt1lj0DbkmqWNjYarP9mQ9BCYZyPgXQ5jNLCM1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OsAf3xTl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20AF5C4CED2;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458702;
	bh=iDynsn5T3AIRd0fuaDAF6TG+oOSwkul/fDifxm3P8PY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=OsAf3xTl8kpIxLvajRmHbLxt5CT/29PmlgoW8jZ5sDYkJ64JH/2qaWPfJV6P/u2P4
	 Q9kbLdjo6QGBYOreV+gmGEqJLrP1vpLM7ZGknWO8f+kevXRfMtGlls96XkR5uQ5kDJ
	 SOUzm4OutKJf66Y8ZOfgjg092QBUh83LwRIkwox9SGAQiChc3eOTHOttiXrUqe4hip
	 7aVeMRDpNuPyu2PnXDXtoslO1iePfrfi7n/TJ9igx7it4TtZRUZvKbO1g6Accl6/m3
	 1vLVMqIb8qGeXbLzSJPUaZFqgI56U8WvqZJhf5nkrITgePMYxvyJiwjnS3F03QoTt9
	 t+u5P8OGUmhyw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5E6E77197;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekodevelopper.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] Input: cyttsp5 - improve error handling and remove
 regmap
Date: Fri, 10 Jan 2025 00:37:46 +0300
Message-Id: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKpBgGcC/x3MSw6DIBAA0KuYWXcSQIyfqzRdWBh10hQJQ9XGe
 PeSLt/mnSCUmASG6oREGwuvoaC+VeCWMcyE7IvBKNMorRUGeq1u9/iJkhONbw4zum/OEht8dpZ
 8r03rrIUyxEQTH//9/riuHz/WO91tAAAA
X-Change-ID: 20250110-nekocwd-upstreaming-cyttsp5-b84ed9127c44
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=nekodevelopper@gmail.com; h=from:subject:message-id;
 bh=iDynsn5T3AIRd0fuaDAF6TG+oOSwkul/fDifxm3P8PY=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNIbHM9Unat0yl1SotVazH38coXUp96chqyt7lukbZTMb
 wbUup7sKGVhEONikBVTZLHZ6DFbLD9cctK0pwowc1iZQIYwcHEKwER8mBkZHnfG/XJ80TjtUcu5
 UvkP90/5cf+Yf8FywtP1H3/cXFynV8/w318qWawzVfJ578UT/yMvcG17GiHr6moaXZwevuxAkrw
 vBwA=
X-Developer-Key: i=nekodevelopper@gmail.com; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582
X-Endpoint-Received: by B4 Relay for nekodevelopper@gmail.com/default with
 auth_id=314
X-Original-From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
Reply-To: nekodevelopper@gmail.com

The vendor cyttsp5 driver does not use regmap for i2c support, it
would appear this is due to regmap not providing sufficient levels
of control to handle various error conditions that may be present
under some configuration/firmware variants.

To improve reliability lets refactor the cyttsp5 i2c interface to
function more like the vendor driver and implement some of the error
handling retry/recovery techniques present there.

As part of this rather than assuming the device is in bootloader mode
we should first check that the device is in bootloader and only
attempt to launch the app if it actually is in the bootloader.

Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Vasiliy Doylov (NekoCWD) <nekodevelopper@gmail.com>
---
Changes v1 -> v2:
  - remove unused reg variable
Changes v2 -> v3:
  - splitted commit
---

---
Vasiliy Doylov (NekoCWD) (4):
      input: cyttsp5: improve error handling
      input: cyttsp5: improve read size
      input: cyttsp5: use raw i2c instead of regmap
      input: cyttsp5: add startup retry

 drivers/input/touchscreen/cyttsp5.c | 257 +++++++++++++++++++++++-------------
 1 file changed, 168 insertions(+), 89 deletions(-)
---
base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
change-id: 20250110-nekocwd-upstreaming-cyttsp5-b84ed9127c44

Best regards,
-- 
Vasiliy Doylov (NekoCWD) <nekodevelopper@gmail.com>



