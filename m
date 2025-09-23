Return-Path: <linux-input+bounces-15013-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC59B9671D
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8605188DE1E
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 14:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5F1264638;
	Tue, 23 Sep 2025 14:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BglUpkpa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB60F244660
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638976; cv=none; b=ZxGNFpStVwqBvyGLrL5416TNYbKh3byzvCgNEZJLPlZR41QQiTFNNXnNwPWUcRzZtoNM7N8gfakcfrFMFdzVIKKx4A2zjeKD5JdmJwLLtg8EtK5ilKDMO7gEyP5iJH5MXC8Y2MD9dR5Uo5403RSqjos2hpd7CGGE0n/JGiDf3D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638976; c=relaxed/simple;
	bh=sLM1xctq1sZCetv1t/FXrLccMl5BHb26sBKtCXVwXcY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mDSANSRWrIdUpie3jPlW1XF1SzW3HzbuNOEnrQTpUxky9yGS6dRJSKUv9qXfxanTkrfbh8iYvpoXw7XSWyCJnvguQkw6jzzon7vErwtbDyFcOnDbQVq4rhcFVL9C2blKdMyR6QJ0mCKOlpBvlT02Un8FRQFxhTcT/jimK2yAAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BglUpkpa; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b554bb615dcso1560885a12.1
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 07:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638974; x=1759243774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp7+9xFuqi62hdNhf2W1lvuRdA3Rtjn+hEtiwRUgEms=;
        b=BglUpkpasnTMsxJ1kob2YRj1IusV3UOU4iwbeZUp2FaU3BgFplLW7qN8mQZsLJ/Me3
         7pXdZ4MJujUW9a+NIcmTCloW+5dpuHcg7FvQcIaVead4QVL3MFULBWiDAsf5ngoPv9v0
         ZM89eRr6vFuIb1HCidoCzpBhyySmJXW7F6DlIYFmX0lhocYMz6TTkAEWRwpUmLeaL4PP
         D5pc7kziwnILkPtdDZofElf0DUSIn1G4fyWjT+WUgcuQ2/oLxO/MdyNDEnW53nAhtc/r
         kxk9FVcCsrEEoW2+/KkTGH7zJxdt0tLKRg8lZMkxUyZ4Y0DeX/0GzIyUCLyFjEjVb8ij
         RWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638974; x=1759243774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xp7+9xFuqi62hdNhf2W1lvuRdA3Rtjn+hEtiwRUgEms=;
        b=Qc8/EfNGYMf4nXZXz6AKKfkPf+NSS6DLrg71qs9utWteEHTWqDMk5tS5UqHnHCDuHl
         fPvjcfAIhsVKw9PwpHT3Lgq7z4i9bTsJU8HoUtVtrpWXnUG6BQIrZqLUPnJEj/rAr5Ei
         kpu4wLdmqOdoj/QsOTZQX/UvNtB/NBOX/iJ1hGOUT6b8PMRCsOBo0EXM5ihRtABpW0MK
         VPnGLh9DwcK4i9DoFYbXbJ0UmLSfxnjDFPGsWdNUA2lSls351+suOKlIE3B4wm7mFc65
         LWPALwkeFHQInaI98LqzihIwWkxCsGSq3aMfGUWiVDnn3Fclh461WbWNT71iKgfldwMF
         KibQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyRW6n85QxNFBWKAT0lliW4oTOE6I/IssOw67G9rgkndoSAc8TcNmDF+GCcX7jW1xISWgF38pddlA5ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkND0Bh6KhDNqAkQ5SnhNuVJJNsau76brSoBb0UWomat0pd7pw
	Y/TVq2WsG+lhSPoshwQskze8yteLKk7ulLKauDtzBLJKvzIzmkpgL/jV
X-Gm-Gg: ASbGncufZ9ftKwkn2aiZfO16UHiaLJmfZor0cHgxIlfOOn/kCtg2hpvkKIBbGVlnudj
	pgqVAqH5vRdjaSjdMr3F9fYgeVjNOlh2mNbN2Fbl2jYUvQUkmKdFqJHWxr7z9C/RnRuJJRJLQBe
	i0l3QIxRLkaCCoZjJyXEKGlWds0oOaGJKIC9Q/WH1jZ2BSVe5OD7n8pTIYP509J15bBPrNAu7SH
	4O3vrmFicB6OqhQdgl9Mcqr3vDQzVX8YS+63HNHjUSwwi8Wqhr46Viyi9s5i6DlLwew9Nyt20Lz
	VzxQN/foqaoO5E2mkV4YcqQDLXjLLO7Dmi2zaX9OAaDB4QpE2nL4Q2+c4/snGSYwwN3xpB2HW92
	NNJAFUDosB+5C+SOLVyrvOwuSBn2vAJ0348iU7caCvCc9U4BifBw=
X-Google-Smtp-Source: AGHT+IEPHh/2ebqkGgimtTNshZ35ZBhXt9O04HK+1pd/wsmqmpdSWNANzUnELZmpu3VzsIEIQkb+0g==
X-Received: by 2002:a17:90b:4a8a:b0:327:9e88:7714 with SMTP id 98e67ed59e1d1-332a97051f7mr3565283a91.37.1758638973819;
        Tue, 23 Sep 2025 07:49:33 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.99.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ed2771d43sm19092682a91.26.2025.09.23.07.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:49:33 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Michael Zaidman <michael.zaidman@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: bhanuseshukumar@gmail.com,
	linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] HID: ft260: Use sysfs_emit to write formatted data to user buffer in sysfs show function.
Date: Tue, 23 Sep 2025 20:19:26 +0530
Message-Id: <20250923144926.307315-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inline with sysfs documentation, sysfs_emit is used in show function
to write formatted data into user buffer. sysfs_emit is already PAGE_SIZE
aware.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: Patch is compile tested and verified with checkpatch.

 drivers/hid/hid-ft260.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 333341e80b0e..8677bea46bea 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -826,7 +826,7 @@ static int ft260_byte_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", *field);
+	return sysfs_emit(buf, "%d\n", *field);
 }
 
 static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
@@ -838,7 +838,7 @@ static int ft260_word_show(struct hid_device *hdev, int id, u8 *cfg, int len,
 	if (ret < 0)
 		return ret;
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", le16_to_cpu(*field));
+	return sysfs_emit(buf, "%d\n", le16_to_cpu(*field));
 }
 
 #define FT260_ATTR_SHOW(name, reptype, id, type, func)			       \
-- 
2.34.1


