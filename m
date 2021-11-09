Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36E8E44AB68
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 11:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245273AbhKIKYH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Nov 2021 05:24:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:41378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245285AbhKIKYG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Nov 2021 05:24:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 50C076115B;
        Tue,  9 Nov 2021 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636453280;
        bh=R928BuAwjwPgAbEZdOA9e3VgBMtaHUofv3hH81F2LXY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=V8Ooh1tSEhP7/CIvVpIlUqpciMkncIOjbH2n0Ezt6jPhVXk92AUfVxPIMA5ua3BsD
         ymAA7vBKNLpJ5V5z3mxqUXeTb/NRdfpIg0g98S5uqll4e5VdzGYOGPhPL7rP47tJaP
         PcGaaH79b2yevF96XaWNNWNPdIkZS8+ulb7hcEmB7Jaljxt9ckDmojjE4sLSBu5Pe8
         9Az4CoMdHI4me6LzftdXGoSROUMgBfc7JM6pPx2xFbz008jqTTKxgUYCOivCfghQjd
         YDtpNRBC10kjQ3xasYc/KD0gu3z4Aj/SL+OkeeJwuIblmFXyWB5uhvCZb/otgucNIa
         TvXhL1IHj7TZg==
Date:   Tue, 9 Nov 2021 11:21:17 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Vin=EDcius_Reis?= <itsme.vreis@gmail.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, angiolucci@gmail.com
Subject: Re: [PATCH] HID: hid-asus.c: Maps key 0x35 (display off) to
 KEY_SCREENLOCK
In-Reply-To: <CALawNGDtzNBgJyc6Ammbp_-5n0EBamXQG84r_FC8WtN9QzFS=g@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2111091121010.12554@cbobk.fhfr.pm>
References: <20211008222327.9324-1-angiolucci@gmail.com> <CAKdAkRTdCSC_6UqWkcT3p697+d0kwEqMSSR=M9vw-NPAjdZ4SQ@mail.gmail.com> <CALawNGC3HTV86+LAkMNf_nApqnUoAQ7UPEXOj9WXake5DhHkpQ@mail.gmail.com> <YYWoRW9NRC58zQ9w@google.com>
 <CALawNGBookRkFSGdGJrW1hboJ8kpsPj_rwAkNXQ3mU32oDv-sA@mail.gmail.com> <YYc1I8aTLxd0FOE2@google.com> <CALawNGDtzNBgJyc6Ammbp_-5n0EBamXQG84r_FC8WtN9QzFS=g@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 6 Nov 2021, Vinícius Reis wrote:

> > > Thanks for explaining this a little bit more, I've got the point: The current
> > > key code triggered by the kernel is correct, the real issue is the lack of
> > > support for that particular code by current desktop environments.
> > >
> > > I'm new to contributing to the Linux kernel; the proper way to rollback
> > > this would be by me just sending a revert patch to the respective
> > > maintainer?
> >
> > Has the patch been accepted? I'd wait for Jiri or Benjamin to chime in
> > as to what they want to do.
> >
> > Thanks.
> >
> > --
> > Dmitry
> 
> Hi Dmitry,
> 
> Yes, it was applied two weeks ago. Okay, I will do that.

Yes, please send me a revert with a full explanation in the changelog.

Thanks,

-- 
Jiri Kosina
SUSE Labs

