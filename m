Return-Path: <linux-input+bounces-8105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298AB9C90FB
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 18:41:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E217C28416F
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 17:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A70B18E050;
	Thu, 14 Nov 2024 17:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="lNI3B3hs"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E718C930
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 17:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731606029; cv=none; b=OqOjVXXt2nPvbYOvmD1YZ8WqrkuruO9tcCb/pr26ba359+qK0jOBei+WyF0eesm04qutZz7QUeKfG/m8IWoYhdIJHDravnTPqRZc9F/RE5HyTwTHhRdkPMeGDfSJeVTLlILr5EXf4GkY4LtYZ5dnXLyiyd8XZ4Kq4AybXdRjzY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731606029; c=relaxed/simple;
	bh=KTRpAz3i1H8BdtJg/igEwbD8gjFpfkoI+H7WdnN+jk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nLwElgJ9OLtcdyw4JPsHfQV1tGf1AvytxxMSdJc1JWl0vEBODVMaum2VunuPPxPpfzFy0eINjHRhXDqVXztUf2SQms7evMyHF1eI74/KDlR0bO5AcdhouK1r2xZzH/45rTESozi9wNKRoLxHUItFtjEeqD/Zxl+e5IetYRZiIQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=lNI3B3hs; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 76AF91813C5
	for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 18:40:17 +0100 (CET)
Received: (qmail 14456 invoked by uid 988); 14 Nov 2024 17:40:17 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Thu, 14 Nov 2024 18:40:17 +0100
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
Subject: [PATCH 2/2] platform/x86: thinkpad_acpi: Add support for new phone link hotkey
Date: Thu, 14 Nov 2024 18:39:30 +0100
Message-ID: <20241114173930.44983-3-illia@yshyn.com>
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
X-Rspamd-Bar: ---
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) BAYES_HAM(-2.564878) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -3.664878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=KTRpAz3i1H8BdtJg/igEwbD8gjFpfkoI+H7WdnN+jk4=;
	b=lNI3B3hsOc+akB1zfEGngZj7y4rDtJvdJKTL4OEQvpLFUGyOOivHkSWtGnUEsti3bmK95oN91P
	46iBb3pgCsJGbz+PhlxqLCyT3TK7sZEAe9AuwV1vDqLaW8D8Kvrh1bwCcagRYsi/ohyrN7gJKiyY
	XPONbZL+AxOsdvDSOi7MluvKBZbovjfyWv6QIph6/0ApjHALVaQiBqp0DfKITRIK+vs1BUAhIAMB
	nO0Mgs5Xowp7ml9lU+LJrUwGUZOBdILRGVKPqx5flW7tMWbf8EIdZgwMamGWhXyI7vaFg4QzZgpS
	v8DnGknLMH3KvpNblTSwcOIrwtVwoV8rNE5l8ntA==

The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
Gen 5 laptops includes a symbol showing a smartphone and a laptop
chained together.  According to the user manual, it starts the Microsoft
Phone Link software used to connect to Android/iOS devices and relay
messages/calls or sync data.

These laptops send the 0x1320 hkey event when the key is pressed.  Map
this event to the new KEY_LINK_PHONE keycode.

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 6371a9f765c1..6f2e28d741dc 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3274,6 +3274,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
 	 */
 	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
+	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
 	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
 	{ KE_END }
 };
-- 
2.47.0


