Return-Path: <linux-input+bounces-5222-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF694238A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 01:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C8A1C20F39
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 23:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D205418E045;
	Tue, 30 Jul 2024 23:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtHB0BCR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2AB18C90C;
	Tue, 30 Jul 2024 23:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722383136; cv=none; b=JlPj98JlZ0ITgcBCcjFfESocJH2KlS479e7FSAUBICvfKhlt4s0encBuXb8Za3gGToiULM5Ow81udGgJyv8JgwG2w35sh+6Ka2B/Moyh02e2glG9kf//SPN5KtPucKL8D3jlzPHpjhCRWlshhCPzAyiXGN5kOoYBHXYNy0g2EHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722383136; c=relaxed/simple;
	bh=B+so1HY6tJLsFQOdo7twd1h20ZOn0arRt+sRAkZunro=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D5YthP61nxVNroDom66sg5oYPz4nFSIr0WBcOEQ++b48bVcmsEWiZu/xAxYqk5jQyZ00dRZC0AftPnT+y9TI8ZV0vgzEfhisLlYPldoO3N+pL8zLAxahnh5KtV6koVuX8HlC92xwWbm8hd3/oY+ZIXJ2RjvjgOXk5CTeabQxV/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NtHB0BCR; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70943b07c2cso2447384a34.1;
        Tue, 30 Jul 2024 16:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722383134; x=1722987934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a4+H8fzB2Ohutauq+QxzhFxCMnikVLp2bFfGFeuADRs=;
        b=NtHB0BCRAOTJjnoSkJ4X8vwKuvtaDqBs6HDNcZo7Tpo2kdMkFrV7iHkyD7kwPKZdZZ
         Y+PywHbWT3coGm20aalvbpdUiGN/QYZ8o0kNeUFpxGavK0hZbKNxWIsuYQ1o3T9OMxPy
         70LRfXDhzM9X/NptRlpydLBNYJ14QkNw1+ZUTaM28QCHq7phSyL8XYZlYgvvZgoOUgfe
         Z4y+gFgU+MkX/mR3JFNQOwG8tuvu4qSOOdWE24F08gV1f5TlK2ubsBNM8D1d0h2Gitj/
         XcynVjoU+dpNW9NHNjVobo3ZEo3GoV3rKEUiGH2RUBewHwuzAc4dCHBjqePqD4rmrOox
         A+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722383134; x=1722987934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a4+H8fzB2Ohutauq+QxzhFxCMnikVLp2bFfGFeuADRs=;
        b=lgCS1dMlbUJzkFzOMHkcq0kwACMLZ/wzWDdaU37dB06R3xBvokm7JfMZEvh9FQ9ezL
         uMKp4o+bi6o8UsL/tnG08tycxWv7iVQo8/j1tuP27LgzfpiDyvwi3UErfM94hLSdI1hZ
         AI2WrBTjAOHdiQtNzPDdCvekfWU/qIeh2VnyZj4meZ8nVAsnQHKngdujQolsYIXdFpeL
         2NKUo57Uczqff/HJK0kTXcAjuH0Sg+vfayWH3hWfVqhyXbsHQ+xgZYoAkbgIoeSQpaOV
         VsHZ4b8HjFBEjuIC8yXvdzz1tbAV0spRQ+oemXaQH3H9pMwVdXPCRtT4rMw2hv0+zboT
         uZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNP4GqnYChkPK1pB/D+m4KexiSJkvZkp+xpV/xW2cwuH//m3me/8vwuBfyTQzT0StX+QN70oPfbPmNIbkWEW/q5SHfL8Wp3JAbAPir
X-Gm-Message-State: AOJu0Yz3bpZ6yD1qZdUTkBVeQHV3ZH4uXgSRpEARUjRBT0aAkyaLpsil
	TNdrr/1iIv0o26d4E6vKb3lom0SB9pZzidgFdg8Ae9Xs1l9hJMJY
X-Google-Smtp-Source: AGHT+IGQB++PpYdXRIB/kAjcG3Vp7C80TqDMpq25Xpz8a8CfzVmNyxd1C8WEJLc4zHEdY34Bw0Fwxw==
X-Received: by 2002:a05:6830:699b:b0:709:4060:1093 with SMTP id 46e09a7af769-70940c6de89mr14554097a34.22.1722383134401;
        Tue, 30 Jul 2024 16:45:34 -0700 (PDT)
Received: from localhost.localdomain ([190.196.134.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f817ae28sm8113593a12.25.2024.07.30.16.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 16:45:33 -0700 (PDT)
From: Camila Alvarez <cam.alvarez.i@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Camila Alvarez <cam.alvarez.i@gmail.com>,
	syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
Subject: [PATCH] usb: fix slab-out-of-bounds Read in cougar_report_fixup
Date: Tue, 30 Jul 2024 19:42:43 -0400
Message-Id: <20240730234242.256598-1-cam.alvarez.i@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

report_fixup for the Cougar 500k Gaming Keyboard was not verifying
that the report descriptor size was correct before accessing it

Reported-by: syzbot+24c0361074799d02c452@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=24c0361074799d02c452
Signed-off-by: Camila Alvarez <cam.alvarez.i@gmail.com>
---
 drivers/hid/hid-cougar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-cougar.c b/drivers/hid/hid-cougar.c
index cb8bd8aae15b..0fa785f52707 100644
--- a/drivers/hid/hid-cougar.c
+++ b/drivers/hid/hid-cougar.c
@@ -106,7 +106,7 @@ static void cougar_fix_g6_mapping(void)
 static __u8 *cougar_report_fixup(struct hid_device *hdev, __u8 *rdesc,
 				 unsigned int *rsize)
 {
-	if (rdesc[2] == 0x09 && rdesc[3] == 0x02 &&
+	if (*rsize >= 117 && rdesc[2] == 0x09 && rdesc[3] == 0x02 &&
 	    (rdesc[115] | rdesc[116] << 8) >= HID_MAX_USAGES) {
 		hid_info(hdev,
 			"usage count exceeds max: fixing up report descriptor\n");
-- 
2.34.1


