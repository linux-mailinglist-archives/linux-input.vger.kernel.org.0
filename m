Return-Path: <linux-input+bounces-14424-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB1B402C4
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 15:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4725B3BCDC2
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 13:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2704826563F;
	Tue,  2 Sep 2025 13:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjrEBk7/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F101A304BA4;
	Tue,  2 Sep 2025 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819132; cv=none; b=k5jj/6rjA6ZbX4s7nx52anQYparz3zGWteNYdUsAmw1XJKe6xQ2xxCV5NdWnEaXOh/dLCGCwBeWJKHs+vs7HQL9pq27DvOxAJ6gh5nuTYi6RS7H4RKbEOpi0JSmH1HfnOasqwPPlyI1kWrSedno9SoId4CCYy+VfAfb+dS2gftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819132; c=relaxed/simple;
	bh=3OlIsexLNj280IDiHBciTLojhFBSfNBq82YiRU5Yb4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjKJs8dLQBGXGSmuwtPA11ucE6XMQJYfTIjovk32RPiwJK++qN5UddiQ6cU0KZZJ0bpnpW8IlwEFQXQGA7/E62LWXDJFIa9guAmho1yH4dbNfsyc0RSleyCBtwClRw7X8ZfwscZz9yvq389Nm3CoMFe9gHz9FFmIAmobKO+OZUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjrEBk7/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB5AC4CEED;
	Tue,  2 Sep 2025 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756819131;
	bh=3OlIsexLNj280IDiHBciTLojhFBSfNBq82YiRU5Yb4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjrEBk7/GBQB1RNdCrvoc4NxQmwXITuCLuJVjArCdPbII01bVOGn4lGDMU5dZD+7M
	 F6dT7jysa4nSPGT4Vadn6SkSl6IrTqgOJZJHxCkgW2vQjFJUhEAT//mo7nmVC4ZH6e
	 5rJJ6OF9DEEuKm7lBf8z2GyG6bffNueSHosHWTkNos8/iS7wAP8tIyeTiuT03PHPOk
	 C9xveW26wVKMRDOsqpJgiaK5FKbGtLKpwa3iLa8w7XcpCGKRyDFzkK7EQmXEOxwi3M
	 KORrLTFoj6inwMGJ0vwLgkEX74EGGpSIvag6aB++qMVaYrJsM8CF8QrKmLigt5dAj8
	 7YEHUy0+ENPIw==
Date: Tue, 2 Sep 2025 21:18:47 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <aLbutygmfjV4AuhZ@tzungbi-laptop>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
 <aLGhLCc9UQWwBz47@tzungbi-laptop>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLGhLCc9UQWwBz47@tzungbi-laptop>

On Fri, Aug 29, 2025 at 08:50:01PM +0800, Tzung-Bi Shih wrote:
> On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> > On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > > probed at the same time.
> > > 
> > > Example:
> > > 
> > > + -----------------------------------------------------------------+
> > > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > > + -----------------------------------------------------------------+
> > > | Probe cros-ec-keyb.            |                                 |
> > > | - Decide to defer[1].          |                                 |
> > > |                                | A device bound to a driver[2].  |
> > > | Probe cros_ec_lpc.             |                                 |
> > > | - Init the struct[3].          |                                 |
> > > |                                | Retry cros-ec-keyb from the     |
> > > |                                | deferred list[4].               |
> > > |                                | - Won't defer again as [3].     |
> > > |                                | - Access uninitialized data in  |
> > > |                                |   the struct.                   |
> > > | - Register the device.         |                                 |
> > > + -----------------------------------------------------------------+
> > > 
> > > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > > 
> > > Note that the device link[5] can't help as in the observed environment,
> > > the devices are already added via device_add()[6].
> > > 
> > > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > > 
> > > The series fixes the issue by ensuring the struct is ready for accessing
> > > before continuing to probe cros-ec-keyb.
> > 
> > Why is the keyboard platform device instantiated before the transport
> > (cros_ec_lpc) is done initializing? I think this is the root of the
> > issue...
> 
> I may misunderstand but it seems to me:
> 
> - The ACPI bus enumerated and instantiated the platform devices[6] first.
> 
> - The keyboard platform device was probed when `cros_ec_keyb_driver`
>   registered.  It deferred as its parent's drvdata was NULL[1].
> 
> - The transport platform device was probed when `cros_ec_lpc_driver`
>   registered.  It set the drvdata[3].
> 
> - The keyboard platform device was probed again from retrying the deferred
>   list, by another thread `deferred_probe_work_func`.  The parent's drvdata
>   wasn't NULL and cros_ec_register() for the transport device weren't
>   finished.  The race happened.

Hi Dmitry,

Does it make sense to you?

