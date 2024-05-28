Return-Path: <linux-input+bounces-3890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C098D13A6
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 07:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF500B22061
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 05:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0734A3D56D;
	Tue, 28 May 2024 05:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCvTZfHS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939273F9C5;
	Tue, 28 May 2024 05:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716872836; cv=none; b=u7wmjzNr2aeq3xXFGX6CLqhTDILmhiqbWbu0XHA7mGjZwNlGuewTIu0Q4o4EtCOXbkZmYmZH4EboHRxt1I/d+4TyLj7cAot/l5J7i8Ibn5DTHkvIbwEXqx+R/coBt0zXP/+4JQTfxlQQh2aUlEX16I6JVwyvcvFF03RjZborTZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716872836; c=relaxed/simple;
	bh=yUShdSmJr46Mgx4i2jipsfc4D+xqm4VZ+NXk6NsJYA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cR2qXL2JV/nFKcXXamqRsSKwAcLnNCDHREDE2UhawKNUjMLaA9j3sC55cq6EZ6EK6R6B7XShSmm1y6AFniT4Bok90n2mycAaMvP8OpwBU/XO4YbOmnxsV6D3fBz9+mwxFGDHLT8GicDx3bt52ELwL+1m/KhSJDnxz6zDhQQY/4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCvTZfHS; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3d1c077b9baso215233b6e.0;
        Mon, 27 May 2024 22:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716872832; x=1717477632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LGkX5CvYSeRWcO/OUCi81i8F2CpNF/Yknz+iuEPMic=;
        b=eCvTZfHSarr5vCpWFjVYlqoMVtJ5Zp9U7sWi6qB7nA28njSlLgcQKLevFTrc9Py0X0
         Eo4/uc3pb3ZLecssNlA3e6kZ2rL8Nz07xTTmCB88UwD0k5+QlXHq72xqlD9Hn/5qlghE
         VZVKqeyJmPe+2qamqQiJxG6A+SlJugvXACxn1re7S/b0nwiZ+9P/ej60ujL/S4bOsWV0
         DUw+m2JdSRT9Sp46Cd8wfmIpmxRYZt/zzfUpKtvuHRL4LeEiuGLH5NB7XXOZNed1a+wH
         eSUXZB6Ag8h216k6H3pcIyg/DLsYluFL0fr1Yl5klSZs3yWWncmRS0dB8jrNO/fkwTaX
         q4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716872832; x=1717477632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LGkX5CvYSeRWcO/OUCi81i8F2CpNF/Yknz+iuEPMic=;
        b=ocrvkvDVahuRLWqwkf20RQo1Wu6EyvThWtWjPFHEoPN3n2pB+C+cVQs6CUk7mGEgNH
         g4oPz++nz9bx1lMf/1rCbGripil6+PbGsYBvJ0Ml1PD4S+z4Igzgot64EOi3uHagFzTD
         fNo5Uk9DUtkLKEtrsJD8ejWFcPg2WF1CBuFCpyGzR4toq++YHybHGk6hobAKJGjt/I79
         msrmEESRYSmSS8FvGAFBuiSc9VtNNhHkrjzEb4IXtgH24qWjupxt3oG1zuqamgOsXGRt
         81h/GDqe9U6TnhVCPrEVJRqL8uB4uFhrMkJ/EG3lzohy7AMjRblHtoEsazGbGhBOjSzm
         eeRA==
X-Forwarded-Encrypted: i=1; AJvYcCV2MRe7V68hH6ZsCshLhWJINDfh6FcNNai+i/6cQu88hhSaROyI8ejzD8QltteQceHCjJ2Uy+BB9b2qXCNfE/PJEJZw02paqIldCmgSubmL4oVra+fTRZeipNkl8bL/UGXlhsMV/pG4vwOBekdYB8DcA+5DdC4/mC0VbBmNDJ1dgUfa/Lk=
X-Gm-Message-State: AOJu0Yw/YJXKV8hsTtbkp96v2yDNupqRBR/TbuxZedcUZKKvcXaZqhay
	bXxcrYl/G8/W6aSNlrw+pAPt3ivkie/DZ1PFHsB3fMekhsiz4xFgqvWUrQNP
X-Google-Smtp-Source: AGHT+IHchZ0MIxn31HdZq/DwBO+sPMGJpEVor0E0NH3BvSt24bhvXtHBVs63rTMcyUTh91G4ODpUSw==
X-Received: by 2002:a05:6808:15a9:b0:3c8:6468:73f6 with SMTP id 5614622812f47-3d1a85ec475mr14137814b6e.43.1716872831642;
        Mon, 27 May 2024 22:07:11 -0700 (PDT)
Received: from my-computer.lan (c-98-39-68-68.hsd1.tx.comcast.net. [98.39.68.68])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-3d1b36825d4sm1238633b6e.6.2024.05.27.22.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 22:07:11 -0700 (PDT)
From: Andrew Ballance <andrewjballance@gmail.com>
To: syzbot+07762f019fd03d01f04c@syzkaller.appspotmail.com
Cc: benjamin.tissoires@redhat.com,
	bentiss@kernel.org,
	jikos@kernel.org,
	jkosina@suse.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	luke@ljones.dev,
	syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Andrew Ballance <andrewjballance@gmail.com>
Subject: [PATCH] hid: asus: asus_report_fixup: fix potential read out of bounds
Date: Tue, 28 May 2024 00:05:39 -0500
Message-ID: <20240528050555.1150628-1-andrewjballance@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <000000000000915d550619389e8a@google.com>
References: <000000000000915d550619389e8a@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

there may be a read out of the bounds of rdesc.
this adds bounds checks

Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
---
 drivers/hid/hid-asus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
index 02de2bf4f790..37e6d25593c2 100644
--- a/drivers/hid/hid-asus.c
+++ b/drivers/hid/hid-asus.c
@@ -1204,8 +1204,8 @@ static __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 	}
 
 	/* match many more n-key devices */
-	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
-		for (int i = 0; i < *rsize + 1; i++) {
+	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && *rsize > 15) {
+		for (int i = 0; i < *rsize - 15; i++) {
 			/* offset to the count from 0x5a report part always 14 */
 			if (rdesc[i] == 0x85 && rdesc[i + 1] == 0x5a &&
 			    rdesc[i + 14] == 0x95 && rdesc[i + 15] == 0x05) {
-- 
2.45.1


