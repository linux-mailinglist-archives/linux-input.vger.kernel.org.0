Return-Path: <linux-input+bounces-8104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 439349C90F7
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 18:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E50B21F243A1
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 17:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1742718C332;
	Thu, 14 Nov 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="bfRO0f2h"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0734E17BA6
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 17:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731606027; cv=none; b=JD09/kar6h6zGG35UfhAaoTfy2GOTvtN4IKrtNz89pCWWc2GoWTmAFU1GmD6ewEl/lcT0y4CAFhLmWxBTQvzIWmm7Q5szAhvgK+kVR3Es7eK/Kvlr8L30MX7JApdFiJNIKvMq8XLSGJr8GzQbjs+h0r/O+TMUQaBYfbInfR11Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731606027; c=relaxed/simple;
	bh=jc9fem6ieIWHDS8pHFTitomuzWtd5Xoialjcc0Snb54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoRRPNhu/SCESEOqk40YOhOSy3yEiNjP4/CGq6rbgnoxycJINmEVZkfZ8s2esN+m5oxOM9ci8hkDcpESB5VGyfPa2OlSrJUNHblA5mR5ZNbqTlOvbGypMnOokYYDQojbc7sYoJ1XeKN1sPMqC2+tDtEqmx4dUe27CXItIUZNKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=bfRO0f2h; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id EB0901813C1
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 18:40:16 +0100 (CET)
Received: (qmail 14424 invoked by uid 988); 14 Nov 2024 17:40:16 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Thu, 14 Nov 2024 18:40:16 +0100
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
Subject: [PATCH 1/2] Input: allocate keycode for phone linking
Date: Thu, 14 Nov 2024 18:39:29 +0100
Message-ID: <20241114173930.44983-2-illia@yshyn.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114173930.44983-1-illia@yshyn.com>
References: <20241114173930.44983-1-illia@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: --
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) BAYES_HAM(-1.519378) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -2.619378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=jc9fem6ieIWHDS8pHFTitomuzWtd5Xoialjcc0Snb54=;
	b=bfRO0f2hG5Nn4E3L5kTIb47hpHP5a1w7fCpWsT5feX8XZZnLYuw9RZhv2HiN0xd6etcxu79Th6
	DWD8bDwooiPV+pQ/cRGPpzPK6pOTD53CLHogB2bqS8WWT6w5QJxcpDLv+tyLN+zC0My/F8tQTgCA
	rLnaCZH5H3RQyCUkdBgywY9aFtIZGq/BZ6aIxpFxjkgsGhvo50KaIBuuRWpnRF8AhLB5ktndzK/B
	Uk72LGxzdZkKmM6C7nuVnaBftueC+6flX8dFFXyL8w/SqoLprO6fyOJIyAZ1y3H9HS0JzK3cNgRT
	mxP2asev4GERUfOo/pIygsSK266SDimVuokUVEuQ==

The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
Gen 5 laptops includes a symbol showing a smartphone and a laptop
chained together.  According to the user manual, it starts the Microsoft
Phone Link software used to connect to Android/iOS devices and relay
messages/calls or sync data.

As there are no suitable keycodes for this action, introduce a new one.

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index a4206723f503..5a199f3d4a26 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -519,6 +519,7 @@
 #define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
 #define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
 #define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
+#define KEY_LINK_PHONE		0x1bf   /* AL Phone Syncing */
 
 #define KEY_DEL_EOL		0x1c0
 #define KEY_DEL_EOS		0x1c1
-- 
2.47.0


