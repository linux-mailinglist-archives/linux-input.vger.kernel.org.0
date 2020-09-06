Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5A225EDB2
	for <lists+linux-input@lfdr.de>; Sun,  6 Sep 2020 14:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgIFMJs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Sep 2020 08:09:48 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:50543 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgIFMJf (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 6 Sep 2020 08:09:35 -0400
Received: from webmail.gandi.net (webmail15.sd4.0x35.net [10.200.201.15])
        (Authenticated sender: contact@artur-rojek.eu)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPA id EFD411BF203;
        Sun,  6 Sep 2020 12:09:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 06 Sep 2020 14:09:28 +0200
From:   Artur Rojek <contact@artur-rojek.eu>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 2/2] input: joystick: Add ADC attached joystick driver.
In-Reply-To: <CAHp75VfixOwpVSXoG1MqaZR2nmgEKumyKW8etLsRj1g=YjgiKw@mail.gmail.com>
References: <20200905163403.64390-1-contact@artur-rojek.eu>
 <20200905163403.64390-2-contact@artur-rojek.eu>
 <CAHp75VfixOwpVSXoG1MqaZR2nmgEKumyKW8etLsRj1g=YjgiKw@mail.gmail.com>
Message-ID: <2f2047e7ada6fcb70489ea6e5917e20a@artur-rojek.eu>
X-Sender: contact@artur-rojek.eu
User-Agent: Roundcube Webmail/1.3.15
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andy,

thanks for the review, replies inline.

On 2020-09-06 11:22, Andy Shevchenko wrote:
> On Sat, Sep 5, 2020 at 7:34 PM Artur Rojek <contact@artur-rojek.eu> 
> wrote:
>> 
>> Add a driver for joystick devices connected to ADC controllers
>> supporting the Industrial I/O subsystem.
> 
> ...
> 
>> +static int adc_joystick_handle(const void *data, void *private)
>> +{
>> +       struct adc_joystick *joy = private;
>> +       enum iio_endian endianness;
>> +       int bytes, msb, val, idx, i;
>> +       bool sign;
>> +
>> +       bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
>> +
>> +       for (i = 0; i < joy->num_chans; ++i) {
>> +               idx = joy->chans[i].channel->scan_index;
>> +               endianness = 
>> joy->chans[i].channel->scan_type.endianness;
>> +               msb = joy->chans[i].channel->scan_type.realbits - 1;
> 
>> +               sign = (tolower(joy->chans[i].channel->scan_type.sign) 
>> == 's');
> 
> Redundant parentheses.
> 
>> +               switch (bytes) {
>> +               case 1:
>> +                       val = ((const u8 *)data)[idx];
>> +                       break;
>> +               case 2:
> 
>> +                       if (endianness == IIO_BE)
>> +                               val = be16_to_cpu(((const __be16 
>> *)data)[idx]);
>> +                       else if (endianness == IIO_LE)
>> +                               val = le16_to_cpu(((const __le16 
>> *)data)[idx]);
>> +                       else /* IIO_CPU */
>> +                               val = ((const u16 *)data)[idx];
>> +                       break;
> 
> Hmm... I don't like explicit castings to restricted types. On top of
> that is it guaranteed that pointer to data will be aligned?
The buffer comes from the IIO core, it is aligned to the sample size.
> As a solution for the first two I would recommend to use
> get_unaligned_be16() / get_unaligned_le16().
> The last one is an interesting case and if data can be unaligned needs
> to be fixed.
> 
>> +               default:
>> +                       return -EINVAL;
>> +               }
>> +
>> +               val >>= joy->chans[i].channel->scan_type.shift;
>> +               if (sign)
>> +                       val = sign_extend32(val, msb);
>> +               else
> 
>> +                       val &= GENMASK(msb, 0);
> 
> It includes msb. Is it expected?
Yes, that's expected as `msb = joy->chans[i].channel->scan_type.realbits 
- 1`.
> 
>> +               input_report_abs(joy->input, joy->axes[i].code, val);
>> +       }
>> +
>> +       input_sync(joy->input);
>> +
>> +       return 0;
>> +}
> 
> ...
> 
>> +static int adc_joystick_open(struct input_dev *dev)
> 
>> +static void adc_joystick_close(struct input_dev *dev)
> 
> Just wondering if this is protected against object lifetime cases.
Can you clarify that in more details?
> 
> ...
> 
>> +err:
> 
> err_fwnode_put: ?
> 
>> +       fwnode_handle_put(child);
>> +       return ret;
> 
> ...
> 
>> +       /* Count how many channels we got. NULL terminated. */
>> +       for (i = 0; joy->chans[i].indio_dev; ++i) {
>> +               bits = joy->chans[i].channel->scan_type.storagebits;
>> +               if (!bits || (bits > 16)) {
>> +                       dev_err(dev, "Unsupported channel storage 
>> size\n");
> 
>> +                       return -EINVAL;
> 
> -ERANGE?
> 
>> +               }
>> +               if (bits != 
>> joy->chans[0].channel->scan_type.storagebits) {
>> +                       dev_err(dev, "Channels must have equal storage 
>> size\n");
>> +                       return -EINVAL;
>> +               }
>> +       }
