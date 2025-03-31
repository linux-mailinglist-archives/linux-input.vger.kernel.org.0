Return-Path: <linux-input+bounces-11429-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A73A76A3A
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 17:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48BF07A175D
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 15:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83FE724E009;
	Mon, 31 Mar 2025 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1SbEKA2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F8F24E003;
	Mon, 31 Mar 2025 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743433026; cv=none; b=Rc2Y4/cEShbyqAiGqnQSxWMGKKQj7vbY1JodZ48UV0s6tiCUd8X8dPm4zRrEgj7pILDEfjR3HmaDi7wTULDpuVf6O+gtZtzMBdy94M3a0SncX8pZUMSNnjazCoudftUXlxod9cf7H20MkhOn1huFI7h/E4+aBRBXA0A86wZlYLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743433026; c=relaxed/simple;
	bh=WwKf7qEzym3fm1+PYCXiS5nCEC8E5Q7PGj26QpqD5CM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XVd5PTk0gHxE+EDcGqs41eHeMP+eTncyrnAnSIWe8kj3z5PodaVPy8HhHbCFPNSRPmDNexLhA6QGL9oH5H7krKWE0xzK4oVkEL5J9ivaOJpIX3uL3TjItfMfpEudN+qHVWtjHCp54TsG7MVSMu1kjuHEkfKTHB8/haqW2HdPO34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1SbEKA2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02C7C4CEE3;
	Mon, 31 Mar 2025 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743433026;
	bh=WwKf7qEzym3fm1+PYCXiS5nCEC8E5Q7PGj26QpqD5CM=;
	h=From:To:Cc:Subject:Date:From;
	b=W1SbEKA2W2C6xBgR8BgDWZh51kFkx0dQvPBtvEPv2tL9yWU+oWPEBtu+Gfs8mbYy/
	 qkJMlWNjYocipxnIOr9KT0PwiZKCA0rBnFffDGfHMC/9VKV4gf1V7LiGDSQrRFeRHF
	 r80OVGxVgi2jpBYGc9uFXpksgkE45cESoqFSUpL7Vpul8gLZFlo7PPvOZSzk4t162P
	 pnuHq0YQdqS0yvKNCmw7v6WSSF6KJQh7rwIMtGhVP468V3KQFw2EUwuX0bTPeDbSRy
	 8FOiXVI0ABgfpOVuD8Vv/4qSCYnJe/MwOWIgLD15sTLlMVkDBwrpLw+ClGIozc74gT
	 Y6QNtsCmrco7w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
	Makarenko Oleg <oleg@makarenk.ooo>,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>,
	Paul Dino Jones <paul@spacefreak18.xyz>,
	=?UTF-8?q?Crist=C3=B3ferson=20Bueno?= <cbueno81@gmail.com>,
	Pablo Cisneros <patchkez@protonmail.com>,
	Jiri Kosina <jkosina@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 1/6] HID: pidff: Convert infinite length from Linux API to PID standard
Date: Mon, 31 Mar 2025 10:56:58 -0400
Message-Id: <20250331145703.1706165-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.179
Content-Transfer-Encoding: 8bit

From: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>

[ Upstream commit 37e0591fe44dce39d1ebc7a82d5b6e4dba1582eb ]

Software uses 0 as de-facto infinite lenght on Linux FF apis (SDL),
Linux doesn't actually define anythi as of now, while USB PID defines
NULL (0xffff). Most PID devices do not expect a 0-length effect and
can't interpret it as infinite. This change fixes Force Feedback for
most PID compliant devices.

As most games depend on updating the values of already playing infinite
effects, this is crucial to ensure they will actually work.

Previously, users had to rely on third-party software to do this conversion
and make their PID devices usable.

Co-developed-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Makarenko Oleg <oleg@makarenk.ooo>
Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
Signed-off-by: Jiri Kosina <jkosina@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hid-pidff.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3b4ee21cd8111..5fe4422bb5bad 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -21,6 +21,7 @@
 #include "usbhid.h"
 
 #define	PID_EFFECTS_MAX		64
+#define	PID_INFINITE		0xffff
 
 /* Report usage table used to put reports into an array */
 
@@ -301,7 +302,12 @@ static void pidff_set_effect_report(struct pidff_device *pidff,
 		pidff->block_load[PID_EFFECT_BLOCK_INDEX].value[0];
 	pidff->set_effect_type->value[0] =
 		pidff->create_new_effect_type->value[0];
-	pidff->set_effect[PID_DURATION].value[0] = effect->replay.length;
+
+	/* Convert infinite length from Linux API (0)
+	   to PID standard (NULL) if needed */
+	pidff->set_effect[PID_DURATION].value[0] =
+		effect->replay.length == 0 ? PID_INFINITE : effect->replay.length;
+
 	pidff->set_effect[PID_TRIGGER_BUTTON].value[0] = effect->trigger.button;
 	pidff->set_effect[PID_TRIGGER_REPEAT_INT].value[0] =
 		effect->trigger.interval;
-- 
2.39.5


