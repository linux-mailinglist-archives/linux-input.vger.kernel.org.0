Return-Path: <linux-input+bounces-15806-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5513CC2119B
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 17:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0490C4042D8
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 16:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55DE3655FF;
	Thu, 30 Oct 2025 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRavKu2A"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C126A3655FC
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 16:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761840413; cv=none; b=seA6+WnMDKgRKoS1nBW755SWQjqjMe7Rct50IzDt2JZRaloK6woOYH41OqrUKmcAXQTgkKZLvIRbgFPF37uzwgKCYm7/k2g+XAMX6yEQG+fDzNZWvxrREMUcpdBU4GedHHbFzgePzqFd9XEwRDOlGBFmaA08+prS4+heGlU8eog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761840413; c=relaxed/simple;
	bh=cGD3JrzUrKfIUyo0MRXAf3KbxaxoqfQZx/jKT1JzaUg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IsUw3BD63LJWjqy5DMiaqpX0Bu6PhBp7E3fWny0cqXM8Ys1wS//CytjVw9Mr8kAdvPyf9aP09OtZZgGGfQ/DyuJjTdB2WG04+a+XGQGw6bcnyJ+og+GvGzGDYmaeAOObwrIyED5rftS+Xx+oW4WsCyCCbB2Lsf0IeIkJgipXp/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRavKu2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F00C4CEFB;
	Thu, 30 Oct 2025 16:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761840413;
	bh=cGD3JrzUrKfIUyo0MRXAf3KbxaxoqfQZx/jKT1JzaUg=;
	h=From:To:Cc:Subject:Date:From;
	b=GRavKu2A5ryapQIjdXcHLerUvRVFa60Aybs1ZzXEoWYXYvd9SvEHNobapdyxeUY5v
	 Pr9iJrJzYGUlcd6QfQOlX7WEnDM0esiOcQxzGZvCerL+yiyfd41s577/xfkUh0CdyS
	 XkHe6B7qh6n1A3nyavM5jKjatWG3GFFzslEYANFkZF8X0SjDLyaREY+iOUlQ7NzpHR
	 EK8xYOAeL9kAKL3y7goADtmksfFj6QMu1h8qUZll/c8CyaX9rU7u3MLEengRXazlyB
	 mh13pOpU+QnCeEb5777MOnSSZtd+xC/tkbjCeYNa1un6gPqS3xrfLKeBmsAbaXQlSD
	 cFI8FnUewqhEQ==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: mario.limonciello@amd.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Barata?= <andretiagob@protonmail.com>,
	linux-input@vger.kernel.org
Subject: [PATCH] HID: hid-input: Extend Elan ignore battery quirk to USB
Date: Thu, 30 Oct 2025 11:06:25 -0500
Message-ID: <20251030160643.3775606-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

USB Elan devices have the same problem as the I2C ones with a fake
battery device showing up.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Reported-by: André Barata <andretiagob@protonmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220722
Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e56e7de532799..2bbb645c2ff41 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -399,10 +399,11 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_CHROMEBOOK_TROGDOR_POMPOM),
 	  HID_BATTERY_QUIRK_AVOID_QUERY },
 	/*
-	 * Elan I2C-HID touchscreens seem to all report a non present battery,
-	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
+	 * Elan HID touchscreens seem to all report a non present battery,
+	 * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C and USB HID devices.
 	 */
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK_IGNORE },
 	{}
 };
 
-- 
2.43.0


