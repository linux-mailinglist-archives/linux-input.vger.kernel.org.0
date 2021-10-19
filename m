Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED5264332C2
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 11:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234914AbhJSJqi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 05:46:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:53666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234680AbhJSJqe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 05:46:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26C0C60C51;
        Tue, 19 Oct 2021 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634636662;
        bh=eqM62DUEKDXNjKrSmHtqURLPJJI+1JSEB59RabxwrmE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Vc51twLIb3g0bRaHLtYNZ1/xdEX46nulKcLzmEJOyvXtgDiM5USI6c3cAe+bwadji
         bqqikUNNsl/auDaAgdeK4G6MHMb2rD1b0J4IPhLhMuwmn8k6EGojYxyGLjbCwl4ZMz
         8Oa6LHQT+UGfoUY5/AJ99vvJ5Wd2KRAO2yzqqIBpqddkHD+y58Bk22Yd+Y7ju1R1ZD
         gOZMr6q7aFTHQ0OAPWAwHaNbqbEYkbN8PqJeh3EveT7ye1BnmYvHFvAv8i/eM3Vtic
         SFT9gX8PairWzlF/XjcxGoaw/vVgz84n/vVNn7TI+oUP39dS7+NLH6PwBib+yO69pK
         dJJdLXsbNFAnQ==
Date:   Tue, 19 Oct 2021 11:44:15 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v16 00/16] HID: nintendo
In-Reply-To: <nycvar.YFH.7.76.2110191054080.12554@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2110191142160.12554@cbobk.fhfr.pm>
References: <20210911173639.5688-1-djogorchock@gmail.com> <nycvar.YFH.7.76.2110191054080.12554@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 19 Oct 2021, Jiri Kosina wrote:

> > Rebased onto Linus' tree (sha 926de8c4326c14fcf35f1de142019043597a4fac)
> > Depends on Roderick's patch to add the player LED defines:
> > https://patchwork.kernel.org/project/linux-input/patch/20210908165539.3102929-3-roderick.colenbrander@sony.com/
> 
> I just got Ack for the joydev part from Dmitry.
> 
> v16 is now queued in hid.git#for-5.16/nintendo

Benjamin noticed that I pushed wrong version of the branch -- the one that 
still doesn't contain the LED_FUNCTION_PLAYER[1-5] defines, which I've had 
staged here locally, waiting for Pavel's Ack (which is taking time, 
unfortunately).

So please ignore this branch for now, I'll push v2 once that situation is 
cleared out.

CCing Pavel as well here to make him aware of the issues this is causing 
all over the place (see .e.g my mail [1] from yesterday).

[1] https://lore.kernel.org/all/nycvar.YFH.7.76.2110181739310.12554@cbobk.fhfr.pm/

-- 
Jiri Kosina
SUSE Labs

