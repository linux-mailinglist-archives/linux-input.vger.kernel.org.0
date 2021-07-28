Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F82C3D8AAA
	for <lists+linux-input@lfdr.de>; Wed, 28 Jul 2021 11:33:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhG1JdN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 05:33:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231256AbhG1JdN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 05:33:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B079A60F01;
        Wed, 28 Jul 2021 09:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627464791;
        bh=nx4F3YPeNCF7rcMriYCJvNKLj3WNTn4Jbhuef7w9WTk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=umwidYFxJylYkjQCv2eMu0iihtI4p8zVtK0H0MkEZFxCamC8biN2SazZcnd4ZVKgm
         PQ7BynbB5DvLi/2JrjWdwzaG8wUarftO18Zll5onQ4Ox1U13mm006XgTpITjU19C9u
         iu0NrZY+O36DMMbPG8ITLwlXknYtENHM29LSRjPSVDw4Pvey7KD8kR1jB1OjFNmj6A
         QyKP6kBkSSbFHKDvHYHKaR6jE6/27ZnaIPL1TYhfQYAUyxQBz6qgZAYRUodWrNEha8
         iTjbgWcmBMWHUnXLn5kmmeLfSLq3LGom4+zAjQe9RzgqLWvmdEwcbnA8YhVIRyAB9X
         OcayjzrJS/J4w==
Date:   Wed, 28 Jul 2021 11:33:08 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dylan MacKenzie <ecstaticmorse@gmail.com>
cc:     Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] HID: amd_sfh: Minor DMA mapping bugfixes
In-Reply-To: <nycvar.YFH.7.76.2107281128140.8253@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2107281132410.8253@cbobk.fhfr.pm>
References: <20210622001503.47541-1-ecstaticmorse@gmail.com> <nycvar.YFH.7.76.2107281128140.8253@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


[ dropping Sandeep, CCing Basavaraj ]

On Wed, 28 Jul 2021, Jiri Kosina wrote:

> On Mon, 21 Jun 2021, Dylan MacKenzie wrote:
> 
> > While preparing to investigate
> > https://bugzilla.kernel.org/show_bug.cgi?id=212615, I read through the amd_sfh
> > driver and saw two (unrelated) bugs in the logic that sets the DMA mask.
> > Ultimately these are harmless, but they should probably get fixed.
> > 
> > FYI, this is my first time submitting a kernel patch. If I've done something
> > wrong in formatting this email, it is likely due to incompetence rather than
> > malice.
> > 
> > Dylan MacKenzie (2):
> >   HID: amd_sfh: Set correct DMA mask
> >   HID: amd_sfh: Continue if fallback DMA mask is accepted
> > 
> >  drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> Nehal, Sandeep, could you please provide your Ack to this series? Thanks,
> 
> -- 
> Jiri Kosina
> SUSE Labs
> 
> 

-- 
Jiri Kosina
SUSE Labs

