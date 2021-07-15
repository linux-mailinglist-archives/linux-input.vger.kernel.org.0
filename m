Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40713CACF2
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344309AbhGOTsd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:48:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43342 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244046AbhGOTqy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:46:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF89461278;
        Thu, 15 Jul 2021 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626378240;
        bh=NHKr1EecKpqah9OK+5p0mSk4oHEPcCBlACibyugX2SA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=IvzG2Fy5kyIskNqdBYT1tCCJ05v+na5pG643gsrGVxENRfUbywTQLLtdNG4waB70R
         khXGM9eLvletPKo/NGi65lfAtepfnx3tPvzRNbbDNAvKfluR9q6UXsex0HX5iFQyRi
         Sqe9DtxnTiZOAxibxMvx0dCoc3MlB95AqGTOefwoh2hoJ4X1hzCY44l1NM4WxkvNsu
         q/thFVftBYZgTZR1OWlynbKXtUim6OvSxNjsPm3r/NZHvKtUezX3+7HIj40/idKQ3i
         gvKizQ6lwV9P09UPKm9GdaCXllLDFYi+UbsQ07j34L+ObFkmCN+BeVhz5H4VMzJPE8
         KNzALi5GkYbzw==
Date:   Thu, 15 Jul 2021 21:43:58 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pascal Giard <pascal.giard@etsmtl.ca>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org,
        Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
Subject: Re: [PATCH] HID: sony: fix freeze when inserting ghlive ps3/wii
 dongles
In-Reply-To: <CAJNNDmnnZYPEWJiEq6Th1wp1Oc3yyXhjPef+abWL+cTT-uEFiw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2107152143060.8253@cbobk.fhfr.pm>
References: <20210604161023.1498582-1-pascal.giard@etsmtl.ca> <nycvar.YFH.7.76.2106151053340.18969@cbobk.fhfr.pm> <CAJNNDmnnZYPEWJiEq6Th1wp1Oc3yyXhjPef+abWL+cTT-uEFiw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 13 Jul 2021, Pascal Giard wrote:

> We (Daniel and myself) have a patch that we want to submit that will add 
> support for the PS4 version of the Guitar Hero Live dongle ;-) IIUC our 
> patch should be against dtor/master and not Linus' tree.
> 
> However, we see that dtor/master is still behind, it does not include
> the fix. Is there something I need to do? Do I just have to be
> patient?

Just base the patch on Linus' tree, submit the patch to Dmitry and 
indicate that it's based on more recent upstream than his master. He will 
manage :)

Thanks,

-- 
Jiri Kosina
SUSE Labs

