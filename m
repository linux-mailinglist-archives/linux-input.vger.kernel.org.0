Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C75391A96
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234929AbhEZOqn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 10:46:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234933AbhEZOqm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 10:46:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 505E5610A2;
        Wed, 26 May 2021 14:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622040311;
        bh=0zJARNd7izNJmiAbZ7tNK6q3qzWS/FcyuYwm5Hp0OlA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QBHZ+R3o01T/bAqB90PryxLxkPkTF5VohW/w0QaLpXpp3kvaYGHw5c52QzOiCD7wB
         3DJIY8Tw5G8O/wPXScSzho8HXGltpUBKfMKCK32vjHAAcIrouRv8AcCpW4NI5n4XUn
         VIuKmRUUGYYcrGhzOBm74oDfQ1sn1ZRO/0dJGJAEnjc5i5MNhQyNCFWl+5pA4C5L+j
         1Uq6seqOa3ahwTXw6NfrZvw8S0jq4OsjStB//G8OKEREOOR1d1UjkQO6ru+Wyr79w9
         Bjk+rNAMCRcvvbVc5zuOwwABW+nFmVy/VPe/dN3fOaYM5UyN3PLeE4rhhi7ChtcW44
         flbvUUBnHUNgg==
Date:   Wed, 26 May 2021 16:45:08 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH v2] HID: intel_ish-hid: HBM: Use connected standby state
 bit during suspend/resume
In-Reply-To: <e41df7ef5ae5f1e18e2fd6b641c8c7def52bc34e.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2105261644150.28378@cbobk.fhfr.pm>
References: <20210316202334.655760-1-srinivas.pandruvada@linux.intel.com>  <nycvar.YFH.7.76.2103191435260.12405@cbobk.fhfr.pm> <e41df7ef5ae5f1e18e2fd6b641c8c7def52bc34e.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 26 May 2021, Srinivas Pandruvada wrote:

> > > The individual sensor drivers implemented in the ISH firmware needs 
> > > capability to take special actions when there is a change in the 
> > > system standby state. The ISH core firmware passes this notification 
> > > to individual sensor drivers in response to the OS request via 
> > > connected standby bit in the SYSTEM_STATE_STATUS command.
> > > 
> > > This change sets CONNECTED_STANDBY_STATE_BIT bit to 1 during
> > > suspend
> > > callback and clears during resume callback.
> > > 
> > > Signed-off-by: Ye Xiang <xiang.ye@intel.com>
> > > [srinivas.pandruvada@linux.intel.com: changelog rewrite]
> > > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > > ---
> > > v2:
> > > 	changed changelog to be more clear
> > > 	Changed the name in the signed-off to match "From"
> > > 
> > >  drivers/hid/intel-ish-hid/ishtp/hbm.c | 6 +++---
> > >  drivers/hid/intel-ish-hid/ishtp/hbm.h | 1 +
> > >  2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > Applied, thanks.
> 
> I don't see this patch in 5.13-rc3. But I see in linux-next. There are
> other patches here which didn't make to 5.13-rc.
> 
> I see them in
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/hid/hid/+/refs/heads/for-5.13/intel-ish
> 
> Did you decide to postpone for 5.14? 

Uwe Kleine-Koening already noticed this:

	http://lore.kernel.org/r/nycvar.YFH.7.76.2105131318120.28378@cbobk.fhfr.pm

I apologize for the hassle. 

> It will be fine to postpone.

Thanks. It's currently in for-5.14/intel-ish.

-- 
Jiri Kosina
SUSE Labs

