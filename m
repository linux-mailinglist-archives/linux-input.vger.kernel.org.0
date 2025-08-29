Return-Path: <linux-input+bounces-14383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A4FB3BBA4
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 14:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC847B1CBD
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F9C1C1F05;
	Fri, 29 Aug 2025 12:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKTD4sFx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDC833F3;
	Fri, 29 Aug 2025 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756471805; cv=none; b=IIXL2ZErcbYWLK3AONxLPbQDzyWPGm6o3Dfbho1ZI3xLXMCafyWxmbKRoafCbHGifrmaAOCOjw1SSi/Td7HkebKxE/uDCj9ren42MsgW5+jAPrEl7hKX8ZuhzhXJHbCuFuV3G2xphCE/e2ktOs/vhznCJAY58ef9FpboFIYaKgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756471805; c=relaxed/simple;
	bh=b/1nox2yHzK8YaCMSKm1ZzMySVv2BaDe9g+Pi0MEFqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKRLiSofxoZZB+a7OlJGNcgklWQwfy6QGDPqbH6SC806VV/I0NSepXr+QstkxW1maDY57zzSEDHDSKFXJEWYEx3m2cHGMyPCoW4aTZU5EqdaM/RT/RkZRZuEYTCxHEJuDsn8ilH3ovn3HQmNAEms191rMbzfQncrjzwn9SBdk7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKTD4sFx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BB0C4CEF0;
	Fri, 29 Aug 2025 12:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756471804;
	bh=b/1nox2yHzK8YaCMSKm1ZzMySVv2BaDe9g+Pi0MEFqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SKTD4sFxcSlWqif8JRWHKqXS9gtQcTmBHw1j9UmyL7yer+baHCUY9hawWVIpXyGSh
	 Q28ik4hU7RdgYmgiBMHY7l/ekBK1sppqLxDfXKyCIjwvDoRUkhTOWBh7dU4WDx0bK7
	 NCGhvTAfn6dnl9xQ+JJnRK7nYbUWlleYroGutY8BdFNql6hHOGf6DOGdfbxKE1n4T7
	 1ifGebs3OAOei0ZhEqSVCSVSI5NRf7+2FyLeI6Qp7p+q09RfnR5bqhUbaHnQ6u/nYZ
	 dBy/rtKDfJvX/TmUgu0MqkvVBBgRCYWb31Qdf04tpCB49st5zSSs4iPzuNxD45z7r4
	 cbtHnbYRaiYTA==
Date: Fri, 29 Aug 2025 20:50:01 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <aLGhLCc9UQWwBz47@tzungbi-laptop>
References: <20250828083601.856083-1-tzungbi@kernel.org>
 <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>

On Fri, Aug 29, 2025 at 11:28:55AM +0000, Dmitry Torokhov wrote:
> On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> > A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> > modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> > probed at the same time.
> > 
> > Example:
> > 
> > + -----------------------------------------------------------------+
> > | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> > + -----------------------------------------------------------------+
> > | Probe cros-ec-keyb.            |                                 |
> > | - Decide to defer[1].          |                                 |
> > |                                | A device bound to a driver[2].  |
> > | Probe cros_ec_lpc.             |                                 |
> > | - Init the struct[3].          |                                 |
> > |                                | Retry cros-ec-keyb from the     |
> > |                                | deferred list[4].               |
> > |                                | - Won't defer again as [3].     |
> > |                                | - Access uninitialized data in  |
> > |                                |   the struct.                   |
> > | - Register the device.         |                                 |
> > + -----------------------------------------------------------------+
> > 
> > [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> > [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> > [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> > [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> > 
> > Note that the device link[5] can't help as in the observed environment,
> > the devices are already added via device_add()[6].
> > 
> > [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> > [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> > 
> > The series fixes the issue by ensuring the struct is ready for accessing
> > before continuing to probe cros-ec-keyb.
> 
> Why is the keyboard platform device instantiated before the transport
> (cros_ec_lpc) is done initializing? I think this is the root of the
> issue...

I may misunderstand but it seems to me:

- The ACPI bus enumerated and instantiated the platform devices[6] first.

- The keyboard platform device was probed when `cros_ec_keyb_driver`
  registered.  It deferred as its parent's drvdata was NULL[1].

- The transport platform device was probed when `cros_ec_lpc_driver`
  registered.  It set the drvdata[3].

- The keyboard platform device was probed again from retrying the deferred
  list, by another thread `deferred_probe_work_func`.  The parent's drvdata
  wasn't NULL and cros_ec_register() for the transport device weren't
  finished.  The race happened.

