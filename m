Return-Path: <linux-input+bounces-8103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5749C90F6
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 18:40:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AC2C1F2439A
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 17:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C58184528;
	Thu, 14 Nov 2024 17:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="UNgJHJqS"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F72118BC2A
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731606026; cv=none; b=tPaeiyJseI074MDkUSzm2gtGAMRMXJSw9zo/qUK2txPZoVP6JXNOq09jXq9hRPoC1UONb0IeTMfI7/Vm7Df36gjh2jQYjR4cszzyXWo38CotZcY5MIhejYIPRCMWXJER8u5Pnl+ME2WFB6T2nPXDRAACb7dr2ofwyYjsLTuecXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731606026; c=relaxed/simple;
	bh=ql6Zl4ZhHVLOcGVutVLY+NFDnNAYKWddAwx/rh9wBH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GcO2JSjd2f1dvvMuHRi1efFgj4Di2y9him85doIJEF2vT05F2zxtgj89YOmsLuJqv51G4xkn7Jz4w+MVMo0rxhb4Y9IQ8ML1X09zoOLB1M/QiwZmMiS/o/4nUKuPTL9yCYzXweFLNK33jBDZCxCpiZMvngdQWOPKpgYhuzE37ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=UNgJHJqS; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 20CAF180C2B
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 18:40:16 +0100 (CET)
Received: (qmail 14370 invoked by uid 988); 14 Nov 2024 17:40:16 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Thu, 14 Nov 2024 18:40:15 +0100
From: Illia Ostapyshyn <illia@yshyn.com>
To: linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Illia Ostapyshyn <illia@yshyn.com>
Subject: [PATCH 0/2] Add support for the new phone link hotkey on ThinkPads
Date: Thu, 14 Nov 2024 18:39:28 +0100
Message-ID: <20241114173930.44983-1-illia@yshyn.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: ++
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-0.084833) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: 2.815166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=ql6Zl4ZhHVLOcGVutVLY+NFDnNAYKWddAwx/rh9wBH4=;
	b=UNgJHJqSARuyuyQpzD1NTBM4K71MFUbOERtVhC87TI5MAkexZ6DsJAWjI3pSRKsx9GlBZwDlU2
	6auOsHmLl+NmdvlMCKz6GJelgk3mHnJaZ30zDkB7NuOmixBOZbANCo/AZH+PVdkbWBU+Araw3VpP
	/TzIiZpZi+5y7PDaGT+tXXBJnFhrC8RQQby3bL5h5ZYvwmf9xCWkyiiJFOO0/ZfJQojeYCu4EE9J
	CdTeFm9hHD0OmE5WrEr7JR9/W3iqkJtGgixteaHl/o54nr4oJQGDpguUDYXDOg9+YPzDcZpj2Vvw
	danxIDChcxwl1Br5F47aoIyGNRnN7UxVRCQcaEqg==

The Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s Gen 5 laptops feature a new
hotkey on F11 showing a smartphone and a laptop chained together.  According to
the user manual [1], it launches the Microsoft Phone Link software used to
connect to Android/iOS devices and relay messages/calls or sync data.

This new keycode can be interpreted by desktop environments to lauch free Phone
Link alternatives like KDE Connect or GSConnect.

[1] https://download.lenovo.com/pccbbs/mobiles_pdf/t14g5_t16g3_p14sg5_ug_en.pdf

Illia Ostapyshyn (2):
  Input: allocate keycode for phone linking
  platform/x86: thinkpad_acpi: Add support for new phone link hotkey

 drivers/platform/x86/thinkpad_acpi.c   | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 2 files changed, 2 insertions(+)

-- 
2.47.0


