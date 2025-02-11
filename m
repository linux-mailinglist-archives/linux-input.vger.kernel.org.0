Return-Path: <linux-input+bounces-9957-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A97FDA30E66
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 15:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2920A188A1B6
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2025 14:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31F5250BE8;
	Tue, 11 Feb 2025 14:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhjVk9JQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1DA24E4BF;
	Tue, 11 Feb 2025 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284522; cv=none; b=iXDPgSOjp/jeLpAWBvKBwW4HaMfB/CWbXGK0FxO7/fqM1nkeQNdGVUDDyZ4q/ULw+E3/7epGxGwsvAS3KjAmfCVoy1mJ0xa4SXMVF7++RShAPwFKCm1SQwNZUQofq+hJrdTkCCjL5SOQV9B7cEl7gEAjd7w1vM97Irld4vMhYqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284522; c=relaxed/simple;
	bh=lmGmSqy2PmFW0zQzBa1szjl9SrAN6tvuVOB7IH0j+EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgAC2XN6iRp7v8b63DZqToYPfHSUkDFcMlki0gzHqupQ5SVlJ+/agjIWH6dtb2V5zwH0me9PNZSrxcBgSf5jp9nI5l1nM/Bzs/0Zj8WJACcATSdfQgAXNu5/qxxvZ8N+m69spJSoPgls4WU3Ag810lMEWd3zld0NzRfQP5pLVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhjVk9JQ; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-307d4eaab17so3969931fa.1;
        Tue, 11 Feb 2025 06:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739284519; x=1739889319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XcwRtnPDk8zSNNP9D2au5calZ66hB6xZSQOd9iufapI=;
        b=KhjVk9JQMkGMeXt61mHkHBnzdijEezfw4Pniw0hZbfiM4n6YsCV3XKK72azkho+a5S
         8aKyYHsrV6P3ShP/uySAzkFM1JQ593p3aR21Q3qs8NUkj6Q18RT0EsC0fKhpElbkDQw8
         3qGPwgS/uqPYaJXckOqDtMsDOaJyk58CyzzFas0YJ9fZjvGv+UHT4fPs5gOLVvePX33b
         xXRisOK/I1sAWiyYixnRppGiXbz6trVq0BapaDXn4w/t5VIhazMpacmy5azvS5h2pEPs
         xEE7leIJLUU2DlLGfGkrynIL+hkkFgSxJK//eyXosfw3kDbYPC/AsEWu/9F8h+afRd/Y
         r3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284519; x=1739889319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XcwRtnPDk8zSNNP9D2au5calZ66hB6xZSQOd9iufapI=;
        b=d5HGcpo47ISoOZGp4rC/pejqx5tdJI7AxMjjhuUlzl6B5nXuJyyjdYOP0Wrbn7ZeM1
         s3X01oE2pl0EttA4sgsYG9o4oPxsTEsx5iI4OuIRNBJgVmB6Ez/R5S65POubhs8mJd1U
         AoYXkUM2ALqjGmplU5HdWxh3hN8AKornUg58hVFEhTcRB96R0awNgjDwRd/W8RUu8Pa/
         EoqVNqsqo3Pz3jZsw74TWJq9wdRagKLSoqKzk+7jT/PWZiiC/mqwFwoVbpsRLUOHUcQD
         kPSXbZDI9GlxG3H9Gntp2irSVWy7G3Va8EkRV00nxA7LPPC+hCDfgaKIOyajN31V6KF5
         /eHw==
X-Forwarded-Encrypted: i=1; AJvYcCU0tfXdLhapix4urDDa/lI23Yc0/RpZfOKDhQCvdlZiqFIAlP5T3VeNffn5R5rAlmImSWJqzpLkw7+o@vger.kernel.org, AJvYcCXmuS7pKwQoiJTAmkK8BwQiTHutiXfpFy7rvthRsZjZU85RzIUOR6rhUYvJcLzerMTSVQGHPqtMzeerHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyymxCLa6eW4GkI3rKpS84P1vxHR+W+6O3HVtIs+FBXn5HzP5GY
	R1LoLO1O5DYLitk0sBPtSIUPA1Ef+z/tXUaBPNH1/c1uxOZvcYyU
X-Gm-Gg: ASbGnctYvtuKOzE+GBF8m377Ytz2F/eK3RLePVfoNTVV+ftgnyQtFD7LG3uB8Bur8LZ
	OBCpZpUlnXtSOtXUeWJuzbXDtun00RNSEIMUgU0NxheFyCsiVu2IZAYkTQdIMN0Z0nsMHrJPWLe
	6sV7idIYUIpYrmfWpBP/c/IiB9kjpvQXmZi6kmBQCkDKwZmDVLgHh92UFNrfeGaAm2Y6L0oo8xY
	cTXAlsNE/yv8xZ57v3i7D82/GzKUuH3j1g62bj9zMNa3zi+i8Td+o9euXbHTonT/PzE+X5JIN7O
	CuHfr8CxpM7aMyXaqpVsNxhhK0X/2ejN6r9r75/05QY9qKm6QsHEhHjj9eMYDg==
X-Google-Smtp-Source: AGHT+IGWcmtd/lkyNRQWblrSGSREKL9mXekrYldPQ/fxQv1VUl9qf+6UXVjP6HuN4rmhs5qvbSQOhg==
X-Received: by 2002:a05:651c:221f:b0:308:f6cf:362d with SMTP id 38308e7fff4ca-308fbe2fedamr3735331fa.4.1739284518952;
        Tue, 11 Feb 2025 06:35:18 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ee4173edsm6132191fa.0.2025.02.11.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:35:18 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v4 1/6] MAINTAINERS: Update hid-universal-pidff entry
Date: Tue, 11 Feb 2025 15:35:07 +0100
Message-ID: <20250211143512.720818-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250211143512.720818-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Oleg Makarenko as co-maintainer

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c37bb8f083..aa87d5d56ee7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10258,9 +10258,10 @@ F:	include/linux/hid-sensor-*
 
 HID UNIVERSAL PIDFF DRIVER
 M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+M:	Oleg Makarenko <oleg@makarenk.ooo>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-B:	https://github.com/Lawstorant/hid-universal-pidff/issues
+B:	https://github.com/JacKeTUs/universal-pidff/issues
 F:	drivers/hid/hid-universal-pidff.c
 
 HID VRC-2 CAR CONTROLLER DRIVER
-- 
2.48.1


