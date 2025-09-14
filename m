Return-Path: <linux-input+bounces-14693-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C98E0B56480
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 05:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEDB67AC71D
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 03:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4C81E1DE3;
	Sun, 14 Sep 2025 03:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FmEK5+qs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58041891AB;
	Sun, 14 Sep 2025 03:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757820398; cv=none; b=hkTqBZt41dk0mpAraxlTzpKHQ/VhszIHgZklsLZdMnZX97HVOPi3jUdlAj4j2DJSElOQXzbc5rjAPTjZwm2p9VCN23f0b+lvE0VgWxdnuBCvrMuofzHAEDt+WAlSnuxRFz7NvHyR4aBkedBhpRVZGjF8/V6Var2I5qxw8Ya6+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757820398; c=relaxed/simple;
	bh=UtdZzoFbwR2rKsyuSMjykhbtuops8D65MXcPVY1QGWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BH8ZUM9vdBv5rwLQfzmx87Uc89WVm6Pw2cDLWiiCRbi7W/SJXuT7BlWMhAHQHIte5H/bSsheRh6EyatT1RgZWth5jeMaB+SviTGDUOe1JF1AkSCJXPW75+F2vPmqkww+kdRuT/15jI1IsZJ+xS4WKkaOTWoXmLVaciR40Uy54o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FmEK5+qs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F56DC4CEEB;
	Sun, 14 Sep 2025 03:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757820398;
	bh=UtdZzoFbwR2rKsyuSMjykhbtuops8D65MXcPVY1QGWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FmEK5+qsOsUPorPNIlK7KkQ3+yjIdcALGbTrMkH4HULoY0G1i43EFQiNv2AMMxCLS
	 pne2ntiZWjrGamAkBpHOH7kAt5FxqNPzqIeiiC+8tQdNiIUNNOiqhF3cgRJd+hEEZR
	 qBzWJcFnSKEEFge8AklnNoMihJHkCCnbQMQ8iiVAF2xlakKZv6xh4LTaBBVmyqImka
	 +r4D5o/kg1FO6Tx7iZevAIz4tNNH0x42ZQP6i/gF8d+ngOyBHCYmHEjqNUeeqqi2VF
	 XwDCCECaa/5KA5kOTsHsCtzLnQdoO9uCbQ1cntCF5gGYV8kusZ5dKX0r0BLXCc3idJ
	 VnZJRe0G1N9nA==
Date: Sun, 14 Sep 2025 11:26:34 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <aMY16n586gt8J3d9@tzungbi-laptop>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
 <aLbutygmfjV4AuhZ@tzungbi-laptop>
 <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>
 <aLqhcu-zjpyeYMly@google.com>
 <vt2xibzzfbq2aq4kuyl3557kqazqusnxe75ps6idn6xpcxhous@u562qeztmaqb>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vt2xibzzfbq2aq4kuyl3557kqazqusnxe75ps6idn6xpcxhous@u562qeztmaqb>

On Sat, Sep 13, 2025 at 06:08:48PM -0700, Dmitry Torokhov wrote:
> On Fri, Sep 05, 2025 at 08:38:10AM +0000, Tzung-Bi Shih wrote:
> > On Thu, Sep 04, 2025 at 07:06:23AM -0700, Dmitry Torokhov wrote:
> > > On Tue, Sep 02, 2025 at 09:18:47PM +0800, Tzung-Bi Shih wrote:
> > > > On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> > > > > On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > > > > > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > > > > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > > > > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > > > > > probed at the same time.
> > > > > > > 
> > > > > > > Example:
> > > > > > > 
> > > > > > > + -----------------------------------------------------------------+
> > > > > > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > > > > > + -----------------------------------------------------------------+
> > > > > > > | Probe cros-ec-keyb.            |                                 |
> > > > > > > | - Decide to defer[1].          |                                 |
> > > > > > > |                                | A device bound to a driver[2].  |
> > > > > > > | Probe cros_ec_lpc.             |                                 |
> > > > > > > | - Init the struct[3].          |                                 |
> > > > > > > |                                | Retry cros-ec-keyb from the     |
> > > > > > > |                                | deferred list[4].               |
> > > > > > > |                                | - Won't defer again as [3].     |
> > > > > > > |                                | - Access uninitialized data in  |
> > > > > > > |                                |   the struct.                   |
> > > > > > > | - Register the device.         |                                 |
> > > > > > > + -----------------------------------------------------------------+
> > > > > > > 
> > > > > > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > > > > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > > > > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > > > > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > > > > > 
> > > > > > > Note that the device link[5] can't help as in the observed environment,
> > > > > > > the devices are already added via device_add()[6].
> > > > > > > 
> > > > > > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > > > > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > > > > > 
> > > > > > > The series fixes the issue by ensuring the struct is ready for accessing
> > > > > > > before continuing to probe cros-ec-keyb.
> > > > > > 
> > > > > > Why is the keyboard platform device instantiated before the transport
> > > > > > (cros_ec_lpc) is done initializing? I think this is the root of the
> > > > > > issue...
> > > > > 
> > > > > I may misunderstand but it seems to me:
> > > > > 
> > > > > - The ACPI bus enumerated and instantiated the platform devices[6] first.
> > > > > 
> > > > > - The keyboard platform device was probed when `cros_ec_keyb_driver`
> > > > >   registered.  It deferred as its parent's drvdata was NULL[1].
> > > > > 
> > > > > - The transport platform device was probed when `cros_ec_lpc_driver`
> > > > >   registered.  It set the drvdata[3].
> > > > > 
> > > > > - The keyboard platform device was probed again from retrying the deferred
> > > > >   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
> > > > >   wasn't NULL and cros_ec_register() for the transport device weren't
> > > > >   finished.  The race happened.
> > > > 
> > > > Hi Dmitry,
> > > > 
> > > > Does it make sense to you?
> > > 
> > > I'll have to research how MFD mixes up statically described and
> > > DT-described platform devices and makes sure that children are not
> > > probed before the parent is ready - I think we need to make cros_ec
> > > behave the same way.
> > 
> > I may misunderstand but FWIW:
> > 
> > I failed to find relevant code in MFD [7] that guarantees the probe order.
> > Also, I'm curious about wouldn't code at [7] results in duplicate platform
> > devices?  E.g., 1 populated from OF; 1 created by MFD.
> > 
> > Note: current cros_ec_dev.c doesn't use `of_compatible` in struct mfd_cell.
> > 
> > If we're looking at how cros_ec_dev.c guarantees the order:
> > 
> > - The transport platfrom device is probed first.  It calls cros_ec_register().
> > - In cros_ec_register(), it registers the MFD device "cros-ec-dev".  And the
> >   children devices are added via mfd_add_devices().
> > 
> > 
> > Back to the issue we observed:
> > 
> > - The platform devices are created when it scans the tree in ACPI[6].  We
> >   probably have no way to prevent the devices from adding unless specifying
> >   `enumeration_by_parent`[8].
> > 
> > - When some of them are modules, the driver registrations are tied to the
> >   module insertion.  They can be arrived by anytime unless we use something
> >   similar to soft dependency[9].  A Kconfig dependency will also
> >   be needed to prevent cros_ec_lpcs=m but cros_ec_keyb=y.  However,
> >   cros_ec_keyb would need to specify 2 possible dependencies "cros_ec_lpcs"
> >   and "cros_ec_spi"[10].  I'm not sure what would be happening if a system
> >   has no cros_ec_spi module at all.
> 
> Sorry for the delay. I think we need to figure out how to delay device
> registration until after the transport device is registered and probed.
> Unfortunately I have not had time to look at this properly so I acked
> the changes to cros_ec_keyb so that we can close the hole for now and
> later we can try to see if there is a reasonable better solution.

Thanks.  Let's move forward with the current fix, even though we know it's
suboptimal.

My suspicion is that we lack a proper in-kernel dependency mechanism.  This
is on my radar, and I'll investigate a better approach.

