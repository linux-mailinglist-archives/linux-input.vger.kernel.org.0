Return-Path: <linux-input+bounces-14993-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAD8B935F5
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 23:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159A616FDBD
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 21:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2069C279334;
	Mon, 22 Sep 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="F7p2g3Od"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EC8126C1E;
	Mon, 22 Sep 2025 21:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758576661; cv=none; b=lPR2uecK919GFmBd+rVz7f6YPLhc3m0WKtW+nAMpuyacbnpPnTfKyZkFyMLWBS1JABQI0JexKlyWnNwzYDtV/t1W07OnH50+w65ttd8KQWrYqt5cc0bto/3Yp4h7Jqo8V1l10gWfzOIzIRlnDlquAQHciYM6hhX14f/Jf5C1u9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758576661; c=relaxed/simple;
	bh=ulkNcW5qF7jLCnXFlavxHc11OpTJYzzXTJimhhJUuDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jpAVBO+G1Y4WnNS2fTbd4eptR46Z2aCyMuij9uLzx8LiLb9JuMFJecRHUVDTjHPRHzI/gaWLdP90NJ2DXyt0e0mghO7TNtB0Fax7PiNhhNyF6eq2AeGAO4IicDUjA/9AUctm+MlCpfwqRq62qplDCxgOdt3MfIutFUu2vmRlhBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=F7p2g3Od; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758576657;
	bh=ulkNcW5qF7jLCnXFlavxHc11OpTJYzzXTJimhhJUuDI=;
	h=From:Subject:Date:To:Cc:From;
	b=F7p2g3Od1O8qIoVWGXv3J7PrfA9ToVde+BL/+O3dVBLGUtsw3uiIpGDKLuoskMupT
	 zsLIvUqCT29gYRAIgrU++GWm2ZNhVuFyfEIpmLC3vt5Z3WZAwkdJk88KSt10Y4b81V
	 NOGW4Sz8JZ/4EngwM6mVr3bPqmc++n21iwaN3ws8XEft52HbzFjohYI9xZ6V2Jyy+J
	 MdA29ysWN/CE/1PdmcsDxKbTetJF+3bFMRDlPTSVWlhZ9nvS4JNSRlie294D+sytIJ
	 l6SF37kytZA3SW9Uq64dYHey/QVttGCOQFsvOLQfrCxjHr6yVaUyDjoh5oby4hRaOe
	 gmBFliNHADsEA==
Received: from localhost (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with UTF8SMTPSA id 355B317E0C96;
	Mon, 22 Sep 2025 23:30:57 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/3] Trivial fixes for recent HID playstation changes
Date: Tue, 23 Sep 2025 00:29:39 +0300
Message-Id: <20250923-ps5-hid-fixes-v1-0-4b994c54e512@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMO/0WgC/x3LMQqAMAxA0atIZgM1ttR6FXEQG20WLQ2IIN7d4
 vj4/AeUi7DC2DxQ+BKV86jo2gbWtBw7o8RqIEPOBOoxq8MkETe5WdF4Mj46G4ZooT658B/qMs3
 v+wF2sD49XwAAAA==
X-Change-ID: 20250923-ps5-hid-fixes-07207d5498d4
To: Roderick Colenbrander <roderick.colenbrander@sony.com>, 
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2

This patchset aims to address a few trivial issues reported on the
recently queued series [1] which added support for audio jack handling
on DualSense PS5.

[1] https://lore.kernel.org/all/20250625-dualsense-hid-jack-v2-0-596c0db14128@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (3):
      HID: playstation: Update SP preamp gain comment line
      HID: playstation: Silence sparse warnings for locking context imbalances
      HID: playstation: Switch to scoped_guard() in {dualsense|dualshock4}_output_worker()

 drivers/hid/hid-playstation.c | 270 +++++++++++++++++++++---------------------
 1 file changed, 137 insertions(+), 133 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250923-ps5-hid-fixes-07207d5498d4


