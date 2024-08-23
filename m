Return-Path: <linux-input+bounces-5765-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75F95D1DE
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 17:44:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76AA51F24CF5
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 15:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21B818B47C;
	Fri, 23 Aug 2024 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2JJMKPg"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233F1885A0;
	Fri, 23 Aug 2024 15:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427689; cv=none; b=IHe5y8leNjxiwjFaFHFewET3MsXNscWZYm6cA9VXQvhEBphAkl/iM3cqBHa4J6m+ICwbZkZDiZ3ybWGj7BXQkwZI6ckE6MHh27CROm9fwS18wPDReDOHbZvM37Ldh41Z4qo3ZOjdec08jS2OpsFwyLJNS+Qq7yjdbRDtJeF5Olo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427689; c=relaxed/simple;
	bh=qP3S+M0CNpnU2TUfkRgYP57VQtavU5PL8tYvXdirsYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7fFCVPJ/dbVWh0BnnDkqPzht/0nUvxxbGjdhbDFW+3lgrBQWYGloe+abqpj6M6MCoEcsVUYsQNoKq7zpCxXYc+4UJtNRhfPEO0pBvHXjM63a50xP2gTbe/59CpGpohcJDzvHFIKzFoS/ikFDw/wNFxeDDopoC5y9BYKDkZZefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2JJMKPg; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7142a93ea9cso1668061b3a.3;
        Fri, 23 Aug 2024 08:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724427687; x=1725032487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjB9ZMnHKgYRM/l7XHxIgiTwIdgJ4z4hI/q0GewkKyo=;
        b=Z2JJMKPgm/l+uGwcmzfUmuQTprRXtpDDEAlTmVo9Zw2hJCl6xEvd1/vJAlSRTueCa/
         NevLmG2h4rE2onDP2qUUmZuYOwJgcBwMfWzDirJmbkX04t4GtEtF6f9/AHMblSxeLTLG
         fwtpklLokPQP5igravkIlgbPtxisANk+XZjcrzgiCY9cUNNCmvl8R1rKzQcgSJsj2iqM
         Udl+lsYkYbueadyVtZH3OP2qzf03LFTSFozWW+C7IOiZFlNuQEb1rVYVQe3Ylr315ao3
         iuYDu4WhCpynUsC7a6Ya7vXp0gHWyGqpmWqYrKSzIb4P8UmA1HgUPlcxydUq5vqCqhmW
         ivfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427687; x=1725032487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjB9ZMnHKgYRM/l7XHxIgiTwIdgJ4z4hI/q0GewkKyo=;
        b=ULigvQTP/BaIsbVNqozFyYBqdMbrTYvQvAR4ByYRojKGDq7CqwlMi7OZ3T7lUMz9G0
         14FHiRPyKSyz0eGDaiLF62N/JG52kbvg8W49XoFz94S4RcEVSibOYZovdR+HD9fH/bNV
         AWYzTGBEGddhED6xEZIbgNI/pQEJ1oXmMfWWOOPx5hFSZkhlkghZBo+32JBaa3sfHcVE
         +P/ieSOvkjBJsb4/3pvPZgNrJZG2hyNPfoqnjB281q4JSi6qzd4ivEnQ3Gd73TijBxGs
         glzH8nnU1wLXBPMHpqFqtYuoc/xj3KqRxeM7SKeJZYH8gvml851xt1TAdOVu9lf8bN5x
         SbEg==
X-Forwarded-Encrypted: i=1; AJvYcCUHg56ILwZ1VO59sYGAMN3nK9NZspf4+7XTqk01/afW90a6BrNb9qxft3HJqt2U316BifJAayiyOiIO@vger.kernel.org, AJvYcCVoV9+kAGVhgbQ08MquZP+3K8i8X+cDRukvigZeWIj3cgU3CUbnOfUDsSPZq5eQCZjSGdA/TFoEwzzfV2C++NdOUl0=@vger.kernel.org, AJvYcCX7FgqvoS3WRKd04EY2Em51hU3iwQcdBzVzrD7Qr6+RYFBmWreF32lkmacGwkiBwK9KvsNWW/zSWVGue9Q=@vger.kernel.org, AJvYcCXeo23jwlnE9tRSUVxdx2mgq5PNNortajSVtHqGL8GgoF5uiPvVHT4UzUm1p8U0nYdvvz9GCzmeW9gfWyY2@vger.kernel.org
X-Gm-Message-State: AOJu0YxJiBkc3L83Qnz1V2AhhyPFW9Ej/akt1kTtzUTLN8AYWRhI4y7z
	khn436hWEpn6DKfjMHU9OR0gyfJhi8N0eb0GW7RA99YTchOD9/Dx
X-Google-Smtp-Source: AGHT+IFuyqyaZHnTmSqiJ3FlOdH0Cc0Z5cRjdNS0bL90sFcrAxgdrMRqebKNcikPNQpMrVWtXPIGDQ==
X-Received: by 2002:a05:6a00:4f8d:b0:714:2d0d:8a90 with SMTP id d2e1a72fcca58-71445772525mr3202824b3a.9.1724427686966;
        Fri, 23 Aug 2024 08:41:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9acdcf7dsm2914549a12.50.2024.08.23.08.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:41:26 -0700 (PDT)
Date: Fri, 23 Aug 2024 08:41:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH 06/14] Input: samsung-keypad - use guard notation to
 acquire mutex
Message-ID: <Zsito5oUdhNBg6Nn@google.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-7-dmitry.torokhov@gmail.com>
 <e6xkutxnpu7acvm5qfyyces4estm4ihc3rzczqpnxrbrkptdm2@6lwrlssvtt3v>
 <Zsd-aVM6504L_hqi@google.com>
 <0afadefb-ecb1-4ec8-a862-bfa06d171457@kernel.org>
 <ZshJMRCe4LvpYNmZ@google.com>
 <e0f8dfd7-7232-4814-a5c9-58acd5c11d53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0f8dfd7-7232-4814-a5c9-58acd5c11d53@kernel.org>

On Fri, Aug 23, 2024 at 10:52:54AM +0200, Krzysztof Kozlowski wrote:
> On 23/08/2024 10:32, Dmitry Torokhov wrote:
> > On Fri, Aug 23, 2024 at 08:06:17AM +0200, Krzysztof Kozlowski wrote:
> >> On 22/08/2024 20:07, Dmitry Torokhov wrote:
> >>> On Thu, Aug 22, 2024 at 05:48:33PM +0200, Krzysztof Kozlowski wrote:
> >>>> On Sun, Aug 18, 2024 at 09:58:03PM -0700, Dmitry Torokhov wrote:
> >>>>> Guard notation is more compact and ensures that the mutex will be
> >>>>> released when control leaves the function.
> >>>>>
> >>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >>>>> ---
> >>>>>  drivers/input/keyboard/samsung-keypad.c | 8 ++------
> >>>>>  1 file changed, 2 insertions(+), 6 deletions(-)
> >>>>>
> >>>>
> >>>> You need to include cleanup.h (unless some other patch already did it
> >>>> and I missed it?)
> >>>
> >>> Guard for mutexes defined in mutex.h which is pulled in indirectly, and
> >>
> >> guard() is not in mutex.h and in general we are including headers for
> >> the things directly used in the unit.
> > 
> > Oh, but it is:
> > 
> > https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196
> > 
> > DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))
> 
> That's DEFINE_GUARD, not guard().

OK, I see what you mean. I believe that cleanup.h is too low level to
include directly by anyone who does not actually define a new guard or
destructor routine. The concrete implementations of needed guards and
all necessary support is pulled together with the headers defining the
primary objects (mutex, spinlock, etc).

Thanks.

-- 
Dmitry

