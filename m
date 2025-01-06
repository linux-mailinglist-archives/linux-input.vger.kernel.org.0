Return-Path: <linux-input+bounces-8953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A98A01FB2
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 08:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802F63A2AC9
	for <lists+linux-input@lfdr.de>; Mon,  6 Jan 2025 07:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E772629CE6;
	Mon,  6 Jan 2025 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IacqO61m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708591876
	for <linux-input@vger.kernel.org>; Mon,  6 Jan 2025 07:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147832; cv=none; b=H3hZQxQdvMNi04ZOrN10o4fahShBg7HRLtaaDsDtAb9RQrlpD6uFX1772WkgJmubCgAYCAJimeENnlSJBX8sQmTCaWdOuug61RSRRC+U+3C/P1p8p0PJ1Nb5joPDnzeJA1qfGKG4Y8CEMjwMYlHAszTtR0X/8qz1pvfdemHRCyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147832; c=relaxed/simple;
	bh=MLSFWP7GObruz+GGfHbHY/Yhfr9F/hrSK2bN+KSp7TI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RynPOmCo8dMxm4hucL9fRf129c43VBV7qcPKBUkvl0SFgfmNMy58+/1ma3+t18zpQwSF21S26Qzc987lJ6ChZUmj43pyUaCWwkEWPZu5jA0MFKIT0jx6UllgO9TNAZ348pEv5bhDejg4Dm2JJFZIDxeZ/OGakN5LNBrH58Vd9qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IacqO61m; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21683192bf9so197800935ad.3
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 23:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736147831; x=1736752631; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hXA2uyplq/GPrIBSJVX4vva1/4ojI6IdPqHZvUaLyFw=;
        b=IacqO61mGP8kI71wqp9770MS1sOBKtL7jGU5mvBJQCfRzCUmMPNCDPp1TXjYNbVG30
         tpz0lLHeS0NYVL2ko3zXKhUlg5IJyGIiya3Xl7yNLFEb/BD3DFFC/mSSJ4Lk0lB7KZrx
         XV4ZJn7G7jwROHyXo7MqOAWghM8U0UbAaHMzHlx2l7yJ5ialv9NzAVDzkwW2mG0IDp5e
         xQOKkCb8FRk4NrzyByOmZOqiCwbRYvNyR3cgs/N+BBBLzTgwHliIcar4CUcL4x7HdfMV
         SreZ8UaVWsWJnRj8zdcCku65mOCdQ5KFGm0CzjHCL1Zs7CaYVXym+VErT8kvWe2VCuqM
         b+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147831; x=1736752631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXA2uyplq/GPrIBSJVX4vva1/4ojI6IdPqHZvUaLyFw=;
        b=PLb3aeJzaqciVzL0rz5i1d/y2pwNvQdrINu0THJQc1C2Yu7nE0r6GqVoxSe/l7sA7J
         Mt1ry6qudsByozZIDXenfgRgaiWpAiX8vZaBkbrENWkBygqUeZBy84Owrmxh7S/YnGrh
         +oJ5qRYZUQx1wmtRQi7q5vX/pT5/rXympw69lJfgDaaED+q+a/FyAcer1+RXfduaFPp2
         pYND44Yb+I4fN1lOEYK18zN7G8RJdxWWniVYvGEcZmgp39nwElJD39wN9zpK6WwuJQaf
         vfkz0MB5tQd7eCp0/mCWpKNxyEa8tadLc5Ez/zOXkTHxqwLN0pFDIEfhIvTcwaXDLTlP
         yyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuK59+dnhv9AmfQBmnNb+n2r7bN+JbokNstIekB8Ds8elvjLEWNeDQ8R0xeZVRM67ocT2x5N4+Fzm0yA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxim8B5majanV3GG4M2rBuW1cc/OumdY8I9fPURXbQIKSApRZma
	ULXywcazZ8pAsTEKmXvPRWcx5xWwHewI4SAYnyKEKg8ay2BOAoaY
X-Gm-Gg: ASbGncuWTqB94geX8uCfLLOBfdXzsLQqw8g3mnqZohEw+apDR1MRhzmnhx+7B6v2T+Y
	g+7JU7imcIjMPdKYZXFe7H5FHw942AaXO1buBnvmnKFazgBVcN9iBhfxvYJdvBoOsUd7YC+VUek
	ot4Q+axWJ5xbqvPWl/Qo0/BwZes9/EozGAOYX5Tb2cXiYUMJ8pk7Jh8EtVQ6FIdp9u+d3/xrcNz
	IAfhVu6zgajXg3GhWkeAiZ100+XtweVdDKKC1Kz+FrEhCFC4ZxgR3bQug==
X-Google-Smtp-Source: AGHT+IH4ThE59eollNTbZ+CfZMnSiAdCDFwkFvR9md3pm8OkHNaNj+ESuabcDlOaEAiHHCTVtzjHVQ==
X-Received: by 2002:a05:6a20:841a:b0:1dc:bdb1:349e with SMTP id adf61e73a8af0-1e5e047029fmr86439427637.17.1736147830675;
        Sun, 05 Jan 2025 23:17:10 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:6998:e192:65f1:e7c0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb7dbsm30556771b3a.133.2025.01.05.23.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:17:10 -0800 (PST)
Date: Sun, 5 Jan 2025 23:17:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Pavel Rojtberg <rojtberg@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 00/13] Input: xpad - sync with github fork
Message-ID: <Z3uDc9dGJgEOQym3@google.com>
References: <20250105193750.91460-1-rojtberg@gmail.com>
 <2025010649-rumble-embattled-7187@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025010649-rumble-embattled-7187@gregkh>

On Mon, Jan 06, 2025 at 08:09:26AM +0100, Greg KH wrote:
> On Sun, Jan 05, 2025 at 08:37:37PM +0100, Pavel Rojtberg wrote:
> > From: Pavel Rojtberg <rojtberg@gmail.com>
> > 
> > This updates the list of supported devices as contributed on github.
> > 
> > Andrei Ilyashenko (1):
> >   Input: xpad - add support for Xbox ONE liquid metal controller
> > 
> > Fernando Petros (1):
> >   Input: xpad - add support for Thrustmaster ESWAP X2 ELDEN RING
> > 
> > Greg Savage (1):
> >   Input: xpad - add support for PDP Mirror's Edge controller
> > 
> > Jack Greiner (1):
> >   Input: xpad - add support for wooting two he (arm)
> > 
> > Javier Zepeda (1):
> >   Input: xpad - add support for Nacon Pro Compact Model NC7271
> > 
> > Jocelyne Jones (1):
> >   Input: xpad - add support for SCUF Instinct
> > 
> > Kikismine (1):
> >   Input: xpad - add Hori Racing Wheel Overdrive for Xbox Series X
> > 
> > Leonardo Brondani Schenkel (1):
> >   Input: xpad - improve name of 8BitDo controller 2dc8:3106
> > 
> > Martin Stolpe (1):
> >   Input: xpad - add USB ID for Nacon Revolution5 Pro
> > 
> > Matheos Mattsson (1):
> >   Input: xpad - add support for Nacon Evol-X Xbox One Controller
> > 
> > Thijs Reus (1):
> >   Input: xpad - added Turtle Beach Recon support
> > 
> > Tobias Görgens (1):
> >   Input: xpad - add Black Shark Green Ghost controller support
> > 
> > jdarn (1):
> >   Input: xpad - add support for 8BitDo Ultimate bluetooth/hall effect
> >     variant
> > 
> >  drivers/input/joystick/xpad.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> How about just 1 patch updating this as giving credit through github
> accounts is going to be messy with bouncing email addresses and the
> like.

Yeah, I think this would be the best.

Thanks.

-- 
Dmitry

