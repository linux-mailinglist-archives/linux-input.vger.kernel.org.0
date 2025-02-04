Return-Path: <linux-input+bounces-9747-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58819A26A03
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 03:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D9357A19C8
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 02:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8066282F1;
	Tue,  4 Feb 2025 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8mhlZE7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE04B23B0;
	Tue,  4 Feb 2025 02:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738635445; cv=none; b=Kw8Ivvon0W94REZEw7BL5fTp1XEMi7mL5gnmAKXb+ly4VF+q30v6+4ih8IGNmDuhao5ozy6EYOCo29nwTms2Gw2tC+CXW6uoYwG29P+zW4LTcaO1NN0YhzV8y5V5xbvKP/r5Li1JcLzX6vDuKn+0AtzR5xmar0PfZaJVRRGEQA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738635445; c=relaxed/simple;
	bh=BqrainDbyyDYDJEYk9SPi0kBeYb3IgcRhrY24PmCer0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ix70Ztz/yRbLMVWZDxvGlZLxqinR6l0NyVUwIuMkGWFlfHMig+oBVvZDJPHTVTXEaWqJpnpYLIwC5WvkMR+XSYsXkh9dC82zxeq7x0UzKgKDShIZUBh7qlVinPVV/RHQxTlbFLaXwz301cw4TF9ffKiydPQ/ABXDCbmUd1XpIAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8mhlZE7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37BEC4CEE0;
	Tue,  4 Feb 2025 02:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738635445;
	bh=BqrainDbyyDYDJEYk9SPi0kBeYb3IgcRhrY24PmCer0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O8mhlZE7ZKcYH2GiyX4kQvF5fbvMvRTJ+2H/pVdtYE66V6FUGEdF75FkicqkmC/Pr
	 yf+Rd5t4JCQGk9tGVpMJpO1V+7kbIpoE4WV/1LH70kH7DIHPp10YigMce777+IiJes
	 VQ+P8tAEPUyAnmI4bLRtlE+1i7wqBSA0TLdeke1ywUIdwXqcOSz2rgJatIsJNnhon5
	 SaQkh2R1Nh6c5pYS0NFlrfG6DlxR3KHMNSbIeHBSQUnyu53581pgcszYhpKiN2dE6q
	 xLZ41lcvPvwEekyQ3mQBcyIP9/Ww9FH4rVuZJEgSY8kF4W7yEdc652fWbSVayIFYOD
	 yRudhUtNBlI1Q==
Date: Tue, 4 Feb 2025 03:17:22 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: "bentiss@kernel.org" <bentiss@kernel.org>, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH RESEND v2 1/4] HID: hid-appletb-bl: add driver for the
 backlight of Apple Touch Bars
In-Reply-To: <MAZPR01MB8280DB01B272D489E700C229B8F42@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
Message-ID: <034oq462-2on2-9rns-q99n-1p0rn5s66n65@xreary.bet>
References: <5AEC08E1-0AEF-49BF-94F6-AA1AD71545D0@live.com> <2B5BC9B0-F882-481C-9B09-1FF3978B655D@live.com> <4818p982-4254-985r-73r6-380497qnp41p@xreary.bet> <MAZPR01MB8280DB01B272D489E700C229B8F42@MAZPR01MB8280.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Feb 2025, Aditya Garg wrote:

> You might have noticed that the hid-apple driver has code for the magic 
> backlight. Now we have a case of MacBook Air 2020, which does not have a 
> touchbar but still shows presence of the touchbar backlight device, just 
> because it needs it for the keyboard backlight. In case we merge both 
> the backlight and touchbar code in a driver, on that model, the 
> backlight breaks. If kept separate, the touchbar driver simply doesn't 
> load and backlight works.

Sorry for being dense, but does that mean that it's either hid-appletb-bl 
or hid-apple, but never both to make a good user experience on those 
devices?

If so, can you please point out what exactly is the reason?

Either those have different VID/PID combination, and then it can be easily 
made conditional both in code and in runtime.
Are we talking about conflicting VID/PID combinations, some of them 
needing current hid-apple, and some of them needing (in a mutually 
exclusive way) hid-appletb-bl?

Thanks,

-- 
Jiri Kosina
SUSE Labs


