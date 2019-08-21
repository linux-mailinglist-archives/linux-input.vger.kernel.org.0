Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D382297803
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 13:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbfHULhV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 07:37:21 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:51233 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfHULhV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 07:37:21 -0400
Received: from [192.168.1.110] ([77.2.122.154]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MEmtx-1i2qxq3AXj-00GHHv; Wed, 21 Aug 2019 13:37:09 +0200
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 2/2] drivers: input: mouse: alps: drop unneeded likely()
 call around IS_ERR()
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net
References: <1566298572-12409-1-git-send-email-info@metux.net>
 <1566298572-12409-2-git-send-email-info@metux.net>
 <20190820111719.7blyk5jstgwde2ae@pali>
 <02f5b546-5c30-4998-19b2-76b816a35371@metux.net>
 <20190820142204.x352bftlvnb7s57n@pali>
Organization: metux IT consult
Message-ID: <2cd7178e-9713-7678-a02d-dde91e990c1e@metux.net>
Date:   Wed, 21 Aug 2019 13:37:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190820142204.x352bftlvnb7s57n@pali>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TAM1S1diYp1x9eYX3uAvyZMSjHGQSUnUc1WSjiNRocDkmneY3z0
 iXGpXmT1t2oyCz25vKG8Y6k73a4SVxurukNsHHcpLnYsf3xT/CACA1PIZoz9t4/ZHw2NPQv
 bEz28CK1uMnfHL2hWdEgJYdtZFI2guJPEO7blvOtHkh6qZH3VEfNA1xdjYIUEVvPGNgVImd
 iaYmz6eLxcUFsX4ZVbJWg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9eE30JboH3Q=:m0XNk5lqcwxYcs38IkYSz0
 s5btQg24tWKE1ZN2aB/frmeLpCh1qytc6l4d2WnDlqPNZNeI4+kptRhJW/uJxL9Md8UJGHLIZ
 idyXKUyLjqZmL2zScviARSetepvK5DzGY0GYQVENhjnv99vvSnrhTzxVYRCkyWZFGlWCOCcj8
 79PO6s0b72W/Bv7tA6gfWVeVhyUMtZaUU8WkRRFj/IqdCaaeHQl3BHWLGNdL3iT6RCxNn+eaz
 hcp9cyuUgwVXTIb7JPJdPp8v8owDjRxqWBwF496ZOhblgrryfumOsthUkm0S3BW8fHUeAd4q/
 y9RrjdPdEcdwlyfcboj2+fppz4Rggjrj+INLGDcQKZxDn2gKL6ly23bojt3z5/eOPlsvVDeI7
 KzUjp2jmKYB1MBI9nFB08NeJkxXmJFXLsR1bWvE2/vsS/pZmJp5XoFLlbuJmGElfamOrJkXKO
 7fIgxZsUSDAukblKdkooJgvbzFaQpQocoplEyhzlhpiO4f7mocYJ0gUo6IIjCiHDnLhBOx+YU
 dzP/m5qeacJimpZUebMsGXHsr/v/Ycc1tFV8HnU/KUa3On7s5OQE1BaAHqA4VTccmNAVA34fX
 nkU4x8mq0op/z5NRbKA/IcXWt51iFKb9dIk/KO4DDWETOecFzOnhbRrfAcwGBWAcScywgQSok
 KHd6BbV3j/pLbE+5hmDbnWkupOo8q4ueH6vmny3Q0Q+wEl2RcTH3XSj/V1YN2US6SRmuzCUl3
 Ob4A8PqzIbXp321LyAArYddZXW9Kd31isTcgb4Hks6QfLRAL+5DnMA1ERQw=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20.08.19 16:22, Pali Rohár wrote:

Hi,

>> In that case, wouldn't a comment be more suitable for that ?
> 
> And why to add comment if current state of code is more-readable and
> does not need it?

Readability is probably a bit subjective :p

With ongoing efforts of automatically identifying redundant code pathes,
the current situation causes the same discussion coming up over and over
again. Sooner or later somebody might get the idea to add a comment on
that line, that it's exactly as intented :o

OTOH, I'm unsure whether it's important to document that is particular
error path is unlikely, while we don't do it in thousands of other
places. IMHO, error pathes are supposed to be unlikely by nature,
otherwise we wouldn't call it an error situation ;-)

> People normally add comments to code which is problematic to understand
> or is somehow tricky, no so obvious or document how should code behave.

Yes, but isn't this case so obvious that it doesn't need any
documentation at all ? Is it so important to never ever forget that this
particular path is a rare situation ?

I might be wrong, but IMHO the likely()/unlikely() macros have been
introduced for optimization (better pipeline optimization for the
frequent cases).

> People first need to understand that static code analysis cannot work
> 100% reliably and always is needed to properly review changes.

Yes, but we see that this particular case is coming up again and again,
from different people, who can't know the background of this (nobody
can read the whole lkml and remember everything). This could be
prevented by adding a comment on that line, but then the macro call
just for documentation wouldn't be necessary anymore.

> And if the only reason for this change is to satisfy some static code
> analysis program,

Actually, it's more for people who're using the tools for the purpose
of tidying up the code and find potential problems. They need some
information to act on properly, which is currently missing ...

> would not it better to teach this program to no
> generate such false-positive results?

Okay, but how to do that practically ? There's no information in the
code which neither some tool nor any human could recognize this false
alarm. That information is just in your brain, now also in mine, and
the other folks who previously proposed the same change (assuming they
still recall it after years).

Blacklisting doesn't seem to be a good idea in the long run. Once going
that route, such blacklists grow quickly and get hard to maintain (we
now have two entirely separately maintained data sources that need to
be synced manually, when something changes).

I believe the code should be kinda self-documenting, so the reader
shouldn't need any detailed special knowledge to understand it. IMHO,
when such discussions on actual implementation details come up, the
code isn't expressive enough.

How can we improve the situation ?

Shall we consider introducing yet another macro (explicitly different
name) for stating/documenting such cases ?


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
