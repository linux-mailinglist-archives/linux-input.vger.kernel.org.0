Return-Path: <linux-input+bounces-9361-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF1A15A6B
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 01:43:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0E1164544
	for <lists+linux-input@lfdr.de>; Sat, 18 Jan 2025 00:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAFA846F;
	Sat, 18 Jan 2025 00:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/zw8rez"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9160747F
	for <linux-input@vger.kernel.org>; Sat, 18 Jan 2025 00:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161012; cv=none; b=iOYOvrjNxS54vQwRZanGz2/f3/u04260QG788/qgAFkdf76T1zexIWCrYcfuQlGUAb9wwbo7OK5VaQnEujXh259fe5LjrJGPEaa12M+pP6JA8gJvQC4agqcKXBSWH6ayMe94AaqdcR9WJqjkhISDdoyMcew5StPFG6vhWdCjADM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161012; c=relaxed/simple;
	bh=VfmDPy846Kexktac6w9L30R5zGR5xCBv2XqStQBiksM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0diUWKNtVPEgDM7E22rZuQ2a+alPyY59okI/mOZemLItP6riGAjL1DJbZFJ08up0SBkPMeNrIT0XNZmcrTwwYwVjX4jAppQyuXqajpU9J+y/HsnTSsEMs649g0CihcWLickFe5VvgdqFm9dh6yCPN9VfCqhv3TQ0QcD99l/KOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/zw8rez; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-216401de828so49501525ad.3
        for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 16:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737161010; x=1737765810; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Eb9jX1khXnmjTVc/JCz1YfjisZoUmb6W5SzJln1/yPc=;
        b=H/zw8rezvZNvGQwukJmF/XOGkvyefsGF9kZiAOUWOaBrenWYQXT0UvyK9sc1S2SSJ7
         86yTOnnthD4xXAPHC04sxu8Q3vaCEAGsjeb+mTCO3uStp8ogdQhY3uJQeI4sjItyHrjv
         oyL1baT2k+9iANSUXes4eALX8qj0tv79r0THp9kxATmnOjzftShRAHke+lz6+2Qb0L2y
         ViOicCI2xsYbCXvoSyJI5HMkeRK5blUXp4H1GCF0+hSTKlq1p955skYr3jM9uY1MSV+n
         CO0Yd3mSB3rIb3J3FhBFHmLj2HFWACbs/femFrYx8lMm+xBDvR15MZa6gP8E7ykJ+bXI
         XoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737161010; x=1737765810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eb9jX1khXnmjTVc/JCz1YfjisZoUmb6W5SzJln1/yPc=;
        b=MAyP+BYRmGto3uGF4rfV46TRhmyZK/6vCttfTyPbgf1oa68oqIEXE2Fs81CU8GBed8
         mRTuDdHHeLfrd5Gb0y6/pKHXlrS53CDU6Z1pOJrYY5LZ1tYSakhHIsIA+190/VQfCCIM
         I9kihEZXLHCpNQ9+8gPmfx6d6ybjSXPUxaenhynd1BdE6UaQ6cVIX+tM1BjoZ5cMrb2i
         EpDlT3Y8v76SC18lIkkCRF7bO7iL19D3FlFzdk5LeTnIsi4GM/rnWJkMVE7k2BcUE/nf
         63ESO6FFm0u+qTr+pMRLiz297DJEXEJ6qcwdkqacAdHrs6JM8JJ3Vv2Qku889Ut+261v
         4y/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSV6QR0ekcSm4trEXdxzwIwNZchE/EBbQtonY39TJj6WGvb9PmF5yyQLXovl+/PIEHXiyllCMut8sgug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhib4PDzk+pThQg3+loJJ3UPYIs1cPQBtbmGEaIcdGq7AaGyBg
	ddGAZT/OuHPthHD24zOWgilGG3lII6q2meRhr91I6xUot86EGuko
X-Gm-Gg: ASbGncs7me1sAovNn94MzmF1BTIFI6GR2ZYVG8KlTz8FO+ZngaDgsbE/uPvFEweoTEA
	tJKFNm++6M4zNCyownfQTsXvTw3MHn6VQRoLvVijpyP06c1Pa7SgFkTA3Dwqp0Xk8S4iA8s++0p
	2RBjMzOr9Jmtc/5qj0nn3Akjr9/T42fjdiZKAzLiNSC+kh1PoD5/2qXq9ieBGD5dhOdM7Xn/dqT
	z7oR57R8AXsV4ak7jJCvOQM2VYbhPYfDonsDN+Pz65yaKqu4aIL+NMDLoResOhzAXdg+rA=
X-Google-Smtp-Source: AGHT+IHLXnzBvgruX8ANjM1pQPLeUJwEvS4SuhrksvB9EFit2biFJ1AnsSwqU/nWJRajrrvRuCTspA==
X-Received: by 2002:a05:6a00:428d:b0:71e:4786:98ee with SMTP id d2e1a72fcca58-72dafae88b0mr6461546b3a.21.1737161009571;
        Fri, 17 Jan 2025 16:43:29 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5b21:de92:906f:1f41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab817732sm2681907b3a.64.2025.01.17.16.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 16:43:29 -0800 (PST)
Date: Fri, 17 Jan 2025 16:43:26 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matheos Mattsson <matheos.mattsson@gmail.com>
Cc: Pavel Rojtberg <rojtberg@gmail.com>, linux-input@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 08/11] Input: xpad - add support for Nacon Evol-X Xbox
 One Controller
Message-ID: <Z4r5LixxTPIf1rqP@google.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
 <20250107192830.414709-9-rojtberg@gmail.com>
 <Z4qTzrFGDtInMfz5@google.com>
 <CAOnZAHtEU-nBVuPq_5mC31e-KG+_VKW8PkSwUaCsFREjxewxGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOnZAHtEU-nBVuPq_5mC31e-KG+_VKW8PkSwUaCsFREjxewxGg@mail.gmail.com>

Hi Matheos,

On Fri, Jan 17, 2025 at 11:25:06PM +0200, Matheos Mattsson wrote:
> Hi,
> 
> Sorry to jump in like this. I am not even sure what kind of "chain" this is
> really,

Pavel sent a chain of multiple patches (of which you were CCed on to
just one I assume), so that's what I was referring to.

> but if we are talking about my SOB I am 100% sure I did in my MR
> description on the xpad github repostitory.

Ah, OK, I see now. I simply cloned the repository and inspected the
commits. Pull requests is something that is only recorded in github and
is not a part of git repository.

> Apologies if this was either the wrong place, or if I am conpletely
> misunderstanding what this is about 😅

Yes, for the kernel development SOB should go into commit message
itself. This way SOBs are part of the source code and its history, not
tied to some infrastructure.

But since I am aware of your SOB now I am applying the patch.

Thank you!

> 
> Regards,
> Matheos
> 
> On Fri, 17 Jan 2025, 19:30 Dmitry Torokhov, <dmitry.torokhov@gmail.com>
> wrote:
> 
> > Hi Pavel,
> >
> > On Tue, Jan 07, 2025 at 08:28:27PM +0100, Pavel Rojtberg wrote:
> > > From: Matheos Mattsson <matheos.mattsson@gmail.com>
> > >
> > > Signed-off-by: Matheos Mattsson <matheos.mattsson@gmail.com>
> >
> > I checked several patches against the github repository and in github
> > there are no "Signed-off-by"s from the original authors. I understand
> > and fully appreciate the desire to credit the original authors, but you
> > can not add SOBs on their behalf.
> >
> > I think the best way would be to combine all the changes into one patch
> > authored by you and give credit to all the people involved in the commit
> > description.
> >
> > > Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> > > ---
> > >  drivers/input/joystick/xpad.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/input/joystick/xpad.c
> > b/drivers/input/joystick/xpad.c
> > > index 237704b3fab5..18e33e2aeaa7 100644
> > > --- a/drivers/input/joystick/xpad.c
> > > +++ b/drivers/input/joystick/xpad.c
> > > @@ -394,6 +394,7 @@ static const struct xpad_device {
> > >       { 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
> > >       { 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
> > >       { 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
> > > +     { 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
> > >       { 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
> > >       { 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0,
> > XTYPE_XBOX },
> > >       { 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0,
> > XTYPE_XBOX360 },
> > > @@ -543,6 +544,7 @@ static const struct usb_device_id xpad_table[] = {
> > >       XPAD_XBOXONE_VENDOR(0x2e95),            /* SCUF Gaming Controller
> > */
> > >       XPAD_XBOX360_VENDOR(0x31e3),            /* Wooting Keyboards */
> > >       XPAD_XBOX360_VENDOR(0x3285),            /* Nacon GC-100 */
> > > +     XPAD_XBOXONE_VENDOR(0x3285),            /* Nacon Evol-X */
> > >       XPAD_XBOX360_VENDOR(0x3537),            /* GameSir Controllers */
> > >       XPAD_XBOXONE_VENDOR(0x3537),            /* GameSir Controllers */
> > >       XPAD_XBOX360_VENDOR(0x413d),            /* Black Shark Green Ghost
> > Controller */
> > > --
> > > 2.43.0
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
> >

-- 
Dmitry

