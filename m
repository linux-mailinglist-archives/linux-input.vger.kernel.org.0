Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED9046558A
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 19:34:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352612AbhLAShW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 13:37:22 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:57774 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352502AbhLASgC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 13:36:02 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 10DACCE1DED
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 18:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B349CC53FAD;
        Wed,  1 Dec 2021 18:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638383558;
        bh=POZgiU4R5pb1QNI9NqYcvaQbu7IkZKK/5BaanrrqX74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V2KQM+qgpoK/MRvLMphKzMnRyknQwVpnlmbAOLEOXK4J93YCtL/EGV67BMnlQQceH
         vbXzXax0/3yKTq2u60crZkLb3GrqxL3BHH8ptpJ6GH6K0FDEAil3VvPABwtgh+ZTl+
         mStc3L2EFiLwBOedx6M/LNYlqmgnOQ3jJTcsFMN4=
Date:   Wed, 1 Dec 2021 19:32:35 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v2 3/3] HID: check for valid USB device for many HID
 drivers
Message-ID: <Yae/w510/NudPTfZ@kroah.com>
References: <20211201163816.2219291-1-gregkh@linuxfoundation.org>
 <20211201163816.2219291-3-gregkh@linuxfoundation.org>
 <575b12be-fec6-522f-0bc9-f62077d57a81@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <575b12be-fec6-522f-0bc9-f62077d57a81@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 01, 2021 at 06:40:08PM +0100, Benjamin Tissoires wrote:
> On 12/1/21 17:38, Greg Kroah-Hartman wrote:
> > Many HID drivers assume that the HID device assigned to them is a USB
> > device as that was the only way HID devices used to be able to be
> > created in Linux.  However, with the additional ways that HID devices
> > can be created for many different bus types, that is no longer true, so
> > properly check that we have a USB device associated with the HID device
> > before allowing a driver that makes this assumption to claim it.
> > 
> > Cc: Jiri Kosina <jikos@kernel.org>
> > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Cc: Michael Zaidman <michael.zaidman@gmail.com>
> > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> > v2: holtek_kbd_probe() changes to test for USB device before calling
> >      hid_probe() and dereferenced the usb interface pointer based on
> >      Benjamin's review.
> > 
> >   drivers/hid/hid-chicony.c         |  3 +++
> >   drivers/hid/hid-corsair.c         |  7 ++++++-
> >   drivers/hid/hid-elan.c            |  2 +-
> >   drivers/hid/hid-elo.c             |  3 +++
> >   drivers/hid/hid-ft260.c           |  3 +++
> >   drivers/hid/hid-holtek-kbd.c      |  9 +++++++--
> >   drivers/hid/hid-holtek-mouse.c    |  9 +++++++++
> >   drivers/hid/hid-lg.c              | 10 ++++++++--
> >   drivers/hid/hid-prodikeys.c       | 10 ++++++++--
> >   drivers/hid/hid-roccat-arvo.c     |  3 +++
> >   drivers/hid/hid-roccat-isku.c     |  3 +++
> >   drivers/hid/hid-roccat-kone.c     |  3 +++
> >   drivers/hid/hid-roccat-koneplus.c |  3 +++
> >   drivers/hid/hid-roccat-konepure.c |  3 +++
> >   drivers/hid/hid-roccat-kovaplus.c |  3 +++
> >   drivers/hid/hid-roccat-lua.c      |  3 +++
> >   drivers/hid/hid-roccat-pyra.c     |  3 +++
> >   drivers/hid/hid-roccat-ryos.c     |  3 +++
> >   drivers/hid/hid-roccat-savu.c     |  3 +++
> >   drivers/hid/hid-samsung.c         |  3 +++
> >   drivers/hid/hid-thrustmaster.c    |  3 +++
> >   drivers/hid/hid-uclogic-core.c    |  3 +++
> >   22 files changed, 87 insertions(+), 8 deletions(-)
> 
> Sorry I haven't spotted this in the earlier versions: hid-sony also
> needs a fix:
> 
> ---
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index d1b107d547f5..c186af552129 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -3000,7 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	sc->quirks = quirks;
>  	hid_set_drvdata(hdev, sc);
>  	sc->hdev = hdev;
> -	usbdev = to_usb_device(sc->hdev->dev.parent->parent);
>  	ret = hid_parse(hdev);
>  	if (ret) {
> @@ -3043,6 +3042,11 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  	if (sc->quirks & (GHL_GUITAR_PS3WIIU | GHL_GUITAR_PS4)) {
> +		if (!hid_is_usb(hdev))
> +			return -EINVAL;
> +
> +		usbdev = to_usb_device(sc->hdev->dev.parent->parent);
> +
>  		sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
>  		if (!sc->ghl_urb)
>  			return -ENOMEM;

Ah, good catch, will go roll that into the next version.

> With that patch and the bigbenff which is not USB related, the hid-tools
> test suite manages to inject all the declared USB devices.

Very nice!

I'll submit v3 now.

thanks for the quick review and test,

greg k-h
