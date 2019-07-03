Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1BBB5DE26
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2019 08:39:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfGCGj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Jul 2019 02:39:57 -0400
Received: from chill.innovation.ch ([216.218.245.220]:53722 "EHLO
        chill.innovation.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbfGCGj5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Jul 2019 02:39:57 -0400
Date:   Tue, 2 Jul 2019 23:39:56 -0700
DKIM-Filter: OpenDKIM Filter v2.10.3 chill.innovation.ch 85CEE64013F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1562135996;
        bh=waAA9bz7u8vTcqSxfkBH3kI4fMWrMyh3e4aqengWgPg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=arld3s3oUiDqM0POunjuNaXZx1LPmOkmuIEDUZXuHuMRO1KtTYegdWtFteYdleykz
         bnaGCYFRvBegnM7u77hhw5jcfUO7jlOGJ3XyTQvUuUkDt+/VX/v0jhALYCPr5LQ6dx
         hnr9d7rU5vpxvfwPUXKAcTWQr+zI8Me+aKrpZljnLwlTgJcbOTOM1udKcq4yf9WZC8
         pV5DyQGdBM3yJRW7B/Ra+oM6J8cGZqG0AlL36KkBchVyOfKSkHBXGuuch0u7GQxLES
         q/3qQ39Dsk2rFuR2x/dEmf/TxLh6aIOUspIeinHPT/OYmMqP4NUSJp/HWbZGFQDwgB
         g8eUiEpsgEk/Q==
From:   "Life is hard, and then you die" <ronald@innovation.ch>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Message-ID: <20190703063956.GA32102@innovation.ch>
References: <20190419081926.13567-1-ronald@innovation.ch>
 <20190419081926.13567-2-ronald@innovation.ch>
 <CGME20190702135052eucas1p11e2621af0514505789c7947b84cf133c@eucas1p1.samsung.com>
 <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d0fe94c-a2c9-a8f6-967f-c33b53e86518@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Tue, Jul 02, 2019 at 03:50:49PM +0200, Andrzej Hajda wrote:
> On 19.04.2019 10:19, Ronald Tschalär wrote:
> > commit d6abe6df706c (drm/bridge: sil_sii8620: do not have a dependency
> > of RC_CORE) changed the driver to select both RC_CORE and INPUT.
> > However, this causes problems with other drivers, in particular an input
> > driver that depends on MFD_INTEL_LPSS_PCI (to be added in a separate
> > commit):
> > 
> >   drivers/clk/Kconfig:9:error: recursive dependency detected!
> >   drivers/clk/Kconfig:9:        symbol COMMON_CLK is selected by MFD_INTEL_LPSS
> >   drivers/mfd/Kconfig:566:      symbol MFD_INTEL_LPSS is selected by MFD_INTEL_LPSS_PCI
> >   drivers/mfd/Kconfig:580:      symbol MFD_INTEL_LPSS_PCI is implied by KEYBOARD_APPLESPI
> >   drivers/input/keyboard/Kconfig:73:    symbol KEYBOARD_APPLESPI depends on INPUT
> >   drivers/input/Kconfig:8:      symbol INPUT is selected by DRM_SIL_SII8620
> >   drivers/gpu/drm/bridge/Kconfig:83:    symbol DRM_SIL_SII8620 depends on DRM_BRIDGE
> >   drivers/gpu/drm/bridge/Kconfig:1:     symbol DRM_BRIDGE is selected by DRM_PL111
> >   drivers/gpu/drm/pl111/Kconfig:1:      symbol DRM_PL111 depends on COMMON_CLK
> > 
> > According to the docs and general consensus, select should only be used
> > for non user-visible symbols, but both RC_CORE and INPUT are
> > user-visible. Furthermore almost all other references to INPUT
> > throughout the kernel config are depends, not selects. For this reason
> > the first part of this change reverts commit d6abe6df706c.
> > 
> > In order to address the original reason for commit d6abe6df706c, namely
> > that not all boards use the remote controller functionality and hence
> > should not need have to deal with RC_CORE, the second part of this
> > change now makes the remote control support in the driver optional and
> > contingent on RC_CORE being defined. And with this the hard dependency
> > on INPUT also goes away as that is only needed if RC_CORE is defined
> > (which in turn already depends on INPUT).
> > 
> > CC: Inki Dae <inki.dae@samsung.com>
> > CC: Andrzej Hajda <a.hajda@samsung.com>
> > CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
> > Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> 
> 
> Apparently this patch was not queued to kernel yet. If there are no
> objections I will queue it via drm-misc-next tree tomorrow.

If this patch set won't be queued for 5.3 then I guess that would be a
good idea.

But may I ask what is preventing this patch set from being queued for
upstream, so I can try and fix whatever the issue is?


  Cheers,

  Ronald

