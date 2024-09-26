Return-Path: <linux-input+bounces-6773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A2B9878D0
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 20:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1891C20B52
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 18:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B73A1509BF;
	Thu, 26 Sep 2024 18:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqzgGSDj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139C4A24;
	Thu, 26 Sep 2024 18:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727373801; cv=none; b=neO2yTs/uT+ESw6UctTQ4+KmG5ht9yANhVQrO1jxAT60UffVnizX6OdvNf35iVvFUUrRK2feXPOdFTkq70rG7NiwiVNWziZFUqdZ2bn78CISNuZxzjEP+5OpYCuqd6Q4sExUaXPDhumhqsSsRSbif8SYdezXq37wTkaWzF+vw9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727373801; c=relaxed/simple;
	bh=3228WUQ9vmLAriBD/5+dhgd2dxqg90jLNlv96f6hosU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RXvQ6RMd1bACszCG/kysGyd2utIhkRvDQPNU57FNcsjkJVoq7ky4yHbO+ldcHTOa0Clr3lVXpaopoI07PaNP62uDhHB2DIoOTSW8DqZhcyTh921SP9O5N5MUYRSOafSY5Nt+T+x64rwZit0BcD4HX9Wh+o2wYO3WmS9viUKlUAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqzgGSDj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144FBC4CEC5;
	Thu, 26 Sep 2024 18:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727373800;
	bh=3228WUQ9vmLAriBD/5+dhgd2dxqg90jLNlv96f6hosU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kqzgGSDjhP9snOiX20gWrwtkbxJ4FT5Wr4UnFIvZITpLLNwtGuCrqFBd3IakG6See
	 nDxbBih8Zn1IIAloR6eyav9COsM5dOW0otLgXHbz1I0kgI0h7pXBI7nQkGUJ771AbJ
	 HjP4mn+U1A2UzFj0LV0U9h2Z75VZ+adbkvvH3RXcrZJt0ccu1m9ytnk4WA0ELaZE3H
	 Zovmdk2HacZO/U/zLomD9FiYCGGjQiHVswcr++7/Ps7IkTyJ4KGDj+3Z+ISkdC1CEW
	 2NE7OmEu7oJ6sqhhsUNsqNzc791js6xBjDOTP8hJBr+YvXxLAx009ER3uOt+dCnAYh
	 wbM9oX/tY68kQ==
Date: Thu, 26 Sep 2024 20:03:18 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>, 
    "airlied@gmail.com" <airlied@gmail.com>
cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
    "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
    "mripard@kernel.org" <mripard@kernel.org>, 
    "daniel@ffwll.ch" <daniel@ffwll.ch>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas@t-8ch.de>, 
    Orlando Chamberlain <orlandoch.dev@gmail.com>, 
    Kerem Karabay <kekrby@gmail.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
    "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>
Subject: Re: [WHY SUCH DELAY!] Touch Bar support for T2 Macs
In-Reply-To: <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
Message-ID: <nycvar.YFH.7.76.2409262001520.31206@cbobk.fhfr.pm>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com> <MA0P287MB02176175318B96135BE3E320B8902@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM> <nycvar.YFH.7.76.2409111420040.31206@cbobk.fhfr.pm>
 <MA0P287MB0217A06CA89D6A7D0631466EB86A2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Sep 2024, Aditya Garg wrote:

> It has been more than a month since I've sent this patch set and I 
> haven't got a clear yes or not for the same. I understand maintainers 
> are busy people, but I'd really appreciate if I get some response for 
> this series of patches from the HID and DRM maintainers.

Just to reiterate -- I am waiting for Ack from the DRM people and will 
then take it through hid.git.

Dave, who'd be the best person to do this from the DRM side please?

Thanks,

-- 
Jiri Kosina
SUSE Labs


