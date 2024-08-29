Return-Path: <linux-input+bounces-5948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8E964D4B
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 19:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E405B20C48
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 17:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F5F1B5826;
	Thu, 29 Aug 2024 17:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dexz7Chh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4531494AF;
	Thu, 29 Aug 2024 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724954095; cv=none; b=SHUGjYoQ7bSMBmtOqcyEoz/iYtSia2P16Ds+ZPFlApVR77+IPYSpuRgJgwxR1t1qMD4kJg7GCNeCU2TXkibPerApJLipXb9wgxSob88sWjWT9KcHNOOS8sh1OZ7+XBIjx1A47soeqgFj8UKVSGZ60vaCHdGY9C8dmO0epSCgJy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724954095; c=relaxed/simple;
	bh=6Khe1Neiw9tuKrXREYEfFg2NaNle6Uh1ofP2W4NM7Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAOoG4SE0WR28LfhKuNydE/s8GkgpiWVRGo5FcDlD64TlP6B6Qe8t1Y6PJKEik40qLonznK46IiWSCVKi9C/k7n2f4hBj2+eAG7wluC+a8NATI/OgDDvrAa6eotAj2SFxpvcT7xyyN/sytMtVKBG5Jeh1JuvzHg3pdeQGxgwoCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dexz7Chh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-202089e57d8so7496815ad.0;
        Thu, 29 Aug 2024 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724954094; x=1725558894; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9H93aDw819CNA8Rn93FJxufdWXEVb9gVql9Y6eK3prM=;
        b=Dexz7Chhb0hIW+4vT05ndAMJudlUl5A+trCzmaR+kylQPLoKU2uh3UYFkZRLGRtTbU
         UTJEyxr+rJ51Whdeq/z2NPcRiQ3OTEoORoSCqGMpPBpZo1gCQdGpRN6s3Mo/oiFQ1ehL
         vNVn9l6BQgEemlI0WP6Dollx6ikorZCqHgTn9NCM+xh1/aaB0sFB6QjWdJBLbQ8mnEqx
         a5p0rU75quc0pf90/IfrHFNvZwCO+NggGRwtB/UneeBKse0C/l6xv7XI0zcWPV8nWM+a
         mWbc1qZi+r5DV6H1j/Mu/jJA3vD2S1b9UCu7vUHU6lasY6ZyzW8YtvCYzW4d2v5dRrXz
         3d3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724954094; x=1725558894;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9H93aDw819CNA8Rn93FJxufdWXEVb9gVql9Y6eK3prM=;
        b=SlQGedMt2gnGH9BmKXhitGHvvLOtv1IY6ae/OnaWJ5+1uvS9kTjl3jW55gtd581gqn
         EjJykMHSDU1MssTDDXyL2ueAnt/wO4BGPmtrfmckbzmIP5yoZ5nMnIDLrhOUlYHMO3t8
         HhNwjzuusm9GJmeUbGc6F0NIpwOmvEJd2oBDKm7i3J45/xMguo0HRD8l+D4glMyuH74f
         4ZE1eG4Pexix2vvmAWCrtiVK21yXSLmaZtm7ktZM+uR4yjiT5ZgMS0HHUBZQb3SF5EIj
         6t910nAU7jVDFsFCx93j2oBZ8aas00GoDW+UkTkzsJMMHh1+pfeWUN6MS9WiWVey9AkG
         I45w==
X-Forwarded-Encrypted: i=1; AJvYcCWqtJ9NHxNoyPzOot2DEVtTh+3B8BqIJDGAo+W5rwRIszbNFov49JExX3TrCrHPRKYZgQ16vvtbA3jbJEQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkqAdavr4KXIaveIrTQ9gHrhLjlDAHPoeobFNp3d8jRQtvnm1E
	CrGulNfJp2nuLPVwTCvwAFqXgGF9iWhq5pKyEkORulxfzye8yQVI
X-Google-Smtp-Source: AGHT+IGXUm962Pa4QKEelupXKV8GhxE5BUtECBV2PARpi/DPXDrFmnKOEdCMoB910uxCwZJyNm7QVw==
X-Received: by 2002:a17:902:e548:b0:201:ec22:8335 with SMTP id d9443c01a7336-2050ea64455mr40648505ad.30.1724954093554;
        Thu, 29 Aug 2024 10:54:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ed6:5fae:d35c:9c2d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152d6966sm14196545ad.115.2024.08.29.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:54:53 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:54:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: linux-input@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
Subject: Re: [PATCH 01/18] Input: zforce_ts - use devm_add_action_or_reset()
Message-ID: <ZtC16tRKASOqXEk9@google.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
 <20240824055047.1706392-2-dmitry.torokhov@gmail.com>
 <11576391.MucGe3eQFb@diego>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11576391.MucGe3eQFb@diego>

On Sat, Aug 24, 2024 at 01:13:28PM +0200, Heiko Stübner wrote:
> Am Samstag, 24. August 2024, 07:50:25 CEST schrieb Dmitry Torokhov:
> > From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> > 
> > If devm_add_action() fails we are explicitly calling the cleanup to free
> > the resources allocated. Lets use the helper devm_add_action_or_reset()
> > and return directly in case of error, as we know that the cleanup
> > function has been already called by the helper if there was any error.
> > 
> > Signed-off-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
> 
> mistmatch between From and first Signed-off-by

Yeah, I got this patch a while ago...

> 
> Other than that:
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Is this for this patch only or for the whole series?

> 
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/touchscreen/zforce_ts.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
> > index fdf2d1e770c8..ffbd55c6e1d4 100644
> > --- a/drivers/input/touchscreen/zforce_ts.c
> > +++ b/drivers/input/touchscreen/zforce_ts.c
> > @@ -803,15 +803,12 @@ static int zforce_probe(struct i2c_client *client)
> >  		udelay(100);
> >  	}
> >  
> > -	ret = devm_add_action(&client->dev, zforce_reset, ts);
> > +	ret = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
> >  	if (ret) {
> >  		dev_err(&client->dev, "failed to register reset action, %d\n",
> >  			ret);
> >  
> >  		/* hereafter the regulator will be disabled by the action */
> > -		if (!IS_ERR(ts->reg_vdd))
> > -			regulator_disable(ts->reg_vdd);
> > -
> >  		return ret;
> >  	}
> >  
> > 
> 
> 
> 
> 

Thanks.

-- 
Dmitry

