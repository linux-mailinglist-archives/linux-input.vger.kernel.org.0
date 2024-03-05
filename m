Return-Path: <linux-input+bounces-2209-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5731E871231
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 02:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 857281C220CB
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 01:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB5A10949;
	Tue,  5 Mar 2024 01:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLR+HssS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F1E8833
	for <linux-input@vger.kernel.org>; Tue,  5 Mar 2024 01:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709600691; cv=none; b=bVd5zJA5poGOdZZkIbWhBwAP8z7NLinzfK/tTYUShF1cjZtBDOnZGCID2WN6nUnARteRJmRDu2yzUl10pR/RC08IcWeaDFcRl+WYeL3Im1oWKn3WPXfsQWqHuQcoxC6uraIOK3Zju+7elShHpODd6B7vc+7O2ad4IjSrapvIE50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709600691; c=relaxed/simple;
	bh=VyWptntybPPbRLQ2q+M4Uvaj+/t579926LaaqEUKdEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CpTjn1Kx1lAy2ThENbX7DhmNlJCbyjuIMZ8+BYuPjJ/5tzxAh72knUvfskQ4bHyUKHD41PQ6bomDwbqtU4E+PHy61loV9rsAVKdqF24tOukLXN868FQ24ar1NvF8rNOdsTwR9EHFf6fDPhpBwApHlehqx8XIlkRshBz9baW8k58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLR+HssS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1dca3951ad9so49236425ad.3
        for <linux-input@vger.kernel.org>; Mon, 04 Mar 2024 17:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709600689; x=1710205489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZkHDFchW+cwvqAyqv7vnDNccUs3Et+xeyxkRdLWLpw=;
        b=RLR+HssSKOERR44mTpNOU6DBc/MOcQwD+sbjTXkVe+HBsQg9aD/XGNuqHlCNT2N0DG
         m8tU0voBaX4wfsts4MlMHYGEJ4UbP7JYnTKySgYo73SJ+wsIsluCKgrYxfN4wA+iPdpo
         UFzrC2JrZlWyZkWbxtd5FyqcYyx/1+dQXqCrc5+1kqCoogsOHV9TVhNCHEY/HuhRWQZk
         0PWt07gnVLt/x36bdVdjr78AxYvWvS6GlTyNFIjPOWE0jLiZiHyylC3kfAFF8l3JfWmw
         Uxn2wZxqFlmo7EFJIiuz+B5BDUat8wGebI2yvNGhQX1OFFn2QxvMYsLPnsLp4fDJIJIW
         i0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709600689; x=1710205489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZkHDFchW+cwvqAyqv7vnDNccUs3Et+xeyxkRdLWLpw=;
        b=Y6n28tfF1T+2XSe7VExJcFy+I1dXrdIaYsl2FeIvUxaGDGR3FGv4AYh96DRS2qQ1ep
         LyJoFY0rZu3viXaDrf4a/N7HavvVb2rPEz4Yo5kuKmh1iB1HGxzrQV/yAEF69BeDXRjT
         OwmjV8L/zC5yuJFqVUc+kwoGpWOyQIRa6eJcFMuWGzxhqp86QheXBhpYwly0p7sCxNzn
         varDq4RiHazg4D1V8sdp0hsASRmGTFsSyGDQuOC66u/pksYwmPZSWYSCmnpZYKdUoXkm
         lHSzgfgtLfhocjNH9Egs8nDLgyFWgIQgJgc3Ths4BZXYmKI3Chzu16m9rvz04+L4z3pp
         BY9w==
X-Gm-Message-State: AOJu0YxrJ/t5K5iSvFoNf0mYw5fhIAH8nASwi/XcJQaAhrMWN80kXXvw
	/7UoFqhper0o9UpkW/9ED2nnbMMQ6OaG5TzM6WF/KmNkoUPtFmkDNrrLGKZU
X-Google-Smtp-Source: AGHT+IHcpCbRbisA4ktLxSSaHz4dkJ7zceCRxy0CLWLBakbn88bZbll47gNnOxMWRi03aBRaFcfqyQ==
X-Received: by 2002:a17:902:f707:b0:1dc:fae0:1c91 with SMTP id h7-20020a170902f70700b001dcfae01c91mr516971plo.13.1709600689247;
        Mon, 04 Mar 2024 17:04:49 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:a5d5:fe74:fba8:86b5])
        by smtp.gmail.com with ESMTPSA id r2-20020a170903410200b001dcc0ffffc5sm9205931pld.166.2024.03.04.17.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 17:04:48 -0800 (PST)
Date: Mon, 4 Mar 2024 17:04:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Nguyen, Max" <hphyperxdev@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Add additional HyperX Controller
 Identifiers
Message-ID: <ZeZvrrpv_xVDWE4A@google.com>
References: <44ad5ffa-76d8-4046-94ee-2ef171930ed2@gmail.com>
 <ZeT9cbHRVe7td8WB@google.com>
 <8a2e32ad-abbe-4459-ac99-c0b8e8e2cdef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2e32ad-abbe-4459-ac99-c0b8e8e2cdef@gmail.com>

On Mon, Mar 04, 2024 at 04:43:10PM -0800, Nguyen, Max wrote:
> 
> On 3/3/2024 2:45 PM, Dmitry Torokhov wrote:
> > Hi Max,
> > 
> > On Fri, Mar 01, 2024 at 06:15:42PM -0800, Nguyen, Max wrote:
> > > Add additional HyperX device identifiers to xpad_device and xpad_table. Cc:
> > > stable@vger.kernel.org Suggested-by: Chris Toledanes<chris.toledanes@hp.com>
> > > Reviewed-by: Carl Ng<carl.ng@hp.com>
> > > Signed-off-by: Max Nguyen<maxwell.nguyen@hp.com>
> > Your client messes up patches :(
> 
> Sorry about that... I tried to submit through a different client.  I will submit through my previous method next time.
> 
> > 
> > > ---
> > > 
> > > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> > > index 7c4b2a5cc1b5..a7e001a1f6dc 100644
> > > --- a/drivers/input/joystick/xpad.c
> > > +++ b/drivers/input/joystick/xpad.c
> > > @@ -131,6 +131,11 @@ static const struct xpad_device {
> > >   	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
> > >   	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
> > >   	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
> > > +	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
> > > +	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
> > > +	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
> > > +	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
> > > +	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },
> > These need to be sorted by VID/PID.
> > 
> > I fixed it up and applied.
> > 
> > Thanks.
> 
> Can you help explain the sort?  Do the VID/PIDs need to be in sequential order?

Yes, to easier see if someone is adding a duplicate, potentially with a
[slightly] different name. So 0x03f0, 0x07A0 should come before 0x03f0,
0x08B6, etc.

Thanks.

-- 
Dmitry

