Return-Path: <linux-input+bounces-12737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F25AD168C
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 03:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B90547A445D
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 01:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E22E8633F;
	Mon,  9 Jun 2025 01:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjd9ohDe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5947812B94
	for <linux-input@vger.kernel.org>; Mon,  9 Jun 2025 01:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749433652; cv=none; b=Z08+40AnC0C1CSzEzPPUpu+eogyc9PZ/kK7Msjgg2ZLFZ0zI+zW9s5fBbx1X1cjGpROSvbFwieTwjasyayQpGD+it3mxqsyPQOVFScOpxo/jvGPSFPftCEuE+/WpFagPbZK/hBE3WRFM+q5yG4AGP+0FDZci0koCo5bYALSUY3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749433652; c=relaxed/simple;
	bh=B3CWKIvI0N2BSscz1/Po4D9VzhIdcbq/q5959aWc0cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9ERH8yIR5GwAC5OezGdPVvuXVMoNwM11C4km0GCVcCvdcvARgkublLK6gfMS3c3fGxoUX673r0qHYyYH6poh3Nz+PMEvyHEQajcgPmzdJLll6DjDmUyDCGZn7PH9CG6pGTYTmf2aAZ6W8dN3APNFfvLhMlzsu+HU7Ru6SIB4SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjd9ohDe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DC9C4CEEE;
	Mon,  9 Jun 2025 01:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749433651;
	bh=B3CWKIvI0N2BSscz1/Po4D9VzhIdcbq/q5959aWc0cU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pjd9ohDe6tW6KWGOsKsnTHdT8ECIma/31gCchW6SqrwAnfoeyBa9PeJk62epFhcwI
	 kke6NQseGL8W4MVsnQZWoJ2rMJEA8F22NfIbJnRRu1I40Czm+geuWXD62vmpv5Zng/
	 SL0bzrGSUCVs9/C3z+ElRGcv9hrw2DZShSS8HkDojnk2n3Qtki24bl4lrbksp1ztvx
	 f5G80FQ2wRgpUg5dUzexkG0LGPA7NzM+kJWKAl0nsnRGu02rbpErjgb8zVSLVTnCuh
	 0CI9l6U0XmVLrL9dWwV5ehBQNXasLWkHjTARbkTsMfSA8ToWzGWnULgUET++akCfr6
	 GAsWNYbyZ8aHA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	dmitry.torokhov@gmail.com
Cc: Vicki Pfau <vi@endrift.com>,
	linux-input@vger.kernel.org
Subject: [PATCH 2/2] Input: xpad: Return errors from xpad_try_sending_next_out_packet() up
Date: Sun,  8 Jun 2025 20:46:31 -0500
Message-ID: <20250609014718.236827-3-superm1@kernel.org>
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

Not all errors that occur in xpad_try_sending_next_out_packet() are
IO errors.  Pass up the error code to the caller so that it can
decide what to to.

Cc: Vicki Pfau <vi@endrift.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 714a694fc0e5e..e0374111d0174 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -1349,7 +1349,7 @@ static int xpad_try_sending_next_out_packet(struct usb_xpad *xpad)
 					"%s - usb_submit_urb failed with result %d\n",
 					__func__, error);
 			usb_unanchor_urb(xpad->irq_out);
-			return -EIO;
+			return error;
 		}
 
 		xpad->irq_out_active = true;
-- 
2.43.0


