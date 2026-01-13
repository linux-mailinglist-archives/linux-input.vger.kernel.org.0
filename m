Return-Path: <linux-input+bounces-17051-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D281D190A1
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 14:11:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25F9D30082D1
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB17B38FF17;
	Tue, 13 Jan 2026 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnGFR9Db"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6665C36B066
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 13:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309897; cv=none; b=kTznn58emmdypYDPQYlCbTw2PJLMZbKWimxckxp1pxtVlt4jnmDit84h4KjS1xU50GrTgHYVcr/3SF9JbUQZ2lF9Be3vPSbCxndiypU2D+Jsm8Hk2u8vzQA0ZKKwyeZdnmNdZVO7tiC8WioOowQRtiZYxMYKJWkjacyZf9GWJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309897; c=relaxed/simple;
	bh=ULZajAJOiGm7ta8km6n83bEZ1hTnc6Jmf/gNFNkQqrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcGhGOABzbvBzc/r6Wd64rxVMJ8juKZZLtierc18rGOFx5PKq8rVv0KqsKFO+biWG+BDlrF4qdvByeIXONjmdPsM8+QyqA68PO4YxsHq+vjGsrxfLFniFOrgO0O5oz9MwtXkcOXOg4h3bUcM0+Sgnc7GkNX8gEMW6iKWKy090vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnGFR9Db; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-81e9d0cd082so3079540b3a.0
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768309896; x=1768914696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdRpfu1xGWcYjAWQxaMfWPygJNPVSP5eUvRVc+dd7G4=;
        b=EnGFR9DbdBbKletJ5XAu1jTwbQQQLJADjf92fXq7cHlowSSFVLGjfl226U4pQMcomy
         vw3iu1vQeMXCY9511YAWIOwqM3IbK3k4gOJ68sLpTH6Krio9Eb98I0DLw3Hp+Bttm/xr
         NnvfNEvvwiOkeFqaoP9Redj9cuY9orBouIpMfBwYjomldrzp4DW/nZ8JODMpnjOuJcek
         fMBFX8o6d8uCsEpHMfWAZPUUIfm8UVR6fzIJjGbR/2v9bOS7+/IOL1RHX6VMPLpeNvcM
         smhs/vxM1AG/7ogaO3LxXQ3sA6KxfCVaHCcs3Wh9FbE7yIpPW5SV5kwZ0FzvBMWruUJ4
         XLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309896; x=1768914696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WdRpfu1xGWcYjAWQxaMfWPygJNPVSP5eUvRVc+dd7G4=;
        b=lWk9vKbg25rRBj03iuBzxRwZEBrnPZBROFo6LKSnjYoN2f2hc4DIYqIiHMKcFhcs67
         pOwD+Q5lWrD8YXdXFTn1iLS3AP4lIelJCpEoo8ry8yHU9uuBzT41Su1gNUvUgcQRonzV
         fFYo75wZr2gpm+E+QjHJq537lW0wG4XBry0WT7TgMRsmina5mrWDooMyS/byS2xdz85t
         B5eK26n3d9+8oBLbJpZiwkz0KhlUfhqp9+WdfmRWpK9xkJ+rWN61leQ1DwG+b/RTsVxT
         fHCKpM/zzht4wLNUpQ2q00rczzAmGPdAOaVn0wcBH3wbWyyo2/XBrhKvSCESIKUB07Ba
         0MPw==
X-Forwarded-Encrypted: i=1; AJvYcCUxT3v5VNumCBMZqgfhA/JHIILfati8g0RVY/k7QXLjqqJMzHPoZ15wxMZ8VtnMLDxXqRG+na6vWCBjew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZT7Fe2QgjfDer8HUVh2QGcud1dasEz2yBNhzn7Cu7N7YdI9g
	VSlX6B8ZJ/6FucEmfsqUt3O3+DbO4O9CrfaNrJtGmSw9U7F2jcg/SD91
X-Gm-Gg: AY/fxX5R4qnSGQ1ZmImdDvzjpcsBi53a7QM1uETG8BdeWbXSvwBBbCos7RFXNyBxOcl
	hDIWMmM8dIXcfMFGm6HO/XIJbiUhmNEbYcAriNNu1EctIdF90HnYU6mlAG49hMslroSNGxcQVoM
	F/Q6yG9wJpT5/soHGv5AnPNSic/cngFW5A7ZFixB1yujhNkrwawgAzEqtV2CxYh+R0lnTDmhFlk
	BUkQGg5j/BVCnSlkZAg6gJCfLISb8KUqunL5bgAelgjQI9CiNLMh2tNormrfeWh+tKLKFggGPrW
	1+A5gqdzvNtNkQUwhoBSTn2oNq6lkJJb4MCY6nidG7bnbuorkzFtD7SOy57P13WK3i8Avt+cvFs
	gHcA+h2NFwzdhtHyuuzo+WLGi0CylU3Y3Crr5QQA3N4g08jCYxhpBESGvKBMbdU3xlXNZ5vI2/Y
	gbTXWgCX0KSWzn48wrM5e6S7SdNNrsVwG84+0EFq5vdNk971YyjKaXR4vdLdJDNr2SifrlZJdZA
	2nETs7TsYqTmfyFQMRcYOpMnTB1UMTq2d9zxunUCSHKaEKa1UYj/RvSbr3M
X-Google-Smtp-Source: AGHT+IFyu2Xbecu5ZQEF+GGthPQ01l1Eol345B13CYqSExCE8oPgIFYwUbfNrbKcyqGQfa4q33q6oQ==
X-Received: by 2002:a05:6a00:4acd:b0:81f:4963:4967 with SMTP id d2e1a72fcca58-81f49635062mr6748701b3a.57.1768309895597;
        Tue, 13 Jan 2026 05:11:35 -0800 (PST)
Received: from anonymous ([113.252.77.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa19242sm20621573b3a.7.2026.01.13.05.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:11:35 -0800 (PST)
Date: Tue, 13 Jan 2026 21:11:31 +0800
From: kenkinming2002@gmail.com
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: i2c-hid: override HID descriptors for some Haptick
 5288 touchpads
Message-ID: <aWZEST09jJlVZOzq@anonymous>
References: <20251225190822.150872-1-kenkinming2002@gmail.com>
 <3sbccjhicn22ubkbgz23njhsektkrva3b2udaavg2onxmo5uah@2vt472vdjehm>
 <aV6d5mt2veL-vEvf@anonymous>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV6d5mt2veL-vEvf@anonymous>

On Thu, Jan 08, 2026 at 02:14:29AM +0800, kenkinming2002@gmail.com wrote:
> > The simplest "solution" following what you are doing is making a HID-BPF
> > fixup which checks whether the device properly sent the report
> > descriptor and if not puts the one here. The HID-BPF has the advantage
> > of being compatible with hid-multitouch so you won't get into troubles
> > with a separate module.
> This might be a solution but would that not only fix it just for me? I
> would have to look into how to do HID-BPF fixup.
An update, I have looked into HID-BPF but it seems to me that we can
only fix up the HID report descriptor and not the HID descriptor (this
descriptor is specific to i2c-hid device) but from my testing both
descriptor can be corrupted. Specifically, I see messages such as:

  i2c_hid_acpi i2c-SPPT2600:00: unexpected HID descriptor bcdVersion (0x0209)
  i2c_hid_acpi i2c-SPPT2600:00: Failed to fetch the HID Descriptor

appearing in my log.

For now, I am just going to just apply the patch locally for myself till
a better solution come up.

I have finally clean up the pile of garbage I have while investigating
the problem and put up a proper git repository with relevant script and
logs at https://github.com/kenkinming2002/samsung-i2c-hid-bug-repro.git.

Huge thanks to Benjamin and anyway who might have stumbled across this
patch for your time.

Yours sincerly,
Ken Kwok

