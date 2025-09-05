Return-Path: <linux-input+bounces-14504-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA3B451AB
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 10:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A440C163C2A
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 08:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA3513AA2D;
	Fri,  5 Sep 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tRlxbGKL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828BA1E487;
	Fri,  5 Sep 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757061494; cv=none; b=nE0xntPBt3UuFvmLwt5ijvgYoo95GhHE5fIK8hAxAcr+rljm53yW3rhtpxnUiyPgamCWmZqlu/9/RYIQ650Qpf3u3iZ80jBNbdXUWQ8P6MkqI/oB7FmLejZ8IC3jHD6DhdLc3C52XOOtjBGlQw/pKTx5cZDsuSjJu9nqEpEdILM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757061494; c=relaxed/simple;
	bh=kVJcCIgesGiuVScQFp+2Alk9JjzRYcuW99Y4IEbJ3Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EwYH6KxNePVTfrSTj/N6Zi4sFr4pp1pGiKDo3V/+Ohs/cUvLAfhuNv5g9YZztO7VRA3kwqzXe9FAbYQtxg2D8PSEvE1Jurgu43J+8sgPmAyqvvInJc9yYDvLxJVrpkdVnRDT9hxSqxVWIeTH14y8KYileDfV/PaKHp3RByPqVsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tRlxbGKL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406ABC4CEF1;
	Fri,  5 Sep 2025 08:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757061494;
	bh=kVJcCIgesGiuVScQFp+2Alk9JjzRYcuW99Y4IEbJ3Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRlxbGKLRR6fntuRfcvXSrUC0dNEASjnzCz8iQ1snWVKU/45oWQ9qqPZDtHWZ8AQF
	 SR75bKEezu50VZ5Tn2Rkpqj0wmWfq7J+KG/sYtNTscoyGSazfB3ef9G5XkZDWB2pWm
	 OWnvUyr+LlYPJyjI2mUpRRMJr/O9gDsxXDocCUUJIoWxYC++x/cLXQpn/pNIHcCdJi
	 ZOq/GwObb48NDs3g48qwr0TGROwPizkvggxMVOewdvHHjfv8CWVTWv3UIwafejba57
	 mLR6u4Fiq/k+papej0D16ubJhJt2DnigrMOxjzTpKBZWO0IjUz1tAdUrWcpuinxdJy
	 IKlymmpk/Ip5g==
Date: Fri, 5 Sep 2025 08:38:10 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <aLqhcu-zjpyeYMly@google.com>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
 <aLbutygmfjV4AuhZ@tzungbi-laptop>
 <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4gtrvxpo6zqk54uvavrox7hszszdpvdubz4w6iaks72zq3jjsw@b6cfvi5ysj2u>

On Thu, Sep 04, 2025 at 07:06:23AM -0700, Dmitry Torokhov wrote:
> On Tue, Sep 02, 2025 at 09:18:47PM +0800, Tzung-Bi Shih wrote:
> > On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> > > On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > > > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > > > probed at the same time.
> > > > > 
> > > > > Example:
> > > > > 
> > > > > + -----------------------------------------------------------------+
> > > > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > > > + -----------------------------------------------------------------+
> > > > > | Probe cros-ec-keyb.            |                                 |
> > > > > | - Decide to defer[1].          |                                 |
> > > > > |                                | A device bound to a driver[2].  |
> > > > > | Probe cros_ec_lpc.             |                                 |
> > > > > | - Init the struct[3].          |                                 |
> > > > > |                                | Retry cros-ec-keyb from the     |
> > > > > |                                | deferred list[4].               |
> > > > > |                                | - Won't defer again as [3].     |
> > > > > |                                | - Access uninitialized data in  |
> > > > > |                                |   the struct.                   |
> > > > > | - Register the device.         |                                 |
> > > > > + -----------------------------------------------------------------+
> > > > > 
> > > > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > > > 
> > > > > Note that the device link[5] can't help as in the observed environment,
> > > > > the devices are already added via device_add()[6].
> > > > > 
> > > > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > > > 
> > > > > The series fixes the issue by ensuring the struct is ready for accessing
> > > > > before continuing to probe cros-ec-keyb.
> > > > 
> > > > Why is the keyboard platform device instantiated before the transport
> > > > (cros_ec_lpc) is done initializing? I think this is the root of the
> > > > issue...
> > > 
> > > I may misunderstand but it seems to me:
> > > 
> > > - The ACPI bus enumerated and instantiated the platform devices[6] first.
> > > 
> > > - The keyboard platform device was probed when `cros_ec_keyb_driver`
> > >   registered.  It deferred as its parent's drvdata was NULL[1].
> > > 
> > > - The transport platform device was probed when `cros_ec_lpc_driver`
> > >   registered.  It set the drvdata[3].
> > > 
> > > - The keyboard platform device was probed again from retrying the deferred
> > >   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
> > >   wasn't NULL and cros_ec_register() for the transport device weren't
> > >   finished.  The race happened.
> > 
> > Hi Dmitry,
> > 
> > Does it make sense to you?
> 
> I'll have to research how MFD mixes up statically described and
> DT-described platform devices and makes sure that children are not
> probed before the parent is ready - I think we need to make cros_ec
> behave the same way.

I may misunderstand but FWIW:

I failed to find relevant code in MFD [7] that guarantees the probe order.
Also, I'm curious about wouldn't code at [7] results in duplicate platform
devices?  E.g., 1 populated from OF; 1 created by MFD.

Note: current cros_ec_dev.c doesn't use `of_compatible` in struct mfd_cell.

If we're looking at how cros_ec_dev.c guarantees the order:

- The transport platfrom device is probed first.  It calls cros_ec_register().
- In cros_ec_register(), it registers the MFD device "cros-ec-dev".  And the
  children devices are added via mfd_add_devices().


Back to the issue we observed:

- The platform devices are created when it scans the tree in ACPI[6].  We
  probably have no way to prevent the devices from adding unless specifying
  `enumeration_by_parent`[8].

- When some of them are modules, the driver registrations are tied to the
  module insertion.  They can be arrived by anytime unless we use something
  similar to soft dependency[9].  A Kconfig dependency will also
  be needed to prevent cros_ec_lpcs=m but cros_ec_keyb=y.  However,
  cros_ec_keyb would need to specify 2 possible dependencies "cros_ec_lpcs"
  and "cros_ec_spi"[10].  I'm not sure what would be happening if a system
  has no cros_ec_spi module at all.

[7] https://elixir.bootlin.com/linux/v6.16/source/drivers/mfd/mfd-core.c#L184
[8] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/scan.c#L2204
[9] https://elixir.bootlin.com/linux/v6.16/source/include/linux/module.h#L176
[10] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/Kconfig#L743

