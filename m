Return-Path: <linux-input+bounces-9525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C59A1C372
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 13:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E69AA1889AE3
	for <lists+linux-input@lfdr.de>; Sat, 25 Jan 2025 12:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDA0209F3F;
	Sat, 25 Jan 2025 12:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKcs0X2g"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A71208964;
	Sat, 25 Jan 2025 12:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809703; cv=none; b=dFFFs6sjL0gn9Lcj9XKebwD0aX5qhBzM/p9Rqg8Yv3e8+5GT/xN8P9TjFHgtQD3WT36SgLAbv4ShfCpplXxNiGZugan3Q1UDNq4MXTUBhxONhbry2WhhbvlA7axsz3UK6Z99WbzmYomTkL8Wo0/tuPv0cWOo8RpoA4WAzFA1uy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809703; c=relaxed/simple;
	bh=VB+0BvEUUb1uF7HcMQ/oDMgtxEjHxIrZItGg7tGNsH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1vNiW/PxfQuMgv5WAMYcPzfwSTeGFNk+VLeHmk4S6IFTYoeun2XMkZi3QroGR8qzB0TAt+0rn3kojWs6WI2+4v5nBHt1vpBqBlmGWdYg/WHLy7VkWBf/NRKS+wtbYEoEPez9WFH1cesGo1724Ny6C2YK5Lb2lhDBYgiRVEsBFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKcs0X2g; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5402ec870b4so448694e87.2;
        Sat, 25 Jan 2025 04:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737809700; x=1738414500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/jagm98BVwOGAW/sM/PsUGZoeqJdswnIQWjbLkDya8=;
        b=dKcs0X2gZqbG7o54CeT0JaETYsJncArRAXPOiE+LhBbIVTABiZULy2Fx9lGsjxPpB6
         seX6x4MzBCidxsVpnLH9WFKZ4daPoW/+zqLtAHhQCB/gpQmXDKbX25j3EiavVD6+p3qu
         rXSYuc5q0kM+uBJGHOh8oX2Ipm86SJ4wsPObuHtvbgbA2KRWSrGl4sCPpa9G4e/3qnIX
         SkxXaR38qBBGsHUt0eyCcN7C0SMgFI9d+QMBCUCYtlBtwurz2cnEgt8DQeA83aHRxtQ5
         EoJNilfKO42PwLAiSyY+hddodTjJ4WiUMJuOUT+niUwUq4qF8I8U1knP+dhPTixataiZ
         EmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737809700; x=1738414500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/jagm98BVwOGAW/sM/PsUGZoeqJdswnIQWjbLkDya8=;
        b=tWQQgKKHmcZ+tQiMy/Owp/nOrrLEioQ7uGPVAxqGFaSF6my9WfOGHR5hdCWQEjpLWC
         9mxwxtuChAJXFv4IDCYAWPBfHcn8aSM2K9pceWX11vWehEbN4iMJ4rAueYcpSgDo/ruO
         UMUxCoNqv7H0mnydSmgLGt//lm48P3Mh9OPB5QSacLzDmGyvcoaNPGr3eIIj6+DV/TKi
         n7bnxwHcuToOHDF/8V9lGySC5TMuWH8r5F5kfzSq0z3zKgCjxD48X8RUNWlrg8J5FbYS
         g8KxGmA63rIZNqMwTCCuW2aRH/FO+Yw8hHAzBCffxgA5D0eHZPbXi4nOEaz6vCoP0YAV
         zYPw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Z9PAydvabR8y+ixCmObzjkm9NjOmFXg/B/aosJ4wsoX9R5l6XGziSHAqJ0aMhqBZvbkp+LCAYtxaDA==@vger.kernel.org, AJvYcCXBZCqvdnWGtFRznUoKwjK8bgKJ9pRAfXwoR5sk6LaDII41eCa4egqnI/336HShfUNjuesg544rWzq7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/b2YMlY0+5KvQKkfkVeNA/B0Aq/N/imytNMXfHp/Yl9Po5xd/
	Vpv3kBvFk+iJimE69KXEyG64PrQtTigODIiuyUiM934NJZ5xq0so
X-Gm-Gg: ASbGncujSsdmrAqJSTfClAtSI22kI9XBwaQu7j3dYUE5YLi72M4IEY3M1Di5yrDLF1z
	l9I429NnMWnDGoUOyqFK0qJluMIhfKj7ak7rTAOgSWOJDQHE24OvgSye+5lvpmlBrGsOJlHy8IY
	sHNzMszlYdQTuGgkGJrCnKQTykuppJwXnSMCLBqEocCFHdZ+NYR+sPj39XJWZcL4vXvVyy84F0p
	Yg2EFwuyVQy+91dry7LzGMKWzXWBalgRqODxwYXyU+XgyZos3FxjQE8esRs+/o3qhqE6JUyiWP/
	RiS+cppoW5k3GNrKBmcejs1bpNBZHi2Sf3xWJBnLCZ9sHo/LzPM=
X-Google-Smtp-Source: AGHT+IG2kD6W3TpbJ2DGEVfIJLQaPTWf9UT1KZaNLXhwniUYuYhkCLVd2KMLxpg8fmk4WJwYWHcaoA==
X-Received: by 2002:a05:651c:b0f:b0:300:3a15:8f18 with SMTP id 38308e7fff4ca-307586034dcmr19544621fa.0.1737809700244;
        Sat, 25 Jan 2025 04:55:00 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc1981esm6960701fa.75.2025.01.25.04.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 04:54:59 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: anssi.hannula@gmail.com,
	oleg@makarenk.ooo,
	linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v6 11/17] MAINTAINERS: Add entry for hid-universal-pidff driver
Date: Sat, 25 Jan 2025 13:54:33 +0100
Message-ID: <20250125125439.1428460-12-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
References: <20250125125439.1428460-1-tomasz.pakula.oficjalny@gmail.com>
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
index 0fa7c5728f1e..c416ba133ea5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10209,6 +10209,13 @@ F:	drivers/hid/hid-sensor-*
 F:	drivers/iio/*/hid-*
 F:	include/linux/hid-sensor-*
 
+HID UNIVERSAL PIDFF DRIVER
+M:	Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+B:      https://github.com/Lawstorant/linux/issues
+F:	drivers/hid/hid-universal-pidff.c
+
 HID VRC-2 CAR CONTROLLER DRIVER
 M:	Marcus Folkesson <marcus.folkesson@gmail.com>
 L:	linux-input@vger.kernel.org
-- 
2.48.1


