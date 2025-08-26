Return-Path: <linux-input+bounces-14318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F258B3660A
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 15:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48D2D1BC79F4
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 13:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BECB33A00A;
	Tue, 26 Aug 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWKMLUdq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7136C944F;
	Tue, 26 Aug 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756216000; cv=none; b=a2RjnNqShrFILf1HP+lXqAE95Mo4GhHr97/J16RtqcetfUb+mQUktbrnGsz20K5Z6grGcmIpTJw0FdT9o7YIhw56fRhhQvr5xoMuJhf3wvmEuP5R+yH5QdCKVPYMRF1VQvVruTk4WeoGNFGiT1b5k5V+pRjwwtlvI1uccTe5H6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756216000; c=relaxed/simple;
	bh=DS9I3prF2/Om6LcKKw0EJ2GebxXtsiAd20o5xBPPTmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pOaj1Tb1aHvsfKb7t1G9pUajhFne3AXYk6HpWRQHf4NH2iK72+VKoVVdDZ8LTofMbRlxWKzTLszDk4B/1TOpeEjYX7o1/JTE3XwenynORqfeA7b5gXkPxBvFCsO0Ot40vRWLP8yT/SSG44XMlmyFLpERsAVn0kkrSU6e4NJqExE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CWKMLUdq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDADC4CEF1;
	Tue, 26 Aug 2025 13:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756216000;
	bh=DS9I3prF2/Om6LcKKw0EJ2GebxXtsiAd20o5xBPPTmE=;
	h=From:To:Cc:Subject:Date:From;
	b=CWKMLUdq7w9NGTgTie30YKndG1gnhxJpnQDHdr3Kan0pNnl/jRBYofdNhV2l+lkUH
	 EIK9dFUV0LRdtNcjRNRIXE3fhU3woWplZ429B6DwfsVYWAxguSzpye+n/NCFaSZZ44
	 QlRjbKqhLkuQ45NBNLNt3r8dPaB99jqzuxcp8G1Wfy0wncB3/N4GoFmA2tWC1YIZp/
	 X+Uago/x7OBMlaE5f3N60ros2tJ4podkTqYKBeXMp4VLznZQ2xrhDc3ohcadeVmxnm
	 lhFpFASwo1uEX8Mi7FnPzY29Gm0nytNOL8RkY5RUOJ2OITyMGOYSfyxk6L5rrAC5G0
	 yR3gi2TeJs2KA==
From: Michael Walle <mwalle@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: jcormier@criticallink.com,
	Job Sava <jsava@criticallink.com>,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 0/3] mfd: tps6594: add power button and power-off
Date: Tue, 26 Aug 2025 15:46:28 +0200
Message-Id: <20250826134631.1499936-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I took over the series from [1] since the original developer was an
intern and is no longer with their former company.

Changelog is in the individual patches. But the most prominent
change is that the pin mux config is now read from the chip itself
instead of having a DT property.

[1] https://lore.kernel.org/all/20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com/

Job Sava (1):
  input: tps6594-pwrbutton: Add power button functionality

Michael Walle (2):
  mfd: tps6594: add power button functionality
  mfd: tps6594: Add board power-off support

 drivers/input/misc/Kconfig             |  10 ++
 drivers/input/misc/Makefile            |   1 +
 drivers/input/misc/tps6594-pwrbutton.c | 126 +++++++++++++++++++++++++
 drivers/mfd/tps6594-core.c             |  58 +++++++++++-
 4 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 drivers/input/misc/tps6594-pwrbutton.c

-- 
2.39.5


