Return-Path: <linux-input+bounces-5195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C941B93FD68
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 20:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809DC1F22BF1
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 18:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C928A15F32E;
	Mon, 29 Jul 2024 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CDhZZP2M"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8C915B555;
	Mon, 29 Jul 2024 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278134; cv=none; b=BbCW25tkte+kCWKe7uSSlBP2/fVPAUCHJrAqrrgrm0Kjt1IRZGooN0nxbw+QiGAOWdehxMiASz1NYXjMMhgzSMZMijnV2EmPh7fjGrqyXZ6ewyxpkppT48QDtykbAP2EOA15iafL+m/I8m6GIPehjAJaBzdpQPGSO0zB5dXTAxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278134; c=relaxed/simple;
	bh=NcegI1Qq9W5mhk4TIx+UvU2cz6l288FI/JCYr0gSj3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5IjWeoIWYPkAlx0OkYsNOa5mBF/Z60gJrV8h0WRYichv0XG4+ANU00H3Gxif6c9TrNIKw6xSiXJyKHIFL4Ftb6+Buaxde0abNYOLupLYDxoqU6dMdcEqZBSppE1aSIGCO3qjD7OWD3wvEwHWbU/NelwA7jWqGxyBZCqwcdIAL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CDhZZP2M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fd66cddd07so22256895ad.2;
        Mon, 29 Jul 2024 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722278132; x=1722882932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMF5Yus63IeW/24stphOXz/RGvKnh0pcl+5VTPs2Q5o=;
        b=CDhZZP2M9KDqqt44X41bHs6qDfyevo+eENoIi0SdFbJM10k7eNCOn6OX1hEIZgxJqF
         y9RUqJCo35R8FLmZ4xTyO3ijMRASqcreZWdbO+dkTpn5J+Do1JZqxRqFr7q1dC5KS12b
         7/LTvH+XeANHWlewRZnK1bBej/US/2clmPVaXHtJo9ws9BHy8TBxoPIq2mjoeIyz1Xhl
         oZzwRa4q2OOyDUxVNEEU0R/9No0olT5Mbdha3rml1APF+HCW7lQOErXKxYBNLYr6y4Zl
         s8VkwNkpm6zB+T8hdZTTLdE1ijnEa9iFtm3KPFU7evSKR2imVn2yIogHh5rTDX82eiMS
         bXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278132; x=1722882932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMF5Yus63IeW/24stphOXz/RGvKnh0pcl+5VTPs2Q5o=;
        b=TCb25BhetOxiBmrfsqkHxOn5edHCdzZ39Zpwz2JgKQaqYvrisBFH7j6XDEcrFx5cDm
         y5pR5xgmTBX3N8G7BXyFGbRWRGUX3/k59/cyXD0Z5nrr+YUtmXnLyT7/oke/rHIa88fm
         xesq3s8geedgYRfwsiPKux6wrVHxj4mYducXkJWlfLrN3exTCNzjRS45DfhrpVtsBUgj
         jn69ucIQaiMawZn2HnSx4N3ehbTAMcjD9GYiJD+xGKSyp/AMUhRB5b6z4v8nlwPT2G7E
         RyYblKrqDrL6B4B20RgWHY5bHCZH/6oFQ2tHTSuwlo9osNhReGZgnoGTCudiWi5/7M5S
         V0nw==
X-Forwarded-Encrypted: i=1; AJvYcCU6F8DNAZAtHypZwZiBC10WdK57yBNDQtcwkWS8tfP4etrkaQ1QtI6/nSsPxeTGCzQW+UtZ/ExZsS8ezPAzUc5MdZ3iKfqevYxkQU9RjAnwkQxIKy/rDh29gPsyfoFeyVcCF3f5RkmUcgk=
X-Gm-Message-State: AOJu0Yz7wlLula3vp1fpoMHeygWY4kdXm3n4mjspvFApZiUNvKODo697
	YW9QkAGf0j1X2mN74aN9ucrUPeB5ALZ2K0SOawt7A8jPjexokKIavCIRUA==
X-Google-Smtp-Source: AGHT+IGzsEth9s3GY91UXbYFw85VdpofAkaHeNuTWBLId4GtAftXC5XSZ4Yahonyz9GQ9yhpRjPnkQ==
X-Received: by 2002:a17:90b:50e:b0:2c9:6ad9:b75b with SMTP id 98e67ed59e1d1-2cf7e72beabmr5501341a91.40.1722278131495;
        Mon, 29 Jul 2024 11:35:31 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f53a:d352:6282:526b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28de6323sm8916526a91.36.2024.07.29.11.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:35:31 -0700 (PDT)
Date: Mon, 29 Jul 2024 11:35:28 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <Zqfg8FW-SFFedebo@google.com>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh>
 <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com>
 <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiT8RzFUVXe=r3S9dfCpV+FhARgtb5SxLDSOKCJKCLOZA@mail.gmail.com>

On Mon, Jul 29, 2024 at 11:16:02AM -0700, Linus Torvalds wrote:
> On Mon, 29 Jul 2024 at 10:59, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Can I write a gigabyte of data to disk? Terabyte? Is petabyte too much?
> > What if I don't have enough physical disk. Do we "fix" write() not to
> > take size_t length?
> 
> Dmitry, that's *EXACTLY* what we did decades ago.

What exactly did you do? Limit size of data userspace can request to be
written? What is the max allowed size then? Can I stick a warning in the
code to complain when it is "too big"?

> 
> Your argument is bogus garbage. We do various arbitrary limits exactly
> to head off problems early.

So does this mean that we should disallow any and all allocations above
4k because they can potentially fail, depending on the system state? Or
maybe we should be resilient and fail gracefully instead?

It would help if you expanded why exactly my argument is a garbage and
what the problem is with recognizing that memory is a depletable
resource (like a lot of other resources, including storage) and there's
never a "completely safe" amount that can be used, so trying to
introduce it is futile.

Thanks.

-- 
Dmitry

