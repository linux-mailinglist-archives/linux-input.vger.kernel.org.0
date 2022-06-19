Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F16EF550B64
	for <lists+linux-input@lfdr.de>; Sun, 19 Jun 2022 17:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiFSPKC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jun 2022 11:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiFSPKB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jun 2022 11:10:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8416260C;
        Sun, 19 Jun 2022 08:10:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7572161195;
        Sun, 19 Jun 2022 15:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F7BDC34114;
        Sun, 19 Jun 2022 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655651399;
        bh=VOMYW7h9E0WyZaMI2nwB2Pn/73aJmN2ixv6/6nGiFyI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mRqRYKv8YZdA+vrX3FNBAjUBhwcyKN0bSHZ+UyLmgPunK0T1fOtedd3iSGe+uu7MF
         EJku4v4MYKbOW/gSkq4NXD2hpHTngR2n3YzauPHN9LCdvqkaZBklofDn9Cbu+jeEVi
         2U2Gkx2H7DR7f4Bsb5mdkvaEh2gqh1lDXlN9UkZ0ccE3z/IN0S0r2K0DPaf3USeb+Q
         MX0vf+daFSM8Zlehb3RfF31W7GnCGzdhZu7YkMJa2DdCACZQX8qCdTKziuFQtWeC9P
         oFpE/7gVQkY+N8r3kKSwyS/fvpQeW8f+y3w8L+R/dQrbducvP10sQ5vbZUZXX2E8B8
         IavA2/UZIpGgw==
Date:   Sun, 19 Jun 2022 16:19:16 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, maccraft123mc@gmail.com,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        Chris Morgan <macromorgan@hotmail.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/3] Input: adc-joystick - Add polled input device
 support
Message-ID: <20220619161916.57ed238b@jic23-huawei>
In-Reply-To: <ec496fcf808d73fe356d1961d89bf1ff@artur-rojek.eu>
References: <20220613192353.696-1-macroalpha82@gmail.com>
        <20220613192353.696-3-macroalpha82@gmail.com>
        <ec496fcf808d73fe356d1961d89bf1ff@artur-rojek.eu>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 15 Jun 2022 03:43:07 +0200
Artur Rojek <contact@artur-rojek.eu> wrote:

> On 2022-06-13 21:23, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> > 
> > Add polled input device support to the adc-joystick driver. This is
> > useful for devices which do not have hardware capable triggers on
> > their SARADC. Code modified from adc-joystick.c changes made by Maya
> > Matuszczyk.
> > 
> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>  
> 
> Hi Chris,
> 
> Comments inline. I also Cc'd Paul and Jonathan, who were attached in v2.

Please cc linux-iio@vger.kernel.org on future versions.

> 
> > ---
> >  drivers/input/joystick/adc-joystick.c | 52 +++++++++++++++++++++------
> >  1 file changed, 41 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/input/joystick/adc-joystick.c
> > b/drivers/input/joystick/adc-joystick.c
> > index 78ebca7d400a..dc01cd0214d2 100644
> > --- a/drivers/input/joystick/adc-joystick.c
> > +++ b/drivers/input/joystick/adc-joystick.c
> > @@ -13,6 +13,10 @@
> > 
> >  #include <asm/unaligned.h>
> > 
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
> > 
> > +static void adc_joystick_poll(struct input_dev *input)
> > +{
> > +	struct adc_joystick *joy = input_get_drvdata(input);
> > +	int i, val;
> > +
> > +	for (i = 0; i < joy->num_chans; i++) {
> > +		iio_read_channel_raw(&joy->chans[i], &val);
> > +		input_report_abs(input, joy->axes[i].code, val);
> > +	}
> > +	input_sync(input);
> > +}
> > +
> >  static int adc_joystick_handle(const void *data, void *private)
> >  {
> >  	struct adc_joystick *joy = private;
> > @@ -215,8 +232,19 @@ static int adc_joystick_probe(struct 
> > platform_device *pdev)
> >  	joy->input = input;
> >  	input->name = pdev->name;
> >  	input->id.bustype = BUS_HOST;
> > -	input->open = adc_joystick_open;
> > -	input->close = adc_joystick_close;
> > +
> > +	if (device_property_read_bool(dev, 
> > "adc-joystick,no-hardware-trigger"))
> > +		joy->polled = 1;  
> As mentioned in v2, I don't think a DT property is required here. 
> Assuming the polled mode is a fallback for devices with no buffers, just 
> do:
> ```
> 	joy->polled = !(joy->chans[0].indio_dev->modes &
> 			INDIO_ALL_BUFFER_MODES);
> ```
> > +
> > +	if (joy->polled) {
> > +		input_setup_polling(input, adc_joystick_poll);
> > +		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
> > +		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
> > +		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
> > +	} else {
> > +		input->open = adc_joystick_open;
> > +		input->close = adc_joystick_close;
> > +	}
> > 
> >  	error = adc_joystick_set_axes(dev, joy);
> >  	if (error)
> > @@ -229,16 +257,18 @@ static int adc_joystick_probe(struct
> > platform_device *pdev)
> >  		return error;
> >  	}
> > 
> > -	joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
> > -	if (IS_ERR(joy->buffer)) {
> > -		dev_err(dev, "Unable to allocate callback buffer\n");
> > -		return PTR_ERR(joy->buffer);
> > -	}
> > +	if (!joy->polled) {
> > +		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);  
> Please maintain line discipline of 80 chars to stay consistent with the 
> rest of this driver.
> > +		if (IS_ERR(joy->buffer)) {
> > +			dev_err(dev, "Unable to allocate callback buffer\n");
> > +			return PTR_ERR(joy->buffer);
> > +		}
> > 
> > -	error = devm_add_action_or_reset(dev, adc_joystick_cleanup, 
> > joy->buffer);
> > -	if (error)  {
> > -		dev_err(dev, "Unable to add action\n");
> > -		return error;
> > +		error = devm_add_action_or_reset(dev, adc_joystick_cleanup, 
> > joy->buffer);  
> Same here.
> 
> Cheers,
> Artur
> > +		if (error)  {
> > +			dev_err(dev, "Unable to add action\n");
> > +			return error;
> > +		}
> >  	}
> > 
> >  	return 0;  

