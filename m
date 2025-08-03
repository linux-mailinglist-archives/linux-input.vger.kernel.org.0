Return-Path: <linux-input+bounces-13773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B9BB194BA
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 20:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 327A5173386
	for <lists+linux-input@lfdr.de>; Sun,  3 Aug 2025 18:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CC51DE896;
	Sun,  3 Aug 2025 18:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGSTiQAn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D11E1DEC
	for <linux-input@vger.kernel.org>; Sun,  3 Aug 2025 18:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754244843; cv=none; b=RhKIS9erCsjqm1/kr0xkS8wnSDKj4F5NLxPxkMlOfpe0kIKxHqTmUXW+HBAkjoWdO4acFFaigzZKNbQRzGOI3NkZQ3RuSwbZW+uhnYAY3oA6sQ2e5wiMBuf5RZeVKd7HshpQTSCmXowzckWDmipIRjICAgO1SOAFuksa2WsGA+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754244843; c=relaxed/simple;
	bh=z0pknK+8ogA2NltA9aozSzN2vyPIvJCbGRvCPoL522Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUrWLD1PzgweBiDdhIqOd5OMJtvSasZ2BXjOGJiy2Bw/7zmwAEl1Fk1bdBz5tZb9s4zZWhzlMRgIG2IHzAOvNCAoP4xXYpQz50jkFVkSH2nWyNL25iuqFI2aPvEPFam0LM3Z9+NKqcVBko495h4XC4N+Ag4HbidfLND/xfVikLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGSTiQAn; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-615547ee514so613839a12.1
        for <linux-input@vger.kernel.org>; Sun, 03 Aug 2025 11:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754244840; x=1754849640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQhRV9nPzASovnJ/VXev9I8ovYrEr4PP8txv0ySIz9I=;
        b=XGSTiQAnJF9xqxIKO76ggEZG3GJHwfAM7OhfOigu9OKtk2kAJa/UQjSUA6oudSPRsU
         aO5sdS9PQ/AbEvR566bKrhw7qosEc33P+G4aahCnWJNIuGEIuFG3S3ISsQfPdg360HcI
         UE2fsCfZL4wSyypGtWPzcs+z1PxKsHqyPXELmOcHGx15Agiz2dE6XxMSrfaLwabH1kCh
         QPpyGx+zNcx6MKubjbeWMJxokk7uz+RfJWEO+5LWY9sQtjnmeavtpRki365BUhkJ4mgF
         mVdpy+SEhSrsvtG44YSmYXx+lnS1O1I4A2Q2Xdn1ArIZ3IH+IC6Tgv0st5Mk67QlR8c6
         QuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754244840; x=1754849640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQhRV9nPzASovnJ/VXev9I8ovYrEr4PP8txv0ySIz9I=;
        b=sPpIbm3e08HcXP89n5P/x8ejJjOwluo1Gk51FLco6sHt0rQmhyhRhDClr65jkSzper
         SOgQqkgDyDlxkzamvSAkmsDNCx8uRosb9dcd7va33v9P+Zvx5BL8rKW8otKI5iXFUSez
         HoF+eoOgmJNT4FLYox2a6VClwjCzerTfutB7ojN9BMNvbAFLlE+tPyhzLi3Si+ki3PwJ
         PgJqJ7/UFV8umgHS0T6onOYXjQhuud1vXLMfrYVZJPEayiqjnm0otNgq3kbmUtgafx7j
         58K6fiF2m9ZJCMxnjwQQu4IyIEZATlOnQKGUw25hrHUg4dqxG0uppCGVW4y2Tdayongv
         adOg==
X-Forwarded-Encrypted: i=1; AJvYcCWdMYPfU6fzktoD4czUqP8cAB/SwRCXXmYfZu9aAKFmPAdmNQ/ypDG22CF6+1Jcvr2E9jTeOio5xaEiYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ARxm3K9b0VrUUega4PhTkvsTC5jcAUkGJ1JNfl9FQJq7gTd2
	PRcXJ2v+iguoX5dj1/DDt8xaWUYMCqb9MnoHG9GCGsGHFvFtIEUnaqZUTkxZkw==
X-Gm-Gg: ASbGnctWRIS12GvXhDUSSVP1rEzPcPYzjlRyytgTcDAcYkIagoUbqFV4wWxou7N9i1e
	Ye/GEShZ5pFTH+cClH91NpGl97gXwzR7838gCWoTXx0KdJH930S6MlvLuDwFot8+Mom1qwq9kvw
	B3Y8ujybkwjUFxz/fWqa+ACh0bpAeMiphmNODkvS1MdJ6xmzv+GuXtsx08nZKRxnwqAaKZcqWaf
	Hq6DAYj2+JkoDSPDK1dBx8Iyz1kumlC/+lfGHXR5Qg6zK6SD6aAW05mHcyZW9g48/zScRipIrJ+
	u0hegJkTof7CGyFR+cZsh5RJmWPim5GqE0b32Vxbd7+NzFkBE0fmxiWnLKnb5VuYYkW+CkPgS1m
	gytW4FxambatlBac71Ufr048Fpd3DKGgKNllVB9cIhxeIvi6UYLHucn71S90OQKM1C0i0TBtQDS
	o=
X-Google-Smtp-Source: AGHT+IGhw8AARXsZMCfx5HIDY/SuVPlxq6WQeok9H22XgnHtXybSu2JJKkCZxqNtYhTy9RIJlSPNYw==
X-Received: by 2002:a17:907:2da5:b0:ae3:5d47:634 with SMTP id a640c23a62f3a-af9401d566dmr234093766b.9.1754244839475;
        Sun, 03 Aug 2025 11:13:59 -0700 (PDT)
Received: from laptok.lan (87-205-5-123.static.ip.netia.com.pl. [87.205.5.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a750253sm614570366b.86.2025.08.03.11.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 11:13:59 -0700 (PDT)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org
Subject: [PATCH 03/17] HID: pidff: Remove unneeded debug
Date: Sun,  3 Aug 2025 20:13:40 +0200
Message-ID: <20250803181354.60034-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250803181354.60034-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Oleg Makarenko <oleg@makarenk.ooo>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index 3cf844f7ad4a..75fc6dbe435c 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -339,10 +339,6 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
 	pidff_set_time(&pidff->set_envelope[PID_FADE_TIME],
 			envelope->fade_length);
 
-	hid_dbg(pidff->hid, "attack %u => %d\n",
-		envelope->attack_level,
-		pidff->set_envelope[PID_ATTACK_LEVEL].value[0]);
-
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_ENVELOPE],
 			HID_REQ_SET_REPORT);
 }
-- 
2.50.1


