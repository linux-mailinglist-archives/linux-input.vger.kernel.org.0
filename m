Return-Path: <linux-input+bounces-3744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E64668C9CAA
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 13:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70DA0B20996
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C9947F7A;
	Mon, 20 May 2024 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvG7xouh"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3EA14292;
	Mon, 20 May 2024 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716205957; cv=none; b=VmpUX4vMdmOThECkQiaPd46S05rNIQKSY0Ez/ZfVYiFLPc3jkgTQG6kUuLs+zmuuomp7AVB1L6FeIP4CFUDkdwdHmgILpWVuIiWm0lNMBM5cKORmssvgcMedjs3MeALe6+qXsM2w3wEwYY/O7I4s6H3FTovUZNaVXBiQGHDmqeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716205957; c=relaxed/simple;
	bh=z3aFHh38mRkuskXCICZ7ozAmniYihzx6T8rWtzfwYSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnbIXspQTLa+F5pf9ZiDEtA/Tt8d/1Hzev/Pc3tuuvqOvBiBCVIolpMNJ2tYhCxeZUDf6oPK7+ZmEZc4L5j+lKBg6/I4uVPpm2uH0CsD3uOoujRcKPyA6QuKkeF3NueCPpnBd+T+15xpWe1HEey1Cg54I0uivGu/fi9/ke8erow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvG7xouh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2B6C2BD10;
	Mon, 20 May 2024 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716205957;
	bh=z3aFHh38mRkuskXCICZ7ozAmniYihzx6T8rWtzfwYSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LvG7xouhQzrqPROcXkFFVpuc4pXu3XX+WUuWvOH/btvB2pZHPKjNmkMnDeGO9l7mj
	 quyi5oA5fu6YJ9kl5lF8dYQjMwLsURXf8UxtRjY7VmZKlpQpwy9qLkoNQ2bjzWCPE/
	 1qBqEp43fgPJUrn2xcdJ066r8D5dny3DjyQo+LT88Q1mXEil3wpyTA4dD70D3TkNJc
	 ep8NRmTkB/V5yJehV1U6wTWqCHsdbC/Hv1JPueFz2vRhj4uq/ZipVDDkDwxFrGH+gp
	 dHLe1UmBEims3QkdMIfPFQB80bx+BFp7J3BmpipHZJ+fKoZp07gF08lSAJvLxA6BOc
	 szFa9EhP+fZAw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s91ZA-000000004K1-07cL;
	Mon, 20 May 2024 13:52:32 +0200
Date: Mon, 20 May 2024 13:52:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH v2 4/7] HID: i2c-hid: elan: fix reset suspend current
 leakage
Message-ID: <Zks5gJ7H6ZuWr_Xm@hovoldconsulting.com>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
 <20240507144821.12275-5-johan+linaro@kernel.org>
 <CAD=FV=V59t_tZ9Xk=uhbgOdTRYLKu+kZt8cpaksTkJo+D4yt8Q@mail.gmail.com>
 <Zks3hp5iUhTe3rLH@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zks3hp5iUhTe3rLH@hovoldconsulting.com>

On Mon, May 20, 2024 at 01:44:06PM +0200, Johan Hovold wrote:
> On Fri, May 10, 2024 at 04:36:08PM -0700, Doug Anderson wrote:
> > On Tue, May 7, 2024 at 7:48 AM Johan Hovold <johan+linaro@kernel.org> wrote:

> > > @@ -67,7 +77,14 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
> > >         struct i2c_hid_of_elan *ihid_elan =
> > >                 container_of(ops, struct i2c_hid_of_elan, ops);
> > >
> > > -       gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > > +       /*
> > > +        * Do not assert reset when the hardware allows for it to remain
> > > +        * deasserted regardless of the state of the (shared) power supply to
> > > +        * avoid wasting power when the supply is left on.
> > > +        */
> > > +       if (!ihid_elan->no_reset_on_power_off)
> > > +               gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > > +
> > >         if (ihid_elan->chip_data->post_gpio_reset_off_delay_ms)
> > >                 msleep(ihid_elan->chip_data->post_gpio_reset_off_delay_ms);
> > 
> > Shouldn't  the above two lines be inside the "if
> > (!ihid_elan->no_reset_on_power_off)" test? If you're not setting the
> > reset GPIO then you don't need to do the delay, right?
> 
> Yes, I guess you're right. The off-delay is weird and not normally used,
> but apparently it is needed by some panel-follower use case. AFAICT it's
> not even related to the reset line, just a hack to add a delay before
> the panel is reset by some other driver (see f2f43bf15d7a ("HID:
> i2c-hid: elan: Add ili9882t timing")).
> 
> I think that's why I just looked the other way and left this little
> oddity here unchanged.

Hit send too soon.

Since this hack does not appear to be related to the reset line, I think
it's correct to not have it depend on whether the reset line is asserted
or not (e.g. as there could be 'panel-followers' with
'no_reset_on_power_off'):

	 The datasheet specifies there should be 60ms between touch SDA
	 sleep and panel RESX. Doug's series[1] allows panels and
	 touchscreens to power on/off together, so we can add the 65 ms
	 delay in i2c_hid_core_suspend before panel_unprepare.

The power-off delay variable should probably be renamed, but that's a
separate change.

So I think v2 of this series is good to go.

Johan

