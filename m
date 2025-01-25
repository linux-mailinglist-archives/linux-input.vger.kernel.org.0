Return-Path: <linux-input+bounces-9547-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9455A1C573
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 23:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 563BF3A4B24
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 22:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DC7207A0A;
	Sat, 25 Jan 2025 22:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hM0kkHsz"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66D207A0F;
	Sat, 25 Jan 2025 22:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737843949; cv=none; b=ZJ7PCo49NrGnI81+fcIkXSlX/yL/b5dS1kleDChAtS2eO6r2H3X+vHJk6mzCrPQuGyjwjvcCXEBvw8CxzEFxt4EeO54vyW3TrGfxqPsufsOgBHv/s9LOf66IlaFU8uAL05GyRpxzvvkmUiNHk4HQDA1O9UyV+hBm10g2zXqdHLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737843949; c=relaxed/simple;
	bh=DVgZ83PVL6NnJFKcDjkzIhQs2MWgZtlclRk4R9cyUPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OK0/3ZSDJKUXvjVvpFrgnvUnGx1NMzeE/qBFLAxTE4XmPukcC0/9qVpShWwZ4ODiT21AV0yoW7diSS2P48IDMw4BlGQCkGPRZf6x426eck0IBbjhsIWZzrLB2Osq3iSh/QVS311+0uW/kpGm1uj7Li9kCf4DxSL22bvHPbHpTfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hM0kkHsz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3e5c225aaso687848a12.3;
        Sat, 25 Jan 2025 14:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737843946; x=1738448746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPl4w6umobhEqf9EmYNSdxjaWz+J0Z6puIKS9uYnr3A=;
        b=hM0kkHsz2ftjSiroSJQmvnJcRFdT1BdOKnTrvdVTnqpzIrU8mvdQkWKZCzMs1kag5b
         //eD6uzg6VbYR08olyNuHfbqSM5aeULRwlUz2JMSRrW6r5uvBXgzE0W2T3OuZJy6cBxO
         JtTYnhfgHP8ZRDeWUM9rViVO+njSi32BnagtAWWKDSNAadmsjCOMp2t4uLOTNFo2/ST8
         9GP2Su3EU0Zlua6nJljBJfDbOXWqN8mfTbOOBEeUf3xT6RNecfX9ezTkfsDxwrj/GKVO
         1iNr7wm/FI0BYYFhUSZPI2QP3uzHIi1hRpdzF3Kpe2leT1DXjIIwscqkJMRlaVpoj1i3
         ysRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737843946; x=1738448746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPl4w6umobhEqf9EmYNSdxjaWz+J0Z6puIKS9uYnr3A=;
        b=mde8F1BgVQkVzY/IAAbJqTmQ+1n55skful1kss0ERWzK3h87gWp8rr7EKb/Jw5R6O1
         U4beR6/DvkzhG1vWDlezObJY9REuqeeCElkmVD2GU3u7heasDmGxtxpY1ifnD01sg7dU
         rwg6P+jJvSkcGW0bCe2hzuvXizrpO/JcTel0DQKzirxKnaVG2dwxY6GMBCZ7MlUDUjpd
         kn3iNRwR7mnD1jsRW82/aeN9q/gxULiMKb3KPJ5+TduBd+MnAbjzWFiCuATu7Rix3QAC
         t8he1hIfjx/30H6wpdp+IgEPfr4K5oEpxsYjLTx8FRja7bwTjiRq45RIP/rMBM6HZfKD
         ZEhA==
X-Forwarded-Encrypted: i=1; AJvYcCUDc/6UyiBlTt303uw+aguFgyIy8AyqcB52Ni3SO8Ss3tO1FDXmxqwi3Gbo7JfyzssVS7Sy/qeU3FNmQQ==@vger.kernel.org, AJvYcCUxRhdGA9PXgnLlEjhJ9KizJuWlvRVKagqYlK4AwCGjICnIAmFOXJkOmOrkUbmFWuBXhy3l49p+mRHD@vger.kernel.org
X-Gm-Message-State: AOJu0YwiapH1Kq8FsZz1ofVvFGKdGIM1knc2jqx2s9Mk+xsG+3sDqBEw
	t9SEybA2RyWNuF7j6bscwDEL+oLzRMz4uR/HSj/Yl3YTty/JSs4b3M3HRSSt
X-Gm-Gg: ASbGncuCVbmQr+UbH0OJerERobBq/pfT8w4GcfOtQjt0ZQ0vKwR7xVJ8EFuNB/0sgfy
	+6JP3GNnNtfnQpNPHYpbCgXhianCUaudgBn5O3y102kzMk34+k1Z5X6OF8DAZ9So+sY7Fgf8PE/
	aJGV3RvKiK6YAtjXDI37DZ6z49vKFdbuooBYf2T5eoGVQMMPlpK0D2857H7vVVeXTAyjgdydB6K
	c0tZXnGuVFBt/WTvufNbBBjJF04CBT3KhOuCT+M7mt2VqI9vCayfpVl/e3satjHEWIAspctZalW
	YJzXK/ziaBr+IQPRt3KnhCYVN0sUaoJcqyoI3Jh/fg863ynwvFU=
X-Google-Smtp-Source: AGHT+IGn8WKOuXdOks9KkEU1eyVnluu02ZHzQqmozqDcfFL1m93bLEHCppAYGdAIKiE42JkMTutFEw==
X-Received: by 2002:a17:907:3e1d:b0:aa6:6e2e:b7b with SMTP id a640c23a62f3a-ab38b1b4679mr1242277666b.1.1737843946380;
        Sat, 25 Jan 2025 14:25:46 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab68f1ef7besm136540166b.62.2025.01.25.14.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 14:25:45 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v7 11/17] MAINTAINERS: Add entry for hid-universal-pidff driver
Date: Sat, 25 Jan 2025 23:25:24 +0100
Message-ID: <20250125222530.45944-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125222530.45944-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the MAINTAINERS entries for the driver

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0fa7c5728f1e..810046532e0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10209,6 +10209,13 @@ F:	drivers/hid/hid-sensor-*
 F:	drivers/iio/*/hid-*
 F:	include/linux/hid-sensor-*
 
+HID UNIVERSAL PIDFF DRIVER
+M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+B:	https://github.com/Lawstorant/hid-universal-pidff/issues
+F:	drivers/hid/hid-universal-pidff.c
+
 HID VRC-2 CAR CONTROLLER DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-input@vger.kernel.org
-- 
2.48.1


