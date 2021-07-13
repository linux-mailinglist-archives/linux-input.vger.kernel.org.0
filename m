Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5CD3C76CD
	for <lists+linux-input@lfdr.de>; Tue, 13 Jul 2021 21:08:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhGMTLk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Jul 2021 15:11:40 -0400
Received: from relais.etsmtl.ca ([142.137.1.25]:50398 "EHLO relais.etsmtl.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229944AbhGMTLj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Jul 2021 15:11:39 -0400
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; d=etsmtl.ca; s=bbb; c=relaxed/relaxed;
        t=1626203329; h=from:subject:to:date:ad-hoc;
        bh=kCSZITT72SLEKJj7jLsnZk6GT7dAyDlxceBRcEj+gnA=;
        b=uCdr9cKMnoelyB5jXDWUk5MN/5Gu6SFQy2MFZVp4bNhXkF7GDyKklOFrWs6wsR/aj1YkfDF4uVH
        hPABYHqAlFAV1wBd79xtNPAGceii7cCV605X8iWaTh1BjU+eIG7p2b7WiTohu3D+WZmOL2V6Sejdu
        wlT72i13lB91x151irA=
X-Gm-Message-State: AOAM532lPMxI9kP7U135jVLBTnLQqN6vpBebHzi8VlUQjeM2GeNkAgK5
        /Nl7NEqPIi0mbIbrk55JVTS3kIsfyiGsMo8l2pc=
X-Google-Smtp-Source: ABdhPJxEzR38cLmUYCXDBs07JvA6IJpbDflOR26Bbj/5XeWzTbgEuwFsS6mvHN8AiSI2FFbHfGLLebbzb2wLkybyHcY=
X-Received: by 2002:a05:6122:17a7:: with SMTP id o39mr7035953vkf.25.1626203328382;
 Tue, 13 Jul 2021 12:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210604161023.1498582-1-pascal.giard@etsmtl.ca> <nycvar.YFH.7.76.2106151053340.18969@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2106151053340.18969@cbobk.fhfr.pm>
From:   Pascal Giard <pascal.giard@etsmtl.ca>
Date:   Tue, 13 Jul 2021 15:08:37 -0400
X-Gmail-Original-Message-ID: <CAJNNDmnnZYPEWJiEq6Th1wp1Oc3yyXhjPef+abWL+cTT-uEFiw@mail.gmail.com>
Message-ID: <CAJNNDmnnZYPEWJiEq6Th1wp1Oc3yyXhjPef+abWL+cTT-uEFiw@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: fix freeze when inserting ghlive ps3/wii dongles
To:     Jiri Kosina <jikos@kernel.org>
CC:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
X-Originating-IP: [142.137.250.50]
X-ClientProxiedBy: FacteurB.ad.etsmtl.ca (10.162.28.15) To
 FacteurB.ad.etsmtl.ca (10.162.28.15)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 15, 2021 at 4:54 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 4 Jun 2021, Pascal Giard wrote:
>
> > This commit fixes a freeze on insertion of a Guitar Hero Live PS3/WiiU
> > USB dongle. Indeed, with the current implementation, inserting one of
> > those USB dongles will lead to a hard freeze. I apologize for not
> > catching this earlier, it didn't occur on my old laptop.
>
> Applied to for-5.13/upstream-fixes branch, thanks.

Thanks Jiri!

I saw that it propagated to 5.13 and 5.12. It also made it to Linus'
tree, I can see it in his master branch.

We (Daniel and myself) have a patch that we want to submit that will
add support for the PS4 version of the Guitar Hero Live dongle ;-)
IIUC our patch should be against dtor/master and not Linus' tree.

However, we see that dtor/master is still behind, it does not include
the fix. Is there something I need to do? Do I just have to be
patient?

Best regards,

-Pascal
