Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515B4550B62
	for <lists+linux-input@lfdr.de>; Sun, 19 Jun 2022 17:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229801AbiFSPIz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jun 2022 11:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234559AbiFSPIi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jun 2022 11:08:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11184AE42;
        Sun, 19 Jun 2022 08:08:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9E9286115D;
        Sun, 19 Jun 2022 15:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01748C34114;
        Sun, 19 Jun 2022 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655651316;
        bh=JVuhU4/ZyM9vlAetCKXIhtCrIda3SkxUvBCJohNkfls=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WU+V3/juJgZTZctaxlYmmK2KG895Lz7sBgt6peqlOKLdeBkknMj00cWK9H69RwANI
         hOngVXUn11pXqPwb6Bi/1sTh4LFtwG+uZg7Mk2f3sm9y4OtTiWgYmJ27sZYhvuNGWc
         BhEjCdEmuQK0LwNYg9SU/tngK2R6lR+d9QW6+MCwmRGtXDXNihVn94QH5+DC6JNM2J
         irquLhr/nvoDoyzmSKb47PK1qQ8nAtOAxyqUCGJw5zLUV/HrPFF3LU6Hda+lGzkNgx
         +tDz6coJdZ1nO4cSGe50AJAcsxNAQj0jrBmJfEnX3a+KmhR3rrm/hD6YXI/tpG0gf9
         JT0pvZSioccNQ==
Date:   Sun, 19 Jun 2022 16:17:52 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu,
        Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH v2 2/3] Input: adc-joystick - Add polled input device
 support
Message-ID: <20220619161752.084db59e@jic23-huawei>
In-Reply-To: <ZCFUCR.XGIL3R7SFVS32@crapouillou.net>
References: <20220601204927.10256-1-macroalpha82@gmail.com>
        <20220601204927.10256-3-macroalpha82@gmail.com>
        <ZCFUCR.XGIL3R7SFVS32@crapouillou.net>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 02 Jun 2022 10:22:11 +0100
Paul Cercueil <paul@crapouillou.net> wrote:

> Hi Chris,
>=20
> Le mer., juin 1 2022 at 15:49:26 -0500, Chris Morgan=20
> <macroalpha82@gmail.com> a =C3=A9crit :
> > From: Chris Morgan <macromorgan@hotmail.com>
> >=20
> > Add polled input device support to the adc-joystick driver. This is
> > useful for devices which do not have hardware capable triggers on
> > their SARADC. Code modified from adc-joystick.c changes made by Maya
> > Matuszczyk. =20
>=20
> I understand what you're trying to do, but maybe there's a better way.
>=20
> It would be better if pollable IIO devices would also be able to be=20
> used with a buffer, with the client driver manually triggering the IIO=20
> device through a function call.

We've done exactly that in the past for some of the weirder consumer
drivers.  Though it's done by hooking up a trigger that is provided
by the channel consumer to the supplier device.

>=20
> Jonathan (Cc'd) might have his reasons why this isn't done this way,=20
> and in this case your patch makes sense, but I'd like to hear=20
> Jonathan's thoughts first.

It rarely makes sense to have a sysfs only ADC and it's usually trivial
to add basic support for buffered mode to use with a trigger from elsewhere.
It's rare that their aren't optimizations around batching etc that
make sense though in this path and not the sysfs polling path where only
one channel is being read.   Hence it's not worth a generic route to
hooking them together.

>=20
> As for "adc-joystick,polled"... it doesn't describe the hardware but=20
> rather a specific configuration, so it shouldn't appear in the device=20
> tree.

Sorry, got lost in my email.

I'll take a look at v3.

Jonathan

>=20
> Cheers,
> -Paul
>=20
> >=20
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > ---
> >  drivers/input/joystick/adc-joystick.c | 52=20
> > +++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 11 deletions(-)
> >=20
> > diff --git a/drivers/input/joystick/adc-joystick.c=20
> > b/drivers/input/joystick/adc-joystick.c
> > index 78ebca7d400a..5a28fe7b8ebc 100644
> > --- a/drivers/input/joystick/adc-joystick.c
> > +++ b/drivers/input/joystick/adc-joystick.c
> > @@ -13,6 +13,10 @@
> >=20
> >  #include <asm/unaligned.h>
> >=20
> > +#define ADC_JSK_POLL_INTERVAL	16
> > +#define ADC_JSK_POLL_MIN	8
> > +#define ADC_JSK_POLL_MAX	32
> > +
> >  struct adc_joystick_axis {
> >  	u32 code;
> >  	s32 range[2];
> > @@ -26,8 +30,21 @@ struct adc_joystick {
> >  	struct adc_joystick_axis *axes;
> >  	struct iio_channel *chans;
> >  	int num_chans;
> > +	bool polled;
> >  };
> >=20
> > +static void adc_joystick_poll(struct input_dev *input)
> > +{
> > +	struct adc_joystick *joy =3D input_get_drvdata(input);
> > +	int i, val;
> > +
> > +	for (i =3D 0; i < joy->num_chans; i++) {
> > +		iio_read_channel_raw(&joy->chans[i], &val);
> > +		input_report_abs(input, joy->axes[i].code, val);
> > +	}
> > +	input_sync(input);
> > +}
> > +
> >  static int adc_joystick_handle(const void *data, void *private)
> >  {
> >  	struct adc_joystick *joy =3D private;
> > @@ -215,8 +232,19 @@ static int adc_joystick_probe(struct=20
> > platform_device *pdev)
> >  	joy->input =3D input;
> >  	input->name =3D pdev->name;
> >  	input->id.bustype =3D BUS_HOST;
> > -	input->open =3D adc_joystick_open;
> > -	input->close =3D adc_joystick_close;
> > +
> > +	if (device_property_read_bool(dev, "adc-joystick,polled"))
> > +		joy->polled =3D 1;
> > +
> > +	if (joy->polled) {
> > +		input_setup_polling(input, adc_joystick_poll);
> > +		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
> > +		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
> > +		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
> > +	} else {
> > +		input->open =3D adc_joystick_open;
> > +		input->close =3D adc_joystick_close;
> > +	}
> >=20
> >  	error =3D adc_joystick_set_axes(dev, joy);
> >  	if (error)
> > @@ -229,16 +257,18 @@ static int adc_joystick_probe(struct=20
> > platform_device *pdev)
> >  		return error;
> >  	}
> >=20
> > -	joy->buffer =3D iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> > -	if (IS_ERR(joy->buffer)) {
> > -		dev_err(dev, "Unable to allocate callback buffer\n");
> > -		return PTR_ERR(joy->buffer);
> > -	}
> > +	if (!joy->polled) {
> > +		joy->buffer =3D iio_channel_get_all_cb(dev, adc_joystick_handle,=20
> > joy);
> > +		if (IS_ERR(joy->buffer)) {
> > +			dev_err(dev, "Unable to allocate callback buffer\n");
> > +			return PTR_ERR(joy->buffer);
> > +		}
> >=20
> > -	error =3D devm_add_action_or_reset(dev, adc_joystick_cleanup,=20
> > joy->buffer);
> > -	if (error)  {
> > -		dev_err(dev, "Unable to add action\n");
> > -		return error;
> > +		error =3D devm_add_action_or_reset(dev, adc_joystick_cleanup,=20
> > joy->buffer);
> > +		if (error)  {
> > +			dev_err(dev, "Unable to add action\n");
> > +			return error;
> > +		}
> >  	}
> >=20
> >  	return 0; =20
>=20
>=20

