Return-Path: <linux-input+bounces-306-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B860F7FC773
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 754272827F1
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06599481AA;
	Tue, 28 Nov 2023 21:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQYSMpKz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD4344366;
	Tue, 28 Nov 2023 21:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD1F9C433CC;
	Tue, 28 Nov 2023 21:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205768;
	bh=jDHcykOOAVnMk0Hh3Ap38ts+LRcD8TFuWOtpKJeCN0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qQYSMpKzBaOwdPh7yoM9eDZ503O80F/bPKxd8/1uQ/f61HsgyxB41l/W5SPBiHp4H
	 XUPu7MHlxGqwPkzPJFxvZy+6xliFf/aOy0SGFK+RO0/QpwozQseRhdL/0cbSrBNIk5
	 ge1V7hBAt7J2V+7o98oE5ODmqm8M8RdbMS9BsAQWkRFtiAurHbttGV6Rf/JJAc8F3Q
	 EL5OH4iL7gYlNDTwqVqSd35FBYWFJjlMAbU6OuI6hiu4t0RRz6XMax4CuOQW5nzqPf
	 dyBKIOnyYcllRRySfpUBqoNuFtGXsZQei/7+l/rueAmWniDWIXQ7QOorz/mj+gRVUZ
	 8onIeG5zYgBnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 09/13] HID: add ALWAYS_POLL quirk for Apple kb
Date: Tue, 28 Nov 2023 16:09:03 -0500
Message-ID: <20231128210914.876813-9-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210914.876813-1-sashal@kernel.org>
References: <20231128210914.876813-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.202
Content-Transfer-Encoding: 8bit

From: Oliver Neukum <oneukum@suse.com>

[ Upstream commit c55092187d9ad7b2f8f5a8645286fa03997d442f ]

These devices disconnect if suspended without remote wakeup. They can operate
with the standard driver.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/hid-quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 4229e5de06745..2093c6a045eef 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -33,6 +33,7 @@ static const struct hid_device_id hid_quirks[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AKAI, USB_DEVICE_ID_AKAI_MPKMINI2), HID_QUIRK_NO_INIT_REPORTS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ALPS, USB_DEVICE_ID_IBM_GAMEPAD), HID_QUIRK_BADPAD },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_AMI, USB_DEVICE_ID_AMI_VIRT_KEYBOARD_AND_MOUSE), HID_QUIRK_ALWAYS_POLL },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_REVB_ANSI), HID_QUIRK_ALWAYS_POLL },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ATEN, USB_DEVICE_ID_ATEN_2PORTKVM), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ATEN, USB_DEVICE_ID_ATEN_4PORTKVMC), HID_QUIRK_NOGET },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ATEN, USB_DEVICE_ID_ATEN_4PORTKVM), HID_QUIRK_NOGET },
-- 
2.42.0


