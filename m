Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C50D13FBFD5
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 02:28:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239392AbhHaACh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 20:02:37 -0400
Received: from phobos.denx.de ([85.214.62.61]:35482 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239185AbhHaACO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 20:02:14 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5E81F833C5;
        Tue, 31 Aug 2021 02:01:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630368078;
        bh=L5K3gmMa+RvboVJq51WOwQBrg9YZmJVUn/2Fh7rmmus=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GQPiR8Co+mrJvcv9lWTODl9IKjZs5qzx1mrx9hwqJQXkm+3LBvbqZIoDJy41irvI4
         uUco7rddUIVUXyDPXRLEijVttiMaRmE7cxIOrrdrHa9xBmACrkPUMqDY3zBPSQ4qLi
         ARI1UB/W/VpaA5FONjibz5tWiz8PdYF+xRvNsmMXwIw/waWEqbbwYakEA+CaNELSvX
         ccfl+A5V9XOaWhDS4tGPVVAYh/K5mBS4RsnOZeKcF3yhzeqBpB/JDHR/c3B4tCuqyS
         y8OvlNY9O7imRy9Opxvd9bn13odC36kN8UshorMxuwAsxMIKvxPZLzLcZXLOzMUWh7
         O9IzATxfRksKQ==
Subject: Re: [PATCH v2 1/3] Input: ili210x - use resolution from ili251x
 firmware
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, ch@denx.de,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
References: <20210827211258.318618-1-marex@denx.de>
 <YS1FsJROzDkm/0Ky@google.com> <bfc05564-38dd-d950-ed71-0599c48d57f4@denx.de>
 <YS1oEX75iIjQLn9r@google.com> <3c4be28d-e749-d63a-37c5-60ff686dc6dc@denx.de>
 <YS1twDwAG+W3YurB@google.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <b7983c53-5d1e-6d27-4d8c-2852fef8d2ae@denx.de>
Date:   Tue, 31 Aug 2021 02:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS1twDwAG+W3YurB@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/31/21 1:46 AM, Dmitry Torokhov wrote:
> On Tue, Aug 31, 2021 at 01:31:06AM +0200, Marek Vasut wrote:
>> On 8/31/21 1:21 AM, Dmitry Torokhov wrote:
>>> On Tue, Aug 31, 2021 at 12:49:49AM +0200, Marek Vasut wrote:
>>>> On 8/30/21 10:55 PM, Dmitry Torokhov wrote:
>>>>
>>>> [...]
>>>>
>>>>>> +		return -EINVAL;
>>>>>> +
>>>>>> +	priv->input->absinfo[ABS_X].maximum = resx - 1;
>>>>>> +	priv->input->absinfo[ABS_Y].maximum = resy - 1;
>>>>>> +	priv->input->absinfo[ABS_MT_POSITION_X].maximum = resx - 1;
>>>>>> +	priv->input->absinfo[ABS_MT_POSITION_Y].maximum = resy - 1;
>>>>>
>>>>> There is
>>>>>
>>>>> 	input_set_abs_max(priv->input, ABS_X, resx - 1);
>>>>
>>>> git grep finds nothing in linux-next / your tree on k.org / patchwork. Where
>>>> is that ?
>>>
>>> Look for INPUT_GENERATE_ABS_ACCESSORS in include/linux/input.h
>>
>> Oh, input_abs_set_max, thanks.
> 
> Ah, sorry, mistyped the name first time around.

Yep, no worries, this will be fixed in V3.
