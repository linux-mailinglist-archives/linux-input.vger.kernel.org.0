Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D51B33FBF74
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 01:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232607AbhH3XcD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 19:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231783AbhH3XcD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 19:32:03 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2943C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 16:31:08 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 856F5833CF;
        Tue, 31 Aug 2021 01:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630366266;
        bh=IXhDxu4iJWZhFfTJvCKv+WuAZxd3irmpN0xnE1tUCqg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=UVgsy6lp/QCBZ9tkJON+HaJ2a1rmljBz//Gr0MrrWfnd5C1H43oH0GcIqePY5GyYX
         l83hYcFWBUqEf4cOXiZNLOnRgTvFYMs1kNCGdmzzMyQ2qA0WojTCVfCBmYRJOhXz5P
         G+qUFrqMEW1Ljwmk8y2IF+Uu3U6sfoeTFW+Bybly07XIsyLG77CcQpVnAbd9GMz7ke
         LxGFVVKiF/5DdBJa/YgYXzksXj2ycCEauRVtY7ZMS4HUR1BfbNCOrevXU5oZ3G1eLz
         gbiju1QQw8zKBBfSamdQrHMFirJHFRtV4K+Wv0bkVXsVnu+LB1h+uGc+WxosHia6oj
         jDRd3cejAzNQg==
Subject: Re: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x
 firmware
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210827211258.318618-1-marex@denx.de>
 <YS1FsJROzDkm/0Ky@google.com> <bfc05564-38dd-d950-ed71-0599c48d57f4@denx.de>
 <YS1oEX75iIjQLn9r@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <3c4be28d-e749-d63a-37c5-60ff686dc6dc@denx.de>
Date:   Tue, 31 Aug 2021 01:31:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS1oEX75iIjQLn9r@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/31/21 1:21 AM, Dmitry Torokhov wrote:
> On Tue, Aug 31, 2021 at 12:49:49AM +0200, Marek Vasut wrote:
>> On 8/30/21 10:55 PM, Dmitry Torokhov wrote:
>>
>> [...]
>>
>>>> +		return -EINVAL;
>>>> +
>>>> +	priv->input->absinfo[ABS_X].maximum = resx - 1;
>>>> +	priv->input->absinfo[ABS_Y].maximum = resy - 1;
>>>> +	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
>>>> +	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;
>>>
>>> There is
>>>
>>> 	input_set_abs_max(priv->input, ABS_X, resx - 1);
>>
>> git grep finds nothing in linux-next / your tree on k.org / patchwork. Where
>> is that ?
> 
> Look for INPUT_GENERATE_ABS_ACCESSORS in include/linux/input.h

Oh, input_abs_set_max, thanks.
