Return-Path: <linux-input+bounces-16762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8952CED9D3
	for <lists+linux-input@lfdr.de>; Fri, 02 Jan 2026 04:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85F193004F6B
	for <lists+linux-input@lfdr.de>; Fri,  2 Jan 2026 03:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C9241754;
	Fri,  2 Jan 2026 03:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="rZOg9U/f"
X-Original-To: linux-input@vger.kernel.org
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A4510785;
	Fri,  2 Jan 2026 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767323608; cv=none; b=H+lp17mHMCkYFIYMfvbaHypOwv8dXBcBvG3IsUEPuI9RdNeoabNaHmkOjzRRE7X3T/x5wCf5EL7RRpN5AVZ6hqv7dEj8JQfs8A2DMRHvnN0/vkch2phYhRbitwpUCr+NQcTpbFSPdL/PtjvzhHTQppF9e7YdjuqakixNM89SGpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767323608; c=relaxed/simple;
	bh=UwCJJKQLkTtYb+1PWHBv+Wp59eN7udHv9yBpBJgLfDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4ePTWcv74vlGk1WZGwMMutp/9KdWfGlVsB36/nlLU7Cp1bKwKcMUJFa65a9htWhP57UJC+jd/H4H6GiPL97gE6+w+4eiI+OA9rgVLvx81W707XsdJHl/GrGM6wlDv057xZQhR5wMPT52QYj6xW6swX5q/nuibGvCe7SIJL2CfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=rZOg9U/f; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id E979820090;
	Fri,  2 Jan 2026 03:05:56 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [149.56.97.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 80E58260DB;
	Fri,  2 Jan 2026 03:05:47 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id EF87C3E961;
	Fri,  2 Jan 2026 03:05:38 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id ECAD240086;
	Fri,  2 Jan 2026 03:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1767323137; bh=UwCJJKQLkTtYb+1PWHBv+Wp59eN7udHv9yBpBJgLfDY=;
	h=From:To:Cc:Subject:Date:From;
	b=rZOg9U/fU0F+awkS3BTSn7AiKUzxVraOP/1N1A4n3EVZlQSSfB6haHOR9YqCQygOy
	 8YeO4nY/qlgCY+Ex2wIEkvK6089a+ugLPfj+NvicfPZ2QIK38Z4COIWNYGmpYc3v0n
	 SQsjkh3g9ebo0xCApsumKfakfAtJjFeqhvteTPbg=
Received: from liushuyu-p15 (unknown [117.151.14.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2D5DC40191;
	Fri,  2 Jan 2026 03:05:31 +0000 (UTC)
From: Zixing Liu <liushuyu@aosc.io>
To: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Zixing Liu <liushuyu@aosc.io>
Subject: [PATCH 0/1] xpad - add support for Beitong KP-series controllers
Date: Fri,  2 Jan 2026 11:01:54 +0800
Message-ID: <20260102030154.197749-2-liushuyu@aosc.io>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: ECAD240086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.36 / 10.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.04)[57.44%];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,aosc.io];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[]

This particular series has several input modes that the controller will
try to select when the controller is powered on (either connected via
wired USB connection or using the dongle provided in the box).

This series of controllers will try to see if specific Xbox One packets were
sent during the probing phase and will power-cycle themselves when they fail to
see these packets. If the controller power-cycles more than three times,
it will change to the next input mode it supports (e.g. Nintendo Switch
mode).

After the Xbox One packets were observed, they will use Xbox 360
protocol to report the input events.

Tested on a Beitong KP-20A controller via USB connection, Bluetooth connection
and via stock wireless dongle.

Zixing Liu (1):
  Input: xpad - add support for Beitong KP-series controllers

 drivers/input/joystick/xpad.c | 55 ++++++++++++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 1 deletion(-)

-- 
2.52.0


