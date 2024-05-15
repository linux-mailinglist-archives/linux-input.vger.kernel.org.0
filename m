Return-Path: <linux-input+bounces-3718-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E948C69F7
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 17:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE5D61F23588
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 15:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5F4156225;
	Wed, 15 May 2024 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+OAg2gZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54587149DEE;
	Wed, 15 May 2024 15:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715788100; cv=none; b=lCPaneIAoIkR0TTL2zKUlxx2lc9PqzzbmsSSvApFKmPW3VWHUCMcBAxMSBRdJ/eeeB95IFBncYpWchuRm1IvyQ+jgzZaHm7BNYJr/O3adT/csmEEAtHMhqrEzh3tkn17Ln81cd1DLtT4fevrS17JpyK4wJwFI1JqQLlKOyIT43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715788100; c=relaxed/simple;
	bh=tImvI4/XFN3XnDtRr36BCf27h4s5GzAbZmCDLw2EHcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QuTc8rFNB6j6wQ6C5MDNjFkwkOvSmLtAVtFqrzqMlTyz19FyF4sxQO9T2JQHxs1TZFB7oMltutPhnBUK8lfQP39+RiHBzTer5s7J9OIY+lm00zK+v/yn8qYPer8BZePVFU1WwbxVBDfV2EzpExFJ8t+hDJsV3TMeCnDRp1/dGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+OAg2gZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8092CC2BD11;
	Wed, 15 May 2024 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715788099;
	bh=tImvI4/XFN3XnDtRr36BCf27h4s5GzAbZmCDLw2EHcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+OAg2gZ2FE7raLUhsq+wQcFh3J2PdbMyP1Lvqc+tLmvRthjaoKM5U3OIcwvr0MxK
	 +M2bRYzeAVbnYqZvMpZq/NXdq4bA22mmtT5psGQ7c52Tz8m9iyrkYFCIfzYXmanV7i
	 kOpqtz3Vh0weCVJwPM7JlkCRFh8WIA+vZN+7A1siWdCLdyq9TzJJFNznPBl9eyoVbM
	 YQny6DqQ/Bez/hYSn8DN3YQR45W7nSC12Bozzl/c/pGacfrv1e27ghE+DBn0OP1wA/
	 /HU/54LNY0QFBTcRDtYPGwGiI2L9zomwTfpw4pg1cfUkRRegDXFFXVhX9bGDUpSBj0
	 5LnnMEWZndmAA==
Date: Wed, 15 May 2024 17:48:15 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Rahul Rameshbabu <rrameshbabu@nvidia.com>
Cc: Chen Ni <nichen@iscas.ac.cn>, jikos@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: nvidia-shield: Add missing check for
 input_ff_create_memless
Message-ID: <ni3q5ljxabdwpirypkh6ahuqsn2iqf3r2jpoa65xt5vlu6rmmz@dcw245bem3o6>
References: <20240515033051.2693390-1-nichen@iscas.ac.cn>
 <87jzjvgkn1.fsf@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jzjvgkn1.fsf@nvidia.com>

On May 15 2024, Rahul Rameshbabu wrote:
> 
> On Wed, 15 May, 2024 11:30:51 +0800 Chen Ni <nichen@iscas.ac.cn> wrote:
> > Add check for the return value of input_ff_create_memless() and return
> > the error if it fails in order to catch the error.
> >
> 
> You will need a Fixes: tag here.
> 
> Fixes: 09308562d4af ("HID: nvidia-shield: Initial driver implementation with Thunderstrike support")
> > Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> > ---
> >  drivers/hid/hid-nvidia-shield.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
> > index 58b15750dbb0..ff9078ad1961 100644
> > --- a/drivers/hid/hid-nvidia-shield.c
> > +++ b/drivers/hid/hid-nvidia-shield.c
> > @@ -283,7 +283,9 @@ static struct input_dev *shield_haptics_create(
> >  		return haptics;
> >  
> >  	input_set_capability(haptics, EV_FF, FF_RUMBLE);
> > -	input_ff_create_memless(haptics, NULL, play_effect);
> > +	ret = input_ff_create_memless(haptics, NULL, play_effect);
> > +	if (ret)
> > +		goto err;
> >  
> >  	ret = input_register_device(haptics);
> >  	if (ret)
> 
> I applied and tested the patch locally, and it looked good. If Jiri or
> Benjamin can apply the patch with the updated trailer, then you can add
> my Reviewed-by: trailer.
> 
> Reviewed-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>


Thanks a lot for the patch and the review.

I wanted to apply it but we have a regression upstream on the CI because
of an unrelated change in selftests:
https://gitlab.freedesktop.org/bentiss/hid/-/jobs/58744845

Once this is sorted out I'll apply the patch (or Jiri will). FWIW, b4
applies the Fixes tag all by itself, so I don't have extra steps to do
:)

Cheers,
Benjamin

