Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0AF3712D7
	for <lists+linux-input@lfdr.de>; Mon,  3 May 2021 11:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbhECJMO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 May 2021 05:12:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:50822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhECJMM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 May 2021 05:12:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DA2061182;
        Mon,  3 May 2021 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620033079;
        bh=J1HEObuC6S6Uc2b+u+41SMD7H5QgtUJqRzSR9U+jVJ8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=arLLgp0xkQEDtrn6SbibknkGvxMdtA65g/gVqTbFkfn9zkKpJBUq03xFMM19qTpLy
         nguGgcUMd9JjEd5oc1skiFeEThMbTfC7qMe4MSBiHNQKVaLsh67HwRGYXU3UCs5UMP
         ibZOystofWZuRlS900R9NnXVR0AagC57RM/YWSz7pDL0+wl/eFmYvxjl1e89+1kWW4
         eMzlc8PCEgCl+dyk78DcJi0d2NyND8e0WeOulbZzlqe6rTF9uGC7l+m/WEgOPQsdBV
         CVOWoxRCKVuOmyaECk0By/AkZaaaNl9grMx92cf4BRucLcblnS0rLsY7ym9X/ukbVm
         eJYpTWRHzqCYg==
Date:   Mon, 3 May 2021 11:11:10 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?KOI8-R?B?zsHC?= <nabijaczleweli@nabijaczleweli.xyz>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Stylus-on-touchscreen device support
In-Reply-To: <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz>
Message-ID: <nycvar.YFH.7.76.2105031110480.28378@cbobk.fhfr.pm>
References: <cover.1615224800.git.nabijaczleweli@nabijaczleweli.xyz> <20210420131741.kdgxquhwqureih7c@tarta.nabijaczleweli.xyz>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 20 Apr 2021, наб wrote:

> > This patchset adds support for stylus-on-touchscreen devices as found on
> > the OneMix 3 Pro and Dell Inspiron 15 7000 2-in-1 (7591), among others;
> > with it, they properly behave like a drawing tablet.
> > 
> > Patches 2 and 4 funxionally depend on patch 1.
> > Patch 4 needs patch 3 to apply.
> > 
> > The output of this patchset and the need for a kernel, rather than
> > userspace, patch was previously discussed here:
> >   https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/558#note_792834
> > 
> > Changes in v2:
> > Patch 4 now ANDs the secondary button with the tip switch,
> > since it's otherwise borderline useless to the user.
> > 
> > Ahelenia Ziemiańska (4):
> >   HID: multitouch: require Finger field to mark Win8 reports as MT
> >   HID: multitouch: set Stylus suffix for Stylus-application devices, too
> >   HID: input: replace outdated HID numbers+comments with macros
> >   HID: input: work around Win8 stylus-on-touchscreen reporting
> > 
> >  drivers/hid/hid-input.c      | 54 ++++++++++++++++++++++++++++++++++--
> >  drivers/hid/hid-multitouch.c | 18 +++++++-----
> >  2 files changed, 62 insertions(+), 10 deletions(-)
> > 
> > -- 
> > 2.20.1
> 
> Bumping this after a monthish ‒ is it missing something? Am I?

Benjamin had concerns about regressions and wanted to run a full battery 
of testing on it.

Benjamin, is there any outcome of that, please?

Thanks,

-- 
Jiri Kosina
SUSE Labs

