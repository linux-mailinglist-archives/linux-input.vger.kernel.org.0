Return-Path: <linux-input+bounces-16882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDFD0706C
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 04:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 645243024251
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 03:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F25678F3E;
	Fri,  9 Jan 2026 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="bTeJPkVg"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F222690D1
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767930408; cv=none; b=odp88baVhNa2BRZRZHK7XdFrDA61MjUrk23xXlVDKJrAJbbIoIG4jsKYnnAhNI6XqvtNPN3sbpwqiHBHxwGMZrR2FP9dwNHBB+wCEVKJkFiMy1Ml7gHQToUOwk3vXnG+44JBGb1sO/855IqyKMDhEQ/6S3F+KfJ3Dy41k7lkvCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767930408; c=relaxed/simple;
	bh=8LGoV6cq/rjhDgzcDzwRbjcg+eAoZ2ZyziifLQhOO38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yu2QoMR2wOIo9FWK4Lp9CMoWxKWHOKHHh/r5+BdTyj2clMYMwEMnMJw5t6uzqxUusoyyX9On1UUbGjBikpjeJ9w1Cs1oM56r18VPWJeaMijDvoIYVM9N6pkFoMCZJYaRviGImIGzJXDo2y1SuoZRicO9jf8YxUijs8OE2s+NxaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=bTeJPkVg; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1767930045; bh=8LGoV6cq/rjhDgzcDzwRbjcg+eAoZ2ZyziifLQhOO38=;
	h=From:To:Cc:Subject:Date:From;
	b=bTeJPkVgIZI0AGJe4D6cAFyyZUDPxkakcYil9+UCa66EtGjE+Edz/F6QmR6MOVcUD
	 uyU4/3SbqnNFVMZSoeQcRz+DlA9wmEps8z1F6s78fmju7mzULSKRKCtEOYsKhC8z5V
	 6MXKdd8MWuXvH/0Med8nss3rBa+fLF9SqxmUkzpkDPCXtxgwE0SPjSmvGB+Cf0uKgc
	 +a2Rb5FViSmaNUxo4nkUMzDwRLNVxLB8jgMoSWjIRnkRVYEBv6vXgSBZeOl7e5t7E0
	 pJcr+Qxcqr3F/Xk+dXMpaI6bfm1cLygGSR5kGGps4rIOqFGLJvd0eDfp8ISPfgTc27
	 2pPW4BAtua/gw==
Received: from nebulosa.vulpes.eutheria.net (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id 83E93A05D;
	Thu,  8 Jan 2026 19:40:45 -0800 (PST)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org
Cc: Vicki Pfau <vi@endrift.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v2 0/1] HID: switch2: Add preliminary Switch 2 controller driver
Date: Thu,  8 Jan 2026 19:40:31 -0800
Message-ID: <20260109034034.565630-1-vi@endrift.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is effectively a resubmission of the previous patch with minor fixes
for issues that came up during the first review. Bluetooth support is still
not included, but this will hopefully provide a solid foundation for
bringing up Bluetooth support once BlueZ is capable of bringing up the
controller. This will probably require a new plugin, but investigation is
still ongoing.

Vicki Pfau (1):
  HID: switch2: Add preliminary Switch 2 controller driver

 MAINTAINERS                          |   7 +
 drivers/hid/Kconfig                  |  18 +
 drivers/hid/Makefile                 |   1 +
 drivers/hid/hid-ids.h                |   4 +
 drivers/hid/hid-switch2.c            | 975 +++++++++++++++++++++++++++
 drivers/hid/hid-switch2.h            | 242 +++++++
 drivers/input/joystick/Kconfig       |   8 +
 drivers/input/joystick/Makefile      |   1 +
 drivers/input/joystick/switch2-usb.c | 353 ++++++++++
 9 files changed, 1609 insertions(+)
 create mode 100644 drivers/hid/hid-switch2.c
 create mode 100644 drivers/hid/hid-switch2.h
 create mode 100644 drivers/input/joystick/switch2-usb.c

-- 
2.51.2


