Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 158243A6770
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 15:09:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbhFNNLU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 09:11:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:59710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233463AbhFNNLP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 09:11:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DCD66124B;
        Mon, 14 Jun 2021 13:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623676151;
        bh=xgmpBnDYrBWcXHDxKY/f9tqgTS3kYbO0/zCkE/qOMrM=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SkLO+en3U78VKPtGri4Qud19sPrrnwsf5MflskNkvbDRB6wgjVNJK/jtpSUtEWX8B
         BMJhWD4fQqlV+tD+2kU8g7qRZaNsAhJjtPC+1HkFd76xP6IUfQZr33xYS7J1ua7BQT
         lz4UGLJDqAu2+Wzjp7TsQA1ubpUNDzePEwbB11YS96iGIHJqw23mAakprfORPLDJlJ
         K18C0M2C3M/Dlm51Ckp44e1v9M3tpIF6dgDA8AGeS84CSXE7EGMj5DL2Tfhkawi43t
         f0em83OnKfy466Ll4hBCR0sQsNQKpTChtDICBv/75WWWDduKA26gsz1SaQ1ASSmYxh
         BdOPx0HxeC0Yg==
Date:   Mon, 14 Jun 2021 15:09:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Singh, Sandeep" <ssingh1@amd.com>
cc:     Basavaraj Natikar <bnatikar@amd.com>,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        "Singh, Sandeep" <Sandeep.Singh@amd.com>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
Subject: Re: [PATCH RESEND] amd_sfh: change in maintainer
In-Reply-To: <402d47b4-71ba-ee81-2b1b-195b35e0794e@amd.com>
Message-ID: <nycvar.YFH.7.76.2106141508520.28378@cbobk.fhfr.pm>
References: <5f36f1b9-67f8-519d-051b-eb88fcfc2e71@amd.com> <402d47b4-71ba-ee81-2b1b-195b35e0794e@amd.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 27 May 2021, Singh, Sandeep wrote:

> > I would like to take the maintainer-ship of AMD SENSOR FUSION HUB DRIVER
> >
> > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> > ---
> >  MAINTAINERS | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 04babfa8fc76..1d27060fca21 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -973,7 +973,7 @@ F:  drivers/net/ethernet/amd/xgbe/
> >
> >  AMD SENSOR FUSION HUB DRIVER
> >  M:     Nehal Shah <nehal-bakulchandra.shah@amd.com>
> > -M:     Sandeep Singh <sandeep.singh@amd.com>
> > +M:     Basavaraj Natikar <basavaraj.natikar@amd.com>
> >  L:     linux-input@vger.kernel.org
> >  S:     Maintained
> >  F:     Documentation/hid/amd-sfh*
> > --
> > 2.25.1
> Acked-by: Sandeep Singh <sandeep.singh@amd.com <mailto:andy.shevchenko@gmail.com>>

This reads strange. I guess Andy's mail should be just removed?

-- 
Jiri Kosina
SUSE Labs

