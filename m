Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1740330A27
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 10:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbhCHJSC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 04:18:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCHJR5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 04:17:57 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43609C06174A
        for <linux-input@vger.kernel.org>; Mon,  8 Mar 2021 01:17:57 -0800 (PST)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1lJC1T-0006WI-4Q; Mon, 08 Mar 2021 10:17:55 +0100
Message-ID: <10377e89322405b5e60a9288e35a7de3ff40f8c4.camel@pengutronix.de>
Subject: Re: [PATCH v3 5/5] Input: exc3000 - add firmware update support
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Date:   Mon, 08 Mar 2021 10:17:54 +0100
In-Reply-To: <YEW6gGUmlYFI4T0+@google.com>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
         <20210125182527.1225245-6-l.stach@pengutronix.de>
         <YEW6gGUmlYFI4T0+@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Am Sonntag, dem 07.03.2021 um 21:47 -0800 schrieb Dmitry Torokhov:
> Hi Lucas,
> 
> On Mon, Jan 25, 2021 at 07:25:27PM +0100, Lucas Stach wrote:
> > This change allows the device firmware to be updated by putting a firmware
> > file in /lib/firmware and providing the name of the file via the update_fw
> > sysfs property. The driver will then flash the firmware image into the
> > controller internal storage and restart the controller to activate the new
> > firmware.
> > 
> > The implementation was done by looking at the the messages passed between
> > the controller and proprietary vendor update tool. Not every detail of the
> > protocol is totally well understood, so the implementation still has some
> > "monkey see, monkey do" parts, as far as they have been found to be required
> > for the update to succeed.
> > 
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  .../ABI/testing/sysfs-driver-input-exc3000    |  20 ++
> >  drivers/input/touchscreen/exc3000.c           | 240 +++++++++++++++++-
> >  2 files changed, 258 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> > index 704434b277b0..123a00ccee8b 100644
> > --- a/Documentation/ABI/testing/sysfs-driver-input-exc3000
> > +++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> > @@ -24,3 +24,23 @@ Description:	Reports the type identification provided by the touchscreen, for ex
> >  		Access: Read
> >  
> > 
> > 
> > 
> >  		Valid values: Represented as string
> > +
> > +What:		/sys/bus/i2c/devices/xxx/update_fw
> > +Date:		Jan 2021
> > +Contact:	linux-input@vger.kernel.org
> > +Description:	Allows to specify a firlename of a firmware file located in /lib/firmware/ that will be
> > +		used to update the application firmware on the touchscreen controller. For example
> > +		"eeti/eeti_27_0_EDipper_0735.fw"
> 
> I believe the current idiomatic way is to have statically defined
> firmware name (it can still encode vid/pid/model info etc) and do not
> re-implement variable firmware name in every driver.
> 
> I think if this really is required we need to add this feature of
> overriding default firmware name to firmware loader maybe?

One issue I see with the driver provided firmware name is that the
model name and revision can be changed by the flashed firmware, with
the EXC3000 being a i2c device ,we also don't have any stable VID/PID
to use as a key. Which is an issue for the initial firmware flashing.
In that case one would need to know whats currently on the device to be
able to place a firmware file with the correct name.

Also I don't really see how that simplifies the driver code, as all
this is doing is using the passed in string as a file name to fetch the
firmware update file from.

To be clear: I'm not totally opposed to using a driver provided
firmware name, I just see that it complicates some things that are not
an issue with the patch as-is today and would like to understand the
reason for pushing for a driver provided name, before deciding one way
or the other.

Regards,
Lucas


