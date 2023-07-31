Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC04576953A
	for <lists+linux-input@lfdr.de>; Mon, 31 Jul 2023 13:49:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbjGaLtx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jul 2023 07:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbjGaLtw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jul 2023 07:49:52 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDB8A1;
        Mon, 31 Jul 2023 04:49:50 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 51889869DE;
        Mon, 31 Jul 2023 13:49:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690804188;
        bh=5YdrhcvpRE4z7qmJuIymjcAWrX64KhH0ogyWQYQjweo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=OSEqc+WwGwp1Ja1MLjJKFxrsf4S/M9qUN1VnDtJLD+KuJmV6gjgywrQ8tWNv6tiOW
         Hjms9yKmk7K1JqDRsWCMwg7E+x1Ouc03aS2NwIRbwfFkrb0PMpdMGdU2Aio1A6M9Tg
         RpSbM603GxR9QoMKaZnwcadLozAfs+DRmYZprVH4EAIdZPijgr6xhId6t7s9jEYVVv
         rg69SO3ZL2Lj/8eVEz22WANX8k26idgpqAd2OmSGn4oHXssTOQLhTmBuUudvxOPUSE
         0gmlMHMgnmW06/SKLb5J149J4hr9woKamWqAlMbEJjpIu1H7Cwr1KmGyAxsYWIjaCv
         AvvjtORPe1+xg==
Message-ID: <63adce9a-df65-b462-9055-0ece5216d680@denx.de>
Date:   Mon, 31 Jul 2023 13:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Input: pwm-beeper - Support volume setting via sysfs
Content-Language: en-US
To:     Takashi Iwai <tiwai@suse.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Manuel Traut <manuel.traut@mt.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-pwm@vger.kernel.org, alsa-devel@alsa-project.org,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20230512185551.183049-1-marex@denx.de> <ZF7kCjKGVjsxK8ec@nixie71>
 <0ef98ec1-6191-c72e-2362-310db7f09b84@denx.de>
 <06379f26-ab24-85f9-783f-0c49d4291b23@denx.de> <ZMdIZiC453onyeHh@google.com>
 <873514d2ju.wl-tiwai@suse.de>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <873514d2ju.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/31/23 08:21, Takashi Iwai wrote:
> On Mon, 31 Jul 2023 07:36:38 +0200,
> Dmitry Torokhov wrote:
>>
>> On Sat, May 13, 2023 at 11:02:30PM +0200, Marek Vasut wrote:
>>> On 5/13/23 03:51, Marek Vasut wrote:
>>>> On 5/13/23 03:12, Jeff LaBundy wrote:
>>>>> Hi Marek,
>>>>
>>>> Hi,
>>>>
>>>>> On Fri, May 12, 2023 at 08:55:51PM +0200, Marek Vasut wrote:
>>>>>> The PWM beeper volume can be controlled by adjusting the PWM duty cycle,
>>>>>> expose volume setting via sysfs, so users can make the beeper quieter.
>>>>>> This patch adds sysfs attribute 'volume' in range 0..50000, i.e. from 0
>>>>>> to 50% in 1/1000th of percent steps, this resolution should be
>>>>>> sufficient.
>>>>>>
>>>>>> The reason for 50000 cap on volume or PWM duty cycle is because
>>>>>> duty cycle
>>>>>> above 50% again reduces the loudness, the PWM wave form is inverted wave
>>>>>> form of the one for duty cycle below 50% and the beeper gets quieter the
>>>>>> closer the setting is to 100% . Hence, 50% cap where the wave
>>>>>> form yields
>>>>>> the loudest result.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>> ---
>>>>>> An alternative option would be to extend the userspace input
>>>>>> ABI, e.g. by
>>>>>> using SND_TONE top 16bits to encode the duty cycle in 0..50000
>>>>>> range, and
>>>>>> bottom 16bit to encode the existing frequency in Hz . Since frequency in
>>>>>> Hz is likely to be below some 25 kHz for audible bell, this fits
>>>>>> in 16bits
>>>>>> just fine. Thoughts ?
>>>>>> ---
>>>>>
>>>>> Thanks for the patch; this seems like a useful feature.
>>>>>
>>>>> My first thought is that 50000 seems like an oddly specific limit to
>>>>> impose
>>>>> upon user space. Ideally, user space need not even care that the
>>>>> beeper is
>>>>> implemented via PWM and why 50000 is significant.
>>>>>
>>>>> Instead, what about accepting 0..255 as the LED subsystem does for
>>>>> brightness,
>>>>> then map these values to 0..50000 internally? In fact, the leds-pwm
>>>>> driver
>>>>> does something similar.
>>>>
>>>> The pwm_set_relative_duty_cycle() function can map whatever range to
>>>> whatever other range of the PWM already, so that's not an issues here.
>>>> It seems to me the 0..127 or 0..255 range is a bit too limiting . I
>>>> think even for the LEDs the reason for that limit is legacy design, but
>>>> here I might be wrong.
>>>>
>>>>> I'm also curious as to whether this function should be a rogue sysfs
>>>>> control
>>>>> limited to this driver, or a generic operation in input. For
>>>>> example, input
>>>>> already allows user space to specify the magnitude of an FF effect;
>>>>> perhaps
>>>>> something similar is warranted here?
>>>>
>>>> See the "An alternative ..." part above, I was wondering about this too,
>>>> whether this can be added into the input ABI, but I am somewhat
>>>> reluctant to fiddle with the ABI.
>>>
>>> Thinking about this further, we could try and add some
>>>
>>> EV_SND SND_TONE_WITH_VOLUME
>>>
>>> to avoid overloading EV_SND SND_TONE , and at the same time allow the user
>>> to set both frequency and volume for the tone without any race condition
>>> between the two.
>>>
>>> The EV_SND SND_TONE_WITH_VOLUME would still take one 32bit parameter, except
>>> this time the parameter 16 LSbits would be the frequency and 16 MSbits would
>>> be the volume.
>>>
>>> But again, here I would like input from the maintainers.
>>
>> Beeper was supposed to be an extremely simple device with minimal
>> controls. I wonder if there is need for volume controls, etc, etc are we
>> not better moving it over to the sound subsystem. We already have:
>>
>> 	sound/drivers/pcsp/pcsp.c
>>
>> and
>>
>> 	sound/pci/hda/hda_beep.c
>>
>> there, can we have other "advanced" beepers there as well? Adding sound
>> maintainers to CC...
> 
> I don't mind it put to sound/*.  But, note that pcsp.c you pointed in
> the above is a PCM tone generator driver with a PC beep device, and it
> provides the normal SND_BEEP input only for compatibility.
> 
> Indeed there have been already many sound drivers providing the beep
> capability, and they bind with the input device using SND_BEEP.  And,
> for the beep volume, "Beep Playback Volume" mixer control is provided,
> too.

Uh, I don't need a full sound device to emit beeps, that's not even 
possible with this hardware. I only need to control loudness of the 
beeper that is controlled by PWM output. That's why I am trying to 
extend the pwm-beeper driver, which seems the best fit for such a 
device, it is only missing this one feature (loudness control).
