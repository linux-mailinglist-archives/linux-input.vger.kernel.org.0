Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC7D63081C5
	for <lists+linux-input@lfdr.de>; Fri, 29 Jan 2021 00:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhA1XVx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 18:21:53 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:15873 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhA1XVv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 18:21:51 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4DRc0h6RlLzCq;
        Fri, 29 Jan 2021 00:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1611876069; bh=IaZGKYf9z4iTIIgycj/Eo3UbzEm6A5CLDsdC7pIfpzU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lBBOhWEIHy4pzJTdCdB9vcFdJqTZzfWwLgpZ2sRUOmaiiDW49UoPjFAr8UZIm4dlx
         cqaU2vEwOt6q465n3F64sEFKBlkumUigP5ZRdOZJx9ZkI6Mu38XWxw6Y9lVLTI1cjQ
         LOpXHxhjDfC2q3+KcB1KnGzJ7vW44l+dZH4TcD3lBYFEBiMBPiYjgfzVHEwWO+y6DD
         07V2iZxBn1g19xCnW2Udgyag5qyOXo61Jg5O3VH+mw9jgskE6gMeRC1Dkr97fua4iy
         oAY+zyRsWEZ0VaPUeu+35+P0kZwcR8GHmFlwXSGwbAHRApSQr2BNuUuezpvToQThlP
         IWmPezOIO0svA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Fri, 29 Jan 2021 00:21:08 +0100
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [bug report] Input: elants_i2c - add support for eKTF3624
Message-ID: <20210128232108.GA11394@qmqm.qmqm.pl>
References: <YBKKePZ1VyZIbBCo@mwanda>
 <20210128130705.GA32681@qmqm.qmqm.pl>
 <20210128143726.GT20820@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128143726.GT20820@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 28, 2021 at 05:37:26PM +0300, Dan Carpenter wrote:
> On Thu, Jan 28, 2021 at 02:07:05PM +0100, Micha³ Miros³aw wrote:
> > On Thu, Jan 28, 2021 at 12:57:12PM +0300, Dan Carpenter wrote:
> > > Hello Micha³ Miros³aw,
> > > 
> > > The patch 9517b95bdc46: "Input: elants_i2c - add support for
> > > eKTF3624" from Jan 24, 2021, leads to the following static checker
> > > warning:
> > > 
> > > 	drivers/input/touchscreen/elants_i2c.c:966 elants_i2c_mt_event()
> > > 	warn: should this be a bitwise negate mask?
> > > 
> > > drivers/input/touchscreen/elants_i2c.c
> > [...]
> > >    963                                  w = buf[FW_POS_WIDTH + i / 2];
> > >    964                                  w >>= 4 * (~i & 1);
> > >    965                                  w |= w << 4;
> > >    966                                  w |= !w;
> > >                                         ^^^^^^^^
> > > 
> > > This code is just very puzzling.  I think it may actually be correct?
> > > The boring and conventional way to write this would be to do it like so:
> > > 
> > > 	if (!w)
> > > 		w = 1;
> > 
> > It could also be written as:
> > 
> > 	w += !w;
> > 
> > or:
> > 	w += w == 0;`
> > 
> > while avoiding conditional.
> 
> Is there some kind of prize for avoiding if statements??

Less LOC and an occassional puzzle, of course. :-) Considering your
examples below I can see where the check came from. I wouldn't object
to a patch changing the code or adding a comment on what it does (it
maps a selected nibble value (0..15) to a byte (1..255) spreading the
values evenly).

> > But, in this case, the warning is bogus. Because w | ~w == all-ones (always),
> > it might as well suggested to write:
> > 
> > 	w = -1;
> > 
> > or:
> > 	w = ~0;
> > 
> > making the code broken.
> 
> Yeah.  The rule is just a simple heuristic of a logical negate used
> with a bitwise operation.
[...]

Maybe it could differentiate between "|= !x" and "&= !x", the second one
being more suspicious? I must say that 'x | !x' idiom looks obvious
as other sigle-operator-letter misspellings ('x | ~x' and 'x || !x')
beg the question of why the constant wasn't used directly?

Best Regards
Micha³ Miros³aw
