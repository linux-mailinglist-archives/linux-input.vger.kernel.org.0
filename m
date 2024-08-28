Return-Path: <linux-input+bounces-5920-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3ED9962143
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 09:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D75DB25C48
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 07:35:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E8C15D5A6;
	Wed, 28 Aug 2024 07:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="a5sTFQI2"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA6415B572;
	Wed, 28 Aug 2024 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724830481; cv=none; b=udwK8DYseewIeTVRQj6gZgU0e63X5xzMQGv0FesVT+jKIXi/Wc85cu5TSIRbt3k0EvP4LzAQVRnNVWEM/oV6IWrJ4xUz704AFaUGsBEc+Zpb81XhwLDpt6Qr+0ADqmJ5Q/9qoGt/6eZqezf+vfpKk5FqHgSGTIiVlDBBobRTyK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724830481; c=relaxed/simple;
	bh=Hgc4Piz+qRkovh9KLxoyA1SrOSPZibfNRwLc00yuIsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kN3wmGeNEUAYHHCfTATlnI6DYdKgkNhygevaZxcHQ7e27mea31yXDt+nrk/ctnOyvyr3wN2cw8bIvUCwhpklvELPlnKdqBVyIl5UhHSP+hw2NwKjABhPHN3it5xtOD5XCP5kLZuhQqWufoYOKi+xpEwa7mKr3ZGK5h0Q9TGIfms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=a5sTFQI2; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1724830478;
	bh=Hgc4Piz+qRkovh9KLxoyA1SrOSPZibfNRwLc00yuIsg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a5sTFQI2OOClq3E1/+EcW8aAMJ6JDCu+Mj+6GwSrTIWoz3a22PygJRa01tKELWLZ0
	 k7B7FUty5jDSItyYSD2wtAWVTu3w+V6DRGC2xx2cjGamq+Aoh7imy+t5YZBXU+oLio
	 vC33jzYMftlIiGXsfMz09x+Sf8HZaXOI//acMt/E=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 28 Aug 2024 09:33:26 +0200
Subject: [PATCH 07/14] HID: vrc2: constify fixed up report descriptor
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240828-hid-const-fixup-2-v1-7-663b9210eb69@weissschuh.net>
References: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
In-Reply-To: <20240828-hid-const-fixup-2-v1-0-663b9210eb69@weissschuh.net>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724830449; l=745;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Hgc4Piz+qRkovh9KLxoyA1SrOSPZibfNRwLc00yuIsg=;
 b=ZhvmYpOStjvkQSfX3VRqa8NbtAJ5/afANvuTOdw5UdWJx1K+eCVjPqTnP3TY9r3VJO4oJrzvM
 rHmwjiOommgD8jIgN+54pFCIXgDSE01PIB5xiljJwMKcN9s3E6CBhu7
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Now that the HID core can handle const report descriptors,
constify them where possible.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/hid/hid-vrc2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-vrc2.c b/drivers/hid/hid-vrc2.c
index 9a4840b524ba..7dc41e92f488 100644
--- a/drivers/hid/hid-vrc2.c
+++ b/drivers/hid/hid-vrc2.c
@@ -16,7 +16,7 @@
 #define USB_VENDOR_ID_VRC2	(0x07c0)
 #define USB_DEVICE_ID_VRC2	(0x1125)
 
-static __u8 vrc2_rdesc_fixed[] = {
+static const __u8 vrc2_rdesc_fixed[] = {
 	0x05, 0x01,        // Usage Page (Generic Desktop Ctrls)
 	0x09, 0x04,        // Usage (Joystick)
 	0xA1, 0x01,        // Collection (Application)

-- 
2.46.0


