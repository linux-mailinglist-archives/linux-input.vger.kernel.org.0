Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C18D115FF4
	for <lists+linux-input@lfdr.de>; Sun,  8 Dec 2019 01:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfLHAHT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 19:07:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:35500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726378AbfLHAHT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 7 Dec 2019 19:07:19 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 333682176D;
        Sun,  8 Dec 2019 00:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575763638;
        bh=M7YFDrfsP98aHjcTFmDSkdeQQZQR99Y+Wunr3u7VZBk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=1TY4b7uPfggkxhFT+TY3ACqYiMTBwLT2da6upkhSP9ffdWP65lHcYCNWxCaVLoSdI
         nNqzfhmSQZ+33DwsBzNTLbncAzpH2IXNJw6CaWZR0LORJF34o81IxGrRrLHI2Au6KE
         eU8U9cK9EaBIOthIBFlz5Iupe4m6Q3Q60w8XZmh0=
Date:   Sun, 8 Dec 2019 01:07:02 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jani Nikula <jani.nikula@intel.com>
cc:     =?ISO-8859-15?Q?Bruno_Pr=E9mont?= <bonbons@linux-vserver.org>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
        linux-input@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v2 11/14] HID: picoLCD: constify fb ops
In-Reply-To: <871rtji02a.fsf@intel.com>
Message-ID: <nycvar.YFH.7.76.1912080106260.4603@cbobk.fhfr.pm>
References: <cover.1575022735.git.jani.nikula@intel.com> <8678a9a3566279c881bb4db944850eef35d0a4bb.1575022735.git.jani.nikula@intel.com> <20191202094047.34525a7d@aether.lan.sysophe.eu> <871rtji02a.fsf@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 5 Dec 2019, Jani Nikula wrote:

> >> Now that the fbops member of struct fb_info is const, we can start
> >> making the ops const as well.
> >>
> >> v2: fix	typo (Christophe de Dinechin)
> >
> > Fine with me.
> > I don't think going through drm-misc would trigger any conflict, but
> > adding Jiri to CC for the case there was any preference.
> >
> > Acked-by: Bruno Prémont <bonbons@linux-vserver.org>
> 
> No response, may I proceed with merging this through drm-misc please?

I have been off the grid the past week, sorry for belated response. Feel 
free to add

	Acked-by: Jiri Kosina <jkosina@suse.cz>

and take it through your tree.

-- 
Jiri Kosina
SUSE Labs

