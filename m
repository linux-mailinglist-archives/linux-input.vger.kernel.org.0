Return-Path: <linux-input+bounces-3743-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C588C9C47
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 13:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B9E01F230DC
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 11:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBF053E02;
	Mon, 20 May 2024 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FdrfVpyt"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7936134;
	Mon, 20 May 2024 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716205451; cv=none; b=BkPHHmoyO6ts2BLqUGqXXjL3BGrh1I5qsa5s+Be071PMJLq8P1P6luaogopoz3/neA3cNv0zJ2g9jF9dPCTYvdH46sjqsLACD9F6UCwCSmBfuON7VPhAl8tsSt2ggd3BwGsvduWylobjwEWFbK9p9p4ezpHJiSZ4DGAJSTAw07g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716205451; c=relaxed/simple;
	bh=JrKEV3MF4JISD4JRKbt9/nLI81LbwnOvu1GLB3l2fNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jInXotTqNF1l3iasUvVFEo8W9Hrn3UjEDT8xWeAgn6SeIDqT/iQay/3jFLcKQQyA7GZftxBUsN7iuBV6buD6SALSqcdyq+J54f8qloF4VE4o21qimMF0DqscTaTWisWD8oQ4AsF/tFGi1aflzIgK6olZrOh50tr1YrFwOzAx49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FdrfVpyt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99253C2BD10;
	Mon, 20 May 2024 11:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716205450;
	bh=JrKEV3MF4JISD4JRKbt9/nLI81LbwnOvu1GLB3l2fNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FdrfVpytjcxGNGVDPVM8RdaPNXxGXcvni6qzf356GNvbFx/CVWMxAkrVW7P7m8Ydo
	 5QzfzSBBEuwyw109jarhFNUFF1TVcQ6NsGP/i66cbxOgUuBHoHU1TinEb3viwydYn9
	 GDyFwe2dw1zEukYjAhwlgOi31gHRvgZv8mXPs7c7fpW6v+3q7/CN2jp3xfgYolO4an
	 o9hrWd+PG9SP3+HGvIrBtKlz1rJ9RyrlK8JC+TrFlC9DHZkip3e94tmGZR5gWJqr2r
	 DXsiBU1cFUS18mficfXtS9l3+hWbnfus8ENNWgxJXgfgjkibd/Y1IRVppOdoioZkiL
	 F5a+7CwldBNJQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1s91R0-000000004DR-0DSE;
	Mon, 20 May 2024 13:44:06 +0200
Date: Mon, 20 May 2024 13:44:06 +0200
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
Message-ID: <Zks3hp5iUhTe3rLH@hovoldconsulting.com>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
 <20240507144821.12275-5-johan+linaro@kernel.org>
 <CAD=FV=V59t_tZ9Xk=uhbgOdTRYLKu+kZt8cpaksTkJo+D4yt8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=V59t_tZ9Xk=uhbgOdTRYLKu+kZt8cpaksTkJo+D4yt8Q@mail.gmail.com>

Hi Doug,

and sorry about the late reply. Was travelling last week.

On Fri, May 10, 2024 at 04:36:08PM -0700, Doug Anderson wrote:
> On Tue, May 7, 2024 at 7:48 AM Johan Hovold <johan+linaro@kernel.org> wrote:
> >
> > @@ -40,17 +41,17 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
> >                 container_of(ops, struct i2c_hid_of_elan, ops);
> >         int ret;
> >
> > +       gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> 
> Could probably use a comment above it saying that this is important
> when we have "no_reset_on_power_off" and doesn't do anything bad when
> we don't so we can just do it unconditionally.

Possibly, but I'd prefer not to add comments for things like this, which
should be apparent from just looking at the code. And explicitly
asserting reset before deasserting it is not unusual in any way.

> > +
> >         if (ihid_elan->vcc33) {
> >                 ret = regulator_enable(ihid_elan->vcc33);
> >                 if (ret)
> > -                       return ret;
> > +                       goto err_deassert_reset;
> >         }
> >
> >         ret = regulator_enable(ihid_elan->vccio);
> > -       if (ret) {
> > -               regulator_disable(ihid_elan->vcc33);
> > -               return ret;
> > -       }
> > +       if (ret)
> > +               goto err_disable_vcc33;
> >
> >         if (ihid_elan->chip_data->post_power_delay_ms)
> >                 msleep(ihid_elan->chip_data->post_power_delay_ms);
> > @@ -60,6 +61,15 @@ static int elan_i2c_hid_power_up(struct i2chid_ops *ops)
> >                 msleep(ihid_elan->chip_data->post_gpio_reset_on_delay_ms);
> >
> >         return 0;
> > +
> > +err_disable_vcc33:
> > +       if (ihid_elan->vcc33)
> > +               regulator_disable(ihid_elan->vcc33);
> > +err_deassert_reset:
> > +       if (ihid_elan->no_reset_on_power_off)
> > +               gpiod_set_value_cansleep(ihid_elan->reset_gpio, 0);
> 
> Small nit about the error label: it sounds as if when you go here you
> _will_ deassert reset when in actuality you might or might not
> (depending on no_reset_on_power_off).

Yes, this is similar to how err_disable_vcc33 may or may not disable the
optional regulator.

> Personally I prefer to label
> error jumps based on things I've done instead of things that the error
> jump needs to do, so you could call them "err_enabled_vcc33" and
> "err_asserted_reset"...

Naming labels after what they do is less error prone and also explicitly
recommended by the coding style.

> I don't feel that strongly about it, though, so if you love the label
> you have then no need to change it.

So I'd prefer keeping things this way.
 
> > @@ -67,7 +77,14 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
> >         struct i2c_hid_of_elan *ihid_elan =
> >                 container_of(ops, struct i2c_hid_of_elan, ops);
> >
> > -       gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > +       /*
> > +        * Do not assert reset when the hardware allows for it to remain
> > +        * deasserted regardless of the state of the (shared) power supply to
> > +        * avoid wasting power when the supply is left on.
> > +        */
> > +       if (!ihid_elan->no_reset_on_power_off)
> > +               gpiod_set_value_cansleep(ihid_elan->reset_gpio, 1);
> > +
> >         if (ihid_elan->chip_data->post_gpio_reset_off_delay_ms)
> >                 msleep(ihid_elan->chip_data->post_gpio_reset_off_delay_ms);
> 
> Shouldn't  the above two lines be inside the "if
> (!ihid_elan->no_reset_on_power_off)" test? If you're not setting the
> reset GPIO then you don't need to do the delay, right?

Yes, I guess you're right. The off-delay is weird and not normally used,
but apparently it is needed by some panel-follower use case. AFAICT it's
not even related to the reset line, just a hack to add a delay before
the panel is reset by some other driver (see f2f43bf15d7a ("HID:
i2c-hid: elan: Add ili9882t timing")).

I think that's why I just looked the other way and left this little
oddity here unchanged.

> > @@ -79,6 +96,7 @@ static void elan_i2c_hid_power_down(struct i2chid_ops *ops)
> >  static int i2c_hid_of_elan_probe(struct i2c_client *client)
> >  {
> >         struct i2c_hid_of_elan *ihid_elan;
> > +       int ret;
> >
> >         ihid_elan = devm_kzalloc(&client->dev, sizeof(*ihid_elan), GFP_KERNEL);
> >         if (!ihid_elan)
> > @@ -93,21 +111,38 @@ static int i2c_hid_of_elan_probe(struct i2c_client *client)
> >         if (IS_ERR(ihid_elan->reset_gpio))
> >                 return PTR_ERR(ihid_elan->reset_gpio);
> >
> > +       ihid_elan->no_reset_on_power_off = of_property_read_bool(client->dev.of_node,
> > +                                               "no-reset-on-power-off");
> 
> Personally, I'd rather you query for the property before you request
> the GPIO and then request the GPIO in the "powered off" state just to
> keep everything in the most consistent state possible.

No, I don't know what state the reset line is in before the driver
probes. So either I leave it unchanged as I did in v1 or I assert it
here unconditionally as I do in v2 (e.g. to avoid deasserting reset
before the supply is stable).

Johan

