Return-Path: <linux-input+bounces-12083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE66AA52C1
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 19:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CE143AD8BE
	for <lists+linux-input@lfdr.de>; Wed, 30 Apr 2025 17:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D27266571;
	Wed, 30 Apr 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ICp+8Ner"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F865265631;
	Wed, 30 Apr 2025 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746034855; cv=none; b=QbRsRU/awrKwbNeAVbzw1BxJTMAUf8A/XxoHxvKafv9EpJAMkgiym2HGQzq0nB/DNZJtjCRDvAw3Dr97w8tMkcz7Ki9vW8BgaddPE2cZOjYKyhd90MwDRrCuHnwueMzgt++6JvXbqaDeT3nh6UJRrHFUgIzROg/CiSdFJRteNuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746034855; c=relaxed/simple;
	bh=L58F8VpFitdjXDwxdOokTqHXLMkWR+da1yRV9U90EiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C4Cu3ZRaSBGe/f/NUGVg/D/fjNH39PkqIseFuD4mGIc6bOEarqjVEIxAb7TstTUcArjLye9ewiosfimqItiB4gbXV3iz7q16l5HUdtH+hu+JumpMyyZmBfD841+GnXSUO4SHW0T1xzSLdXT1aQhWmrmw3IKfFhd+k6uGNXcUcUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ICp+8Ner; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so44991f8f.0;
        Wed, 30 Apr 2025 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746034852; x=1746639652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qr4YA8C6ubuzSecBPpkUyyaJOotpwzXLW4F+DAHusgI=;
        b=ICp+8NeruKNvjkRMNkFdtNO+sfeiy+rly43mM6jEcdBtXQzCmAU9SKqC9LrWSWaO3s
         Tr4dqsJxeESAZqCErGh6euj/OkD6gdq4xmcxxZGs9pME7Jo9YPfec/VjKCBBbE54Dx5r
         lyeSc1xJdRunTmXAA9wbUteqV3iJhawIV84lDlNMy//i+H9cYn4SBV1hBQ8f9/LcxmfP
         zeEq8hbh6CDrqYaiEeECgN/YJlsVovAUVFJ6mZj2rq0kiliwdWq8l4GQJAzmRfjGumZR
         uDi3M1CTBoyzG5CBTRks0aerP0TUTgzDTWY9mmjJzsLdZgt6uKmCGGuoUlAz1Cz+5A7w
         RQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746034852; x=1746639652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qr4YA8C6ubuzSecBPpkUyyaJOotpwzXLW4F+DAHusgI=;
        b=IP2njEFYcL0v/OcguqcJK/MZCFU+SPFYiJ9ycUj6389s9mqRoR9ApaKeu3wgaP2i9w
         mjgXO4XCbGCy+EKvpeJXtnNRSnaZMmrIl1zFDG6MUMCQ4vXvc0ToiTBDF/XAsrufbc2y
         ZNGfhhQPZBw7n1hnsTA1RGLJVM7j2Agx4LgkliyXMSs4MXbe/gLgVFToFuCyotsPVHEZ
         dlFsypYyu9qZ98shd2iwhEGp/aEwE9XbG8kFeE5mbbteM45IeiXJhCoR/UayvM34K/oh
         tkkMKNneMyKZMbA1szRPEbue03as2D1B/XILa/4+YsQCMEojfuNxjP4tTN5gJs26TsNq
         W4kA==
X-Forwarded-Encrypted: i=1; AJvYcCWFkb4Z3h/ark54dZ7sg3AnItLupNmNVH4meAHBlVYeKVdQR70axN6cIVt00g4LPgpDMTYqmsnBK/E/rGgr@vger.kernel.org, AJvYcCXSMXFqY0DYrqYIq91m+BiNit/b1d/o9FSgrmARRy2dMXvzi4MGYm1c5T44UtM5OTCSd0DWpdmFOmPwSA==@vger.kernel.org, AJvYcCXrTeacTBHEIf/bN1Wc6/uHEy0BuaeOwE2X9FOBVMw6KarNiV7xBZw8F79Sa+5MsMYeOL9qc/YN@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3l/efd/rYiiYfx9227KXQLvGDF/O/r5o84fG2ZoFZvtfC9RQ
	OBBtXjHZlzDAwQMyLAEU+ZUzCi63Ms6d1tyb3CsyZfupgVytf2oz09i5xA==
X-Gm-Gg: ASbGncufoKFwZH4y0A7o/DB9QWEIgcCq0kcx1iwB9kSLWnnVuE6hVD4n/HWNQu5qWRe
	TbC4VZgiueNIzi8gQVF09A+b4gCmIOOWbFXqnUWAlEGicS2ctTNFonhc3768eQDxr15c7467ru/
	+NkPsplphKOLfE10ahNNk0KrG7BrgFTLeJGwuVkMNna/5UGMgv12ZGib/Wmx3AWh0N/PwD/8XAN
	la/vWCqE8WEaVLwOgmlWWBFQl28kOWIbI1EmbYCmTTAKKHawfI2lJCzCM5ppwUjPAK9KrEu9N3/
	LLhxkb3Jy0MzNae5/Q+5Ub0QHmH+DoSAqEVEhYFn1Q==
X-Google-Smtp-Source: AGHT+IEmNE/VR07OxMfSFdyBBqWX9svb/T4h8Nx5tRuJEG+krh3hgCM+/mR02ZKnCmExu4209d75gg==
X-Received: by 2002:a05:6000:3107:b0:391:23de:b19a with SMTP id ffacd0b85a97d-3a08f7a2164mr3174512f8f.31.1746034851557;
        Wed, 30 Apr 2025 10:40:51 -0700 (PDT)
Received: from qasdev.Home ([2a02:c7c:6696:8300:7d1e:a9b9:e7a2:cc4c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5473sm17765934f8f.31.2025.04.30.10.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 10:40:51 -0700 (PDT)
From: Qasim Ijaz <qasdev00@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qasim Ijaz <qasdev00@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] HID: wacom: fix memory leak on kobject creation failure
Date: Wed, 30 Apr 2025 18:39:09 +0100
Message-Id: <20250430173911.84705-2-qasdev00@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430173911.84705-1-qasdev00@gmail.com>
References: <20250430173911.84705-1-qasdev00@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During wacom_initialize_remotes() a fifo buffer is allocated
with kfifo_alloc() and later a cleanup action is registered
during devm_add_action_or_reset() to clean it up.

However if the code fails to create a kobject and register it
with sysfs the code simply returns -ENOMEM before the cleanup
action is registered leading to a memory leak.

Fix this by ensuring the fifo is freed when the kobject creation
and registration process fails.

Fixes: 83e6b40e2de6 ("HID: wacom: EKR: have the wacom resources dynamically allocated")
Cc: stable@vger.kernel.org
Signed-off-by: Qasim Ijaz <qasdev00@gmail.com> 
---
 drivers/hid/wacom_sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
index eaf099b2efdb..ec5282bc69d6 100644
--- a/drivers/hid/wacom_sys.c
+++ b/drivers/hid/wacom_sys.c
@@ -2048,8 +2048,10 @@ static int wacom_initialize_remotes(struct wacom *wacom)
 
 	remote->remote_dir = kobject_create_and_add("wacom_remote",
 						    &wacom->hdev->dev.kobj);
-	if (!remote->remote_dir)
+	if (!remote->remote_dir) {
+		kfifo_free(&remote->remote_fifo);
 		return -ENOMEM;
+	}
 
 	error = sysfs_create_files(remote->remote_dir, remote_unpair_attrs);
 
-- 
2.39.5


