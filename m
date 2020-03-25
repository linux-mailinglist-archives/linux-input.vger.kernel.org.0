Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B71771927E5
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 13:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgCYMLt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 08:11:49 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:29355 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbgCYMLt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 08:11:49 -0400
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 37588240003;
        Wed, 25 Mar 2020 12:11:45 +0000 (UTC)
Message-ID: <1db6a35732a2c191ff56043f1ae357d8ae1b5b10.camel@hadess.net>
Subject: Re: [PATCH] Input: goodix - Fix compilation when ACPI support is
 disabled
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, kbuild test robot <lkp@intel.com>
Date:   Wed, 25 Mar 2020 13:11:45 +0100
In-Reply-To: <6611fe58-8e3d-d443-9dd1-6ed9086fa752@redhat.com>
References: <20200325103348.108792-1-hdegoede@redhat.com>
         <9f4df3fdc54448728582ea35f4d3a08411f6aba5.camel@hadess.net>
         <6611fe58-8e3d-d443-9dd1-6ed9086fa752@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.0 (3.36.0-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 2020-03-25 at 12:49 +0100, Hans de Goede wrote:
> Hi,
> 
> On 3/25/20 11:47 AM, Bastien Nocera wrote:
> > On Wed, 2020-03-25 at 11:33 +0100, Hans de Goede wrote:
> > > acpi_execute_simple_method() is not part of the group of ACPI
> > 
> > Could we not stub acpi_execute_simple_method() either in acpi.h or
> > in
> > this driver, and make it return -EINVAL?
> 
> We have 2 troublesome calls:
> 
> acpi_execute_simple_method() in goodix_irq_direction_output()
> acpi_evaluate_object() in goodix_irq_direction_input()
> 
> The second one was not in the build-bot output because the
> build-bot never got around to linking and its prototype is
> brought in even when CONFIG_ACPI is not set.
> 
> This also immediately introduces a problem with adding
> a stub for this one. We cannot have a static stub in
> goodix.c for it because that will trigger warnings after
> include/acpi/acpixf.h first having it declared public.
> 
> We could add a non static stub, but that just feels wrong.
> 
> Doing a static inline stub in include/linux/acpi.h also is
> not possible for the same reason.  That would leave adding
> #ifdef with a stub to include/acpi/acpixf.h, but that is
> not going to fly either because the headers under include/acpi
> are part of the ACPICA project:
> https://github.com/acpica/acpica
> 
> Which is OS independent and the kernel syncs the files from
> it once each cycle, so we cannot make Linux specific changes
> to those headers.

And we can't do something like that?

static acpi_status
goodix_acpi_execute_simple_method (...)
{
#ifdef whatever
  return acpi_execute_simple_method(....);
#else
  return -EINVAL;
#endif
}


> So all in all I believe that #ifdef is the best solution.
> 
> Also note that all the #ifdef-s are in switch-case and cover
> whole cases, so they are pretty clean IMHO.
> 
> As for the braces, alternatively we could keep the variables
> at the top of the goodix_irq_direction_[in|out]put functions
> and mark the as __maybe_unused, then the extra braces this
> change introduces goes away.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> > There's already a stub to avoid those 2 access methods from being
> > used,
> > and I'd prefer a little more code to more ifdef-spaghetti, or
> > awkwardly
> > placed curly braces.
> > 
> > > related functions which get stubbed by include/linux/acpi.h
> > > when ACPI support is disabled, so the IRQ_PIN_ACCESS_ACPI_METHOD
> > > handling code must be disabled through an #ifdef when ACPI
> > > support
> > > is not enabled.
> > > 
> > > For consistency also #ifdef out the IRQ_PIN_ACCESS_ACPI_GPIO code
> > > and use the same #if condition as which is used to replace
> > > goodix_add_acpi_gpio_mappings with a stub.
> > > 
> > > Fixes: c5fca485320e ("Input: goodix - add support for controlling
> > > the
> > > IRQ pin through ACPI methods")
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > ---
> > >   drivers/input/touchscreen/goodix.c | 27 +++++++++++++++++++--
> > > ------
> > >   1 file changed, 19 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/goodix.c
> > > b/drivers/input/touchscreen/goodix.c
> > > index 2c9cd1bfb860..a593ca38b35b 100644
> > > --- a/drivers/input/touchscreen/goodix.c
> > > +++ b/drivers/input/touchscreen/goodix.c
> > > @@ -68,8 +68,10 @@ struct goodix_ts_data;
> > >   enum goodix_irq_pin_access_method {
> > >   	IRQ_PIN_ACCESS_NONE,
> > >   	IRQ_PIN_ACCESS_GPIO,
> > > +#if defined CONFIG_X86 && defined CONFIG_ACPI
> > >   	IRQ_PIN_ACCESS_ACPI_GPIO,
> > >   	IRQ_PIN_ACCESS_ACPI_METHOD,
> > > +#endif
> > >   };
> > >   
> > >   struct goodix_chip_data {
> > > @@ -572,9 +574,6 @@ static int goodix_send_cfg(struct
> > > goodix_ts_data
> > > *ts, const u8 *cfg, int len)
> > >   static int goodix_irq_direction_output(struct goodix_ts_data
> > > *ts,
> > >   				       int value)
> > >   {
> > > -	struct device *dev = &ts->client->dev;
> > > -	acpi_status status;
> > > -
> > >   	switch (ts->irq_pin_access_method) {
> > >   	case IRQ_PIN_ACCESS_NONE:
> > >   		dev_err(&ts->client->dev,
> > > @@ -583,26 +582,29 @@ static int
> > > goodix_irq_direction_output(struct
> > > goodix_ts_data *ts,
> > >   		return -EINVAL;
> > >   	case IRQ_PIN_ACCESS_GPIO:
> > >   		return gpiod_direction_output(ts->gpiod_int,
> > > value);
> > > +#if defined CONFIG_X86 && defined CONFIG_ACPI
> > >   	case IRQ_PIN_ACCESS_ACPI_GPIO:
> > >   		/*
> > >   		 * The IRQ pin triggers on a falling edge, so
> > > its gets
> > > marked
> > >   		 * as active-low, use output_raw to avoid the
> > > value
> > > inversion.
> > >   		 */
> > >   		return gpiod_direction_output_raw(ts-
> > > >gpiod_int,
> > > value);
> > > -	case IRQ_PIN_ACCESS_ACPI_METHOD:
> > > +	case IRQ_PIN_ACCESS_ACPI_METHOD: {
> > > +		struct device *dev = &ts->client->dev;
> > > +		acpi_status status;
> > > +
> > >   		status =
> > > acpi_execute_simple_method(ACPI_HANDLE(dev),
> > >   						    "INTO",
> > > value);
> > >   		return ACPI_SUCCESS(status) ? 0 : -EIO;
> > >   	}
> > > +#endif
> > > +	}
> > >   
> > >   	return -EINVAL; /* Never reached */
> > >   }
> > >   
> > >   static int goodix_irq_direction_input(struct goodix_ts_data
> > > *ts)
> > >   {
> > > -	struct device *dev = &ts->client->dev;
> > > -	acpi_status status;
> > > -
> > >   	switch (ts->irq_pin_access_method) {
> > >   	case IRQ_PIN_ACCESS_NONE:
> > >   		dev_err(&ts->client->dev,
> > > @@ -610,13 +612,20 @@ static int
> > > goodix_irq_direction_input(struct
> > > goodix_ts_data *ts)
> > >   			__func__);
> > >   		return -EINVAL;
> > >   	case IRQ_PIN_ACCESS_GPIO:
> > > +		return gpiod_direction_input(ts->gpiod_int);
> > > +#if defined CONFIG_X86 && defined CONFIG_ACPI
> > >   	case IRQ_PIN_ACCESS_ACPI_GPIO:
> > >   		return gpiod_direction_input(ts->gpiod_int);
> > > -	case IRQ_PIN_ACCESS_ACPI_METHOD:
> > > +	case IRQ_PIN_ACCESS_ACPI_METHOD: {
> > > +		struct device *dev = &ts->client->dev;
> > > +		acpi_status status;
> > > +
> > >   		status = acpi_evaluate_object(ACPI_HANDLE(dev),
> > > "INTI",
> > >   					      NULL, NULL);
> > >   		return ACPI_SUCCESS(status) ? 0 : -EIO;
> > >   	}
> > > +#endif
> > > +	}
> > >   
> > >   	return -EINVAL; /* Never reached */
> > >   }
> > > @@ -862,6 +871,7 @@ static int goodix_get_gpio_config(struct
> > > goodix_ts_data *ts)
> > >   	ts->gpiod_rst = gpiod;
> > >   
> > >   	switch (ts->irq_pin_access_method) {
> > > +#if defined CONFIG_X86 && defined CONFIG_ACPI
> > >   	case IRQ_PIN_ACCESS_ACPI_GPIO:
> > >   		/*
> > >   		 * We end up here if
> > > goodix_add_acpi_gpio_mappings()
> > > has
> > > @@ -878,6 +888,7 @@ static int goodix_get_gpio_config(struct
> > > goodix_ts_data *ts)
> > >   		if (!ts->gpiod_rst)
> > >   			ts->irq_pin_access_method =
> > > IRQ_PIN_ACCESS_NONE;
> > >   		break;
> > > +#endif
> > >   	default:
> > >   		if (ts->gpiod_int && ts->gpiod_rst) {
> > >   			ts->reset_controller_at_probe = true;

