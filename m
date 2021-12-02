Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411604662DF
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 12:54:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345845AbhLBL6K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 06:58:10 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:52512 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbhLBL6F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Dec 2021 06:58:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 04220CE2230
        for <linux-input@vger.kernel.org>; Thu,  2 Dec 2021 11:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A225BC53FD0;
        Thu,  2 Dec 2021 11:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638446080;
        bh=DZ5mXaLV3LXBaoJbDmk3nNO9Dz0Z7LTWnO79nh0nBpc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TWnrMluxATUZ3JCekHkc/ZEOTs8jlUlnrVApaBKSABOYY+RN1YDh0jZj/jpeY1Mb2
         dFtBwlmOPEaHfR42TzqxJT93qCraBFfKndk2bq0ZNGg9S9vw1Al1Hmu2EKIzlM9ApK
         IudS5zfJa5oOVHNVE9V0uC5aL5G4Dh2a6gtErvQM=
Date:   Thu, 2 Dec 2021 12:54:37 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v3 3/3] HID: check for valid USB device for many HID
 drivers
Message-ID: <Yaiz/U9POyHfCs1M@kroah.com>
References: <20211201183503.2373082-1-gregkh@linuxfoundation.org>
 <20211201183503.2373082-3-gregkh@linuxfoundation.org>
 <CAO-hwJJ5=SCNypQJP2V3DdjwLoo23DuMuZ8w_fejp17cytznQw@mail.gmail.com>
 <YaiRGg+gmJgcT8uA@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaiRGg+gmJgcT8uA@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 02, 2021 at 10:25:46AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Dec 02, 2021 at 10:08:07AM +0100, Benjamin Tissoires wrote:
> > On Wed, Dec 1, 2021 at 7:35 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > Many HID drivers assume that the HID device assigned to them is a USB
> > > device as that was the only way HID devices used to be able to be
> > > created in Linux.  However, with the additional ways that HID devices
> > > can be created for many different bus types, that is no longer true, so
> > > properly check that we have a USB device associated with the HID device
> > > before allowing a driver that makes this assumption to claim it.
> > >
> > > Cc: Jiri Kosina <jikos@kernel.org>
> > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Cc: Michael Zaidman <michael.zaidman@gmail.com>
> > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > Cc: linux-input@vger.kernel.org
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > > v3: add check in hid-sony based on fix from Benjamin.
> > 
> > Sigh. This morning I realized my fix was incomplete as the error path
> > of the GHL devices handling is not releasing the hidraw node.
> > I have a followup patch ready that I am about to send as soon as I get
> > the full tests run.
> > 
> > Also, I guess we want this series to land in 5.16-rc4 or rc5 and mark
> > it as stable, no?
> > If so, I'll add the cc stable@vger.kernel.org marks so you don't need
> > to keep tabs on it.
> 
> That would be great, thanks!
> 
> > Besides that, I tested the wacom change on an I2C screen, and it is
> > still working as expected, so I think the wacom changes are safe.
> > The full series is
> > Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> 
> Wonderful.
> 
> Note, I did just get some really odd 0-day error messages from this
> patch series:
> 	https://lore.kernel.org/r/202112021000.3GKuE8mS-lkp@intel.com
> 	https://lore.kernel.org/r/202112020808.AZ5usuXj-lkp@intel.com
> 
> Which looks like a dependancy issue that might have always been there.
> I'll work on resolving that after lunch...

Now sent:
	https://lore.kernel.org/r/20211202114819.2511954-1-gregkh@linuxfoundation.org

I can resend it as a v4 series that adds this to the end of the series
if you want me to.

thanks,

greg k-h
