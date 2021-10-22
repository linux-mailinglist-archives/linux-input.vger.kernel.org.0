Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94BBE4372BD
	for <lists+linux-input@lfdr.de>; Fri, 22 Oct 2021 09:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhJVH3a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Oct 2021 03:29:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:47086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231334AbhJVH33 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Oct 2021 03:29:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F0A2060F46;
        Fri, 22 Oct 2021 07:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634887632;
        bh=dzqi7vFMuKP+qh6hHtsilh+1qXu9+uZu4RceOFaDhPs=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=m3ZqrcYmmw8AP/B8mqIGND2ZFwuU+/JnDkYfwjDS6AdpCcWt6dlBjOTe3qeEOIS5s
         1pMKZEW+nHzlXshawJp+D1uFRH0cZZWr5fG6gRGsSGtbMmaDNO7SDkG8WJ4bOXrI3C
         BUEnDRPxWMZlM0u9OYjMu0NbDnySb5oFz40lZRmsT0t9jWfPPPIeEYHrBNoCrcNkOc
         mW0QqBwWgw8W7sgzTTxYdaWt0QdAU+Y8yMm6FtVzUnH0bP7pp18Vq3X9bulzGy4FJ/
         iaRI/21fsVKDukBKeMVdEBNtw/+KaiU78QEi7NJO5EnnYiQdqAECkOT2KbRM4gyejP
         +0sB3qSiD0dSg==
Date:   Fri, 22 Oct 2021 09:27:08 +0200 (CEST)
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
In-Reply-To: <20211022072115.GA25215@amd>
Message-ID: <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm>
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com> <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm> <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
 <20211013074849.GA10172@amd> <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm> <20211022072115.GA25215@amd>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 22 Oct 2021, Pavel Machek wrote:

> > > > Ok, so let's put it in the common place. I'll take this patch through
> > > > LED tree if you resubmit it. You still may want to use local defines
> > > > so you can apply the other patches without waiting.
> > > 
> > > Pavel, why complicate it so much? Given how trivial the patch is, the 
> > > easiest way is what's usually done in such cases (where substantial patch 
> > > depends on a tiny trivial change elsewhere) -- take it through HID tree 
> > > with your Reviewed-by / Acked-by:.
> > > 
> > > Do you see any issue with that?
> > 
> > Pavel, another week has passed. I am considering just including the 
> > trivial LED #define additions and take them through hid.git unless I hear 
> > from you today.
> 
> I'd prefer not to deal with rejects / common immutable branches / etc.

I am not proposing common immutable branch; and if there are going to be 
trivial cotext conflicts because of that, those will be sorted out by 
Linus without you even noticing.

> You don't _need_ the defines at all

As I've already pointed to you in several threads, we have quite a lot of 
code queued that does depend on the defines.

> and you don't need them in the common place.

I compltely fail to see the point of having them teporarily local before 
you manage to finally do something about the trivial addition to proper 
shared header.

> Just merge the patch without the defines. I'll merge the defines. That 
> seems like least complex solution to me.

That would cause my tree not to build.

-- 
Jiri Kosina
SUSE Labs

