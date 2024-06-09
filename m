Return-Path: <linux-input+bounces-4272-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDDA901854
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBDC31F2118C
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 21:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE38B4E1C8;
	Sun,  9 Jun 2024 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtvHpyYv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D21865C;
	Sun,  9 Jun 2024 21:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717969281; cv=none; b=kJ+dIs4WzvDa5fy1x9PLU67eELtxRgYVW9867Yn8Glwq7s5GPfwCGBoldHZTa9XZG2IgDvUEUYNUWWbTWiUVRa9e/euzKkgVeMNYk5ZXRGtKDQrM68TphcK7qHDXZihXc6Jab/nRzDP4Ek8tkdrBqHfb0MCW/fnWjtpvb9Mpex8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717969281; c=relaxed/simple;
	bh=kRTX5mjZmUNWGLllyyHVNH3c1pTK9xaLXWAa/EivX3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WblZyi18t/z9GVB9VIyRMWxE3h2ooNmnrOseUT9ebAnj59Gft1mGvp3unFzFnBZILPNI9LdKsHl82B/SIyV3RkkwX0L1vWqshI5dJJ6OETZNaPjK92MS3yB+F1oziWe6maZCIqgMem+PEH11uzvRhR1ZegKNuORMta39W2Bs9Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtvHpyYv; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-37594abcee7so5972275ab.0;
        Sun, 09 Jun 2024 14:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717969279; x=1718574079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mcjlMxR8WC9GvF7wR1CGHb3xg0yhlQrP3Q+QhW8JPRs=;
        b=XtvHpyYvYdcLaU9a7sIxY8flkiDUSfnLneBTBYKEtauMZSCwsX/M9G9I8H6jbocosM
         A66puiYlC4BsERxyEqsZL5MsaJflbm/2UxbHjTcgK4+9HjlYhqRfhWp/oOM3GpZpc5fx
         tnqiIaa3p7qflt+i3Mde7haJHZC3mq1E1XIeMCLuY4uGSrRax67C4QVB4vC0pzoReROG
         ziuVZqNLPEgVJ6ptNglgUyF3zgsj+2/D+pxgR/JlZNqT0SN+f5Oxk9Gxec/9BJTZjfgw
         rSMO8Xyw7QE4sJU5896PAVF0kxAT6ZzxlM4QwIStgpFvhO4exRoorj7VEbk8lFriE8zC
         MsHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717969279; x=1718574079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcjlMxR8WC9GvF7wR1CGHb3xg0yhlQrP3Q+QhW8JPRs=;
        b=TnMrWwUHsHLUunr3AFjVGdhod8sI1n46u2r10e9lDRTBHW4iNC2NJe2NuxXLt+i/D2
         CKJkGJR2ZUk/1MXUXi821RPA3gZpLAVyhDT5jDkObHEhbwNV3KPP/gYnTaTB23e0tpTc
         7tQ/WmVhxoRDUpQ6VR9q/FatB2qnXSU8/hkyE6pvuIJ+nuvFv7T3NZ7vOTKESK5RJjFl
         IIZfPC2BU2m+5e/CFFcwMXkqK6M9XQdEXQX7L0lF5fBc0OnmZTtgOQv9mrNq/tPW4Kg6
         t1I0QttzeGZKaw8okqNu+Gp/aKN2xzy7/ZuYs8UrcNeDnNKgdVmF/4dzJ0JH4QejNhqK
         cgaA==
X-Forwarded-Encrypted: i=1; AJvYcCWDshg2KkbhQKGobaGQaAzhMPXZK5XlHEmdlqS/498GBQTwYjLeu6ws4UuvS7HGHz9W1fgg/lGDapXiIlHZlfRf1nBuUVuFZQrnQNism6cEDUORSxlo6W+oMbdCeax+6rX4mVeu3hAKKpxkQatPA5drRA0ExdZqPPI3oudPjawJhv3i1mvi2He/hnM=
X-Gm-Message-State: AOJu0YxnZfXAo8VWdWHHB5hQHv2y/J8K3WjcO7LJH//Z33gP1mPqMvtu
	6A4TCYymp1jTPXTOLz1vydCqQ5scXNFqXxDv+RU77L39i43GT/D5
X-Google-Smtp-Source: AGHT+IG6YLP9mR9wBI7joN7g3FWK9wAdt5wGRHlhq8r+NXoPDq8kp2OdWVqpdrh0BzbfcOM1WuYOog==
X-Received: by 2002:a92:cdaf:0:b0:374:a963:be9b with SMTP id e9e14a558f8ab-37580331e2cmr105686145ab.12.1717969279412;
        Sun, 09 Jun 2024 14:41:19 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6e3575b6c73sm3549648a12.78.2024.06.09.14.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 14:41:19 -0700 (PDT)
Date: Sun, 9 Jun 2024 14:41:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Erick Archer <erick.archer@outlook.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Vicki Pfau <vi@endrift.com>,
	Brenton Simpson <appsforartists@google.com>,
	Max Nguyen <maxwell.nguyen@hp.com>, Carl Ng <carl.ng@hp.com>,
	Matt Scialabba <matt.git@fastmail.fm>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Input: joystick - use sizeof(*pointer) instead of
 sizeof(type)
Message-ID: <ZmYhfNmyjX6OiJP4@google.com>
References: <AS8PR02MB7237FEA55FAC8A9453F2DA6F8BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR02MB7237FEA55FAC8A9453F2DA6F8BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>

On Sat, Jun 08, 2024 at 05:13:57PM +0200, Erick Archer wrote:
> It is preferred to use sizeof(*pointer) instead of sizeof(type)
> due to the type of the variable can change and one needs not
> change the former (unlike the latter).
> 
> At the same time refactor the code to not use assignment in "if"
> conditions.
> 
> This patch has no effect on runtime behavior.
> 
> Signed-off-by: Erick Archer <erick.archer@outlook.com>

Applied, thank you.

-- 
Dmitry

