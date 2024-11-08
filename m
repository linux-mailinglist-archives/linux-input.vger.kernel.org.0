Return-Path: <linux-input+bounces-7969-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 085FF9C1656
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 07:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC976B229EB
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 06:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5D61CEEB6;
	Fri,  8 Nov 2024 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKAucGOS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19E58F54
	for <linux-input@vger.kernel.org>; Fri,  8 Nov 2024 06:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731046129; cv=none; b=W57DuyPnQEYYdfLljbRAeDylwgWl0UKeb57+kDk3OnFRSAUSRTncRABI3HSXasCFpVp0r2WDV6Z58KDrO5R5cYDp0OV/cxkbUiN1qWnRbv9TYFLBEaA7gMWQDvEafVCp7E9xPPAwSx2qvDP0xcQndy07HZQ8UI0R3RGnpVtJ7hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731046129; c=relaxed/simple;
	bh=Ih+M8A/d4PN6jOa0oIwtyacN7ubPgmGTI+/kEu0Ko30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY39kffTJcPXd8y3V/SFuHZ69a4zthgzC4b7UyXEar7n4tb66K65bScIw2ZzNe7ME0w/0DvCoO7T2V784oFI2YGqMNXDMy3orWvB+kYbn9p8GuwPf1cJH8tWX+LbRn/9PnjhF7aSKi1U2kkuwcubySL3rTa9nml46FmwbqichLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKAucGOS; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cf6eea3c0so19155995ad.0
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 22:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731046127; x=1731650927; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bayc9mYusJC8TPQwxhdo5zLifIgLmkRHLjwEFTbskvY=;
        b=VKAucGOSZ7+bGRs/U5zkxKizInpABPwjW3tB/29EYtxmzkRes6A+taeGW3cwtq3eZk
         PwV+Y10a6RJfkDxud6T85NMEHHRjxOmYFxd1+EU89z9wwCitIxaV+x0RpEyMW49+GIgF
         kOJ+IA5uJdYT9R6+gmyqOuRhlRrWMVbaPXEUupdZ34LneRlhbvpi5+doBLA1kcI3XNYq
         SaEO4M+859exffU1V6d1aKhggo1/xUuxUGayj331wQUvA1ijZe2r68UKLmSX0NNah44q
         Kc0maVD6lIjLeSNtLtPG7mKYBa1WjcenYSJIJCyxU/xXPI1XuuhGqUhetIJZZzjMItQG
         voFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731046127; x=1731650927;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bayc9mYusJC8TPQwxhdo5zLifIgLmkRHLjwEFTbskvY=;
        b=vHa0qcgPgrlvW80JJYDGV4Ak9IeVnH4LwsL+06kYIKqZGtpmDg5tjNfllU8VHGxyd1
         KqsY7zUPl0A4//QIw/Xwg9RoFXdV0uPXwY042eyGBHKDUwZs+LvI6sWOyyx9Fxx61JXI
         IbGvwROoWWEp4cMKu6NgJSB6KmH6ou+9Q995RbJ3ENGpEBuSzdLIzI/7cD2rB2bVlXRO
         JkS7KaRiP6KWFDFv7No8lQWYzqJz1g7xwsT42na+ittHVLEUBWaksi0mBhwxJh5EwPXE
         T3KeGtWf8MTzJw2v72Ey/Tdyn2V6eSfdtVIiEi7IYdzZ7yk7M9lJk2NDZkNSaSyPYEEd
         TJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFRMDglNZwkXzcJHjXMboc2huRI+FA5riZQ63mpQTgc2eCx2BkdBoi/qXZ3DQfkHoY2HEfUzeoj75Xzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YymhSS7p0yfIZdyLuJ0UqeRDweo7CjpuNF/DrB8GFpkHuO+9Q3n
	84BdR4wAFpgqHIvifntxaPo4tsFYS8IP3t6ieG6oKUN3MaMprowdn9U7kA==
X-Google-Smtp-Source: AGHT+IG0DmBMoMzYglyJHBFnP/a0UEJ8jNDJWOFbnKUYnmTastCfFi9SYiSMbQpJeqN/LVmLKjjGJA==
X-Received: by 2002:a17:902:ec81:b0:20c:5e86:9b5e with SMTP id d9443c01a7336-211834e7319mr20343995ad.3.1731046126882;
        Thu, 07 Nov 2024 22:08:46 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9aed:7ea4:c2e6:9e3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e4148esm22450775ad.125.2024.11.07.22.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 22:08:46 -0800 (PST)
Date: Thu, 7 Nov 2024 22:08:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@dh-electronics.com
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
Message-ID: <Zy2q7FnS9j9MaSpz@google.com>
References: <20240320072533.170029-1-marex@denx.de>
 <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de>
 <Znstp_l5l2PUgIfP@google.com>
 <CACRpkdaC79-UPDg17cnanBFbsnOrzgwks7HCLxfrn_eBwNuXxA@mail.gmail.com>
 <ZnyXMLJBvuryshct@roadster.musicnaut.iki.fi>
 <4b7f0fcc-781a-4725-8985-6d033c0e9dac@denx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b7f0fcc-781a-4725-8985-6d033c0e9dac@denx.de>

On Thu, Oct 31, 2024 at 07:21:52PM +0100, Marek Vasut wrote:
> On 6/27/24 12:33 AM, Aaro Koskinen wrote:
> > Hi,
> > 
> > On Wed, Jun 26, 2024 at 02:40:00PM +0200, Linus Walleij wrote:
> > > On Tue, Jun 25, 2024 at 10:50 PM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > 
> > > > I am concerned that we are putting workaroud for a single controller
> > > > into common function. Can we quirk it based on compatible? If not then I
> > > > would like someone to run tests on other controllers. Unfortunately I do
> > > > not have such hardware.
> > > > 
> > > > Linus, do you have devices with ads7846 or tsc2046 by chance? Spitz?
> > > 
> > > Sadly I do not, but it is inside the Nokia770 so maybe Aaro can test it?
> > > (Not sure if Aaro has the 770 though...)
> > 
> > I sure have 770, and I can test patches.
> > 
> > However, ads7846 has regressed and it has been broken on 770 for
> > a couple years already as half-duplex support got suddenly deleted
> > without any pre-warning to users (770 was using this driver maybe
> > a decade without any issues). I reported this as a regression but
> > input maintainers preferred to prioritize "nicer hardware". See e.g.:
> > https://marc.info/?l=linux-input&m=164783764828520&w=2
> > 
> > I'm planning to restore the half-duplex support for 770, but it's not
> > on my top prioriority list so it will take a while.
> > 
> > Meanwhile, maybe you can ask the users of such "nicer hardware" to test.
> Seems there is basically no interest anymore . Can this patch be applied or
> how shall we proceed ?

Applied, thank you.

-- 
Dmitry

