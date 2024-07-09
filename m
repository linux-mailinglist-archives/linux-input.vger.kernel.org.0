Return-Path: <linux-input+bounces-4937-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5392C383
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 20:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B0D11C22768
	for <lists+linux-input@lfdr.de>; Tue,  9 Jul 2024 18:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E51317B045;
	Tue,  9 Jul 2024 18:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLO852cq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB4C80BEC;
	Tue,  9 Jul 2024 18:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720551149; cv=none; b=u5ZCvTNiYqNdjM5jycEOEsNxdVNkQwMhBu83BWg5eZ/i8cVk0rNF8hkOjl6ebP5Hq/MZJxfJShkhIeNzX23mtIHVEE6dexvW3RKMMvlltGUe4kYxNHGbGybfofgK/QuA595iwtTXzTdc7rIIk0wESPcKEZ81Vn/I2oxxrrY8djg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720551149; c=relaxed/simple;
	bh=8ieHrXVeYYJBD+wAMu25xGbS8xjwW/N04pPu6ObI7mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s30ZeHkiZvmxjbZqP/oLhoUsj7Tp2miGf8eZ7iyRT9gY4AfYtyTpMGXpm9IiwQit3gdaOua0uf73c66ypHwVe4SRUJAmQDUFDLAsBg3bTs0vjkCYwSEv1Gkwe2YhC79QkW17kBQhiP586x/m9Z3CuQyOUwh8V1Jhi4Uc71Xekic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLO852cq; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-656d8b346d2so3093884a12.2;
        Tue, 09 Jul 2024 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720551148; x=1721155948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9XkRhpaVRdgchhtWjJLj6BGbUn4he7TT4pklzFSgHlQ=;
        b=TLO852cqbaNRqHI//u2aICPGV6EGOQWA+ZeDnqVRWKIOmJ39wk1ImvU/PZYTHuSd5K
         IYOPWdnIxiSSAADe2cGCS/e9qs0mjinXlrSgy/yG8TEj3dL7BVWjLDvjJp0nx2qEURoK
         EjPDSzhnmzbFkP4hLcKbAy6DACB6f9EFXJxmmWn45QM6fRapMIsxr5KSQeXZ1nC8d+cT
         rKciCD+SAaYkY9lXPkG5MKy3oS7Up802xDSTTL9LUNomDE47PcHyaggzJc5RmRuCjF0n
         dgSiGLpuMWZuXv4TUTqNwOnMTTZ3baZ/6UwAxei+RWQtRFrgTtjePEGqN8g7j5WyXRRW
         ROEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720551148; x=1721155948;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XkRhpaVRdgchhtWjJLj6BGbUn4he7TT4pklzFSgHlQ=;
        b=a6F6+1IjcA8zeOFswBJih6OKcZwGo4zuEbZaewzM7UipYVgrgJavrL4xqw83kmkMNw
         DtvCUb0lGuvFzr+8CnIUOHZarTq8dE2++qYisd45a045InSFohpQv5FIlj3nfWlqbeOj
         HCW/Y/Pl9DFPNs78At7xAbUd81vnzXtLXpO4c93E89vSFwRDhG3LDDj8MpbBXpNu3EfZ
         Ew0gUxuG/0ZlBfZfR6eewOTpYM8dAsKFcc1524+66VDRpr7UbMtJBRPATiN3bLb0o5xF
         3shlK3Angzf+YTjmyaRukjcGqLFB4M6P0p91lx/sZ01XcxMkiF430irZyc1yXVavOSh9
         C0cg==
X-Forwarded-Encrypted: i=1; AJvYcCXLyg3lS62whnhlSZt/sKcRRkRy0hVXG7GAij6KqfSCyKMsSh9hgbPOxhX5hkRdQYJ7DyE4RL4bG01Pcb9ezIcc7PRTvCqzoizMq4Z3
X-Gm-Message-State: AOJu0YzICL5aHG8AwMMjTmhEBdTf4yGzQ9zHm1j3m0v84hWFT/6dBJ78
	4iAdjRVPffMtwJr8GP9t9sPZdT4H/z40N4yJn0Wfmb8DWpsJwNZt
X-Google-Smtp-Source: AGHT+IEHNE+fsRFsGTVFWTYrX6xSNJ38pTMIyukS0nKbIttJkZLibhW6cPZ72l6OsP0ZhoRsRPDy+A==
X-Received: by 2002:a05:6a20:244e:b0:1c0:bf35:ef42 with SMTP id adf61e73a8af0-1c2981fbfdemr3890267637.3.1720551147703;
        Tue, 09 Jul 2024 11:52:27 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:922a:af36:b3d9:2eac])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b439b54fesm2237478b3a.173.2024.07.09.11.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 11:52:27 -0700 (PDT)
Date: Tue, 9 Jul 2024 11:52:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Felipe Balbi <me@felipebalbi.com>,
	Peter De Schrijver <peter.de-schrijver@nokia.com>
Subject: Re: [PROBLEM linux-next] drivers/input/misc/twl4030-pwrbutton.c:33:
 warning: expecting prototype for twl4030().
Message-ID: <Zo2G6P-hFER6EqgQ@google.com>
References: <51a4022c-e5a7-48c2-8c87-0e26a1b7b406@gmail.com>
 <ZowbMn8BNJm_oufN@google.com>
 <2594cc44-5fd7-4aeb-9f35-da3d8b8210a3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2594cc44-5fd7-4aeb-9f35-da3d8b8210a3@gmail.com>

On Mon, Jul 08, 2024 at 08:04:37PM +0200, Mirsad Todorovac wrote:
> On 7/8/24 19:00, Dmitry Torokhov wrote:
> > Hi Mirsad,
> > 
> > On Sun, Jul 07, 2024 at 01:54:12AM +0200, Mirsad Todorovac wrote:
> >> Hi,
> >>
> >> This is the result of testing randconfig with KCONFIG_SEED=0xEE7AB52F in next-20240703 vanilla tree on
> >> Ubuntu 22.04 LTS. GCC used is gcc (Ubuntu 12.3.0-1ubuntu1~22.04) 12.3.0.
> > 
> > Have you saved the .config for the failed run by any chance?
> > 
> > Thanks.
> > 
> 
> Hi Dmitry,
> 
> Please find it attached to this message.

Thanks. LOL, here's the fix:

diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
index e3ee0638ffba..ade6685e5ce9 100644
--- a/drivers/input/misc/twl4030-pwrbutton.c
+++ b/drivers/input/misc/twl4030-pwrbutton.c
@@ -1,4 +1,4 @@
-/**
+/*
  * twl4030-pwrbutton.c - TWL4030 Power Button Input Driver
  *
  * Copyright (C) 2008-2009 Nokia Corporation


Thanks.

-- 
Dmitry

