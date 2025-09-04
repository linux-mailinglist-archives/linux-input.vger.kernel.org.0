Return-Path: <linux-input+bounces-14481-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B204B43C23
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 14:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFEE91C24EEB
	for <lists+linux-input@lfdr.de>; Thu,  4 Sep 2025 12:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F082FE059;
	Thu,  4 Sep 2025 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmHm2XSR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9A2FD1BA;
	Thu,  4 Sep 2025 12:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756990399; cv=none; b=dFzbnzWZn7Egp+JYDpli4aKxpX4JUaARflVIHbqPXvbtPDWb9q9tHWgPSnXNuY2sX8xMGDfw25D7e7QSKabDbG9JikMHcIBMkxmSGJjvyV2BAAG3XBFo6RO/07J7kc3CEGyRfvBbo49bUvCGnyl0QSoq6yGojbBds1hshRO3DkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756990399; c=relaxed/simple;
	bh=JWS3KyT+zY5EZN61GqdzNXPZeOtvm8EphsHSmQl0luM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PvAh+ctOfwJKjhB0L9S7RLwlqvUTlxAhnHFotd57S0/7Rcl899LnIQNWfzhuZUnfnYgrY8F/1FYcl6Pn2rkdJNQ8JYfBoJIc/+R8AwMYQyU22q4++j5AXlIoynFbsgVKEIouM/ICmPhOgPwc/+imhUfHrpHWPsb8gfeGWisprQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmHm2XSR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-327ae052173so598149a91.0;
        Thu, 04 Sep 2025 05:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756990398; x=1757595198; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZOhetTls4k/IZK9zWCC3HeNYLZFx65nLqKNI+GJ+ouM=;
        b=hmHm2XSRlhV6NcxKh4AivxZSC4cg00oO09qUQBzNDdwD4fsq5d4wUA74rPHTsg+dBW
         Q3u27Pdls0WJfevGxGufE4DS7Tg+18A0BKxS5o8sw976Rf0opSXasEbofy0oB1j8AcKj
         RbJ1dPatlI942JYAjB3hs0oCK1R8g1Qc640wq48JDG+o1nB30YPqmeueMeQrUIjQGlmo
         vjd9yT4JDWh4XzXWac+FPtzz8s+O48yrFOkgsdUAMcm9morGMP1O2seCXLyg6SwDGXCS
         +V8ba6iUyWykOnam+AdaJhhT7vuYsja0gTlnMmhlWf+HHFZln7ojY/AaEvKTo5XM6fdw
         wYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756990398; x=1757595198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOhetTls4k/IZK9zWCC3HeNYLZFx65nLqKNI+GJ+ouM=;
        b=wLIylStexOvyoWrBCIKbxe7IUfpmt4RV+DK78AQJdYZpzGJxPYarRuoy9eIUkEpCML
         EDJ2MNYi2/J5ZsNN1TDQy/kMrxROZ6bnhTb3lCcgIzpvYJgLU+u2ufHxw7wup0sCkJGb
         zgnb7r2U1tSh4tPD+HyrNX+fTzL2sBr7I/BoAlsvJ9rimgWedWAFTU1aS6U8oJd4w0Wt
         qiLD3kTmlR4a3+cGzzPhQymx+jsMKMmV1AJ8UZgRX0NoSJo2UmoYkQEJbhJ7I2aUBL7M
         Xm5O+grl4PkGT5E0UZYcZw8jCWhu2exnKCkr7CVQNLwbsnjegeDK+O7gwnsY7trU/zFV
         MkSw==
X-Forwarded-Encrypted: i=1; AJvYcCV34SC+SpUag1dPXHHE5t3Bjw2BYpoi4YMsLb4rYVW9IxpkENPjk+ImOzX1FV1v8l+LjMiUsKdmpJXGfyMA@vger.kernel.org, AJvYcCWDMw4KHIDJeYCrCKrpI5u+Ta1R9wdqb2LBkXYxamMsBvSvBOY8LUPYP4qg0pRCsw/mMzMrCM3SsTxo/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmQ/5ySyZCoPKRISlk/ejOQdSXuXeYB7UcW61b2pJCg9IcvrmY
	GFyI/pixLLbsZm9cuRP2/KdRnuN+wRdUWmmHeeKQeKsVvaZAtPTXCRHQtOGjcBXQ
X-Gm-Gg: ASbGncs4WB9mzQq06S+7HaL4HidFSVazuQCiwrKCw7yh9zU1SdOgwlwXXVb1pSH2PV5
	SGYKKhDgmkvZhn1Pz3WVp42Nf/6E3+KxM9i1fNu0wHTCNsr1D0oEoaquqOEjzXyVJCHfG7ylZMd
	mdZDOg1KtpwKUpJ9HM05EuuBhf+ZDWS5oTdRZzPyGz8Mqs2dmFM1JWO81Yi+TWBC9nCLoeLHlwB
	L/Em47siD7ryWOxmSYHHci8fX/5596K+E2OdUpASSOEshSJgWXm/Rj9MrE7MVmKyelEtndYYUB0
	BaLFwyK1PkivBsxY1I4o3Vc6fbjqbn0mNQpXswzNA85cQzQt6Bk56iAaDLyj/dPMMwigbTWjMe0
	uj/ZdoCIQJ5H6LcIBvXNUS8Q=
X-Google-Smtp-Source: AGHT+IG1E4y2xvritDAKNzyzrFmfK8e3rOVhr+y+M07Yy8gaVkXuyEb65ocmz12it6wfPXwnwXW3mQ==
X-Received: by 2002:a17:90b:4d06:b0:321:752b:6c95 with SMTP id 98e67ed59e1d1-3281543381emr2683623a91.10.1756990397413;
        Thu, 04 Sep 2025 05:53:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:463b:8ef9:3432:4c09])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm17642544b3a.79.2025.09.04.05.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:53:17 -0700 (PDT)
Date: Thu, 4 Sep 2025 05:53:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Nick Dyer <nick@shmanahar.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] input: touchscreen: atmel_mxt_ts: add support for
 generic touchscreen configurations
Message-ID: <2e6fm6aacsmgid3v266uqiaagjje6k264czk25skj7t3js2tpr@lxuxca42i3wx>
References: <20250903162327.109538-1-clamor95@gmail.com>
 <20250903162327.109538-2-clamor95@gmail.com>
 <acakhrd7m7uigyqepxnaidrzpmftvxjaeybqlns6boujmzdzwq@lter6ek2b7er>
 <CAPVz0n015aKKjArWk5u+0rHU_tDZyQ1zQ92m3BbA2A=JgjAegg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n015aKKjArWk5u+0rHU_tDZyQ1zQ92m3BbA2A=JgjAegg@mail.gmail.com>

On Thu, Sep 04, 2025 at 03:50:53PM +0300, Svyatoslav Ryhel wrote:
> чт, 4 вер. 2025 р. о 15:22 Dmitry Torokhov <dmitry.torokhov@gmail.com> пише:
> >
> > Hi Svyatoslav,
> >
> > On Wed, Sep 03, 2025 at 07:23:27PM +0300, Svyatoslav Ryhel wrote:
> > > This provides support for generic touchscreen configuration options like
> > > swapped-x-y, min-x, min-y, size-x, size-y, etc.
> >
> > This requires corresponding change to the binding document.
> >
> 
> I assumed it was already included, but it seems not to be. I will add
> appropriate change to schema in v2. Do I need to add any adjustments
> to the code?

No, the code looks good.

Thanks.

-- 
Dmitry

