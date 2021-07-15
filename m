Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E6E3CAD7B
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 22:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239580AbhGOUFD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 16:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346146AbhGOUEg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 16:04:36 -0400
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521D3C04F962
        for <linux-input@vger.kernel.org>; Thu, 15 Jul 2021 12:45:52 -0700 (PDT)
Date:   Thu, 15 Jul 2021 21:45:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1626378350;
        bh=XLx+C8EmGeUInQ8/g4lidS0Ph1eLMBWqE1keBI/qGOs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MD9B9AI8qmOQBxckkk8E3Y0tNNjWAw9P7jiLcYlb+q2o272BWjXGugDa9aVmjyScE
         Vz3s/TtrqcrWpWxP6z5JakYuiguYAh9QL56a6qLZBM+dZ/HNEALMtliNT6aUeTC7Zo
         WSJnuD4lT0luDq/uzl5lBeJSWQ8rhuw5qAfUJvK0=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.or
Subject: Re: [PATCH] HID: add cmedia-fixup driver
Message-ID: <a769ae40-6d0c-47c4-803f-2c8dbc362f24@t-8ch.de>
References: <20210704104906.78490-1-linux@weissschuh.net>
 <nycvar.YFH.7.76.2107152059330.8253@cbobk.fhfr.pm>
 <2f89257c-b074-45ed-8103-e3e70db2c1c6@t-8ch.de>
 <nycvar.YFH.7.76.2107152114020.8253@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2107152114020.8253@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Do, 2021-07-15T21:14+0200, Jiri Kosina wrote:
> On Thu, 15 Jul 2021, Thomas Weißschuh wrote:
> 
> > > > This driver provides HID fixups for CMedia audio chips.
> > > > For now this enables the recognition of the microphone mute button for the
> > > > HS-100B.
> > > > 
> > > > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > ---
> > > >  drivers/hid/Kconfig            |  6 +++
> > > >  drivers/hid/Makefile           |  1 +
> > > >  drivers/hid/hid-cmedia-fixup.c | 82 ++++++++++++++++++++++++++++++++++
> > > >  drivers/hid/hid-ids.h          |  1 +
> > > >  drivers/hid/hid-quirks.c       |  3 ++
> > > >  5 files changed, 93 insertions(+)
> > > >  create mode 100644 drivers/hid/hid-cmedia-fixup.c
> > > 
> > > Can you please drop the '-fixup' from the driver name? We have quite a 
> > > couple of drivers that do report descriptor modifications, but we're not 
> > > using this '-fixup' naming scheme for them either.
> > 
> > There is already an existing driver "hid-cmedia":
> > "HID driver for CMedia CM6533 audio jack controls".
> > 
> > This driver works in a completely different way from mine, so I thought 
> > to keep them separate. The idea was for the new driver to be a 
> > collection of simple, similar report fixups.
> > 
> > Should they be combined?
> 
> If it's the same vendor, then yes. We generally (with exceptions, of 
> course :) ) group the HID drivers by vendor, even if completely different 
> quirks are needed for different devices from the same vendor.

Will do.

Should I merge it into the existing `struct hid_driver` and do id checks in
every member function or declare a dedicated `struct hid_driver`?

Thanks!
