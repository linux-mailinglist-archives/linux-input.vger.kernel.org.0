Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE2620AF33
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 11:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgFZJrk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jun 2020 05:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgFZJrk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jun 2020 05:47:40 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E256CC08C5C1;
        Fri, 26 Jun 2020 02:47:39 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id CFC402A59F3
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
References: <20200306085513.76024-1-ikjn@chromium.org>
 <20200417101333.GA3737@dell>
 <ab5adcd1-18f2-9b1c-8c5d-744f7a0e5579@collabora.com>
 <20200625134620.GS954398@dell>
 <b2f27cee-327e-c96c-aa12-5e1ef1f352aa@collabora.com>
 <20200626094005.GA177734@dell>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <42f68bda-a152-9f21-ff72-a71a474a8c92@collabora.com>
Date:   Fri, 26 Jun 2020 11:47:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626094005.GA177734@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lee,

On 26/6/20 11:40, Lee Jones wrote:
> On Fri, 26 Jun 2020, Enric Balletbo i Serra wrote:
> 
>> Hi Lee,
>>
>> On 25/6/20 15:46, Lee Jones wrote:
>>> On Thu, 25 Jun 2020, Enric Balletbo i Serra wrote:
>>>
>>>> Hi Lee,
>>>>
>>>> On 17/4/20 12:13, Lee Jones wrote:
>>>>> On Fri, 06 Mar 2020, Ikjoon Jang wrote:
>>>>>
>>>>>> Convert the ChromeOS EC bindings to json-schema.
>>>>>>
>>>>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>>>>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>>>> ---
>>>>>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
>>>>>>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
>>>>>>  2 files changed, 129 insertions(+), 76 deletions(-)
>>>>>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>>>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
>>>>>
>>>>> Applied, thanks.
>>>>
>>>> I don't see this patch applied, I am missing something?
>>>
>>> It should be there.  Not sure when the MFD repo was last pushed.
>>>
>>> I'll try pushing it again (there are a couple of new patches from
>>> today).  Maybe that will spur a fetch from -next.  If it's still not
>>> there tomorrow, let me know and I'll investigate further.
>>>
>>
>> Still not there, just to make sure I am looking at the right branch, I am checking
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next
> 
> Oh, I see what's happened.
> 
> Looks like this patch wasn't sent to LKML, so my apply script failed.
> 
> Any reason not to send it to LKML?
> 

Ikjoon? I agree that is a good practice cc always the LKML, also I didn't know
you had a script looking at it to pick the patches, that's useful to know :-)

Do you want we resend the patch? In such case, Ikjoon, can you resend it?

Thanks,
 Enric
