Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A567E432EF3
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 09:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhJSHH4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 03:07:56 -0400
Received: from mout02.posteo.de ([185.67.36.66]:40953 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234476AbhJSHHz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 03:07:55 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id B8E3F240106
        for <linux-input@vger.kernel.org>; Tue, 19 Oct 2021 09:05:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1634627140; bh=27DwBM89UVO58vt3UU6C+FH9Qv5HaDXJ9yANwxcIR0I=;
        h=Date:From:To:Cc:Subject:From;
        b=ebMdlDMuiol6TyiKjOMKfOM1DxNbbuAF2JRl9/auy8SlhM/F3Mz1iJpIKoysxLdd5
         sK+giteF1tE7ofcH7QaIQD4XFNn4lLL7Ogk2QtoHzGglAk3KjaEqaaUG9KutCBwUOo
         Ek8dDId5PaaSxs5+kpZtTAPaaP5mgCV1N+oAczHURNRb6hdt3fh517r3DgUtrGUgbs
         uTZHa2nsd2SAuiNxVvcl16GaLSAeYqwGKkeZbdifCIKhF7AV4Tg0O4I6/5tzri5r8k
         e5N05tA29p+a9Dm7yR0SKBRTRPhoqANvfoOEaXVuLnLkwxv+GPenFCn88PdSWsUH4F
         PBTUQflv6WNEg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4HYPsG6Dg8z6tmX;
        Tue, 19 Oct 2021 09:05:38 +0200 (CEST)
Date:   Tue, 19 Oct 2021 07:06:14 +0000
From:   Julian Weigt <juw@posteo.de>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     =?utf-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Alex Henrie <alexhenrie24@gmail.com>,
        linux-input@vger.kernel.org, benjamin.tissoires@redhat.com,
        hadess@hadess.net, jslaby@suse.cz, lukas@wunner.de
Subject: Re: [PATCH 3/3] HID: apple: Bring back flag for Apple tilde key quirk
Message-ID: <20211019070614.grwvzwjgz4pf334j@julianhome>
References: <20211008073702.5761-1-alexhenrie24@gmail.com>
 <20211008073702.5761-3-alexhenrie24@gmail.com>
 <20211009184051.GA72740@elementary>
 <nycvar.YFH.7.76.2110181728030.12554@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2110181728030.12554@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Oct 18, 2021 at 05:29:53PM +0200, Jiri Kosina wrote:
> On Sat, 9 Oct 2021, José Expósito wrote:
> 
> > > Some Apple ISO keyboards have a quirk where the backtick/tilde key is
> > > swapped with the less-than/greater-than key. Unfortunately, there is no
> > > perfectly reliable way to detect whether a keyboard has the quirk or
> > > not, but the quirk appears to only be present on models that support
> > > Bluetooth, and the affected keyboards usually report country code 13 in
> > > the HID descriptor.
> > > 
> > > Therefore, the best we can do is to change
> > > /sys/module/hid_apple/parameters/iso_layout to a ternary:
> > > 
> > > 0 = Not ISO or ISO and not quirky
> > > 1 = ISO and quirky
> > > -1 = Guess based on product ID and country code
> > > 
> > > Table of keyboards I have tested:
> > > 
> > > Product    Model  Shape  Labels      Bus  Country  Quirky
> > > =========================================================
> > > 05ac:0201  M2452  ANSI   Usonian     USB  0        No
> > > 05ac:020b  A1048  ANSI   Usonian     USB  0        No
> > > 05ac:020c  A1048  ISO    Québécois   USB  13       No
> > > 05ac:0221  A1243  ISO    Norwegian   USB  13       No
> > > 05ac:0221  A1243  ISO    Portuguese  USB  13       No
> > > 05ac:0221  A1243  ISO    Swedish     USB  13       No
> > > 05ac:0221  A1243  ISO    Swiss       USB  13       No
> > > 05ac:022c  A1255  ANSI   Usonian     BT   33       No
> > > 05ac:022d  A1255  ISO    Hebrew      BT   13       Yes
> > > 05ac:022d  A1255  ISO    Québécois   BT   13       Yes
> > > 05ac:022d  A1255  ISO    Spanish     BT   13       Yes
> > > 05ac:023a  A1314  ISO    Russian     BT   13       Yes
> > > 05ac:023a  A1314  ISO    Swiss       BT   13       Yes
> > > 05ac:024f  A1243  ANSI   Usonian     USB  0        No
> > > 05ac:0250  A1243  ISO    British     USB  13       No
> > > 05ac:0250  A1243  ISO    German      USB  13       No
> > > 05ac:0250  A1243  ISO    Italian     USB  13       No
> > > 05ac:0250  A1243  ISO    Québécois   USB  13       No
> > > 05ac:0251  A1243  JIS    Japanese    USB  15       No
> > > 05ac:0255  A1314  ANSI   Usonian     BT   33       No
> > > 05ac:0255  A1314  ANSI   Taiwanese   BT   33       No
> > > 05ac:0255  A1314  ANSI   Thai        BT   33       No
> > > 05ac:0256  A1314  ISO    Arabic      BT   13       Yes
> > > 05ac:0256  A1314  ISO    French      BT   13       Yes
> > > 05ac:0256  A1314  ISO    German      BT   13       Yes
> > > 05ac:0256  A1314  ISO    Norwegian   BT   13       Yes
> > > 05ac:0256  A1314  ISO    Spanish     BT   13       Yes
> > > 05ac:0256  A1314  ISO    Swiss       BT   13       Yes
> > > 05ac:0257  A1314  JIS    Japanese    BT   15       No
> > > 05ac:0267  A1644  ANSI   Usonian     USB  33       No
> > > 004c:0267  A1644  ANSI   Usonian     BT   0        No
> > > 05ac:0267  A1644  ISO    British     USB  13       Yes
> > > 004c:0267  A1644  ISO    British     BT   0        Yes
> > > 05ac:0267  A1644  ISO    Swiss       USB  13       Yes
> > > 004c:0267  A1644  ISO    Swiss       BT   0        Yes
> > > 05ac:0267  A1644  ISO    Québécois   USB  13       Yes
> > > 004c:0267  A1644  ISO    Québécois   BT   0        Yes
> > > 05ac:0267  A1644  JIS    Japanese    USB  15       No
> > > 004c:0267  A1644  JIS    Japanese    BT   0        No
> > > 05ac:029c  A2450  ANSI   Usonian     USB  33       No
> > > 004c:029c  A2450  ANSI   Usonian     BT   0        No
> > > 05ac:029c  A2450  ISO    Spanish     USB  13       Yes
> > > 004c:029c  A2450  ISO    Spanish     BT   0        Yes
> > > 05ac:029c  A2450  JIS    Japanese    USB  15       No
> > > 004c:029c  A2450  JIS    Japanese    BT   0        No
> > 
> > You can add to the table:
> > 
> > 05ac:0267  A1644  ISO    Spanish     USB  13       Yes
> > 004c:0267  A1644  ISO    Spanish     BT   0        Yes
> > 
> > Tested here and it works as expected, both over USB and bluetooth,
> > thank you very much for fixing it!
> > 
> > It's a pitty that we need to add a configuration option, for many users
> > it is not going to be easy to discover it.
> > 
> > macOS doesn't have this issue, so there must be a way of detecting the keyboard
> > layout... Unless they apply the quirk on user space checking the selected
> > keyboard layout and language in settings.
> > I bought ANSI English keyboard to see if I could figure out where is the
> > difference but no luck so far.
> > 
> > For what it's worth, Tested-by: José Expósito <jose.exposito89@gmail.com>
> 
> Alex, could you please add the mentioned device IDs, include José's 
> Tested-by: and resend, so that I could apply it?
> 
> Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs

I also tested
 
05ac:0267  A1644  ISO    Finnish     USB  13       Yes
004c:0267  A1644  ISO    Finnish     BT   0        Yes

With USB it still works out of the box. With BT the guessing goes wrong, but setting iso_layout to 1 works now, thanks!

Best, Julian
