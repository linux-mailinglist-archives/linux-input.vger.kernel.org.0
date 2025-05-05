Return-Path: <linux-input+bounces-12153-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16529AAA85F
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 02:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA3503BB54E
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 00:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A0C296176;
	Mon,  5 May 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FRw6O7ud"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B71729616F;
	Mon,  5 May 2025 22:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484756; cv=none; b=tnJC6aRavBRsWK4FEiZIkXPtQQXHJnAGW7iQ0R6SBjCjqj2Jg5vzCPw4+sMg4n/i1i9a50Dh0z41ktbm3GfSDTa1HtVzfSAwMQFv6j//l0qzYUTrAq2ot28gzzDdDg26VgaXJdcFn4ybRy1ekiaGJe9b61IAe2Zf9AagEaLwRp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484756; c=relaxed/simple;
	bh=myG3xDKndjEbLNO7Alrr8ZDBH5rNgMU5c3BwtYuwtZU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=siI5e6jxGSCIhuzuB2JwleXwBserrkNP+GZcbyNWn6AJMzInXjYNbyL8iV6TXaiTGAUWYxY7ReBSgDfYHLfC76W2zlWmOFnkDgoC3PTAEP7Pz1MYz5T832QgITsHVBuelr/81izO1RXvieHAqdErYhda3cErow5IHTYwSCnwBkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FRw6O7ud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46B6C4CEED;
	Mon,  5 May 2025 22:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484756;
	bh=myG3xDKndjEbLNO7Alrr8ZDBH5rNgMU5c3BwtYuwtZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FRw6O7udF3INqUdlaoIyMxZbwuxCmntrT9KnnipewPRJhoZQgptyOPWhFhk/okWpb
	 8xQ2csOI0fP1+cS4ojCtzMHtRyzaw+kLtnUGvXXK7HPw1hT5kUUdba/8qJURpN/D07
	 8uWk79KXus7Ac+FuJDN0WDyUdJgIK1EJRUJkF0Pn6denz0tRXwRelFbGSKIephohpm
	 uwhMS7PcLUJac6ug2AuCj8gm26tp9d65njfdaD/p8X0kqi+wdzzKKP58U0I2CshO0W
	 6FKOF1Z/1RxdUtxW7+6Qc2CvJ5ezWI61PWxpXYT2AkpTdfEoKqkmqct72M4EpNhtfN
	 E2n8y3Pl4jJpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kate Hsuan <hpa@redhat.com>,
	kernel test robot <lkp@intel.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	hdegoede@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 641/642] HID: Kconfig: Add LEDS_CLASS_MULTICOLOR dependency to HID_LOGITECH
Date: Mon,  5 May 2025 18:14:17 -0400
Message-Id: <20250505221419.2672473-641-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Kate Hsuan <hpa@redhat.com>

[ Upstream commit 4465f4fa21e0e54c10896db3ed49dbd5a9aad3fd ]

The test bot found an issue with building hid-lg-g15.

All errors (new ones prefixed by >>):

   powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g510_kbd_led_write':
>> drivers/hid/hid-lg-g15.c:241:(.text+0x768): undefined reference to `led_mc_calc_color_components'
   powerpc-linux-ld: drivers/hid/hid-lg-g15.o: in function `lg_g15_register_led':
>> drivers/hid/hid-lg-g15.c:686:(.text+0xa9c): undefined reference to `devm_led_classdev_multicolor_register_ext'

Since multicolor LED APIs manage the keyboard backlight settings of
hid-lg-g15, the LEDS_CLASS_MULTICOLOR dependency was added to
HID_LOGITECH.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502110032.VZ0J024X-lkp@intel.com/
Fixes: a3a064146c50 ("HID: hid-lg-g15: Use standard multicolor LED API")
Signed-off-by: Kate Hsuan <hpa@redhat.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 4cfea399ebab2..76be97c5fc2ff 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -603,6 +603,7 @@ config HID_LOGITECH
 	tristate "Logitech devices"
 	depends on USB_HID
 	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR
 	default !EXPERT
 	help
 	Support for Logitech devices that are not fully compliant with HID standard.
-- 
2.39.5


