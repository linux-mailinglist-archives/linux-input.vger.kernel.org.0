Return-Path: <linux-input+bounces-12346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0234AB5FBE
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 01:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 079C73B8F94
	for <lists+linux-input@lfdr.de>; Tue, 13 May 2025 23:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDDC81E8356;
	Tue, 13 May 2025 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="tDm9s8w5"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E31DF74F
	for <linux-input@vger.kernel.org>; Tue, 13 May 2025 23:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747177401; cv=none; b=fcunC0fvWPcCDsPYdAv1rj06kIzlDGBo2VyIqr9+8bp4OdwzVTUCAMZh0KOpknL9Ktpn1uMA/o8Di7zcrL45G/viBTEV/2aCXGsN80oXOJMZF8vr2uGcBoNmWpWnXQLx2lurmaKQ06iZY1gdHiNlZQGM3k5x98junqOMQSMKyy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747177401; c=relaxed/simple;
	bh=cdNXMZyNeBYD5NIRFlZ6W4oWoX9ramCfKZ1S84JfAR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o94leGQUhCM6e6rDiHeROkDMBv9XrQuoyteO17apLlS9h8/CC/pm+XWPW5GwrVcrZ/EfK6EmlEAJQz7lYCQvIV823F0rrzI+ejttVN0iV7NDIWpYL+/StaAd+0lMJxND/vdF6H4qu/ctcsu4tN5DfW0uLkKn4qIFw5sKMNgrxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=tDm9s8w5; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1747176915; bh=cdNXMZyNeBYD5NIRFlZ6W4oWoX9ramCfKZ1S84JfAR4=;
	h=From:To:Cc:Subject:Date:From;
	b=tDm9s8w5p0j36TXRsmlp+k+prEsc39e5DDRSoiO5DlcQQ7S3QXb9mBFcDCHbpr/l/
	 L212nfW1nnOox+7g9ShLmoOwZxsUfVMvgn6zvMZveh7rVP2nmJQFfr1ZYoc2MsDt9E
	 sHlZtXmLSK4t4B2ITd1fvsft4r9plc2qSVKxA6CSzAppI5qHFUYkMDL794Sfuf5gxk
	 2mR4R+BTHmB0Toqzx27Pw2hU0LxqGaBZNI61omPbnLGAtYOGeYirjrnd+TCnxylj7r
	 L/tw9hE77EQ3QraW4veDVTLLaIrjZUxZqS6q5KRsUZ/swSvtOE+ifRvNc1uanAkxLD
	 RYjL8uyhvP/iA==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 1C5B5A01D;
	Tue, 13 May 2025 15:55:15 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 0/4] Input: xpad - More Xbox One improvements
Date: Tue, 13 May 2025 15:53:58 -0700
Message-ID: <20250513225411.2718072-1-vi@endrift.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for several more controllers but also adds a bit
more "correctness" to the initialization flow, and a quirk on waiting until
the announce packet for some wireless controllers that delay the init flow.

I have a WIP new driver with a proper initialization flow based on the
recently released documentation, so hopefully this will be the last needed
patch that adds piecemeal per-controller fixes like this.

Pierre-Loup A. Griffais (1):
  Input: xpad - Add the ByoWave Proteus controller

Vicki Pfau (3):
  Input: xpad - Allow delaying init packets
  Input: xpad - Send LED and auth done packets to all Xbox One
    controllers
  Input: xpad - Add more controllers

 drivers/input/joystick/xpad.c | 57 +++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

-- 
2.49.0


