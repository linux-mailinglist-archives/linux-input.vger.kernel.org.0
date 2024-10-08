Return-Path: <linux-input+bounces-7137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF72C993F71
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 608B8B20CB2
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:34:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 199E51C1AA5;
	Tue,  8 Oct 2024 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bu2uHdSB"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA618FDB7;
	Tue,  8 Oct 2024 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370667; cv=none; b=OjQbS45L3cxLaor1nKS/4aRNIWAwbMwKu46qafCe1sO5qoZ919W6eg1sK7VbJyDeWK7DINjnl+vzT/+zMNHFZzruf/RgKxWAeJ4xtl4JzeDl3cPajMNsWyKI+n/Z958km+kGfHTILiAjLzAhtQv3/b9f/hZ/bB85GtchvYyhM38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370667; c=relaxed/simple;
	bh=UbuV+c00CwL2uO6e4Gz8tF4MdLxdFDm8hR4wKAxUJiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L3FfV37iDnWqhFamwjiX7DGAI5M9dGcoE2vULjUY/U5XDPwIGzuI72YVG00ZNz2bwqFTA0RuhF90OhWMcBujpM4mxXD6vYMwRXcYGxS10PGKrcHbfMkZ9njPp5d+exc1OkmN85YJJvtRHdFpc+wr2aJ9mUO23/z5Cy4EyC2mi2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bu2uHdSB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21201C4CED2;
	Tue,  8 Oct 2024 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370666;
	bh=UbuV+c00CwL2uO6e4Gz8tF4MdLxdFDm8hR4wKAxUJiw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bu2uHdSBu2RTrt/+5FVX980QMypWRmQGgjMyyw+z6yKgz4xm3COU1BiXSWM5HH2Am
	 EcWIlCi8JfX+kvvWX82BvVJYAQfZpBmBoZ1m0pYgdxCB9lQ6gh0j4BW2eHtrqE114i
	 6THGk+OA0JywSF0ZTmwtzbF42MVxuPdy/aA/XbWpFCm3zYrDAuXESoBdGxeNY8Iw7I
	 fu4O6NvmtFQSK8AdTmAiqXqVsEly9U0vO0ClPTIiCxKliHLM9v0ko3gLYzQqHt9swU
	 hFfqCOA4sgN4AZm2JkCueg2zQBmlFMPiJ6Hn+/kYiYSNC9MIUj7dLQ0XztJ4ET0DYH
	 OdU72Y2D92Psg==
Date: Tue, 8 Oct 2024 08:57:44 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
cc: linux-input@vger.kernel.org, Benjamin Tissoires <bentiss@kernel.org>, 
    Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 RESEND] HID: corsair-void: Add Corsair Void headset
 family driver
In-Reply-To: <20240909184936.32489-3-stuart.a.hayhurst@gmail.com>
Message-ID: <nycvar.YFH.7.76.2410080855470.20286@cbobk.fhfr.pm>
References: <20240909184936.32489-3-stuart.a.hayhurst@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Sep 2024, Stuart Hayhurst wrote:

> Introduce a driver for the Corsair Void family of headsets, supporting:
>  - Battery reporting (power_supply)
>  - Sidetone setting support
>  - Physical microphone location reporting
>  - Headset and receiver firmware version reporting
>  - Built-in alert triggering
>  - USB wireless_status
> 
> Tested with a Void Pro Wireless, Void Elite Wireless and a Void Elite Wired
> 
> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>

Thanks a lot for working on this! I have one small nit:

[ ... snip ... ]
> +config HID_CORSAIR_VOID
> +	tristate "Corsair Void headsets"
> +	depends on USB_HID
> +	select POWER_SUPPLY
> +	help
> +	Support for Corsair Void headsets.
> +
> +	Supported devices:
> +	- Corsair Void headsets
> +

As we alreay have general CONFIG_HID_CORSAIR, I think it'd make sense for 
this driver to be encapsulated under this config option as well (it'd also 
follow the general practice of HID subsystem, that the drivers are divided 
per vendor) -- i.e. link hid-corsair-void into the final hid-corsair.ko 
whenever CONFIG_HID_CORSAIR is selected.

Would you be willing to make that small change, and resubmit for final 
merge?

Thanks,

-- 
Jiri Kosina
SUSE Labs


