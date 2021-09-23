Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0426415E1D
	for <lists+linux-input@lfdr.de>; Thu, 23 Sep 2021 14:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240930AbhIWMTE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Sep 2021 08:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241052AbhIWMSv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Sep 2021 08:18:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB6EC0613DF;
        Thu, 23 Sep 2021 05:17:17 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3021D58B;
        Thu, 23 Sep 2021 14:17:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632399435;
        bh=/drw1Dk5E4UqncQuFxf04jqsz9XYsWqBltMyjLcA6Vo=;
        h=From:To:Cc:References:Subject:Date:In-Reply-To:From;
        b=QrzYKsh1Sk3GiIN/2GIM3wUc7wRNc1rjrkpi1CiJK22eB3nORVIWSrPC/moO1h0zI
         zk4bFSWW2HUiEyFkWRZPSjF+YLrOUiFe/HXWdXcptVz1uhF+byzIxop3Ev/PF2FTWR
         NMQ3vqNjBoA8c4ELhpktZ4iBbujo96wwm7rQEaTM=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>
References: <20210922203027.3229474-1-kieran.bingham@ideasonboard.com>
 <CAMuHMdULHnztv=7i1b1x9BEsO8pu=J3Af_Qx7=CzD3qJhYRNBA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW46
 switch support
Message-ID: <eda13f7c-b353-dcf4-c4ea-c2aa65858e7a@ideasonboard.com>
Date:   Thu, 23 Sep 2021 13:17:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdULHnztv=7i1b1x9BEsO8pu=J3Af_Qx7=CzD3qJhYRNBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 23/09/2021 08:32, Geert Uytterhoeven wrote:
> Hi Kieran,
> 
> CC input
> 
> On Wed, Sep 22, 2021 at 10:30 PM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
>> Add support for SW46-1 and SW46-2 as switches using the gpio-keys
>> framework.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> ---
>>
>> SW_LID and SW_DOCK are selected as low-impact switch events for the
>> default configuration. Would SW_RFKILL_ALL, and SW_MUTE_DEVICE be
>> preferred as more 'functional' defaults? (I have otherwise avoided these
>> to hopefully prevent unwanted / undocumented effects occuring on
>> development hardware running a full interface which may parse these)
>>
>> I'd expect them to be overridden by any platform using them anyway.
> 
> That's a good question
> 
> BTW, I'm happy you brought this up.  I discovered EV_SW only

I hoped it would start a discussion ;-) I noticed no one else was using
EV_SW ... and ... well the slide switches just aren't buttons ;-)

> recently, and had just started wondering whether we should use it
> for the various slide switches on Renesas R-Car Gen2 and Gen3 boards,
> which are modelled using the default EV_KEY and KEY_[1-4].

Indeed, that was my dilemma - there isn't really a 'generic' zero-impact
choice for the slide switches. They all imply that they are likely to be
interpreted by a window manager / gui to make some adjustment to the system.

Which is of course desired in a product/device - but on a test board
like the evaluation modules - I can imagine someone saying they can't
understand why the screen isn't working / is in powersave ... because
... of the undocumented feature that the SW46-1 position indicating that
the 'lid' is closed ...




> I see several DTS files using EV_SW (or hardcoded 5) with KEY_*
> codes instead of EV_* codes, so perhaps KEY_A or KEY_B would be
> suited better, to avoid strange effects? But SW_LID (and KEY_RESERVED)
> seem to be quite popular, too.

It feels 'horrible' reporting Key events on switch events ... but if
it's an approved solution - I'm fine with that.

As long as there is no further side impact of suddenly 'KEY_B' is
constantly pressed, and so the WM is going to act as though a key
modifier is active ...


> Any input^Wgood advice from the input people? TIA!

Yes please ;-)

Maybe we need some 'test' keys / events that can be hooked up that allow
testing/validation but represent that these keys/switches/buttons have
no current definition for their operation...

They're just generic buttons and switches ..

> 
>> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
>> @@ -52,6 +52,24 @@ keys {
>>                 pinctrl-0 = <&keys_pins>;
>>                 pinctrl-names = "default";
>>
>> +               sw-1 {
>> +                       gpios = <&gpio1 28 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <SW_LID>;
>> +                       linux,input-type = <EV_SW>;
>> +                       label = "SW46-1";
>> +                       wakeup-source;
>> +                       debounce-interval = <20>;
>> +               };
>> +
>> +               sw-2 {
>> +                       gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
>> +                       linux,code = <SW_DOCK>;
>> +                       linux,input-type = <EV_SW>;
>> +                       label = "SW46-2";
>> +                       wakeup-source;
>> +                       debounce-interval = <20>;
>> +               };
>> +
>>                 key-1 {
>>                         gpios = <&gpio6 18 GPIO_ACTIVE_LOW>;
>>                         linux,code = <KEY_1>;
> 
> Looks good to me.
> 
>> @@ -193,7 +211,8 @@ i2c6_pins: i2c6 {
>>         };
>>
>>         keys_pins: keys {
>> -               pins = "GP_6_18", "GP_6_19", "GP_6_20";
>> +               pins = "GP_1_28", "GP_1_29",
>> +                      "GP_6_18", "GP_6_19", "GP_6_20";
>>                 bias-pull-up;
>>         };
> 
> This part is not needed, as the GPIOs connected to the slide switches
> have external pull-up resistors (unlike the GPIOs connected to the
> push switches, which are driven low by open-drain buffers, without
> external pull-up resistors).
> 

Ah - for some reason I thought it was required to configure the PFC
regardless, and show that these pins are acquired by the gpio function -
but of course I'd expect 'getting' the gpio would do that..

I'll await some feedback on the best key codes to use before reposting.


Out of interest, is the OD buffer there to act as a hardware debounce or
such? or is there another likely reason?

--
Kieran



> Gr{oetje,eeting}s,
> 
>                         Geert
> 
