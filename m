Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8373CAB9D
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 21:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244882AbhGOTVE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 15:21:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:57772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245062AbhGOTTP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 15:19:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 799CB61417;
        Thu, 15 Jul 2021 19:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626376492;
        bh=mEgB6rGD16qESFzgDPGp0vZrvVMyQ407FeYYZunkIFw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Rwl41mKxtAt18NJcS26U1Q4CHm5U93QAN2qvmoQR2FmzM7ejigjh47Dxs8Noz9sEs
         9S2fsvI6szA0O5yuSJU1WqvBYw4v3fkmBlA3kN6Oq2wqROFrAh4Zi/nsXlwJOQMUsB
         dZaH6b1REK6xpIqL0ypr1SKYQXr3zIktSxY5eTo1JW5QJNYy3ivWh9E7kintoK8b7G
         WnmppZ0X57vxUaP2A4OIYny/wt+XvO1zbP8oHUQFYxXLUTpaN3ZdTnbngjl0dRA528
         Uldn+h5FVTBne/zEB4f6yrSbmBUQKlVKXhvIDqix7daiCT/qlzCaL1GDM49ohzvBOB
         45dUSSVuieUJQ==
Date:   Thu, 15 Jul 2021 21:14:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.or
Subject: Re: [PATCH] HID: add cmedia-fixup driver
In-Reply-To: <2f89257c-b074-45ed-8103-e3e70db2c1c6@t-8ch.de>
Message-ID: <nycvar.YFH.7.76.2107152114020.8253@cbobk.fhfr.pm>
References: <20210704104906.78490-1-linux@weissschuh.net> <nycvar.YFH.7.76.2107152059330.8253@cbobk.fhfr.pm> <2f89257c-b074-45ed-8103-e3e70db2c1c6@t-8ch.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 15 Jul 2021, Thomas Weißschuh wrote:

> > > This driver provides HID fixups for CMedia audio chips.
> > > For now this enables the recognition of the microphone mute button for the
> > > HS-100B.
> > > 
> > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > ---
> > >  drivers/hid/Kconfig            |  6 +++
> > >  drivers/hid/Makefile           |  1 +
> > >  drivers/hid/hid-cmedia-fixup.c | 82 ++++++++++++++++++++++++++++++++++
> > >  drivers/hid/hid-ids.h          |  1 +
> > >  drivers/hid/hid-quirks.c       |  3 ++
> > >  5 files changed, 93 insertions(+)
> > >  create mode 100644 drivers/hid/hid-cmedia-fixup.c
> > 
> > Can you please drop the '-fixup' from the driver name? We have quite a 
> > couple of drivers that do report descriptor modifications, but we're not 
> > using this '-fixup' naming scheme for them either.
> 
> There is already an existing driver "hid-cmedia":
> "HID driver for CMedia CM6533 audio jack controls".
> 
> This driver works in a completely different way from mine, so I thought 
> to keep them separate. The idea was for the new driver to be a 
> collection of simple, similar report fixups.
> 
> Should they be combined?

If it's the same vendor, then yes. We generally (with exceptions, of 
course :) ) group the HID drivers by vendor, even if completely different 
quirks are needed for different devices from the same vendor.

Thanks,

-- 
Jiri Kosina
SUSE Labs

