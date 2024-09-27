Return-Path: <linux-input+bounces-6821-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 455E99888C5
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 18:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4B221F24D20
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 16:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D451C1725;
	Fri, 27 Sep 2024 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMLLcB0C"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35A17ADF0;
	Fri, 27 Sep 2024 16:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727453338; cv=none; b=WCVxTm50fJrWDaomgkeQTFFgAX9U6Jdl71R9t+4jPI4J5PP/fkxuRqdq+GNSgQkWVqA6ARbZJPSSz4ZEwmmdafR2OdNO70QOcILW2ETfN3B7nWmO5KAgEUR7xAOKb1PNXYij4VusULwjoLpWvGaNngt4+DV0oJt3lUMucHG61uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727453338; c=relaxed/simple;
	bh=Jgeva35jung0HLChJS3oHaOxrwYCVGeyPtkdlN1SI6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbnlkY3re71kj3232J3vHPsSFUo+NaComKlrAmTNSOgv81rcZTnBT5jIPZwRalr2kzw5QNOezZ+nsr6qjHEsC2sqCgZ0wMHJ+osaRAbzWF0apqE3lD6CvqMH2t5i2dbRlZYPyW6Ig58ga+vqO2AQIoa8MhYmfQpFIf6Z5/Bh9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMLLcB0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA5CC4CEC6;
	Fri, 27 Sep 2024 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727453338;
	bh=Jgeva35jung0HLChJS3oHaOxrwYCVGeyPtkdlN1SI6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMLLcB0CPeYXnWoJ+M+VV6LO8BtP0Cc8lJPeDm249puTHgDZ2cRWWBj2u4QGF0qF4
	 CQOnXklJBdNnkBCLkUroki95BnrC/3VpkQ58i8CRHt+AibtwysDxxvLiwbvXEEvwjT
	 YGRGTDvheXGgWQFGoOcv/HXC+UeSDVdR/MxIwiAiaiNr1JszVkKfavLxg3pyfVDWiC
	 jYSW7hNFoJARle0f+oQD6Ne1DW1jyWVgmspfSZ/YE+TiiJU6645ZbJ7bgJONwC9lrx
	 8ODbH5pVVga89H6WV//VxeNDSfi+6smL5YcYSjGNjSnCensPmQw/kgIlAkn3dfG5lm
	 b/BlSxiTm0f9w==
Date: Fri, 27 Sep 2024 18:08:52 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: dri-devel@lists.freedesktop.org, hdegoede@redhat.com, jelle@vdwaa.nl, 
	jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	ojeda@kernel.org, onitake@gmail.com, pavel@ucw.cz
Subject: Re: [PATCH 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04
Message-ID: <et3cv7i2lhsjoq26toweh4uv72yo34u3wqrj3q2urfnx2bhiq3@fdtkag4bcekh>
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926174405.110748-1-wse@tuxedocomputers.com>

On Sep 26 2024, Werner Sembach wrote:
> Hi,
> took some time but now a first working draft of the suggested new way of
> handling per-key RGB keyboard backlights is finished. See:
> https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
> First time for me sending a whole new driver to the LKML, so please excuse
> mistakes I might have made.
> 
> Known bugs:
> - The device has a lightbar which is currently not implemented and
>   therefore stuck to blue once the first backlight control command is send.
> 
> What is still missing:
> - The leds fallback
> - Lightbar control
> 
> Some general noob questions:
> 
> Initially I though it would be nice to have 2 modules, one jsut being the
> wmi initialization and utility stuff and one just being the backlight logic
> stuff, being loaded automatically via module_alias, but that would still
> require me to create the virtual hid device during the wmi_ab probe, and
> that already needs the ll_driver, so i guess I have to do it statically
> like i did now?
> Or in other words: I would have liked to have a module dependency graph
> like this:
>     tuxedo_nb04_lamp_array depends on tuxedo_nb04_platform (combining *_wmi_init and *_wmi_utility)
> but if i currently split it into modules i would get this:
>     tuxedo_nb04_wmi_ab_init dpends on tuxedo_nb04_wmi_ab_lamp_array depends on tuxedo_nb04_wmi_utility

On more general question to you: how much confident are you about your
LampArray implementation?

If you still need to add/fix stuff in it, I would advise you to have a
simple HID device, with bare minimum functionality, and then add the
LampArray functionality on top through HID-BPF. This way you can fix
LampArray out of band with the kernel, while having a more stable kernel
module. This should be possible with v6.11+.

Another solution is to still have your wmi-to-hid module, and then a
HID kernel module in drivers/hid that supports LampArray.

But I would strongly suggest while you are figuring out the userspace
part to stick to HID-BPF, and then once you are happy we can move to a
full kernel module.

Cheers,
Benjamin

> 
> Currently after creating the virtual hdev in the wmi init probe function I
> have to keep track of it and manually destroy it during the wmi init
> remove. Can this be automated devm_kzalloc-style?
> 
> Kind regards,
> Werner Sembach
> 
> 

