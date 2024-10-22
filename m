Return-Path: <linux-input+bounces-7630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B119AB80B
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 22:56:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8EE4283129
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 20:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C491B1CCEDA;
	Tue, 22 Oct 2024 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ni7BJgHe"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383801CCB5E;
	Tue, 22 Oct 2024 20:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630563; cv=none; b=IvNNy+OgH8tbq8oSDPDa0Ny8yeotY4QaR9yRDyCPOea2mfDcu/fvD5I+IYdoK29fIhn4q4VadW8VhZb+IWrwC4tc9TuX/PEWczO1qEcJvwAVc3PGN0ZACAtiQqxdPnd+DBL+DUycGCHOPjyf0V/p3yuX1+GlwwORePRCV3//fb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630563; c=relaxed/simple;
	bh=0ESlIhjZd4HFCxmkBGZQtiRoShm8WNFaWATLsOata1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iG4SJFX7s3ZuGxie9uDMPkHNNgt3xhWieql8KdGfQzIflJGGXBHmQeh+OLfPCQmSAdzwHEOhtSSI+Q60cYnsk6N3SAtk215BNn39FFp4GiLkZrLDVYfmfUE14ofuxJRAljZKqoCWdfty+NdQKXaDMSl4ASWYQVrR/1QQ8KeXsto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ni7BJgHe; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2ed59a35eso4982986a91.0;
        Tue, 22 Oct 2024 13:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729630561; x=1730235361; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYqGf4Pwp6Jt9xviwyozADIX/pC+5pxs8oEKVNvbqAw=;
        b=ni7BJgHe1IK+pjRWznXj65vo96tqEfQqL5w3iWsDBut2FhsF1rTQCnzpVsSPoNaeka
         pMpRkKjdban7DCzfiorTS0zgepeAieMGkpMlZXZzRCsyItW5ChVUv2wPgpo3srFUfCEx
         j2G8ibtanUfq9pG9ZX0Wgg/OQqoA6YoM4ok54EzMWU3vSlDyskunp0IaP6yxAzpqPiGi
         UahUSxpMKaLLRDTIuoyWi3gbcQER57n4elE4FR7T21Dojxo2KdGhgQgdAJSPcaZfx3j5
         dERy/uRIwfWJh+gpkxPzNt4+xphi7sIDyVPpqZntMnKK1GkqZj5UyhD3ZQLDy4SAXIYj
         bLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729630561; x=1730235361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYqGf4Pwp6Jt9xviwyozADIX/pC+5pxs8oEKVNvbqAw=;
        b=qiQ+uAgADDUdCO/W4vNGTnlHPAus+szo665zbFjCJ9l+HMVAr3qjQ4strfYvijYLvm
         cdTm5qmk7t38ir0W4eK2FksV2/IBBWOn3EcHJ1jcHEJGkXxePF4q7AhIxEGtUA5lvQ1G
         DhlywhX/uRY5N28rFc2ZuuS6ZnuFibpAqkcwVpi3J6iqpqRYqAH8+KHGrDNJTbxacqei
         Zn8xUKo6CGTA0uIUK/jliPCvA6w64XsE38mVM5GHhEQ+iMtr0cTfETsYGfhVBKg8ludV
         2b12APar3PQAtkzbuUqniGLbfoHVik1tOy0qRgpuTF9emo9mSNrVqrdd0K7NDL2VnIaI
         jZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/oJ7ilCTEa0eZDqhUi0gjVewA07pV1L8kD6En+IAzcDux0CauMWCCFAEU8kZj5fA/f0+bwO1+19Vf2Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFL36EPoS1sFY40E0J/Uxavua5MZUSRKrktF7MdZS7LCwlZnLC
	X+YRtRNB472LhXtUIDjrlE2I+poKbgIOvR8sdKqWsvGFSWXLKmpM
X-Google-Smtp-Source: AGHT+IFcHmr9cL47HFX1FM/lsgz83ZL95h2v1Hm54hTESz1Kjk4m2VEDzmF8cdodsSHbUqKPrkWzlg==
X-Received: by 2002:a17:90a:8c08:b0:2e2:c40c:6e8e with SMTP id 98e67ed59e1d1-2e76b70c585mr250247a91.34.1729630561339;
        Tue, 22 Oct 2024 13:56:01 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:94ec:f4e5:1552:e2cc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389139sm6747254a91.30.2024.10.22.13.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 13:56:00 -0700 (PDT)
Date: Tue, 22 Oct 2024 13:55:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [RFC PATCH 0/5] Removal of a few obsolete input drivers
Message-ID: <ZxgRXmPZrhKUegon@google.com>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
 <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk>
 <ZrmUnaLJ5Ft0_tst@google.com>
 <alpine.DEB.2.21.2408121448250.59022@angie.orcam.me.uk>
 <Zro8fpgvqa74aki4@google.com>
 <alpine.DEB.2.21.2408131802050.59022@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2408131802050.59022@angie.orcam.me.uk>

On Thu, Aug 15, 2024 at 10:20:49PM +0100, Maciej W. Rozycki wrote:
> On Mon, 12 Aug 2024, Dmitry Torokhov wrote:
> 
> > > > >  Are these drivers broken, e.g. fail to compile or crash the system?  
> > > > 
> > > > I have no idea because I doubt that anyone has tested them since
> > > > forever.
> > > 
> > >  What's the rationale for your conclusion?  How do you know nobody uses 
> > > them?
> > 
> > Because they are either require ISA add-on cards and it is quite hard to
> > find devices that still work, and are supported by the current kernel,
> > or internal peripherals in devices that are no longer useful. Do you
> > expect anyone using "Gateway AOL Connected Touchpad" in the year of our
> > Lord 2024?
> 
>  Maybe, maybe not.
> 
>  I certainly use Linux with actual ISA hardware, i.e. systems with ISA or 
> EISA slots and option cards within, as well as other hardware dating back 
> to 1989.  I'm told people use Linux with m68k hardware going back in time 
> even further.  I don't use any of the bus mice themselves though (having 
> had perhaps a more common serial mouse instead), but if the drivers build 
> just fine, then I fail to see a reason to dump them.

OK, so here is an example:

https://lore.kernel.org/all/20241010194533.GA575181@bhelgaas/

We need to cleanup PCI core and the driver uses a hack. So we need
to patch it.

> 
> > > > The same gain that we get from removing obsolete boards and
> > > > architectures - less maintenance burden, less work when we need to
> > > > change some APIs, less energy burnt by 0-day and other bots, CI systems,
> > > > etc, compiling useless drivers over and over and over.
> > > 
> > >  Well, you don't have do do anything about these drivers, do you?  They 
> > > don't scream for food.  And as to the energy, well I doubt this really 
> > > matters, the amount is noise lost in the overall consumption.
> > 
> > I kind of do even if they did not require much involvement.
> > 
> > Let me ask this: why do you want to keep them? Do you know of a large
> > (or small) userbase of bus mice enthusiasts? Note that it would be very
> > easy to "git revert" the removal if someone actually needs this.
> 
>  There is burden involved as well as repo clutter from going through an 
> apply/revert cycle though.

You are assuming that somebody actually needs them and will have to
restore them.

> 
>  Sometimes we do want to discard code, because it causes burden elsewhere.  
> It was the case with the removal of support for the original 80386 CPU due 
> to its lack of user page write-protection in the kernel mode, which in 
> turn required us to have explicit checks carefully sprinkled throughout 
> and painfully maintained.  That hindered generic code and was a good 
> argument in favour to removal as soon as 80386 became unimportant enough.
> 
>  In this case the decision seems arbitrary, the presence of these drivers 
> does not hurt anything else.  I agree it might well be that nobody uses 
> them anymore (though someone may come across a relevant piece of hardware 
> anytime and wish to try it with Linux; I do it from time to time, and I 
> also have old stuff even I'd like to write entirely new drivers for if I 
> ever find some time for that, i.e. I have sorted higher priority stuff), 
> which I can sort of recognise as an argument in favour of discarding them.
> 
>  I'm not entirely convinced it's enough of an argument by itself, however 
> if there are other people who think otherwise, can we please at least do 
> it in stages such as some other projects do?  That is require an explicit 
> action for any interested party to keep the drivers enabled, say by hiding 
> them behind CONFIG_DEPRECATED or suchlike (with clear documentation saying 
> it's for stuff slated for removal), wait a year or two, and only if nobody 
> speaks out during that period, then actually retire the code in question?

I do not see how CONFIG_DEPRECATED help any better than revert. The
driver will disappear, people will start looking for it and will
complain on Linux Input/LKML. At which point we will revert either the
config change or driver removal patch.

If the argument that with config someone does not need git tree but
rather can work with a tarball I say I really do not care for this case.

> 
>  A part of the joy with Linux for me and I believe other people as well it 
> has been the ability to do odd stuff just for the sake of it.  It used not 
> to be business back in 1990s and it still not is, not at least entirely, 
> for such a Linux old-timer as I have now oddly enough become.

We are still willing to support old hardware, but only when it is
actually used.

Thanks.

-- 
Dmitry

