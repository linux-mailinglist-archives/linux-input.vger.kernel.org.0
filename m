Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F9A4372CB
	for <lists+linux-input@lfdr.de>; Fri, 22 Oct 2021 09:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhJVHfH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 03:35:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:48046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231758AbhJVHfG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 03:35:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF9EA60F22;
        Fri, 22 Oct 2021 07:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634887969;
        bh=oG6IPam6Jk0HBDw/7Km4rG1+mLwwj3InW6WH8nWo59o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=m6l6Md8ALsaEgSwm8dsHKzn6xnH4T0hiu25Lw0eq4X5KUWUS3f5IUTtBpsWI42zyZ
         Gia7sErbVtTiLbXMMjST6+nWrIU1yO7m0+GiLUZ0rqdswQDmp6o93aUw/w6hjpZZKr
         fC7yVjrRqeHrDoRJCEOyAURKlcLA780TAFaC/Wo1TYh49AENOK10RZShoClJSglEIN
         ldCS4O5882vvFqzxaey8ggOWts2YYeuX4kBZxePGWg7iQPgntvFbs9ZI1iJ+IEev/S
         QxUC+GdQFYXGb9kQ7uVHJls5S9E3aWRHQxQCheH1h3sbEO15O03UNqCsddXMEZCJud
         /f2azQDeHo8Dg==
Date:   Fri, 22 Oct 2021 09:32:45 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
In-Reply-To: <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2110220931190.12554@cbobk.fhfr.pm>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com> <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm> <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd> <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm> <20211022072115.GA25215@amd> <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Oct 2021, Jiri Kosina wrote:

> > > > > Ok, so let's put it in the common place. I'll take this patch through
> > > > > LED tree if you resubmit it. You still may want to use local defines
> > > > > so you can apply the other patches without waiting.
> > > > 
> > > > Pavel, why complicate it so much? Given how trivial the patch is, the 
> > > > easiest way is what's usually done in such cases (where substantial patch 
> > > > depends on a tiny trivial change elsewhere) -- take it through HID tree 
> > > > with your Reviewed-by / Acked-by:.
> > > > 
> > > > Do you see any issue with that?
> > > 
> > > Pavel, another week has passed. I am considering just including the 
> > > trivial LED #define additions and take them through hid.git unless I hear 
> > > from you today.
> > 
> > I'd prefer not to deal with rejects / common immutable branches / etc.
> 
> I am not proposing common immutable branch; and if there are going to be 
> trivial cotext conflicts because of that, those will be sorted out by 
> Linus without you even noticing.
> 
> > You don't _need_ the defines at all
> 
> As I've already pointed to you in several threads, we have quite a lot of 
> code queued that does depend on the defines.
> 
> > and you don't need them in the common place.
> 
> I compltely fail to see the point of having them teporarily local before 
> you manage to finally do something about the trivial addition to proper 
> shared header.
> 
> > Just merge the patch without the defines. I'll merge the defines. That 
> > seems like least complex solution to me.
> 
> That would cause my tree not to build.

In other words: could you please elaborate what exact issue are you trying 
to avoid by not providing your Acked-by: and letting it go through hid.git 
with all the rest of the code depending on it?

-- 
Jiri Kosina
SUSE Labs

