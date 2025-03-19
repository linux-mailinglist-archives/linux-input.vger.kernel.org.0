Return-Path: <linux-input+bounces-10981-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09B0A698CF
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 20:14:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 683AE3B5BFB
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 19:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAEB214225;
	Wed, 19 Mar 2025 19:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JcGwKjn0"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD9C1B0F1E;
	Wed, 19 Mar 2025 19:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742411610; cv=none; b=KOVQGKDMxecCvYDuAnzR6ugvjzzuQGNbyWhdo+7AlCFfid+zxgSHiN9OodFQ2s3ffdxhzWVf346QW/4Ez0kmPslYS9oHlBpR/s0TE/fnWIbdczSiX/PrlRcWfLU8k/oFF4yIDtgt1CUVy5pWEyFHyEPUyHUZF0wHtCA7LpRlD+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742411610; c=relaxed/simple;
	bh=fdpGiDeNZTffqd3ClYYEe7dLIgqCM5WBpFP3hHCUauk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PcdQwnxyTUgdxx+5MvxPpz6p8+qow8DMDiJSCAC99EXnxEr/L7FcttBzZKqoLLCk4IuiuymESq3MckXU3PTgF/pos+cRdl4L6r9DTqlTmnadQ4u59jW6VO/gIZyTE//KKL+yc7FZn/10JBzzS8Oofh4+N+dMhYr/nlC7obWoLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JcGwKjn0; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 8DEAF2E02983;
	Wed, 19 Mar 2025 21:13:25 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742411606;
	bh=CkVyRl6ofkF8tSjqkt4HlEXeT8gWPG11IpspxJDllEg=; h=From:To:Subject;
	b=JcGwKjn0mHZK98VyOWmVT8GWs81zoQjwwm5XzrwP1USnO0CXK/to6oplo7vy1xSKH
	 W5MUcKTWqKAWuOEJ2npbcleXqJZbmzMHBp/2lERcinb/QjKgCHT/ey8kLypDtq3JwY
	 ndMSF/4ZrsaogXSNTf6HW1zx71RsjZV93yDI3HwU=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH 02/11] HID: asus: cleanup keyboard backlight check
Date: Wed, 19 Mar 2025 20:13:10 +0100
Message-ID: <20250319191320.10092-3-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319191320.10092-1-lkml@antheas.dev>
References: <20250319191320.10092-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174241160668.7728.4433485881007523163@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Currently, asus_kbd_get_functions does a set_report
to query for the keyboard backlight status using a varying
report id. However, it then does get_report with the fixed
id 0x5a. The ids of get_report and set_report should always
match. Therefore, remove the calling argument and force 0x5a.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hid/hid-asus.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index aa4a481dc4f27..bcc317057b465 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -427,10 +427,9 @@ static int asus_kbd_init(struct hid_device *hdev)
 }
 
 static int asus_kbd_get_functions(struct hid_device *hdev,
-				  unsigned char *kbd_func,
-				  u8 report_id)
+				  unsigned char *kbd_func)
 {
-	const u8 buf[] = { report_id, 0x05, 0x20, 0x31, 0x00, 0x08 };
+	const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0x05, 0x20, 0x31, 0x00, 0x08 };
 	u8 *readbuf;
 	int ret;
 
@@ -572,7 +571,7 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
 		return ret;
 
 	/* Get keyboard functions */
-	ret = asus_kbd_get_functions(hdev, &kbd_func, FEATURE_KBD_REPORT_ID);
+	ret = asus_kbd_get_functions(hdev, &kbd_func);
 	if (ret < 0)
 		return ret;
 
-- 
2.48.1


