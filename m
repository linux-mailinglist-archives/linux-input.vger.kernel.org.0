Return-Path: <linux-input+bounces-5517-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61BB794EEEE
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 15:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E231F21274
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 13:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085C817CA09;
	Mon, 12 Aug 2024 13:53:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B5E217C9EB;
	Mon, 12 Aug 2024 13:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723470815; cv=none; b=fMcTa0YH9Euf8Onhje1MvFq2PD0Ivo+2hYtBfGtTmJAacuvL73Fl2SQlGQXPtTkcIb8u2pRRlDySkcg51CU7UThbma6xsXe779mKHa+oxP0QxTyHBCsv39o3jSiozuypgnRn5lqnG9E6mpNzSYany+2ni260AGXpmMt3gTRLzcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723470815; c=relaxed/simple;
	bh=8VSdEML3eFk4s2ggy52pkHEj2PmBcDJu5mSKi+tVJX8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s1cU/8OMQSWlrSM4Qt/m1NIdk8nsX10rFEeEazZe42Oo5B1mtoxjgo0sWcEIyFV4M85PhpSYMUbI4cbzZ2cop5ZyINvdDc49gvDIbQFqA1l4eUGvpfRSBJpQVW2+0dD0z5BojjVsocxCAwossf3ilbbxofWBX7w1xetJfFlUgjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9815F92009D; Mon, 12 Aug 2024 15:53:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9104192009B;
	Mon, 12 Aug 2024 14:53:30 +0100 (BST)
Date: Mon, 12 Aug 2024 14:53:30 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Vojtech Pavlik <vojtech@ucw.cz>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [RFC PATCH 0/5] Removal of a few obsolete input drivers
In-Reply-To: <ZrmUnaLJ5Ft0_tst@google.com>
Message-ID: <alpine.DEB.2.21.2408121448250.59022@angie.orcam.me.uk>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com> <alpine.DEB.2.21.2408090122060.61955@angie.orcam.me.uk> <ZrmUnaLJ5Ft0_tst@google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 11 Aug 2024, Dmitry Torokhov wrote:

> > > I am wondering if it is not the time to retire bus mice drivers since
> > > they have been out of favor for close to 30 years, as well as 3 drivers
> > > for portables from late '90s to early 2000.
> > 
> >  Are these drivers broken, e.g. fail to compile or crash the system?  
> 
> I have no idea because I doubt that anyone has tested them since
> forever.

 What's the rationale for your conclusion?  How do you know nobody uses 
them?

> > Otherwise what's the gain from removal?
> 
> The same gain that we get from removing obsolete boards and
> architectures - less maintenance burden, less work when we need to
> change some APIs, less energy burnt by 0-day and other bots, CI systems,
> etc, compiling useless drivers over and over and over.

 Well, you don't have do do anything about these drivers, do you?  They 
don't scream for food.  And as to the energy, well I doubt this really 
matters, the amount is noise lost in the overall consumption.

  Maciej

