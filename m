Return-Path: <linux-input+bounces-10502-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBA9A4CB89
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 20:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46A8C167C07
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 19:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892E021B9CF;
	Mon,  3 Mar 2025 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mvET0YI3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284BF1DE2BF;
	Mon,  3 Mar 2025 19:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741028699; cv=none; b=pSVcV8ftrMHIK2mqv/GhqKDILs9Z2tdmvulQ3/+B4BtngJCE0JI+xOo6gWFA0Ound1A4KEMzSqeujmY19DDeu8/QYk5Zb++mKF5UNhE9FQVDPQ/FvmJzXBqLbywbUUleIkPxauZufO2Kxm1qL/y4virLJJwWrvcw84goe6okPQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741028699; c=relaxed/simple;
	bh=7f8zhBmnYIQY/hVV8Ox5ondAxkUb7sSp+AVuW3GeSFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P2uq5hdzrpcTXSoSUYbyphkl1PqXK1Vu/J71HlN70AsE/RN54e6dRYGiFDdqC2p+pDfCIuh2+1PtywuHnud1XTmvxaOxxr8LwrTs6c4YLpok99dyeVU0WnjxhYj4NyGvr/a53PkAX7t3FleZyrsXRWSHRIcbNStof0fu4muga44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=mvET0YI3; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 0CDD52FC004A;
	Mon,  3 Mar 2025 20:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741028693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ug1MGBU8UIz5I0TH5SUsDUHFl3Z8sg6GRAsc5+BcUxM=;
	b=mvET0YI35m3KkfxADFAO2nedns3g57hRnYIyMiv+H8KcBo7+0wKqvSXhnR1TKA6Q9UU2aH
	zym+Ey53MjxyfG8Fe6n9D3oohzlIPEWH8m9jja+puPj8a1mVFlyRv9E9MRK66MB5dvSQt+
	rcwHEf7/JLFbcQMYSw33zPvAfB1ewHI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: mario.limonciello@amd.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] Input: atkbd - map F21 key to support touchpad toggle keys
Date: Mon,  3 Mar 2025 20:04:34 +0100
Message-ID: <20250303190442.551961-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the default xkeyboard-config used by both X11 and wayland touchpad
toggle is assigned to F21.

This patch is in preparation for i8042 filter patches to be able to remap
bogus scancode(-combinations), produced by notebooks uppon pressing a
touchpad toggle key.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Cc: <stable@vger.kernel.org>
---
 drivers/input/keyboard/atkbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index adf0f311996c9..2ba3493de88cc 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -88,7 +88,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
 	  0, 56, 42, 93, 29, 16,  2,  0,  0,  0, 44, 31, 30, 17,  3,  0,
 	  0, 46, 45, 32, 18,  5,  4, 95,  0, 57, 47, 33, 20, 19,  6,183,
 	  0, 49, 48, 35, 34, 21,  7,184,  0,  0, 50, 36, 22,  8,  9,185,
-	  0, 51, 37, 23, 24, 11, 10,  0,  0, 52, 53, 38, 39, 25, 12,  0,
+	  0, 51, 37, 23, 24, 11, 10,  0,191, 52, 53, 38, 39, 25, 12,  0,
 	  0, 89, 40,  0, 26, 13,  0,193, 58, 54, 28, 27,  0, 43,  0, 85,
 	  0, 86, 91, 90, 92,  0, 14, 94,  0, 79,124, 75, 71,121,  0,  0,
 	 82, 83, 80, 76, 77, 72,  1, 69, 87, 78, 81, 74, 55, 73, 70, 99,
-- 
2.43.0


