Return-Path: <linux-input+bounces-9856-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA7A2D7C3
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 18:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2FC1888A14
	for <lists+linux-input@lfdr.de>; Sat,  8 Feb 2025 17:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C001F3B89;
	Sat,  8 Feb 2025 17:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWYB7Otn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B11F30CC;
	Sat,  8 Feb 2025 17:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739036197; cv=none; b=hzGdxET6p/bhrGoQpCLJkWDreb4IAi04BvuELHYCsJm6d8vrdUK+N1I248iEyRnRY4x8n577CYRcUw/YjKierkW9wmPb8l2YT7qB7GNxY2cwwjVJR9zszuuXPsaCFXINFmvgMRhQLwmkm6T06JQghBHqEJG1EBSFnFbZoORx7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739036197; c=relaxed/simple;
	bh=UWXrf7WRGjQt+teMGQjTFxcuMT0+nwb9fGdcN/5Iv4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vEY1eWIHHheTb+Uf2SfAKlJX22fwDw4XubHkBqM+Ih1jofxIbpXB3xIoj7B57V5stAzy91MnJPdLyFrRlRNqsxGkJpYZjNmHd7QRSmJHbDDq1go+esdyh1wdHXbTaMp1UQTIbpiLEmektXIZzensordu6XVhS39ZPPuuGkxYYDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWYB7Otn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-544107119b5so387464e87.0;
        Sat, 08 Feb 2025 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739036193; x=1739640993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qTyscYdIMBi+D+hFlA5BfNGHhqpENIsWeUFDb9bmok=;
        b=EWYB7OtnaghmYUQ/Qklyo81kU+SQsYjU7MiArTls6xiEIP6lH3YnKQ/sdOjy1Qbcl1
         CWzAIV6W1SRgF8LGkNBVTBedWZwNmZthQbuSbeym+2juMgHtZ5kmG6J9to5Y5dJKC+0e
         RSn/3l3e9NWp6vPZt1+JbRjmBYQWye36J6njNO70OqZGukKPtSt/i0J3GkZm1ZCTAc8o
         EhKhOmPIboyLyEmM92jtJduhirl2ajEW/04qHWCwycZQ3GRFT+wQym6KjVh/ml8fkUGS
         2RzzCTr1uoKKrB2jfeUVrt2O5pGqKqIasSj40g6nqul4cvTFXg2NXwmzOR5AhZT8U7r5
         eeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739036193; x=1739640993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qTyscYdIMBi+D+hFlA5BfNGHhqpENIsWeUFDb9bmok=;
        b=BvqIlhRfe3HxC1mtkvjWqmnpbL2pje7eAceKJUBpnu1YDXHKqf1Wfon5KHenFvFMJL
         J2yhrw2NPvHVtC5G4INhJmIcXjVj2VYA0nJ8RW6/2mi2UKoh8vuH7PhqT/yJj1KsAMKj
         f8Y3xgfwPCQWGQf6lJXPNsbUK4TPrglv/GzJSipfdRVQo7uUdpSU1qInYdgjSfAWfwXP
         dbDui5uBB6+lyjzRdj3a+xHYAUvArNLTKu2DEoUVl8ZK+9XComk6eA2eXHlMxqpQX0XQ
         SnoXQnzgYSiELAZ42/CYxlUddrk2NO+0/pdE0W5Sb5yF/Ai2pLCeuG/uDKdalf+saP6f
         CZCA==
X-Forwarded-Encrypted: i=1; AJvYcCUgZ0ghAFKfSNfRtCjVuhgVHrnT0aVIlfagC8NM2jRW7GfAc8XU7FXz5liw71RHDvodrVNhoyZOwX/m@vger.kernel.org, AJvYcCWOQAVWizIT7wKsUDgkkIh8ndIXGl6lSfSRFMj+37bC1pGvah1K2RFZtL2xLgFXSeJD1gK8uM73SmdTgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJP5UwjLpBfh2IkLFvS4Rtzx4+XxPNRyn8zW8vwYg5XHAXCyl
	4nhtfv7CRmgwXAuCWWPwebv7sVU2zNoMo+Uo16zgw3hDnaNR1VYGDDht3g==
X-Gm-Gg: ASbGncs0SvQ7hUx4a0kvQH2ROitBi/6sXY24tIkbmBI268jadqi/1Oh5LXiZfVD+CmV
	PuDu4SWzTtJNCK8CrBzn1Bt5c8MVHx+ekIrsM5FLoAteBWiM3BybEKIDEG83HH8n7L0bVGK+PsX
	/a0FBZNSjEyhYsps2AKxjBqEi2mV+E8DAwg+uoGzWt+O+Ejk1mdLrQ1CEZGxlTHMq7YXVTioIro
	lPJyJcrknXsLVRYocSUsGgAhLTvOdsiHA+ogZxSlLJFa9uvl4DW4J/QLFL0i+Djrw1vQvZOAa6A
	Ai90l7cB4sGqn0So7CuFdlKzY+bT4orhOMX2cSlz/VKlJlQD87C3yL5aW/Xmuw==
X-Google-Smtp-Source: AGHT+IEzXg4/h1qW+N0hwaxDHvUXv1XDwdtP/qWm5ObOC7byJJ+Ur00PzE3XFWMLohbHM3WzHMfT2A==
X-Received: by 2002:a05:6512:3ab:b0:545:760:44ca with SMTP id 2adb3069b0e04-54507604cc2mr116786e87.10.1739036192829;
        Sat, 08 Feb 2025 09:36:32 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ed99sm774808e87.3.2025.02.08.09.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 09:36:31 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/3] MAINTAINERS: Update hid-universal-pidff entry
Date: Sat,  8 Feb 2025 18:36:26 +0100
Message-ID: <20250208173628.5734-2-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250208173628.5734-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add Makarenko Oleg as co-maintainer

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7c37bb8f083..174d25d87371 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10258,9 +10258,10 @@ F:	include/linux/hid-sensor-*
 
 HID UNIVERSAL PIDFF DRIVER
 M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+M:	Makarenko Oleg <oleg.makarenk.ooo>
 L:	linux-input@vger.kernel.org
 S:	Maintained
-B:	https://github.com/Lawstorant/hid-universal-pidff/issues
+B:	https://github.com/JacKeTUs/universal-pidff/issues
 F:	drivers/hid/hid-universal-pidff.c
 
 HID VRC-2 CAR CONTROLLER DRIVER
-- 
2.48.1


