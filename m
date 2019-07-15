Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32BB169A6A
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 20:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729080AbfGOSEM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 14:04:12 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:32788 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfGOSEL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 14:04:11 -0400
Received: by mail-pl1-f194.google.com with SMTP id c14so8668798plo.0;
        Mon, 15 Jul 2019 11:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=KvkisiFAqnFhJQH/sxc+6YmwW4354mTDG0KMmG7pklg=;
        b=pPInN/AyZm7yn31pdN9aPbHJrSV5r8RPqxRFFlF92ahU4VhGQ5f4XvpcGyfyB8D+nq
         yuowytOH19HNeMj9r7VQZoU+WJFA5YoYw2E+7p9XFt9lGlTKuRc9QqvICZSurnDE8OqA
         uTCBzOc9rdVSmEq/HijM20PPPiJNIl0taqUQ2tD/D1/Ea9Oh189GyTZiHPp2v2mAEsj7
         SHH6PGa9I+cZ/hM1VRc3R56AfkjrYSdJegDX1sMFeQdnwVy33q+ozPVVgApH/5GS2tlU
         wHX1RkinKZeYRdmEUkQmMiVso+37YX6wkKxcH0omOCWf4/Oq/M/U3cZ2Fy/7RtPPGEmO
         THRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=KvkisiFAqnFhJQH/sxc+6YmwW4354mTDG0KMmG7pklg=;
        b=ZzPcgzZezQJmUWx/KoG6WdY2tw3G+raPr+JdLkUJPhmNrNxQve86RIt1qhcNCriX0B
         QYX6/ImKEhQXHFD2jK1YZkjWDE6m/oX0yBtX24PJNIAB3JcXJ2pRdLj3cYi9yMzmy2zM
         Gsn737T7F/LyqbHZet0kdbUgAOyQmQIeeuJ7LGr9CTVfM8C1q8MI9inOCSyFg0i6zX5o
         /cgYrchjlQmekSEZMBzLNupj4u/4B/t2jhXMAPYGyTMSUOHNuPFV87mlC6RF9RvhN03u
         YTI7l2YGeqCbFxf1iXDzGyDV1CXnhBBWIj+4K3v/+4aPzK3iAICeM+ffULKVAWeqqNX7
         pvYg==
X-Gm-Message-State: APjAAAVL5fBAGyf1RRHk8o5Cc64zzbVHd9MPIKl4qjVq4qkVjt71Ifd2
        Cyqah7zIjQg5nNLImCzzfglLE6LS7WM=
X-Google-Smtp-Source: APXvYqw6IG5z/VMRUXcDYY8AewGKSghmfEmS9vk7liPYPXslN0meA+PtO10qAzp1UKLlff63OBk+Vw==
X-Received: by 2002:a17:902:26c:: with SMTP id 99mr30828389plc.215.1563213850480;
        Mon, 15 Jul 2019 11:04:10 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a6sm10839127pfa.162.2019.07.15.11.04.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 11:04:09 -0700 (PDT)
Date:   Mon, 15 Jul 2019 11:04:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Federico Lorenzi <federico@travelground.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/2] drm/bridge: sil_sii8620: make remote control
 optional.
Message-ID: <20190715180407.GB131063@dtor-ws>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
 <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
 <20190703063956.GA32102@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190703063956.GA32102@innovation.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Jul 02, 2019 at 11:39:56PM -0700, Life is hard, and then you die wrote:
> 
> On Tue, Jul 02, 2019 at 03:50:49PM +0200, Andrzej Hajda wrote:
> > On 19.04.2019 10:19, Ronald Tschalär wrote:
> > > commit d6abe6df706c (drm/bridge: sil_sii8620: do not have a dependency
> > > of RC_CORE) changed the driver to select both RC_CORE and INPUT.
> > > However, this causes problems with other drivers, in particular an input
> > > driver that depends on MFD_INTEL_LPSS_PCI (to be added in a separate
> > > commit):
> > > 
> > >   drivers/clk/Kconfig:9:error: recursive dependency detected!
> > >   drivers/clk/Kconfig:9:        symbol COMMON_CLK is selected by MFD_INTEL_LPSS
> > >   drivers/mfd/Kconfig:566:      symbol MFD_INTEL_LPSS is selected by MFD_INTEL_LPSS_PCI
> > >   drivers/mfd/Kconfig:580:      symbol MFD_INTEL_LPSS_PCI is implied by KEYBOARD_APPLESPI
> > >   drivers/input/keyboard/Kconfig:73:    symbol KEYBOARD_APPLESPI depends on INPUT
> > >   drivers/input/Kconfig:8:      symbol INPUT is selected by DRM_SIL_SII8620
> > >   drivers/gpu/drm/bridge/Kconfig:83:    symbol DRM_SIL_SII8620 depends on DRM_BRIDGE
> > >   drivers/gpu/drm/bridge/Kconfig:1:     symbol DRM_BRIDGE is selected by DRM_PL111
> > >   drivers/gpu/drm/pl111/Kconfig:1:      symbol DRM_PL111 depends on COMMON_CLK
> > > 
> > > According to the docs and general consensus, select should only be used
> > > for non user-visible symbols, but both RC_CORE and INPUT are
> > > user-visible. Furthermore almost all other references to INPUT
> > > throughout the kernel config are depends, not selects. For this reason
> > > the first part of this change reverts commit d6abe6df706c.
> > > 
> > > In order to address the original reason for commit d6abe6df706c, namely
> > > that not all boards use the remote controller functionality and hence
> > > should not need have to deal with RC_CORE, the second part of this
> > > change now makes the remote control support in the driver optional and
> > > contingent on RC_CORE being defined. And with this the hard dependency
> > > on INPUT also goes away as that is only needed if RC_CORE is defined
> > > (which in turn already depends on INPUT).
> > > 
> > > CC: Inki Dae <inki.dae@samsung.com>
> > > CC: Andrzej Hajda <a.hajda@samsung.com>
> > > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
> > > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> > 
> > 
> > Apparently this patch was not queued to kernel yet. If there are no
> > objections I will queue it via drm-misc-next tree tomorrow.
> 
> If this patch set won't be queued for 5.3 then I guess that would be a
> good idea.
> 
> But may I ask what is preventing this patch set from being queued for
> upstream, so I can try and fix whatever the issue is?

As I mentioned in my pull request to Linux I will be picking up the
Apple keyboard driver for this merge window even though it was not in
next (my fault).

I created and immutable branch for this change if you'd like to pull it
in so we do not duplicate commit and risk the conflicts (but I believe
git should resolve it either way).

https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git id/5.2-sil_sii8620-rc-optional

Thanks.

-- 
Dmitry
