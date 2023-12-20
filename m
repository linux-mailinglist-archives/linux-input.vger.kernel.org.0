Return-Path: <linux-input+bounces-888-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2441819734
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 04:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02FCCB23BF3
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 03:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37AB8BF6;
	Wed, 20 Dec 2023 03:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="0R3Uow7F"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4218BF9
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 03:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from nebulosa.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 547BEA080;
	Tue, 19 Dec 2023 19:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1703043407; bh=4YMznDT+DeclENjJKuL5DS0vv0OO+1neNhfdpbJgfqQ=;
	h=From:To:Cc:Subject:Date:From;
	b=0R3Uow7FcRDx8VNSeRQQoQee/COdL1isA7ygOk97plMZ6tN4cRX2RB4ONxrqFbFdZ
	 3vmGduMj+y6M24OxaI9+RCKME18168P2nRCKwd+XdhcsLGo3RsIIrBWJTj0+Tb73+o
	 35EKWcO/qh7d3o0aPYgawfgWDB5ikR4cl51zBiWvzJmE9NAsZQUakswH+ebdopUhv5
	 vBYifO/9NSGzblK7UyBTU81bDaL3mLOl+0O5xo+6OX8AyYGDM/WTiNbNepLFNT0Ywd
	 4cpR5q8VKUOHFynPrbSrcBRex6Dphuds1tmf5EYZttoNmT71LelI1B2nriiL7BDcQO
	 BbDPI4tQ94pUw==
From: Vicki Pfau <vi@endrift.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH 0/7] HID: hid-steam: Upstream more SteamOS patches
Date: Tue, 19 Dec 2023 19:36:09 -0800
Message-ID: <20231220033609.2132033-1-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a slew of patches that have been in testing for a while in SteamOS
betas in one form or another. Most of them are pretty straight-forward, though
I expect the gamepad-only mode may be preferred to be offloaded to a userspace
daemon. Right now, the gamepad-only mode is handled by Steam when it's running,
but has utility when it's not running too, given the presence of Lizard Mode
(the keyboard/mouse emulation system).

Vicki Pfau (7):
  HID: hid-steam: Avoid overwriting smoothing parameter
  HID: hid-steam: Disable watchdog instead of using a heartbeat
  HID: hid-steam: Clean up locking
  HID: hid-steam: Make client_opened a counter
  HID: hid-steam: Update list of identifiers from SDL
  HID: hid-steam: Better handling of serial number length
  HID: hid-steam: Add gamepad-only mode switched to by holding options

 drivers/hid/hid-steam.c | 547 ++++++++++++++++++++++++++++------------
 1 file changed, 391 insertions(+), 156 deletions(-)

-- 
2.42.0


