Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE64C4FAE54
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 16:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236244AbiDJPBI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 10 Apr 2022 11:01:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbiDJPBH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 10 Apr 2022 11:01:07 -0400
X-Greylist: delayed 103795 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 10 Apr 2022 07:58:54 PDT
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEDD5F4E9
        for <linux-input@vger.kernel.org>; Sun, 10 Apr 2022 07:58:54 -0700 (PDT)
Received: (Authenticated sender: contact@artur-rojek.eu)
        by mail.gandi.net (Postfix) with ESMTPA id 1692E240006;
        Sun, 10 Apr 2022 14:58:48 +0000 (UTC)
MIME-Version: 1.0
Date:   Sun, 10 Apr 2022 16:58:48 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] input: adc-joystick: Stop using scan_index for reading
 data
In-Reply-To: <SN6PR06MB5342727A065E9FA2223B6A45A5EB9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220408212857.9583-1-macroalpha82@gmail.com>
 <YlDqTKuo5rbkIL8V@google.com>
 <2941de6570a6f808d6ea6e71d137ef87@artur-rojek.eu>
 <SN6PR06MB5342727A065E9FA2223B6A45A5EB9@SN6PR06MB5342.namprd06.prod.outlook.com>
Message-ID: <c7ace6661c11183586420b431adb6bab@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2022-04-10 03:39, Chris Morgan wrote:
> On Sat, Apr 09, 2022 at 12:08:57PM +0200, Artur Rojek wrote:
>> Hi Chris & Dmitry,
>> 
>> On 2022-04-09 04:07, Dmitry Torokhov wrote:
>> > Hi Chris,
>> >
>> > On Fri, Apr 08, 2022 at 04:28:57PM -0500, Chris Morgan wrote:
>> > > From: Chris Morgan <macromorgan@hotmail.com>
>> > >
>> > > For my Odroid Go Advance I noticed that the adc-joystick driver was
>> > > only reporting the y channel and on the x axis. After debugging, I
>> > > found that the driver was trying to read values from channels 0 and
>> > > 1 even though my device is using channels 1 and 2. By changing the
>> > > code
>> > > to use the axis index instead of the scan index when unpacking the
>> > > data
>> > > from the buffer, the joystick begins working as expected.
>> >
>> > This sounds like some sort of misconfiguration, as your change
>> > effectively removes the ability of using just some ADC channels for
>> > joystick functionality...
>> 
>> I agree, this sounds like either a case of misconfiguration, or an 
>> issue in
>> the ADC driver that this device is using.
>> The axis index corresponds to the iio channel associated with the 
>> joystick,
>> but NOT to the order at which data is sampled by ADC.
>> That's why each channel has a `scan_index` field. It sounds like in 
>> Chris'
>> case the channels have wrong scan indices.
>> I'd start by verifying that in the ADC driver that is being used.
>> 
>> In any case, this patch is wrong and removes functionality that 
>> existing
>> devices depend on.
> 
> I appreciate the feedback. If this driver is working as expected then
> that means the issue I am experiencing is further up the stack. Based
> on troubleshooting by getting the raw data that the rockchip-saradc
> driver was putting into the triggered buffer and seeing what the
> adc-joystick saw coming out of the triggered buffer I wonder if the
> issue is with the rockchip-saradc driver? I noticed that the buffer
> pushed by the driver's trigger handler would only (appear to) send the
> channels that I was requesting data for. So basically the data buffer
> would have the correct values in [0] and [1], but the adc-joystick
> driver by using the idx would fetch values from [1] for x (which has
> the y axis data) and [2] for y (which would have arbitrary data in
> it, usually something around 65406 or so).
> 
> Do you think I should start looking at the rockchip-saradc driver then?
> Should the saradc be putting stuff in the buffer for every channel with
> empty data for channels that aren't to be reported?
> 
> Thank you.

Chris,

I analyzed the IIO core code some more and I think you are correct in 
your assessment.
The data buffer that `adc-joystick` receives will be the length of all 
the *active* channels combined.
That would mean scan index specifies the order of the channels by which 
they appear in the buffer, NOT their offsets in it.

That said, we can't rely on channel order from `joy->chans = 
devm_iio_channel_get_all(dev);`,
as channels might have out-of-order scan indices and thus this sequence 
can't be used to iterate the buffer.
I think the best approach would be to add an IIO helper to find a 
channel offset in a buffer.
Say, something like this:

```
--- a/drivers/iio/buffer/industrialio-buffer-cb.c
+++ b/drivers/iio/buffer/industrialio-buffer-cb.c
@@ -151,6 +151,27 @@ struct iio_dev
  }
  EXPORT_SYMBOL_GPL(iio_channel_cb_get_iio_dev);

+int iio_find_channel_offset_in_buffer(const struct iio_channel 
*channel,
+                                     struct iio_cb_buffer *buffer)
+{
+       const struct iio_chan_spec *chan = channel->channel;
+       struct iio_dev *indio_dev = channel->indio_dev;
+       struct iio_buffer *buf = &buffer->buffer;
+       int ind, i = 0;
+
+       if (chan->scan_index < 0)
+               return -EINVAL;
+
+       for_each_set_bit(ind, buf->scan_mask, indio_dev->masklength) {
+               if (ind == chan->scan_index)
+                       return i;
+               ++i;
+       }
+
+       return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(iio_find_channel_offset_in_buffer);
+
```

...and then the only change in `adc-joystick` has to be:

```
--- a/drivers/input/joystick/adc-joystick.c
+++ b/drivers/input/joystick/adc-joystick.c
@@ -39,10 +39,13 @@ static int adc_joystick_handle(const void *data, 
void *private)
         bytes = joy->chans[0].channel->scan_type.storagebits >> 3;

         for (i = 0; i < joy->num_chans; ++i) {
-               idx = joy->chans[i].channel->scan_index;
                 endianness = 
joy->chans[i].channel->scan_type.endianness;
                 msb = joy->chans[i].channel->scan_type.realbits - 1;
                 sign = tolower(joy->chans[i].channel->scan_type.sign) == 
's';
+               idx = iio_find_channel_offset_in_buffer(&joy->chans[i],
+                                                       joy->buffer);
+               if (idx < 0)
+                       return idx;

                 switch (bytes) {
                 case 1:
```

On a side note, this potentially uncovered an issue in an unrelated 
`ingenic-adc` driver,
where data pushed into the buffer is always the size of all the 
available channels, not just active ones.
I was using that driver while writing `adc-joystick`, which explains why 
I never encountered your problem.

With all that said, let's wait for Jonathan to speak out before we 
proceed with v2.

Cheers,
Artur

> 
>> 
>> Cheers,
>> Artur
>> 
>> >
>> > Let's add Jonathan and Arthur for their take on this.
>> >
>> > >
>> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> > > ---
>> > >  drivers/input/joystick/adc-joystick.c | 7 +++----
>> > >  1 file changed, 3 insertions(+), 4 deletions(-)
>> > >
>> > > diff --git a/drivers/input/joystick/adc-joystick.c
>> > > b/drivers/input/joystick/adc-joystick.c
>> > > index 78ebca7d400a..fe3bbd0d4566 100644
>> > > --- a/drivers/input/joystick/adc-joystick.c
>> > > +++ b/drivers/input/joystick/adc-joystick.c
>> > > @@ -32,24 +32,23 @@ static int adc_joystick_handle(const void *data,
>> > > void *private)
>> > >  {
>> > >  	struct adc_joystick *joy = private;
>> > >  	enum iio_endian endianness;
>> > > -	int bytes, msb, val, idx, i;
>> > > +	int bytes, msb, val, i;
>> > >  	const u16 *data_u16;
>> > >  	bool sign;
>> > >
>> > >  	bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
>> > >
>> > >  	for (i = 0; i < joy->num_chans; ++i) {
>> > > -		idx = joy->chans[i].channel->scan_index;
>> > >  		endianness = joy->chans[i].channel->scan_type.endianness;
>> > >  		msb = joy->chans[i].channel->scan_type.realbits - 1;
>> > >  		sign = tolower(joy->chans[i].channel->scan_type.sign) == 's';
>> > >
>> > >  		switch (bytes) {
>> > >  		case 1:
>> > > -			val = ((const u8 *)data)[idx];
>> > > +			val = ((const u8 *)data)[i];
>> > >  			break;
>> > >  		case 2:
>> > > -			data_u16 = (const u16 *)data + idx;
>> > > +			data_u16 = (const u16 *)data + i;
>> > >
>> > >  			/*
>> > >  			 * Data is aligned to the sample size by IIO core.
>> > > --
>> > > 2.25.1
>> > >
>> >
>> > Thanks.
