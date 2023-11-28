Return-Path: <linux-input+bounces-294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330047FC6EC
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D99C0286A0B
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 978643527B;
	Tue, 28 Nov 2023 21:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDzoE3E1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BDB44367;
	Tue, 28 Nov 2023 21:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26469C43391;
	Tue, 28 Nov 2023 21:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205640;
	bh=xHGnWuCCxuYyGR6ZhJm+dQIdcVZ2/tLLAL35SS9YPRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rDzoE3E1tMhQD05N5wPszhKAadOwxURtetAE7jdeYp5lWzDgjkVPQEgPQ1CIRWQ6+
	 BCc0ZDAMVaaPIBH6HJThidDKM0HnfP2mCOTMkKhYPJaotNWfbwB2J361WlWgDW9pRO
	 2ICN8f2T8dQC0kqnVK7iX/m2c9ScKOiicIZUfXa+0qE739A4xB9GoFWkVtLqcWzeoO
	 vvXxEmOLy+j+xIl3s8tbWBKuaZ4FyuTl4sOu+gy3aDZpJ7nSr+XXloJaA/NJKrszIn
	 BGeca97gxjabQPHmBoEFNAgCUwGqtkU+9/h54VelhEmEpHe4ABrZlIF53gyg+l0cqk
	 iveexc/MuFKZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Oliver Neukum <oneukum@suse.com>,
	Jiri Kosina <jkosina@suse.cz>,
	Sasha Levin <sashal@kernel.org>,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 28/40] HID: add ALWAYS_POLL quirk for Apple kb
Date: Tue, 28 Nov 2023 16:05:34 -0500
Message-ID: <20231128210615.875085-28-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210615.875085-1-sashal@kernel.org>
References: <20231128210615.875085-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.3
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
index 3983b4f282f8f..0384384120c9f 100644
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


