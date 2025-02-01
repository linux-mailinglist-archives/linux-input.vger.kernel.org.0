Return-Path: <linux-input+bounces-9662-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E35A248B9
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 12:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C6171884B11
	for <lists+linux-input@lfdr.de>; Sat,  1 Feb 2025 11:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692E01B6556;
	Sat,  1 Feb 2025 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCttXFfj"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91EA1ADC99;
	Sat,  1 Feb 2025 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738409976; cv=none; b=lDjJI8FE8a2LmnhbsgN/kb+dtc2Wu2CBDq8GLNAmsEEfo2IHdU+6buwpptGl3tAWNzc5XZyjygQVnzRWbtZ1+iJ1Bju6wXG0qRUWLig0SQlFc51QEVr+E0oQUwCujlAd9HUQ/CngNzl2SK84BLwfyJyFkRA5+XovBDEH7BB9tP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738409976; c=relaxed/simple;
	bh=cabapa6JgVvaN8IijEkAXa15PpEFajlynULvWLHF/ug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MakaGjhxApF7FCh7rrgTL0QtpmvP2E5pCdQLtEWT30wCfC7CwWH8b6/34q9tJdY8faN3XK/E3/cfv494pX5L6O70bf8sotZBxQwrsAx6cPTd0xz+7TeYg9+wmji14t1F96JFD8Gn8LBtYFCk4D9LE96F4/QvrYiI1q9pHGaDKRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCttXFfj; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d3cd821c60so548696a12.3;
        Sat, 01 Feb 2025 03:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738409973; x=1739014773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or6wYFw+AUau12EbI8cBz5y0ES3OZ+1JZ7ySMJU6T0Y=;
        b=aCttXFfjs9LMmwiCOHMi38AXqJFdtlkUrBHFT/u/mbHKBXFFlhepGyNIgyq44UUXjH
         bGY1j8Hdv7Rrgk8Oqj+w4O5Q6QDbOkNy9le2JBUoI7wDzl0mR8/qSDG1mY9Ncv7mmRL3
         wbnyJ7UWw6y4JRwxbMkkPu+OJbd6NXb2E4n1ywV7LLadWlit8Ty4cXdbf0VEK7NbiNRq
         MLdzTSwD1+Tsr0ZEQT1LeJ/RA17Fsrub3xCy2jdpcIgXBcJ0Fdbg60+veOuiwgOKWqU9
         yaTiEfN+mdY0h9dyEmR6xxO9WGW+eDjLQQBDo4pHX+iZDiUYHE55GSFaL2Bz2e85BvLi
         b2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738409973; x=1739014773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Or6wYFw+AUau12EbI8cBz5y0ES3OZ+1JZ7ySMJU6T0Y=;
        b=eWxThcL/JhmqoVnWAL97KviN7qTlzwj0kZ2NGTQc62dIQC835rT0VktIHnV+Tsfg8B
         sIjr/ahToUx9HAjrgHICEmG1Hp3x0AtJOhIhY7cY/H52a+1Azct8Lo0KK7NzffMALNWb
         LZwozHMi2GIqb12Z3kUFtWDL96VmAlhMsyk8jv8m24Gv29q+F/WIWsfEb97mg1gqHATu
         MxYx0T1PlsJ47Gtxp+I07lxQsh0rTbSMXMJpEse3SelFIOzUxxc2WTuoCM64R/J3Re9+
         5R8lgVazL46R57q8LY+g+7BAOVhElobwLgfvEyZrFiXrmBplnha6tPtVZslucZL7aWMM
         DIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQavn2yqPP8mu7dYsBQuh/yKR+AtvETYnlgD9uCioXo0sc+Yiwc/sypWjiomPtLCCuJOUVgxYAme8RqQ==@vger.kernel.org, AJvYcCXWKhVxUy633jfdLNeyarTGvpTI3uh9Bu6wzyQOVqKqkbsepnjtMU/ewTy3va6XvdckdEf9+rcf2oP7@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJ7B9ejhMfKu357elpbDcAZadmFZ70n222UF5mkYPEZUr8jRy
	uYffFnXqj7TuUIFdG0bgeZOzMVb/U6IFeXRSA3peRcyMXS4mX17o
X-Gm-Gg: ASbGncu9Vpjmf6tl3QDeoPqhAyy+PMpaKsrU+Y3u24C6PvBAQNNr9dO8bwXuxDjr99I
	qpY61YyCKNDlMr87SMiKnyagSSSDSFTlPusLY0FGhFsNfWSLVF3d2cuYFMUmcqU2/ESRGACkSqr
	+lvqTo/lXNgur5uJVl0sgjqQMl21bMMVCmR8EQateF5UBnXMPgJNRZ2HnanGL4DxJjnp34pQDvm
	ZyvsPECYF1x24HyPt5DsMoCJ6FGp3GtOGpVCA2C5O3qXnF2oqj2+U9Ew2pD5kflllQppO0Go4Iw
	uOrGKla+TcLG1HGKEO9qqjo2Kg3jK/WnSVDAyYXcE84VCi4BEjZeiwr8bP6J7Q==
X-Google-Smtp-Source: AGHT+IFBezlDEcA08k+ZX/Q4uOeA9szw0scXaFOulx8FgliKrwgvQOeNwZ675kxu/AidvLfTywdlyg==
X-Received: by 2002:a05:6402:4287:b0:5d0:bf79:e925 with SMTP id 4fb4d7f45d1cf-5dc5efec149mr6290444a12.6.1738409972809;
        Sat, 01 Feb 2025 03:39:32 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fa7sm4304577a12.20.2025.02.01.03.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 03:39:32 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v9 20/22] HID: pidff: Simplify pidff_rescale_signed
Date: Sat,  1 Feb 2025 12:39:04 +0100
Message-ID: <20250201113906.769162-21-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250201113906.769162-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This function overrelies on ternary operators and makes it hard to parse
it mentally. New version makes it very easy to understand.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
Reviewed-by: Michał Kopeć <michal@nozomi.space>
Reviewed-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Paul Dino Jones <paul@spacefreak18.xyz>
Tested-by: Cristóferson Bueno <cbueno81@gmail.com>
Tested-by: Pablo Cisneros <patchkez@protonmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index a8eaa77e80be..8083eb7684e5 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -230,9 +230,9 @@ static int pidff_rescale(int i, int max, struct hid_field *field)
  */
 static int pidff_rescale_signed(int i, struct hid_field *field)
 {
-	return i == 0 ? 0 : i >
-	    0 ? i * field->logical_maximum / 0x7fff : i *
-	    field->logical_minimum / -0x8000;
+	if (i > 0) return i * field->logical_maximum / 0x7fff;
+	if (i < 0) return i * field->logical_minimum / -0x8000;
+	return 0;
 }
 
 /*
-- 
2.48.1


