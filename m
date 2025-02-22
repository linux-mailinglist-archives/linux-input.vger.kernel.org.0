Return-Path: <linux-input+bounces-10230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3363A40A70
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 18:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3CA57A4CCD
	for <lists+linux-input@lfdr.de>; Sat, 22 Feb 2025 16:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92AA207675;
	Sat, 22 Feb 2025 17:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="ioZCh8N9"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F63A13BAF1;
	Sat, 22 Feb 2025 17:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740243619; cv=none; b=J4gGGQhYKnlp6e00d/BWwLMiqXc1HwzgUfX4Ws+vF2MjehBdGFP/RBET+o919yNIskZcdEAZpKI1Jl8bQd0P0hkGXTDL1gXBv/dwQq68b0t4pQYTozaAf5eqHjfSQAkJ2KJPW+KFu25bCaTkqm5tVhLLyPrpU3oVQbz3NU7a3lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740243619; c=relaxed/simple;
	bh=lsiSpM+P2RSpdomwDhHwSrSih7ILxLhRF44Rf6OyVYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aDwmm/0+/q+FRh9mEsweCKs0tmsslhO5CbFujK7B8wK5rWmd/aGcch3sEEOZi8qGqI1x2jsaNNBb088H9H1xEirikbiGDXze1sCBM6DGG9VTwZfUW5JaX69BbpqyzD1pMwWKi8uQkHTMakare5Zt9hLn3bXNNdpci7sm6K20sV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=ioZCh8N9; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 1A1172E08F8D;
	Sat, 22 Feb 2025 19:00:13 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1740243614;
	bh=BuMwn5K5BtMsHAaTnFeuTeO2u8iznSlPA41xYCQSPGY=; h=From:To:Subject;
	b=ioZCh8N9xR8iXWc8UE2VS7g6QYFw/3cfeQY/dmTL43gZVMHp4RI8qYefQGISB+GgO
	 3xhNLt+xZ1Ke/sc+jmg2FGEYGXodizCFLgf2oqBUXqPEcAmbeH9g+2hgx1tu7GZals
	 KHUy88VNbUE4CKmMZ4rnvtxhO/e/VswdWBMXOEMQ=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	pgriffais@valvesoftware.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 0/3] Input: xpad - add Zotac Zone, TECNO Pocket Go,
 rename Go S
Date: Sat, 22 Feb 2025 18:00:07 +0100
Message-ID: <20250222170010.188761-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174024361383.6735.786605406099440853@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Add two new xpad entries for Zotac Zone and TECNO Pocket Go, and rename the
mysterious "GH Electronics" controller into Legion Go S. This way, it
matches the rest of the device and is coherent.

@Pierre-Loup: for upcoming devices you do not want to leak the existence
of, a little trick for enabling the xpad driver is via udev rule [1].
This is also good for backwards compatibility.

[1]: https://github.com/hhd-dev/hhd/blob/06b857f31359ab04ce0fd92988284874cc4e1c7c/usr/lib/udev/rules.d/83-hhd.rules#L40

Antheas Kapenekakis (3):
  Input: xpad - add support for ZOTAC Gaming Zone
  Input: xpad - add support for TECNO Pocket Go
  Input: xpad - rename QH controller to Legion Go S

 drivers/input/joystick/xpad.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.48.1


