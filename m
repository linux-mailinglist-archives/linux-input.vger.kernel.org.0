Return-Path: <linux-input+bounces-12736-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F641AD168B
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 03:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7353A8AE5
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 01:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A34914D8D1;
	Mon,  9 Jun 2025 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OptiznrD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E58312B94
	for <linux-input@vger.kernel.org>; Mon,  9 Jun 2025 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749433651; cv=none; b=KqNzpRGFdyR338TixzNXHtwIu6WuESBL8zy+ST4Kuemo6La/JWtBPZoh6O4VuyxyHhkHJZveSwrAYQMT1pbRbjH7P+Xlba8RzT9d64fnzsosQdiF36uJwCgUUGykS6r98fzC0pSKoaXYZI9DEKoczyoNWihQquC9qYyqy1PfyAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749433651; c=relaxed/simple;
	bh=wAu9Bm+Mw5O4OaXL9CM7XNDo23JDWr8bPutnxZzqeY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PPVU+T4+/0lIi1tKkcyeJqFKGc+f3/2Kd3qXYnF1aG687u8ZQtipUdFizEpYemA5OiLVZ2lZPjNf0EcrXAWjfd4p0+QoE4lPKD/sIFIHvhIerb0rv/sNhMin2hDd78saf7gP/NfcSZbi8hel4yRRbPtOR/bo7jOCOmw3hd/LBvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OptiznrD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A96EC4CEF0;
	Mon,  9 Jun 2025 01:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749433651;
	bh=wAu9Bm+Mw5O4OaXL9CM7XNDo23JDWr8bPutnxZzqeY8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OptiznrDEF2ZIOf4GS2QUSQ3LrHWjbeQEXB+s+yLKAYPk4/iDq1zNXAzQkxwkoW8+
	 r/JVV+rYdDnuBXztRIdFHX/XgAvfcrtuJccH+UJNeJwOBsT/IKhtbPp7eALQcUsxlT
	 Ys42MCBxgRNuGBGlbbONuzOYLImduVrnZXM35x6SPTDofGnEsxNTpc1ytQjPyM7CSq
	 b6P3ey99cVmBBr7muNpCn0L3H7d2HDnFpQrN9UVW3EjuRLTzrHL289owV2bMl6CJ3B
	 X4X9qlF4UJjrHZVM+H1D50bBxLf+Uu95Z1nMpyUG32FvU6TA1NsPy1lbz9pNbVVSQh
	 HMy8kvPvtYvOA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	dmitry.torokhov@gmail.com,
	rojtberg@gmail.com
Cc: Vicki Pfau <vi@endrift.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 1/2] Input: xpad: Adjust error handling for disconnect
Date: Sun,  8 Jun 2025 20:46:30 -0500
Message-ID: <20250609014718.236827-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609014718.236827-1-superm1@kernel.org>
References: <20250609014718.236827-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

When a device supporting xpad is disconnected it's expected that a
URB will fail to transmit.

Only show an error message when the error isn't -ENODEV.

Cc: Vicki Pfau <vi@endrift.com>
Fixes: 7fc595f4c0263 ("Input: xpad - correctly handle concurrent LED and FF requests")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/input/joystick/xpad.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c066a4da7c140..714a694fc0e5e 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1344,9 +1344,10 @@ static int xpad_try_sending_next_out_packet(struct usb_xpad *xpad)
 		usb_anchor_urb(xpad->irq_out, &xpad->irq_out_anchor);
 		error = usb_submit_urb(xpad->irq_out, GFP_ATOMIC);
 		if (error) {
-			dev_err(&xpad->intf->dev,
-				"%s - usb_submit_urb failed with result %d\n",
-				__func__, error);
+			if (error != -ENODEV)
+				dev_err(&xpad->intf->dev,
+					"%s - usb_submit_urb failed with result %d\n",
+					__func__, error);
 			usb_unanchor_urb(xpad->irq_out);
 			return -EIO;
 		}
-- 
2.43.0


