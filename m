Return-Path: <linux-input+bounces-4408-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4A90C994
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 13:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 195A2B29455
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 11:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A798B15B157;
	Tue, 18 Jun 2024 10:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="z0FXRA7O"
X-Original-To: linux-input@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A8C15B13D
	for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705434; cv=none; b=SoUTl/lFBUC+Kdb40xiap3p04zzTFbzH1+aHM8VuXWuPBVsR6KFMuEbhTmztj6ltgjkcI8R7elAJMcTDHN8YpLhd5JkpI56pfBZq0UKeLTXv5MfI9Spyr6/IQwa8O3hzdUk19c/pznKTIvq+qC6Yez6S+oqu4Tku5tKhRCoEMmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705434; c=relaxed/simple;
	bh=GN1+EIVCy65yZyaAPDr0TiNdQCqQGzw1AKr17kwmOo4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gznIFqPlLb7sECYhcZi/VAIoqg1eq3/g+uC99PBw5g8V+XYboteFCwxY0yJd55kdQ8RB6M2Q2njIRJJD4XMfFVAs1AhaArwY+BI3QkkW0PB+6uEQFceEtBkuzPFM3Nj/0SmoiHkM8l5d9+9VGvNC3d0arS6p55zs4fUY3LkOKgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=z0FXRA7O; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1BE041F932;
	Tue, 18 Jun 2024 12:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1718705426;
	bh=n65tQRB36mqSWHLBPOD2mpDrlsHeK0lEHCIKjvZbOko=; h=From:To:Subject;
	b=z0FXRA7ODOEvkhh6p6GcBLj9QYp2KRp5eELnvodgwzZNsavKxKIH0rEydQczsDSoT
	 p3I6s0Fy4KWCoDI3N3vDg7A84sjaiWJIwL0/IDN+n/VlwzlwQePhdfyA7Aj4EohaaK
	 vtEyzMLhQ1ne0Pj97qS+juhQnU44Wk9FdB86wZuqPiXQls2la/WfXPysKEAe4FjbBp
	 zhsHLOa3ZyDcyagRGvoXtb95WtoWE2ludR8BSj/UtA5upibinvx7RlEeHVTneXovfC
	 nHRcJpHBgskD7sAu8OMZtz4DfA2ZmgvW4e7juaqxDxY59E09gu0FPepx3iNqu4Zmpk
	 K5SlslClF25AQ==
Date: Tue, 18 Jun 2024 12:10:21 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, linux-input@vger.kernel.org,
	Stefan Eichenberger <eichest@gmail.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Re: Advise needed on stale patches
Message-ID: <20240618101021.GA10395@francesco-nb>
References: <20240315093307.GA5060@francesco-nb>
 <ZfSZDbyczmodyI_j@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZfSZDbyczmodyI_j@google.com>

Hello again Dmitry and Linux Input people,

On Fri, Mar 15, 2024 at 11:53:01AM -0700, Dmitry Torokhov wrote:
> On Fri, Mar 15, 2024 at 10:33:07AM +0100, Francesco Dolcini wrote:
> > Hello Dmitry and Linux Input people,
> > 
> > In the last months I sent (or was involved in) a couple of small patches
> > [1][2] (bug fixes or small addition to an existing driver) and they have
> > been around in the mailing list for quite some time (months, 2023-09-20
> > the oldest one).
> > 
> > I am not sure on how to progress here, therefore looking for some advise.
> > 
> > Maybe they did just fall through the cracks, in this case just take this
> > as a kind head up (or maybe those email did not pass some aggressive
> > spam filtering?).
> > 
> > Or maybe the changes are not deemed correct or something wrong was done,
> > and in this case it would be great to know what we could improve.
> > 
> > Or, maybe you just had other priorities (life and work are challenging
> > at times, I know), in this case, if possible, I would love to know if I
> > can provide some small help in any way.
> 
> Sorry, I am swamped with other projects. I just responded on the
> mailing list for the patch [2].

You got a new patch version 2 months ago and no comment afterward.

What about https://lore.kernel.org/all/20231222183114.30775-1-francesco@dolcini.it/ ?
Those are just a couple of small fixes that should be easy to provide a
feedback on, or eventually just apply? That one is on the LKML since
September 2023.

With that said, sorry for buggering you again, I understand that you
might have other project and priorities, however I do not know how to
move forward.

In the end what I am looking for is some guidance on what's the best way
to contribute in an effective way such kind of small fixes/improvements
to the Linux input subsystem drivers.

Thanks
Francesco


