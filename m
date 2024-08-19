Return-Path: <linux-input+bounces-5638-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 409529562C7
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:58:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCCD3B215FF
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EAE14B95A;
	Mon, 19 Aug 2024 04:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIAPbbXu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9E3149C57;
	Mon, 19 Aug 2024 04:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043510; cv=none; b=c+zXJxD7sr+F4QkPLva9MZiGHJra1iL5d8p2NNg4SJmMh0blNCfPZEpSm5VEL7raueqos5MpOiKd49r9slF04Q9Hr5I7e+jj/xj42Bz/seUf/rhKJ42HgfG+W3XBqwG14ngP10jLhM/SzO4zldtbaZCFv0FMiADPXEhRc8TbCak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043510; c=relaxed/simple;
	bh=qDttKstohPe0ekAAz8JTCIxL/t3M35NnwMxbeKk1VbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRH7wcGA7DYYIZDmMfXa4wH3L9hO0Af67RWJq1UmjK938RzyUCRtCMCarj1oy2jqsX6It1GkMTZDdd/YlzJZW5uRBEt39QnKRxjerC7DOqnAo+3/hEh143p7HnUAIeJw6JJsvA9mO3xbG6hL1w/W9LI6KYP9e0VCxDqTqDQJomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIAPbbXu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-202376301e6so3616435ad.0;
        Sun, 18 Aug 2024 21:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043508; x=1724648308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/Y0JUcD5C4Iagug6Oy1owYtKAXHbmgAHcwaCUa/T4M=;
        b=jIAPbbXuCdyBfvfuxNqP6Lhx9nISm//QlWTpxmpugIJxM80MI/wyIXjg1Ih/ZCXdiL
         v5m1MAvjl0c5u3wQlGKvS4drgestM3Yfr2uHKLEZPcZKm78IUCm7t+mNlzof0J+HhZKZ
         kUuVeTeWmHevyn9Nc3ATPx6VLIxPZTQzpzuoiStcMzY7bnqnh0A1VCX3UwlHpGB01IHB
         nvhGnpKutRf8yic9Um46vXkMBXUg/d19f6uZFjPMYyqSVt2KcToPiv8Mw4NHqo4IN2V3
         /9P6NyY6dMnv/hKTnDi7GoJQTiToCRhsa9RpAl7ZP9Kp2cTpklT6nJfGr/z8zzRIaV6I
         h/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043508; x=1724648308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2/Y0JUcD5C4Iagug6Oy1owYtKAXHbmgAHcwaCUa/T4M=;
        b=Kr6vlnP73PpARNxRMRMrVOqG4t8zDS7en+zEeDPIqQQ0BtLvyfudrUnEU0vopo3J2I
         AG9A/RapcHo9n1TDkZe7zVFYW1Ik7oSZhnAzpDN76rJjbAqyq8iEV1iMcbxrR6tM+Y6b
         69XS89Q/h0gWirZF1RZyoiATK5tIvkTTzO6pp2DXPcvDOLlfqKgPH/82YZAXd1cQtKur
         KUJn/IQ/97EgDMGmPZdwPo1jyBOmIb20i4G+ibt3jnjiEMJqOD+wEqtJ3lj548nXz2kl
         n1PjqX9I5B8O84qyp9Mc/6pGDsJPqkrjb8iqbzmdHqTW6YZWY5lOntkjkvwuvgbLrrdO
         NqoA==
X-Forwarded-Encrypted: i=1; AJvYcCVz4+pU9sMkG6Sh2APvYPryvOS6XJ2hPcsHMxatKEZFEoauAVzWLSWYyhW2WQGPkZN76GTCmwNg5ILcaWdDFiR5PNc7y1jiwFC59hVkYhno/6I/wEnPpMD/aqBRgTQnloXmoTxbuKfz2a3/V36qprIQ5uBO1KoQzCEp8bYWTYk2NabUYFy5ryxpz66x
X-Gm-Message-State: AOJu0YzfWr1mV6jMsjbXpb935/ZE8ev+uawpsybqutSFBBI4UtJ6q8Xh
	8yF+CUEqM19+Equvywj/xAANJKrLBjavZfWy9gHPlBmjT1oEdpF0
X-Google-Smtp-Source: AGHT+IF1FebuvREI1PKd696ezenX7q5OEaQirUD2qmXuoFQq8cvKEdSNbcfFQPZuyxucVQtm6Vli6w==
X-Received: by 2002:a17:902:d2c3:b0:202:1984:d507 with SMTP id d9443c01a7336-2021984d79emr48288425ad.30.1724043507950;
        Sun, 18 Aug 2024 21:58:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 02/14] Input: samsung-keypad - do not set input device's parent explicitly
Date: Sun, 18 Aug 2024 21:57:59 -0700
Message-ID: <20240819045813.2154642-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses devm_input_allocate_device() to allocate instances of
input device, which sets the parent appropriately. Remove extraneous
assignment.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index a5fac7de8b5d..46c0d0c900f6 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -383,7 +383,6 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 
 	input_dev->name = pdev->name;
 	input_dev->id.bustype = BUS_HOST;
-	input_dev->dev.parent = &pdev->dev;
 
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
-- 
2.46.0.184.g6999bdac58-goog


