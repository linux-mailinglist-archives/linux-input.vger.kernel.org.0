Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C6B439292
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 11:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232684AbhJYJjM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 05:39:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:53062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232654AbhJYJjJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 05:39:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 853B860EFF;
        Mon, 25 Oct 2021 09:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635154607;
        bh=g8bY25dLS02+QAC7q/CdfhPVLD4w2MgXvkpSEHqQ4b0=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=pPrMRfiPCS89uEbQhCP0gBs2mxM46TubEb+inOFGhmaaVq5BOp2ol5cvXQrEOMyd9
         KzSaaJU87mkgpaLr7nW8D8rZTgv2H1yHUaLJZ2pYGg6V2vwerB/cH9Qk6p+HvDfvp6
         CX555o5kpwYC9Thu5zC2wk6uEQtwdMX46n4rpuvVQYbyaECt+5C8A8naO9OzQUb5To
         qQULqs7/WT2X4FKLcaM71cudq6BK4AbVdyU84NeSTOJyMJiOK/KssP0+gXLNaOEuPE
         sVzfy3LgsRQWK/16RH7aj0rJJEtbjc/wGhaUY+ktPyJmOqjTn8LGNrv3x3G9w8tVnj
         4X4O8SngUUvAg==
Date:   Mon, 25 Oct 2021 11:36:43 +0200 (CEST)
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
In-Reply-To: <20211025091929.GA5878@amd>
Message-ID: <nycvar.YFH.7.76.2110251127380.12554@cbobk.fhfr.pm>
References: <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm> <20210927141109.GB5809@duo.ucw.cz> <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com> <20211013074849.GA10172@amd>
 <nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110220840340.12554@cbobk.fhfr.pm> <20211022072115.GA25215@amd> <nycvar.YFH.7.76.2110220924340.12554@cbobk.fhfr.pm> <nycvar.YFH.7.76.2110220931190.12554@cbobk.fhfr.pm>
 <20211025091929.GA5878@amd>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 25 Oct 2021, Pavel Machek wrote:

> > In other words: could you please elaborate what exact issue are you trying 
> > to avoid by not providing your Acked-by: and letting it go through hid.git 
> > with all the rest of the code depending on it?
> 
> I'm trying to avoid merge conflict.

What's wrong with this kind of conflict?

That's what linux-next is for; if there is a conflict, we'll be notified 
and if needed and we could indicate this to Linus during merge window. The 
trivial ones he resolves without any issues. And we'll know exactly what 
kind of conflict (if any at all) is there beforehand from linux-next.

> I believe open-coding string for a while is acceptable price to pay for 
> that, and I'd prefer that solution.

I don't. It's a mess. If you'd then for some reason change your mind on 
the last minute and did the numbering differently in your tree, it will go 
by unnoticed, while when the real conflict happens, it'll be a clear sign 
that there is a thing to resolve.

Conflict is not a bad thing per se that needs to be avoided at all costs.

Conflict clearly shows the dependency between the trees and is trivially 
resolved.

> If you can promise that no conflicts or other problems will happen for 
> either me or Linus... 

Linus doesn't care about this kind of hypothetical conflict if there is a 
reason for it, and he resolves them on a daily basis, just check the git 
history.

> go ahead and merge the patch.

Can I take this as your Acked-by: then, so that I can finally apply it and 
get the needed linux-next coverage before merge window opens?

-- 
Jiri Kosina
SUSE Labs

