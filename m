Return-Path: <linux-input+bounces-7961-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2CD9C0D3C
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 18:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1CA11F23745
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 17:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D6E212D27;
	Thu,  7 Nov 2024 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRkQD1+I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A671A20FA85;
	Thu,  7 Nov 2024 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731001771; cv=none; b=LcKXvDKTQfKHDuELTOY5spxlvLoH/N+4kXq+gjG1a1Gvn16oidGt50RXf4viX4ohbNO//z6W9JuuDd0IgQka6EhhCNoqDc6NWPb8/Q4DgNl083WTfWN7UYN8Zc3KKz3f8MyEYicukJVZWkzHzpENvIBsdCrnROyIbqNaMI02/+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731001771; c=relaxed/simple;
	bh=4DZ5xKw23AQ6kbrTK566vI1gGLr1jbCnO8DhHoxzp3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NoCORnB8KYR/cw8OnQ335E4ZhnrqMc1UpRJvovVwwTe3w3nhrGXY4z0l5I1D2LHqcd4HDuVeimckzb07Mv5tZ2ST15jw2tK43FoJ/qvJ4qQMAtrKXhSmvFbR3mbFV2d8pvrEKrLjxJg6dtz4rVBs0Zg2GpgjpYlzf/CQSNVyLeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JRkQD1+I; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so978586a91.0;
        Thu, 07 Nov 2024 09:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731001769; x=1731606569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aVI86jqEfUt+yFFgC92llBdhDY30vnX1kQd0B0RuKPc=;
        b=JRkQD1+IOnPjfT9SZjfswLwMzxsALMdhkPzu5xBwG/2nxF9rDeW9ccQdpNIy8rMgqZ
         4BupNjzlMs5BS3MLg593oiW9SkXhKgWahU/QZUO2tUnNl0Ie4uFaS+M0A9XaY4zRDjjQ
         6U2i+UDan0Nvy81+jaN9lHgGLj1hrGMCqbuxHYMa6oyp7FO4neuu+zM2spfUOeKFvAak
         Qio3vJtGn7UjpjCr1ckDXLDnensQTc5plPAPzjRmqEMVxkWKLg/tMPI0f3amq+1ZkLbg
         TK3ZEUlHgXQGhBBvkV+3T1pOs+mefUAJkruHHdEXm7OfAVgsUi29vCBgXwYollv8Tbhz
         pM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731001769; x=1731606569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aVI86jqEfUt+yFFgC92llBdhDY30vnX1kQd0B0RuKPc=;
        b=pq5WP63rFLOfHZHvQ4FNWrjGoJH+tvuDuC/Tut6tHe7+DK3j0eC08BmBDsEbrkBygY
         6mHTMXR+gcKcHFvG4JlMBQLlYTICanSjOSF09enQB/BMOdXFuLsoZbvQVF4Pj3B3zRjt
         RoInKmo7N8Au0OwNrE2f5xbWoiYkZ9SzTNS0LWXOTKcnz4UBgGzQxQFoGkBwSIuposrt
         g+5jgQtX2nRhXZfzGd19iisUXFOiuCfVpNi4Xg/xeRmqZ2gAaCH/jJut35sFdcPiA46W
         e+a1invs2bTa07QXwdzrVZsz/Spl/lNWLBMicaEkmthQpBq+BAIazJmGw27N+xzIdbxc
         BFbA==
X-Forwarded-Encrypted: i=1; AJvYcCXViBJEM9eVDG/9cbeu9rgbCJw/KKGS/MeZRHfD4YlcHNlwZrc5X45brvEsGh/QdBh/pB3NZDlY6neGPwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5FOM2yk6L9nUeBswSKsPxsd7jgKMiztU3xb8UJsCvuGSPE77
	rs6MOjAwRzBchV9wsSveLoe41GbqHpQigFXULn/CS/bBbskef/ra
X-Google-Smtp-Source: AGHT+IGcRCtRas5EcAr8ajxJ9kVA9bOAHo/JUcbQ6cRLvtY5OanfDqBYQIvX8RQli34weAgZ6q0Zow==
X-Received: by 2002:a17:90b:3844:b0:2cc:ef14:89e3 with SMTP id 98e67ed59e1d1-2e9b171f673mr37448a91.15.1731001768917;
        Thu, 07 Nov 2024 09:49:28 -0800 (PST)
Received: from Kuchus.. ([27.7.141.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd1534sm1741391a91.42.2024.11.07.09.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 09:49:28 -0800 (PST)
From: Shivam Chaudhary <cvam0000@gmail.com>
To: dmitry.torokhov@gmail.com,
	wse@tuxedocomputers.com,
	tiwai@suse.de,
	hdegoede@redhat.com,
	eshimanovich@chromium.org,
	szfabian@bluemarch.art,
	tjakobi@math.uni-bielefeld.de
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Chaudhary <cvam0000@gmail.com>
Subject: [PATCH] Input: i8042: Fix typo dublicate to duplicate
Date: Thu,  7 Nov 2024 23:19:18 +0530
Message-Id: <20241107174918.78335-1-cvam0000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in i8042-acpipnpio.h dublicate -> duplicate.

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 34d1f07ea4c3..127cfdc8668a 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -90,7 +90,7 @@ static inline void i8042_write_command(int val)
  * ORDERING IS IMPORTANT! The first match will be apllied and the rest ignored.
  * This allows entries to overwrite vendor wide quirks on a per device basis.
  * Where this is irrelevant, entries are sorted case sensitive by DMI_SYS_VENDOR
- * and/or DMI_BOARD_VENDOR to make it easier to avoid dublicate entries.
+ * and/or DMI_BOARD_VENDOR to make it easier to avoid duplicate entries.
  */
 static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 	{
-- 
2.34.1


