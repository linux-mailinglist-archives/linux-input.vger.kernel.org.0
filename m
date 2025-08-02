Return-Path: <linux-input+bounces-13765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2BFB19024
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 23:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D035B17C5C7
	for <lists+linux-input@lfdr.de>; Sat,  2 Aug 2025 21:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4A9253B52;
	Sat,  2 Aug 2025 21:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="bIdkvxPc";
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="dtNNoLFC"
X-Original-To: linux-input@vger.kernel.org
Received: from e3i331.smtp2go.com (e3i331.smtp2go.com [158.120.85.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A348A1F2C45
	for <linux-input@vger.kernel.org>; Sat,  2 Aug 2025 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.85.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754170384; cv=none; b=UwyGqeGr+BaWpAaGMf6k4wc/YHn9q7prCDVekxnMOKf96B7mMwEBFxr0NUIBPQpK+J4XCl8n25dc2AMSOVgp9V0+fVI31rigei+WbRdam6iFw9EUztjKYN8Kw3sYRBshY0tIcQ+NCaQR5QjVd7dTgqrxPqJxpVVgfwt0v/FW7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754170384; c=relaxed/simple;
	bh=GLhv/T2dtFQ3GlTlK7o9Bmk4Du5gnHqSjrhT57Tn/uE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hokZbgZLfXwjblxx3gXpRS+EHJuAPgG1sZygDoh/n6vdanOa3qZzBNtHf7aOPSJdkjQfD7cYlO2U423PS6dxDWX+jxMOnXtpvJ9HMAMWZaT3e8Vcw8tp5QjK81AUgZNOlzkug/msYTUuFWgNFc+Pak87KwDTkDmnffaVloR0o1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=bIdkvxPc; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=dtNNoLFC; arc=none smtp.client-ip=158.120.85.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1754170373; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=AcX9VcErMWRg0sR1MbexnWdLJ0Tu14req403gJypbmc=;
 b=bIdkvxPcTwFI86bsNBgRJt07KW0Mq+/Ig8i0SA1lAAlEaZYSkfU7bHqK4H0ssBwcifTXI
 Za379Z/TPa33ceGsFSIsCFhVHp2np9aIH8F40O2rtPpiCmqiRfeugW+e+nqHc36hlV91U6S
 mHsD1dkpG60TkjCeozA2YxVK9yLWkuNscRp2lfABIAWF09l4u0gVFVIT3bUOAvJzzXvJveg
 +Uud3mYKPqcXWlDj4Hb/hQX8gLBHXYYwu/8NSzrBRAbRrX4TZKuf6L5SrT8sUAWPkjj5uNp
 CG3Gy27k6eqxFaWWpM1bSDYizDkngmwTP6+hMQKSAaYJ0Ia4KDFIUBv8PmKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1754170373; h=from : subject :
 to : message-id : date;
 bh=AcX9VcErMWRg0sR1MbexnWdLJ0Tu14req403gJypbmc=;
 b=dtNNoLFCT0fJ6DifLSl5zZhlevZHzTOEGfmKOAW14pT8hInSLs40snSRbEVCwIm6DKN2N
 6DFd1lyWXz7PtekIgBhaXV0Iyy4E0JAfrMoyYgjB2SC1VfUUA9jD97e9929Ixx7Sl6f4fPB
 deWDaeuPvGNPDy9iWn3CRNL+cXOSHd2iBzCX7z8F8NrhtCRKL1OSMr0dJtVI/xThaiohZoe
 n7/uBGRnzjqNG58ng2C5rTR1ozFJ+emRHONXVCKlM8EgO5SSskZlOj2nsSqUALijJDBxu3N
 cbdIyu+WJ8BaJidPjvYV44ExawIUN0Vvi6z3dwfCFpbUxC4rfP+Dm4cvrjMQ==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1uiJqP-FnQW0hPvggj-NCpg;
	Sat, 02 Aug 2025 21:32:46 +0000
From: edip@medip.dev
To: dmitry.torokhov@gmail.com
Cc: jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH 1/2] Input: Add key event code for Fn + P
Date: Sun,  3 Aug 2025 00:21:50 +0300
Message-ID: <20250802212149.16707-2-edip@medip.dev>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sMNE8L0U3Q
X-smtpcorp-track: R-V7ZdS_w03l.e1voHp-jQOGP.CxuSpgP-0ld

From: Edip Hazuri <edip@medip.dev>

Newer Victus (and probably newer omen) laptops contains a "Fn + P"
Shortcut. This is intended to use with Omen Gaming Hub, Which is
changing the performance profile when this shortcut triggered. This
shortcut is shown on performance control page, see [1]

Currently there is no key definition to handle this. So add a KEY_FN_P
keycode define to be able to use this shortcut.

[1]: https://jpcdn.it/img/adadf6c927ffeb75afd8038f95db400a.png

Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/hid/hid-debug.c                | 2 +-
 include/uapi/linux/input-event-codes.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 4424c0512ba..2bcf7b24801 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3342,7 +3342,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_FN_1] = "Fn+1",			[KEY_FN_2] = "Fn+2",
 	[KEY_FN_B] = "Fn+B",			[KEY_FN_D] = "Fn+D",
 	[KEY_FN_E] = "Fn+E",			[KEY_FN_F] = "Fn+F",
-	[KEY_FN_S] = "Fn+S",
+	[KEY_FN_S] = "Fn+S",			[KEY_FN_P] = "Fn+P",
 	[KEY_FN_F1] = "Fn+F1",			[KEY_FN_F2] = "Fn+F2",
 	[KEY_FN_F3] = "Fn+F3",			[KEY_FN_F4] = "Fn+F4",
 	[KEY_FN_F5] = "Fn+F5",			[KEY_FN_F6] = "Fn+F6",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3b2524e4b66..2fc79b32425 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -548,6 +548,7 @@
 #define KEY_FN_S		0x1e3
 #define KEY_FN_B		0x1e4
 #define KEY_FN_RIGHT_SHIFT	0x1e5
+#define KEY_FN_P		0x1e6
 
 #define KEY_BRL_DOT1		0x1f1
 #define KEY_BRL_DOT2		0x1f2
-- 
2.50.1


