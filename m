Return-Path: <linux-input+bounces-8874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85019A006D5
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 10:23:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F263A3D51
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 09:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E285D1D45E2;
	Fri,  3 Jan 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="aswxTjXG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86EB1D278B
	for <linux-input@vger.kernel.org>; Fri,  3 Jan 2025 09:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896112; cv=none; b=NpqATNTfxbVh/j/kwWF4Skvh+hYvmsF8/UpKlofTilEU5T8OK3Z7P+hLKgj3rd2zKL7zFdQZvPMvWykh3/E0cqW9FMXdMN1p3/9IhXUWlAbDoWstzhsyaLklu3GPApWJ2//JWrWYU86s1O4JkIyzyHOiunoUW/p+J2z5uig80H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896112; c=relaxed/simple;
	bh=dgmlLrpBpnhcVRatzmA3ElIe9dEfB/vT6wgPvY7RCLQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CpJ/XRQy5nh+9Kx/YwHvQJwJfvHmeA2ZsnZJUQTog3OsVOoySmTkk/VhvxERg7fir6DQpnqcpwbut9LLqx3p2wuamPZlSfD5JMGm+F3/0cmhdJ+Y4tCjOHJV3QgGGHY4xBiMjNkapa122xf5X2rjg6yVSMhaYczQstmAiC4lXEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=aswxTjXG; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso2059087a12.1
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2025 01:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1735896103; x=1736500903; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9kNqfgWGfkfVt/bxXFgxNqi23umuLOBb02EY+IZ1jc4=;
        b=aswxTjXGLxzjoLMW5SHu4fVmkMiVljtM3OkwajI5EQlnP0VHdW6LqcvIHGjrVt3s0/
         BhfS3eQjR3H06pVAQasQFRkn36pYZ9uspuxqMcZbVN3ShbPYcmVUuLSDyiFEOR+oeMPy
         zYTXJ2KHNW5ttMK0GG15UwyafN4h9hZG/n3q4gBHQSn6bi8NPQNT8FLNdEh+17yG9qVW
         /GATNzZ9O2iDHkhykVKyByUWrE0AMRez56K8uHzEhgcc08xmNxs2z4iq7J32M5uq0YGG
         xERD9oFS1cpRD0mFG214oBYEVlAwXPC8m4ZUykljDKJM+R1hw/cYHRHEqEkd6tInImDo
         mLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896103; x=1736500903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kNqfgWGfkfVt/bxXFgxNqi23umuLOBb02EY+IZ1jc4=;
        b=ZzYA4iJLx3iZOq5Jna1wXSmKaEbmcHj4VHUqzg2u37SS75hOKfq9Q8oDMsbK9EiMxI
         GwNqurFp0SItJKS9aUS/IJBIIZEGohftpMa1hyjs9QGKFPBjoUS4hFMT2xuN5luU5n5F
         KWhPQ5dN0tz7RMWZ7Q0xqaCnYbEQRtu1/sM3unV8QCxE0wQRlhyPtHjfwSzfHmOJVWLj
         H/s3VZJSyI+0CjpKSaaBuLMd9tUm+gOKOxBl/1Npap8j3q+iLsMJaYl47t/VZM1STy4Q
         KElWnddlia0gwBIxaYfeEwlNk0wd/C8iq0pGzRlfSKP/tQC5qXnXcdPQiiwc+whOAC/R
         trAw==
X-Forwarded-Encrypted: i=1; AJvYcCV4AMiRKVcLPQKi8MOvF9XcHpWxMiz3ClEoZvrnVVKd50SQ/L1zKtWsgNGVUufszeon4IRzqIztsw7WEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTBXt+lLC2wI8uBuw2/JV53pOXGbupm639q0a90/v0ZC81bNQ
	BLFjanbxK2tZLD9VchzuE7mbe48l9c53kOK1aGQ64abb/Kdi+p6Peyub1TXk9NI=
X-Gm-Gg: ASbGnct4aPNnQl1DsZdiZ+4a68R8d38B8vNYLXwsQt+23wvuOZrjgj0+SfpcY1bIoIv
	A/gvAjdm8UgsPBdahpGYwo2QT6W6kezTpZSfTd6qLMb2LZxnT1Ub/ldM+ODee63Tug42hwR9USX
	Y25w0WSCUWFeTa0O+ymDQ007A5PmTIoMUVCGgDJeFL0Dt7U4qQY+vHlnTeg9+bk/b3bU2fy6kLg
	LDi+wU3BLkX2514kcBcplY+mCdWbL554I6N8mZmG5tdpPEXzN1BsdVq6vajkM8rMs8ZxGb7uPMV
	HcqNvAI+2fdUt8CU/iWGmtHj5w==
X-Google-Smtp-Source: AGHT+IGu1+xTSi3G3Zc/mqzPzvlJdEDQOTlLhsMMlE3lvBvhvdWDIBE8fThcf6LjLSwmrDncRUMvXA==
X-Received: by 2002:a05:6402:3581:b0:5d3:bc1d:e56d with SMTP id 4fb4d7f45d1cf-5d81de086afmr41880660a12.31.1735896101632;
        Fri, 03 Jan 2025 01:21:41 -0800 (PST)
Received: from [192.168.178.188] (31-151-138-250.dynamic.upc.nl. [31.151.138.250])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80679f0e4sm19235306a12.42.2025.01.03.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 01:21:41 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Some fixes for Goodix Berlin touchscreen driver
Date: Fri, 03 Jan 2025 10:21:34 +0100
Message-Id: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB6sd2cC/x3LQQqAIBBA0avErBsYi5K6SrQwHW0gNBQiiO6et
 Hx8/gOFs3CBuXkg8yVFUqxQbQN2NzEwiquGjrqBFPUYUnJy48b5kIhebi5IXuvRTWSN0VDPM/M
 f6ris7/sBxta0DWUAAAA=
X-Change-ID: 20250103-goodix-berlin-fixes-0f776d90caa7
To: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jeff LaBundy <jeff@labundy.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Charles Wang <charles.goodix@gmail.com>, Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2

One is a simple comment fix, and the second one fixes a discrepancy
between dt-bindings and driver, aligning the driver to match
dt-bindings.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      Input: goodix-berlin - fix comment referencing wrong regulator
      Input: goodix-berlin - fix vddio regulator references

 drivers/input/touchscreen/goodix_berlin_core.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)
---
base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
change-id: 20250103-goodix-berlin-fixes-0f776d90caa7

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


