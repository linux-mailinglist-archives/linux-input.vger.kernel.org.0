Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3713B32F1E8
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 18:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhCERyq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 12:54:46 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:57011 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhCERyj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 12:54:39 -0500
Date:   Fri, 05 Mar 2021 17:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1614966877;
        bh=OLtTeS9whulTVfjNeKIRbp5Nt0oqyEHztozzyRmrAEE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=OYO+4sh06ZpnXqprWsCe8yamKHLyawP5vvwrgiqOOb6q9Sh/T/3IojDedxALaPefo
         bmCc24y3E6YSHETHmwgIc0wrPU2gdhTacceW/YIQmT5lKUFTv6cnfhwVWjkvuywrbZ
         HU7BN7V3I7SAVeY9j0jvenNEbwhOhO2bg81TPftc=
To:     Andi Shyti <andi@etezian.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH] input: s6sy761: fix coordinate read bit shift
Message-ID: <ffc3b523-23e2-402d-5727-82cacb226aab@connolly.tech>
In-Reply-To: <YEIcRBjVSrAIaB+c@jack.zhora.eu>
References: <20210305020310.550527-1-caleb@connolly.tech> <YEIcRBjVSrAIaB+c@jack.zhora.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andi,

On 05/03/2021 11:55 am, Andi Shyti wrote:
> Hi Caleb,
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA256
> Please clean up the commit message.
oops! Sorry
>
>> The touch coordinates are read by shifting a value left by 3,
>> this is incorrect and effectively causes the coordinates to
>> be half of the correct value.
>>
>> Shift by 4 bits instead to report the correct value.
>>
>> This matches downstream examples, and has been confirmed on my
>> device (OnePlus 7 Pro).
> The real reason is that from the register we get:
>
>         byte 3             byte 2             byte 1
> +--------+--------+ +-----------------+ +-----------------+
> |        |        | |                 | |                 |
> | X[3:0] | Y[3:0] | |     Y[11:4]     | |     X[11:4]     |
> |        |        | |                 | |                 |
> +--------+--------+ +-----------------+ +-----------------+
>
> and the 12 bit values have to fit in a 16bit variable.
>
> The upper 8 bits (in event[2] and event[1] need to be shifted
> left by '4' and not by '3' in order to leave space to the lower
> 4 bits (in event[3]).
Thanks for clarifying, sorry for my rather naive commit message.
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   drivers/input/touchscreen/s6sy761.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/input/touchscreen/s6sy761.c b/drivers/input/touchsc=
reen/s6sy761.c
>> index b63d7fdf0cd2..85a1f465c097 100644
>> --- a/drivers/input/touchscreen/s6sy761.c
>> +++ b/drivers/input/touchscreen/s6sy761.c
>> @@ -145,8 +145,8 @@ static void s6sy761_report_coordinates(struct s6sy76=
1_data *sdata,
>>   =09u8 major =3D event[4];
>>   =09u8 minor =3D event[5];
>>   =09u8 z =3D event[6] & S6SY761_MASK_Z;
>> -=09u16 x =3D (event[1] << 3) | ((event[3] & S6SY761_MASK_X) >> 4);
>> -=09u16 y =3D (event[2] << 3) | (event[3] & S6SY761_MASK_Y);
>> +=09u16 x =3D (event[1] << 4) | ((event[3] & S6SY761_MASK_X) >> 4);
>> +=09u16 y =3D (event[2] << 4) | (event[3] & S6SY761_MASK_Y);
> the devil knows how that '3' has ended up there :)
>
> Thanks for catching it!
>
> Reviewed-by: Andi Shyti <andi@etezian.org>

Regards,

Caleb

>
> Andi

