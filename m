Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9D65504FB
	for <lists+linux-input@lfdr.de>; Sat, 18 Jun 2022 15:08:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiFRNIy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Jun 2022 09:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237514AbiFRNIf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Jun 2022 09:08:35 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFE2167D4;
        Sat, 18 Jun 2022 06:08:33 -0700 (PDT)
Received: (Authenticated sender: contact@artur-rojek.eu)
        by mail.gandi.net (Postfix) with ESMTPA id EBFAF240004;
        Sat, 18 Jun 2022 13:08:29 +0000 (UTC)
MIME-Version: 1.0
Date:   Sat, 18 Jun 2022 15:08:29 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Chris Morgan <macromorgan@hotmail.com>,
        Jonathan Cameron <jic23@kernel.org>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, maccraft123mc@gmail.com,
        heiko@sntech.de, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com,
        Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/3] Input: adc-joystick - Add polled input device
 support
In-Reply-To: <SN6PR06MB5342762DE16AFC607CA9D5F9A5AD9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220613192353.696-1-macroalpha82@gmail.com>
 <20220613192353.696-3-macroalpha82@gmail.com>
 <ec496fcf808d73fe356d1961d89bf1ff@artur-rojek.eu>
 <SN6PR06MB5342762DE16AFC607CA9D5F9A5AD9@SN6PR06MB5342.namprd06.prod.outlook.com>
Message-ID: <cdb956639e9550b287db31b762f7b764@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022-06-15 17:12, Chris Morgan wrote:
> On Wed, Jun 15, 2022 at 03:43:07AM +0200, Artur Rojek wrote:
>> On 2022-06-13 21:23, Chris Morgan wrote:
>> > From: Chris Morgan <macromorgan@hotmail.com>
>> >
>> > Add polled input device support to the adc-joystick driver. This is
>> > useful for devices which do not have hardware capable triggers on
>> > their SARADC. Code modified from adc-joystick.c changes made by Maya
>> > Matuszczyk.
>> >
>> > Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> 
>> Hi Chris,
>> 
>> Comments inline. I also Cc'd Paul and Jonathan, who were attached in 
>> v2.
>> 
>> > ---
>> >  drivers/input/joystick/adc-joystick.c | 52 +++++++++++++++++++++------
>> >  1 file changed, 41 insertions(+), 11 deletions(-)
>> >
>> > diff --git a/drivers/input/joystick/adc-joystick.c
>> > b/drivers/input/joystick/adc-joystick.c
>> > index 78ebca7d400a..dc01cd0214d2 100644
>> > --- a/drivers/input/joystick/adc-joystick.c
>> > +++ b/drivers/input/joystick/adc-joystick.c
>> > @@ -13,6 +13,10 @@
>> >
>> >  #include <asm/unaligned.h>
>> >
>> > +#define ADC_JSK_POLL_INTERVAL	16
>> > +#define ADC_JSK_POLL_MIN	8
>> > +#define ADC_JSK_POLL_MAX	32
>> > +
>> >  struct adc_joystick_axis {
>> >  	u32 code;
>> >  	s32 range[2];
>> > @@ -26,8 +30,21 @@ struct adc_joystick {
>> >  	struct adc_joystick_axis *axes;
>> >  	struct iio_channel *chans;
>> >  	int num_chans;
>> > +	bool polled;
>> >  };
>> >
>> > +static void adc_joystick_poll(struct input_dev *input)
>> > +{
>> > +	struct adc_joystick *joy = input_get_drvdata(input);
>> > +	int i, val;
>> > +
>> > +	for (i = 0; i < joy->num_chans; i++) {
>> > +		iio_read_channel_raw(&joy->chans[i], &val);
>> > +		input_report_abs(input, joy->axes[i].code, val);
>> > +	}
>> > +	input_sync(input);
>> > +}
>> > +
>> >  static int adc_joystick_handle(const void *data, void *private)
>> >  {
>> >  	struct adc_joystick *joy = private;
>> > @@ -215,8 +232,19 @@ static int adc_joystick_probe(struct
>> > platform_device *pdev)
>> >  	joy->input = input;
>> >  	input->name = pdev->name;
>> >  	input->id.bustype = BUS_HOST;
>> > -	input->open = adc_joystick_open;
>> > -	input->close = adc_joystick_close;
>> > +
>> > +	if (device_property_read_bool(dev,
>> > "adc-joystick,no-hardware-trigger"))
>> > +		joy->polled = 1;
>> As mentioned in v2, I don't think a DT property is required here. 
>> Assuming
>> the polled mode is a fallback for devices with no buffers, just do:
>> ```
>> 	joy->polled = !(joy->chans[0].indio_dev->modes &
>> 			INDIO_ALL_BUFFER_MODES);
>> ```
> 
> Understood. I attempted this and noticed that it was showing I have
> INDIO_BUFFER_TRIGGERED in addition to INDIO_DIRECT_MODE (the
> INDIO_DIRECT_MODE is the only one specified at the hardware level
> though). Should I just check for INDIO_BUFFER_SOFTWARE &
> INDIO_BUFFER_HARDWARE instead? I think it's possible that the inclusion
> of the industrialio_triggered_buffer module in my kernel is adding
> this to the channel somehow?
Having INDIO_BUFFER_TRIGGERED means that your saradc is capable of using 
the existing flow. You should be able to register a software trigger and 
use the adc-joystick driver without further issues.
That said, this is where it gets problematic - there is no way to create 
an IIO trigger via Device Tree, since triggers don't describe any piece 
of hardware, and you shouldn't need to register it at runtime 
(configfs/sysfs) for communication between two kernel drivers either. At 
the same time, it's not adc-joystick's job to register an external 
trigger.

Jonathan,
I don't know what the proper approach to this should be, perhaps you 
could assist?

Cheers,
Artur
> 
> Thank you.
> 
>> > +
>> > +	if (joy->polled) {
>> > +		input_setup_polling(input, adc_joystick_poll);
>> > +		input_set_poll_interval(input, ADC_JSK_POLL_INTERVAL);
>> > +		input_set_min_poll_interval(input, ADC_JSK_POLL_MIN);
>> > +		input_set_max_poll_interval(input, ADC_JSK_POLL_MAX);
>> > +	} else {
>> > +		input->open = adc_joystick_open;
>> > +		input->close = adc_joystick_close;
>> > +	}
>> >
>> >  	error = adc_joystick_set_axes(dev, joy);
>> >  	if (error)
>> > @@ -229,16 +257,18 @@ static int adc_joystick_probe(struct
>> > platform_device *pdev)
>> >  		return error;
>> >  	}
>> >
>> > -	joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
>> > -	if (IS_ERR(joy->buffer)) {
>> > -		dev_err(dev, "Unable to allocate callback buffer\n");
>> > -		return PTR_ERR(joy->buffer);
>> > -	}
>> > +	if (!joy->polled) {
>> > +		joy->buffer = iio_channel_get_all_cb(dev, adc_joystick_handle, joy);
>> Please maintain line discipline of 80 chars to stay consistent with 
>> the rest
>> of this driver.
> 
> Understood, sorry about that.
> 
>> > +		if (IS_ERR(joy->buffer)) {
>> > +			dev_err(dev, "Unable to allocate callback buffer\n");
>> > +			return PTR_ERR(joy->buffer);
>> > +		}
>> >
>> > -	error = devm_add_action_or_reset(dev, adc_joystick_cleanup,
>> > joy->buffer);
>> > -	if (error)  {
>> > -		dev_err(dev, "Unable to add action\n");
>> > -		return error;
>> > +		error = devm_add_action_or_reset(dev, adc_joystick_cleanup,
>> > joy->buffer);
>> Same here.
> 
> Ditto.
> 
>> 
>> Cheers,
>> Artur
>> > +		if (error)  {
>> > +			dev_err(dev, "Unable to add action\n");
>> > +			return error;
>> > +		}
>> >  	}
>> >
>> >  	return 0;
