Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FC248F634
	for <lists+linux-input@lfdr.de>; Sat, 15 Jan 2022 10:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbiAOJrZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 15 Jan 2022 04:47:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbiAOJrY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 15 Jan 2022 04:47:24 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A400C061574
        for <linux-input@vger.kernel.org>; Sat, 15 Jan 2022 01:47:24 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id d187-20020a1c1dc4000000b003474b4b7ebcso10243384wmd.5
        for <linux-input@vger.kernel.org>; Sat, 15 Jan 2022 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=xXIlm8HOFzSwOzD8FItOn15UbpQBeIesDyoBmLlJzug=;
        b=VOYePVuZZB8gz/IQNsiVTYrNTBvMrg2HdHl2/EEJwCHYApf9EmTeWrEwrET0AfkWGg
         Q6g9SpcC5oCtaE8xpoKr9BA+Sox5PPG4WN6Ktj1SydXdGwMUmJGheDUNEpOgJEo6QbvE
         9sXLYQH0hy+WexaP0HdDOiUfd2SPQl1wkisDIMt7scSry9I2LeOFDCDcW7C4u6xBGsjF
         n70HhmabSQii1BrUEgEPPZzhc891SCb1zXHZ0WxbbBGBGlshql1z8+GCD5i5i9TsuUEh
         BLm5RzsIyzhbJ5aJ5ShQjqR3xYjBCfTfZpfDPgVWP/MsQVS4CCafnXuBcU6Su+vzRjBp
         MMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xXIlm8HOFzSwOzD8FItOn15UbpQBeIesDyoBmLlJzug=;
        b=geObILkZkqENNTvBzeWcLkcgtbgwLdYXXVVo/jLdnd/KDdUd5F5r3M0NAxfZml5SO/
         zY28wsUkTl/ta0DMYKIa4V5R2kUceydLgHqlEjfzb7M1HoJch5qyy/tv7wXEn0WHoIqn
         lbfYiYYsCVKuAijp9zu0nfdQ9s6e90CgD+GJLpiQ0eqeBdIeQeHPGpK8/zG43yPZgtHO
         op59qPdeaIsEoiQe6xN31HX0+jD8RZBAExunqG0bNZivROP5kry67IGVIiD9Fjl44sjn
         q2qmZxiXWnk/4d9bjU0lh5EIsHZ9M8YGqKm4qAJlYSTf2nEIppn8+7MRqouPWedXAS/9
         LBHw==
X-Gm-Message-State: AOAM532hdwsNXA7wBObmtLSqdqD86M5cUx7Jq0w3VUU1VWS0FkHRpoXv
        8aGbDFVpFO8cKU53VSbr7D95ACpF4Hs=
X-Google-Smtp-Source: ABdhPJxlr824zlh0PDYenJsl/BTg1YLb/vUI1u4pOM+z3PXoLaz6z9sAVw39tW10oSs9X3Y8ABvfCQ==
X-Received: by 2002:a05:600c:34d2:: with SMTP id d18mr11914864wmq.71.1642240042806;
        Sat, 15 Jan 2022 01:47:22 -0800 (PST)
Received: from ?IPV6:2a02:8109:1a3f:a0e0::150d? ([2a02:8109:1a3f:a0e0::150d])
        by smtp.gmail.com with ESMTPSA id l4sm7728362wru.74.2022.01.15.01.47.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 01:47:22 -0800 (PST)
Message-ID: <fe5f3548-8eb8-0213-0312-e061e5711188@gmail.com>
Date:   Sat, 15 Jan 2022 10:47:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: About the Apple tilde key quirk
Content-Language: en-US
To:     Alex Henrie <alexhenrie24@gmail.com>
Cc:     jkosina@suse.cz,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <7bc98e92-bebc-e765-8d40-75f9a932f392@gmail.com>
 <CAMMLpeSeoXSz2fTA_gYP+4=Sw_ckxkHw3BK57c6HurODxzqsZQ@mail.gmail.com>
From:   Markus Wageringel <markus.wageringel@gmail.com>
In-Reply-To: <CAMMLpeSeoXSz2fTA_gYP+4=Sw_ckxkHw3BK57c6HurODxzqsZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 1/15/22 00:09, Alex Henrie wrote:
> On Fri, Jan 14, 2022 at 2:37 PM Markus Wageringel
> <markus.wageringel@gmail.com> wrote:
>>
>> Hi Alex,
>>
>> regarding the changes around commit [1] that made it into kernel 5.16, I
>> hope you do not mind if I message you directly, as I am not sure where
>> else to bring this up.
>>
>> Apparently, the default behavior (when the iso_layout flag is not
>> configured explicitly) has flipped for my keyboard.
>>
>>       $ lsusb | grep Keyboard
>>       Bus 001 Device 004: ID 05ac:0246 Apple, Inc. Internal
>> Keyboard/Trackpad (ISO)
>>       $ cat /sys/bus/hid/devices/0003\:05AC\:0246.000{2,3}/country
>>       0d
>>       00
>>
>> As my keyboard is rather old (internal German keyboard of MacBookPro8,1
>> 2011), maybe nothing needs to be done about this, so feel free to ignore
>> this email. After all, one gets the correct behavior by explicitly
>> setting `iso_layout=1` now, which used to be the default.
>>
>> Kind regards,
>> Markus
>>
>> [1]
>> https://github.com/torvalds/linux/commit/d58cf34a594d34de1a6843f576f82fae40adc0c2
> 
> Hi Markus,
> 
> Thank you for reporting this to me. Unfortunately, I didn't have any
> foreign MacBooks to test, so I had no way of knowing if any of their
> keyboards had the quirk. But based on your report, I think it's safe
> to say that the quirk is present on the "Wellspring 5" and later
> models. I will send a patch to fix them up.
> 
> Do you have any other MacBooks that you could test (especially super old ones)?
> 
> -Alex

Thank you, Alex. Unfortunately, I do not have access to any other models.

Markus
