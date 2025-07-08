Return-Path: <linux-input+bounces-13422-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F96AFCEC8
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 17:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9541BC2ABC
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 15:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C500A2E06FD;
	Tue,  8 Jul 2025 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Isya+k0N"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348712CD8B
	for <linux-input@vger.kernel.org>; Tue,  8 Jul 2025 15:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751987677; cv=none; b=TIg/eqGrtuKXVnk8uy70bvWkHhKf5pjEKIqWxhDx/o9gTBdJVP+vqXnVDoJjO+oREXKlnpHjX+vhYOqgiIK5o6u1YnO+U/xVrxMPmH3w7IvSAmjyaAfysF1vj/Y2eNNWRDe92Etm6CE9nUZQvyk5BnLZkX65C9ggU3T6H8qP1LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751987677; c=relaxed/simple;
	bh=Qp9HYGhoVHKGyikybLoDXqYGVnVdiI5u+EpYGDWAL2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rTHHxePX2xvH4vZcDr+V3Q3QqkpzA5FZA2c5nfXpnZXDGHDi2eREO3sB9RucA+NeaM97N0LOcPpa8/G5H8IKKHu4iZKU06sDDfI6LiAS0wHp2J3n1RiH7PJtPaDd+cfUayn5kIXetr3Q365Hzce1mJ6tKxb9+p0hmJ16044lPtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Isya+k0N; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a42c40a04aso1834261cf.1
        for <linux-input@vger.kernel.org>; Tue, 08 Jul 2025 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751987675; x=1752592475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovNnR7jB2avfVIhbkNxZ8a7ZIwNV++7lp5fbb0p1xHs=;
        b=Isya+k0N28EI4Y6NuoxQv/8UAPeR1k+IESgVdL+a5GYCYxgCzGrG5ZSIE99riYdJeQ
         unO8vNd/n+wc7E4GljF2/3UUnjoDIiqAqYLypiEb2hJt47nK8ThlOZqA0NLBX1RT0j5T
         v1ZilQv2ixWg8toGTxvdCZswcvyTZYvOby0KUFx7uyJ6sCvf2rq5/5zoQhFpVvH3Qmlr
         7QwrjQ7R2PXu9f7WFkT/HER0SWktiRpVFAT45eY18bWR7kVDnHlPO6N9ahjubLczWh7H
         Wy2hYWEZFVgiZLbkUL9b9Sy5nI7dz1Ij6Imqm+MmCLxJg8tWcQer1fk9Bo87kJ4WDu8Z
         oiGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751987675; x=1752592475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ovNnR7jB2avfVIhbkNxZ8a7ZIwNV++7lp5fbb0p1xHs=;
        b=sstfIM83TS5egjlJlWAc1uXYQ/j/IsyBsD3Bbi0tvaNpslkMS4UrtHoNucDDwEcsAN
         RtZdc8m3CCV8niz7DXah2BXX8I2CQkH2jCxoqm6F1jxW1igyq3vMFsZ2xojV5YeQ6UNF
         mzs/zi+vEIhbGA3XpAcKdMmqJVakljza1AAz9gkHOUbX4My1k4uG7uVXP72+e5sBBOB2
         6LNphZC4LZep8QEwAMWyrZZNPl/hICBJEwXAbMGzoQFZ3neuChfgUOuCvJZ12SzA/q7q
         oFm/2IQHh3VNChCxggWxuJoKdVOar47TTxiKkuPgt+lZf/JyIqumIeDbsCEA0nQQ4jjS
         2axg==
X-Forwarded-Encrypted: i=1; AJvYcCWmYmE8jumrm9O/wv3119pRT4SWGEbKXl8/sBhZt0qVulfxC0w/Tdenj8m1rJ87DeNEbjwKuQI8folhNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU44AcHzPJeD8FmNJAQ8Hm/CGhPy3dX0IhTE99DPtyTt94ODAW
	q9fTXIulNxSu7DbQSD8TcnpZQS7WopfAsRGKU/rLK6ok4uAdxZQfhKBc
X-Gm-Gg: ASbGncsOi5pccBvglMMQAvuRFMiGbVzXmUMwsHveVqAltOCT8lx6RU3F3/L6k8SaixU
	QD8FnYMN82vq+3O1eeYVB5aC/teZJpOatr8AZ1tKHTiCc0wI6l2Vi3ZjMls4XGiztfGT9Uahs8n
	ueV8DIJPTrGDLcZBoeg1OceP20ypBEGNZ3db9yRD4TMm7GnDydqQA4kbN+niuY/PY3ewkhCCCKB
	thhq704kl7Bs6MHWyKx4IVanHzkU6wEMzkKfBwM9dL1aVusWo2enPIdYC1ej+cdAn/PTO46mxvo
	CJgrS+O/23MCA/UcU1kYBYw4+Ut7TvKtxyeIrJv2bL3PoT2wIgzSu/fQ/k8TRVB3E1LGoEezww=
	=
X-Google-Smtp-Source: AGHT+IEEyhGXxe3lP6N0fAEutEU/SK4omcJhjXC8I0DKzjQDqwt672uwwDfr1TfeXiW+MKpbf5vhVA==
X-Received: by 2002:a05:622a:12:b0:4a9:bfec:b794 with SMTP id d75a77b69052e-4a9ca630423mr26930731cf.9.1751987674506;
        Tue, 08 Jul 2025 08:14:34 -0700 (PDT)
Received: from PERIM ([177.149.138.121])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-4a9949e5221sm82261191cf.2.2025.07.08.08.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:14:34 -0700 (PDT)
From: Nilton Perim Neto <niltonperimneto@gmail.com>
To: vi@endrift.com
Cc: dmitry.torokhov@gmail.com,
	gregkh@linuxfoundation.org,
	linux-input@vger.kernel.org,
	niltonperimneto@gmail.com
Subject: Re: Re: [PATCH] Changed Acer NGR200 to XTYPE_XBOX360 fixed the table because
Date: Tue,  8 Jul 2025 12:12:06 -0300
Message-ID: <20250708151204.14680-3-niltonperimneto@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
References: <92a568ca-e08f-423a-9de0-3f5b2946e721@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 Not sure how to procceed with it, I only want to fix my mistake, 
 However I'm fairly new to doing git over the mail list (I just use
 github/lab) It was previously on the wrong place and the wrong xtype, so I
 changed it Now it is on the right place on the tree and the correct 360 XTYPE
 Just want to correct those issues

Signed-off-by: Nilton Perim Neto <niltonperimneto@gmail.com>
---
 drivers/input/joystick/xpad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index bad4c3608775..a7953bf5e289 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -176,8 +176,8 @@ static const struct xpad_device {
 	{ 0x05fd, 0x1007, "Mad Catz Controller (unverified)", 0, XTYPE_XBOX },
 	{ 0x05fd, 0x107a, "InterAct 'PowerPad Pro' X-Box pad (Germany)", 0, XTYPE_XBOX },
 	{ 0x05fe, 0x3030, "Chic Controller", 0, XTYPE_XBOX },
-	{ 0x05fe, 0x3031, "Chic Controller", 0, XTYPE_XBOX },
 	{ 0x0502, 0x1305, "Acer NGR200", 0, XTYPE_XBOX360 },
+	{ 0x05fe, 0x3031, "Chic Controller", 0, XTYPE_XBOX },
 	{ 0x062a, 0x0020, "Logic3 Xbox GamePad", 0, XTYPE_XBOX },
 	{ 0x062a, 0x0033, "Competition Pro Steering Wheel", 0, XTYPE_XBOX },
 	{ 0x06a3, 0x0200, "Saitek Racing Wheel", 0, XTYPE_XBOX },
-- 
2.50.0




