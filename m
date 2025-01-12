Return-Path: <linux-input+bounces-9152-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F1DA0A8CA
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:53:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65A931659BB
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186CB1AA1C0;
	Sun, 12 Jan 2025 11:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="UqMFrWJl"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4D1A4F2F;
	Sun, 12 Jan 2025 11:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682782; cv=none; b=bnRRvkAeJFgbIqsuHsyH2vspEPtq6Jz/bDGqUwhnesjHu3aVx1hWEWrMa1r5wMhS8sC9FQez63PJYBiKu/r4mfUlW80tIYRkBUySjqCfE+J2ZetrNNVN09Jdo05I9Y1d2g/ChUPrDUnsnRjklAA05GlDQnWkKILQUb+g3FxDKUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682782; c=relaxed/simple;
	bh=LegztEwVyHwsMKQKcrypHegKeIQugIbO/vHiKyGixSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uMZBr2JeAEkrs2KOtFfki7Gc5ff69AC/zAQT/mUXafqrVesGNxn/9rMsJdQ1jTDg/IYwG9MqwBdUQVLAnxa81wKgkulna2UAe1D6yI5/u6CPhCCU/SbqB6C8WKFGLaMAYII9GNj6oXF5nszkm//cKOE+tOMyrLDRWSD1s9xRdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=UqMFrWJl; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4YWD9H0fMwz3w5R;
	Sun, 12 Jan 2025 12:45:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682339; bh=LegztEwVyHwsMKQKcrypHegKeIQugIbO/vHiKyGixSs=;
	h=From:To:Cc:Subject:Date:From;
	b=UqMFrWJlr4G7R9PieMHdOVLefp6RWgXwsDYVGKU+YR/X1wtqMa6MrSXp8um8bb+yQ
	 lhMANQ64WuHVhoNKmsG0JUVJeHKh8tT9q6FRVn/1QbuEtA686nVZLuyyJ5t8af6DLb
	 tzuEb3WAXMKmaW+B/dax+ifgeXZktnm9Iu1pFRP1n4zM2jeFnznO4R0oEqieojgT6S
	 MJp8tGlGhjvN4XTr4qCpoR9kFsjUU6f8h+eH/Tp7640agHuPE+CU/aBJqG7FKG4CR0
	 hp4LlA/B5d68GPXOavjZsEIf3Opj0X0KQ9911CckkvF15aqcMLyUFewrXuR502Fjob
	 QRA6Oemlv+jKQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4YWD9G733sz3w5K;
	Sun, 12 Jan 2025 12:45:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4YWD9G3lBxz8tYH;
	Sun, 12 Jan 2025 12:45:38 +0100 (CET)
Received: from localhost.localdomain (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id D52441C0057;
	Sun, 12 Jan 2025 12:45:33 +0100 (CET)
Authentication-Results: mxe85d;
	spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=git@mayer-bgk.de smtp.helo=localhost.localdomain
Received-SPF: pass (mxe85d: connection is authenticated)
From: Christian Mayer <git@mayer-bgk.de>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bastien Nocera <hadess@hadess.net>,
	Christian Mayer <git@mayer-bgk.de>
Subject: [PATCH v2 0/5] HID: steelseries: add SteelSeries Arctis 9 support
Date: Sun, 12 Jan 2025 11:44:01 +0000
Message-ID: <20250112114438.2196-1-git@mayer-bgk.de>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <173668233421.8746.11390138385077026001@mxe85d.netcup.net>
X-Rspamd-Queue-Id: D52441C0057
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: EgtmFBNYxJAS2qOAR7r/GUOXV2Ncz438JS28wWCQn9QegwaepYA=

Hi,

i added support for the SteelSeries Arctis 9 headset.

Changes in v2:
* Use constants instead of magic numbers for cleaning up model name.
* Remove unnecessary whitespace changes.
* Split up preparations and actual adding suport for the device 
in separate patches.
* Call hid_hw_open/hid_hw_close for all devices
* Fix code style issues
* Optimize capacity mapping for min and max values

Christian Mayer (5):
  HID: steelseries: preparation for adding SteelSeries Arctis 9 support
  HID: steelseries: add SteelSeries Arctis 9 support
  HID: steelseries: export charging state for the SteelSeries Arctis 9
    headset
  HID: steelseries: export model and manufacturer
  HID: steelseries: remove unnecessary return

 drivers/hid/hid-steelseries.c | 120 +++++++++++++++++++++++++++++++---
 1 file changed, 110 insertions(+), 10 deletions(-)

Christian

