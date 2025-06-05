Return-Path: <linux-input+bounces-12723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DBACF612
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 19:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A739A189D352
	for <lists+linux-input@lfdr.de>; Thu,  5 Jun 2025 17:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FEBF27D784;
	Thu,  5 Jun 2025 17:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b="T8K2vxG7"
X-Original-To: linux-input@vger.kernel.org
Received: from libero.it (smtp-18.italiaonline.it [213.209.10.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D575727D766
	for <linux-input@vger.kernel.org>; Thu,  5 Jun 2025 17:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.209.10.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146206; cv=none; b=qPp7Pab2uTu/w/+5EjBpj797cBytDd/pHh2Tw+L6AKPXb02vyrkq142ZGik1IocX6qSRTolCv79yWlLbUdzt/TJLNoIg8YbqLqlx7TQ+tvUsXA3byMtwPYG4VcgHWvqN2IHbcXl9PTEQqJ8kgcr9nK4+kQUjiTtVjCG5uQcGRzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146206; c=relaxed/simple;
	bh=UDbyyU289DpiKEMXJKbMueeNS458Kw0ebYMljjBVTE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XmdSM1gQjZWxJbmkP3ETE/6hO9OMqbqR3N9PGmi1aJVBosmEapQ3fs6yjg6BA8hbp8hBAl+P3lxk8dsw9c/WqQeP/D0hllu01orBqt8HxbU8HVvXlS8OUgOwzVwsvzHATVWQOpGb5fPckLmsT4bakLpRkAiLoOTLFKREyifIBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it; spf=pass smtp.mailfrom=libero.it; dkim=pass (2048-bit key) header.d=libero.it header.i=@libero.it header.b=T8K2vxG7; arc=none smtp.client-ip=213.209.10.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=libero.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=libero.it
Received: from HP-Pavilion.home ([82.84.39.179])
	by smtp-18.iol.local with ESMTPA
	id NEoguUyL3YObTNEpPuMfvK; Thu, 05 Jun 2025 19:56:35 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
	t=1749146196; bh=scq481/vJIzHOcwPmp8rc3B2A4DiECInIg6hf4LLLjY=;
	h=From;
	b=T8K2vxG7GUOEY25wkk+jsLrNWd1D/jPljTWDkaj8OgiOQmnhYsSsFxoNqpkxexq4D
	 x4+Z9HRvXhkvhgcNTbchOZa0kq9Ow9nFZvH+yypYGCzeUGIpRtNcUfZ8e3YMoYlBzF
	 iKqiqpBRhz0zSPWg26ODjKBcIcyY26iDHixPyU6qzICCqqrSjxiQFmi/9S0TeqlFyE
	 hcvOJ9R5wZarJcxuSelstiTsCm+C1trcAlsPizxoQATqocyQLCJdJsJNWfNM7ANnvg
	 D2YfYsaEEC3a18KU+STV60I8JKnabuSHEyHrOWhBtqPPjEt2pHwFADc7ePXhEE0Sb1
	 F711pk+KiGw8w==
X-CNFS-Analysis: v=2.4 cv=T/qMT+KQ c=1 sm=1 tr=0 ts=6841da54 cx=a_exe
 a=vLznef9V9GWkD4NuElIRWw==:117 a=vLznef9V9GWkD4NuElIRWw==:17 a=VwQbUJbxAAAA:8
 a=tqaCDwS5ghsgyJy-KEMA:9
From: Iusico Maxim <iusico.maxim@libero.it>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] HID: lenovo: Restrict F7/9/11 mode to compact keyboards only
Date: Thu,  5 Jun 2025 19:55:50 +0200
Message-ID: <20250605175550.641392-1-iusico.maxim@libero.it>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHk8/5YcbjZsrFKxLg4acxOIm6ujU6RM3iLq+z1T5FHBOZ9SFWc75SJ+eM+x0KHkN6cIfhJpzqo8Y3aUl+LYoxkVFjK5gfap3lxN8oiIJsgErRTg8NIU
 02cTrkThROQAI/1eFs6GMENwCXwWj5MOGxTalupaqQR53lky6RLpmoWSbJvl0d3F6o0A7jHHeMU4UbqL7cNxhWoPvjR5VKE4bU1rh/u8yNMrF00zBBRTezuA
 b2ub8Px6op4SAkpuTURepbgcKRpOjnIBK4DeDhpM/VKfw9/xnlfhvcMAWkSeNVFPmL9Qzyqofj1Eofx6IYkWIKRzl3vZ1QUlfpsGAG5enkU=

Commit 2f2bd7cbd1d1 ("hid: lenovo: Resend all settings on reset_resume
for compact keyboards") introduced a regression for ThinkPad TrackPoint
Keyboard II by removing the conditional check for enabling F7/9/11 mode
needed for compact keyboards only. As a result, the non-compact
keyboards can no longer toggle Fn-lock via Fn+Esc, although it can be
controlled via sysfs knob that directly sends raw commands.

This patch restores the previous conditional check without any
additions.

Cc: stable@vger.kernel.org
Fixes: 2f2bd7cbd1d1 ("hid: lenovo: Resend all settings on reset_resume for compact keyboards")
Signed-off-by: Iusico Maxim <iusico.maxim@libero.it>
---
 drivers/hid/hid-lenovo.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index af29ba84052..a3c23a72316 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -548,11 +548,14 @@ static void lenovo_features_set_cptkbd(struct hid_device *hdev)
 
 	/*
 	 * Tell the keyboard a driver understands it, and turn F7, F9, F11 into
-	 * regular keys
+	 * regular keys (Compact only)
 	 */
-	ret = lenovo_send_cmd_cptkbd(hdev, 0x01, 0x03);
-	if (ret)
-		hid_warn(hdev, "Failed to switch F7/9/11 mode: %d\n", ret);
+	if (hdev->product == USB_DEVICE_ID_LENOVO_CUSBKBD ||
+	    hdev->product == USB_DEVICE_ID_LENOVO_CBTKBD) {
+		ret = lenovo_send_cmd_cptkbd(hdev, 0x01, 0x03);
+		if (ret)
+			hid_warn(hdev, "Failed to switch F7/9/11 mode: %d\n", ret);
+	}
 
 	/* Switch middle button to native mode */
 	ret = lenovo_send_cmd_cptkbd(hdev, 0x09, 0x01);
-- 
2.48.1


