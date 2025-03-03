Return-Path: <linux-input+bounces-10499-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2EDA4C6D5
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 17:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D6FB16433E
	for <lists+linux-input@lfdr.de>; Mon,  3 Mar 2025 16:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254A822B587;
	Mon,  3 Mar 2025 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="XMQmtGEt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21378214A93;
	Mon,  3 Mar 2025 16:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018373; cv=none; b=Jfw4SD2hWxtmIfL3wVKPAWxSduR9SvaAEBNbLNMkdcZOCv2W3ijx3gOIoU8kFpfCm98WzlIiQ0SOErHAS9I40mjkQbOvosWIpC4KrNBZVrVh5wQ1LeHsdKjn4OOnvqo3b5sI8g9fjSm+y8HyIWIlrcAtdBrAHJnMEjlCTTCn4Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018373; c=relaxed/simple;
	bh=7f8zhBmnYIQY/hVV8Ox5ondAxkUb7sSp+AVuW3GeSFM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ay5UTM0G4GZ+ZFDwSEQJd70MJt+AGA0m0kosau05FR1YtotEBrxvNeCv2CMNO4rTB2KWWrhW1XIQcjXYtNXJJP1EUitqsWYHkiz0H7YVTyFD73w5yJlP81l7Mih4VK1FVwFUU09whj3DJ7EGDj3Ox3zNbVuv8Nn/QkxFRT9FoTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=XMQmtGEt; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from wse-pc.fritz.box (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id ADE1D2FC004A;
	Mon,  3 Mar 2025 17:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741018360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ug1MGBU8UIz5I0TH5SUsDUHFl3Z8sg6GRAsc5+BcUxM=;
	b=XMQmtGEt9Ncr8p1avF7lKkWyLReH8z/eq1lxMrUwTgkd9l11wiDhzcpcfSI5t+2VZcnhTq
	tZn2YjB8tfwH0ATYoj54tA//kvNZYq3aJghClfVJKrkCfMRWHEQT5neXWWFczmGdqujBG0
	lo3z34kiTVcSr+m+FvVEWkeQeleh+yk=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Input: atkbd - map F21 key to support touchpad toggle keys
Date: Mon,  3 Mar 2025 17:11:57 +0100
Message-ID: <20250303161228.437604-1-wse@tuxedocomputers.com>
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


