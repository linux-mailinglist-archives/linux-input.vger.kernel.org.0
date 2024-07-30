Return-Path: <linux-input+bounces-5219-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A279942240
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D651F2395E
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 21:36:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E3418E059;
	Tue, 30 Jul 2024 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="QNowJeLv"
X-Original-To: linux-input@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C0818DF6D;
	Tue, 30 Jul 2024 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722375373; cv=none; b=j7LTN7irP8xiqNOGEquu3b1u761q15xnklgF2RS2N9q579exoOVFSKjU0101RQ4cbfRBf8uIb42eTUB+iQ5Ixz9tAoMbmmRO18856UeRJJ1BLpO+DvSpIbbvsloZ9dVHr2MnQbWDNA+gQF/+xw7BZ3koTWW2BN3KkifJaLiuHJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722375373; c=relaxed/simple;
	bh=t+gR7S6Jr27an4lJK8thmRUqwUBLQYsYtoHBRf35Qn0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WsH44Y89pJLm2KJskGz4cWvMl0eHUodQEtmDPA1C6riH/JPp1HLSnEdiyFAs+2klAlxcLWN6F2SCXccWg7h3jyrcdRjJsPvKzNajD07RJB2VDiYfg7HJc6aAxdK2mfs2R43jwhXcdUTzngazYkXItucqddqWqFwR5XndBCvUQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=QNowJeLv; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1722375361;
	bh=t+gR7S6Jr27an4lJK8thmRUqwUBLQYsYtoHBRf35Qn0=;
	h=From:Subject:Date:To:Cc:From;
	b=QNowJeLvgLnPWHoldhHL5TIqRWHFXrr7pnp2LayCMwPJC5u7KKKx273EBDtu0coxz
	 uvIiWniQmYQC+6sgcFmkWh2LKBXLQ36AkFCSrwWewg3Q44SjXIzJ/ZtTpbNHSl0c+G
	 yyCNl1OiplQAiZ82ZzP0VJXOCKqFBS3+y5XqwaoY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH RFC 0/4] HID: constify static fixed up report descriptors
Date: Tue, 30 Jul 2024 23:35:56 +0200
Message-Id: <20240730-hid-const-fixup-v1-0-f667f9a653ba@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALxcqWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc2MD3YzMFN3k/LziEt20zIrSAl2LJAPD5KSURMMkE0sloK6ColSgBNj
 EaKUgN2el2NpaALYVcxhmAAAA
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722375361; l=1439;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=t+gR7S6Jr27an4lJK8thmRUqwUBLQYsYtoHBRf35Qn0=;
 b=UO0moEkTFZT23w2xc2vPWHP00QsFr2XBpB4YbM/oP3lIBMXN5Kdodf2NnxpAlXjlylgOGCCad
 xbFLj9ni/V7C1V0+jD/FWBTU0RY7QkF6Jbe+QzuVYF4jXig46AjoRaU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

By allowing the drivers to return a "const *" they can constify their
static report arrays.
This makes it clear to driver authors that the HID core will not modify
those reports and they can be reused for multiple devices.
Furthermore security is slightly improved as those reports are protected
against accidental or malicious modifications.

This is an RFC, only the cmedia driver is updated.
compilation of any other HID driver making use of report_fixup() will fail.

Currently the series would require one big cut-over commit changing the
signatures of all report_fixup() callbacks at once, of which there are
around 50, so it wouldn't be that bad.
All other preparations and actual constifications can be done one a
per-driver basis.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      HID: treat fixed up report as const
      HID: cmedia: directly return fixed up rdesc
      HID: change return type of report_fixup() to const
      HID: cmedia: constify fixed up report descriptor

 drivers/hid/hid-cmedia.c     | 6 +++---
 drivers/hid/hid-core.c       | 7 ++++---
 drivers/hid/hid-sensor-hub.c | 2 +-
 include/linux/hid.h          | 2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)
---
base-commit: c91a7dee0555f6f9d3702d86312382e4c4729d0a
change-id: 20240730-hid-const-fixup-8b01cbda1b49

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


