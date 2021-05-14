Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 274F5380599
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 10:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231555AbhENI4T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 04:56:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49734 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhENI4S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 04:56:18 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 2055F1F430D3
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To:     Ikjoon Jang <ikjn@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hsinyi Wang <hsinyi@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210510092631.3141204-1-ikjn@chromium.org>
 <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
 <CAATdQgDfQUVQQwL1KQZvRffUgE+ADcwjBReWhCnmNL3SSgoE-A@mail.gmail.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <daeb031a-1992-704b-49bf-c935078f15f8@collabora.com>
Date:   Fri, 14 May 2021 10:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAATdQgDfQUVQQwL1KQZvRffUgE+ADcwjBReWhCnmNL3SSgoE-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ikjoon,

Thank you for the patch.

On 13/5/21 3:45, Ikjoon Jang wrote:
> On Thu, May 13, 2021 at 12:38 AM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Ikjoon,
>>
>> On 10/05/2021 11:26, Ikjoon Jang wrote:
>>> Add a 'cbas' device node for supporting table mode switch in
> 
> tablet
> 
>>> kukui devices.
>>>
>>> Kukui platforms with detacheable base have an additional input
>>> device under cros-ec, which reports SW_TABLET_MODE regarding
>>> its base state (e.g. base flipped or detached).
>>>
>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>>> ---
>>>
>>>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> index ff56bcfa3370..40030ed48854 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>>>                       compatible = "google,extcon-usbc-cros-ec";
>>>                       google,usb-port-id = <0>;
>>>               };
>>> +
>>> +             base_detection: cbas {


This should be just cbas, remove base_detection. It was a bit confusing follow
these series. If [v5, 2/2] is already applied in hid tree, I'd suggest send a v7
version including:

[v7, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
[v7, 2/2] arm64: dts: mt8183: add cbas node under cros_ec

Both patches can go through the Matthias tree, but the first one also needs an
Ack from Lee Jones, MFD maintainer, which I think is not cc'ied, so unlikely to
give you the needed ack.

Thanks,
  Enric


>>> +                     compatible = "google,cros-cbas";
>>
>> I'm not able to find any binding description for this. It seems linux-next has
>> driver binding to this compatible, but the description is missing.
>>
>> Can you please clarify.
> 
> Yep, that's correct.
> Let me resend this with v2 after the dt-binding patch is applied.
> 
> In this series, I requested queueing these to hid tree:
> 
> [v5, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
> https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-2-ikjn@chromium.org/
> 
> [v5, 2/2] HID: google: Add of_match table to Whiskers switch device.
> https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-3-ikjn@chromium.org/
> 
> Later I found that I missed a comment from [v5, 1/2]
> But only [v5, 2/2] part is already applied to hid tree as I asked for it.
> 
> I sent a v6 dt-binding patch is here (not yet applied)
> https://patchwork.kernel.org/project/linux-input/patch/20210512100832.3878138-1-ikjn@chromium.org/
> 
>>
>> Thanks,
>> Mathias
>>
>>> +             };
>>>       };
>>>  };
>>>
>>>
