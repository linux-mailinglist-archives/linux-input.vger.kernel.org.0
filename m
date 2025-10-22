Return-Path: <linux-input+bounces-15658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF26BFD740
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 19:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4BFFB581CA4
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 16:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690DD27F4CA;
	Wed, 22 Oct 2025 16:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aprilg.moe header.i=@aprilg.moe header.b="TEQEd2Rf"
X-Original-To: linux-input@vger.kernel.org
Received: from a4i517.smtp2go.com (a4i517.smtp2go.com [158.120.82.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860E334CFCC
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 16:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.82.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761151322; cv=none; b=TLF4JO9/rufbFZsipoyBX8CO9bE/2keV2egWd4sppF4L3SNIMeRNjTiP02NIAgM53V4mx0Oy4dUUyRg+ppF81CYDiX1Ui8A6Z/l0Gls2B8++/Y2vPRYDmyKe/1rdR0yBGRA8hPHd2UqTzPnUDlEToeDEd36wXofwhzNivJ9foDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761151322; c=relaxed/simple;
	bh=DPBA1cEnteThqlbYCaIQpR6lbEIC8T3GqqRLJOWPZb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HywTHIabgp66X3vm8lTEhavEHOHDEDSa5Z+XFHyfwH+tSoxg9nGQdLZqfhYTxG5tTCFDkSPu5oDPDKjfJdengkVoXno3RcLi3UVHye5qFXSXOski90xo3q8syn7RbLAaHm07dsYTz87Ced5lxjdKN/pJC3FFdTBJvNGPcaSldE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aprilg.moe; spf=pass smtp.mailfrom=em810805.aprilg.moe; dkim=pass (2048-bit key) header.d=aprilg.moe header.i=@aprilg.moe header.b=TEQEd2Rf; arc=none smtp.client-ip=158.120.82.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aprilg.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em810805.aprilg.moe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aprilg.moe;
 i=@aprilg.moe; q=dns/txt; s=s810805; t=1761151136; h=from : subject :
 to : message-id : date;
 bh=/irYkdYYv9XO+lHWk+huvIBG8k7L/412MUvHRa00Fa0=;
 b=TEQEd2RfltZu3VAyu83Zwe5tH/t2n29jZt4SZ4SaN2Ea5i+N0HXKrSOimNa3p+8YXOyrM
 cygQQU/qnkFZwdah9Xo7D0PT8OrHaK4j/PZ/zhLJtg5CBgxq0O8k/ag7Yj0XlHLBmW+Q4Fh
 ZDeOa1HubDhwsyxefTQrGUeW9/rVXxQsItMJ8MX9AZZtmeFa4CtwAr8yOzbGVaSH3zQZtlC
 5XR/9BTgxAvlk8c+zzI5xDSdU6os3oZ+rVdgBcmAYXZsSEk7BuH01vbm0JQQtViFSgzWAg4
 y5kcfoTUAjj2nEsfFXzpfDY5ZcEnp7CMmGknggurf0LWulBvz5iQtut5gJBw==
Received: from [10.178.243.157] (helo=aprilg.moe)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <april@aprilg.moe>)
	id 1vBbrR-FnQW0hPwFuZ-Jkxq;
	Wed, 22 Oct 2025 16:38:53 +0000
Received: from AprilGrimoire-Mechrevo (unknown [23.249.17.191])
	by aprilg.moe (Postfix) with ESMTPSA id 66573662F0;
	Wed, 22 Oct 2025 12:38:50 -0400 (EDT)
From: April Grimoire <april@aprilg.moe>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	April Grimoire <april@aprilg.moe>
Subject: [PATCH] HID: apple: Add SONiX AK870 PRO to non_apple_keyboards quirk list
Date: Thu, 23 Oct 2025 00:37:26 +0800
Message-ID: <20251022163726.19667-1-april@aprilg.moe>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 810805m:810805a5lOAc2:810805scwCczSjBE
X-smtpcorp-track: SidzeDkWsPM9.Z7ezLsOAyaaV.R97J4gd1rjF

SONiX AK870 PRO keyboard pretends to be an apple keyboard by VID:PID,
rendering function keys not treated properly. Despite being a
SONiX USB DEVICE, it uses a different name, so adding it to the list.

Signed-off-by: April Grimoire <april@aprilg.moe>
---
 drivers/hid/hid-apple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 61404d7a4..57da4f86a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -355,6 +355,7 @@ static const struct apple_key_translation swapped_fn_leftctrl_keys[] = {
 
 static const struct apple_non_apple_keyboard non_apple_keyboards[] = {
 	{ "SONiX USB DEVICE" },
+	{ "SONiX AK870 PRO" },
 	{ "Keychron" },
 	{ "AONE" },
 	{ "GANSS" },
-- 
2.51.0


