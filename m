Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7072F31237A
	for <lists+linux-input@lfdr.de>; Sun,  7 Feb 2021 11:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBGKdr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Feb 2021 05:33:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34574 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229445AbhBGKdq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Feb 2021 05:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612693939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EZ2NyIxf6r/NIa95Lz0kTigmjh+yVnxtRLDiE0g2UJY=;
        b=HKKPxsI/YSQGMwJk12NniOJoiCjqXGJXP8DPBUx16ZMC8fEp5btKundCw0ySQ6mvKLm1zM
        GdKqkxzZ8P70ch6lmmkOiXVQ9WA48Z//u2VlkgZnwTX14QfGaWcF1/krvQL9fl+wXun3R2
        HrgiKUC2vYSfJaN97jrQ6mt5nEZDSiY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-PxZNND9iNxSE2Xyymtx5EQ-1; Sun, 07 Feb 2021 05:32:17 -0500
X-MC-Unique: PxZNND9iNxSE2Xyymtx5EQ-1
Received: by mail-ed1-f72.google.com with SMTP id g6so11538495edy.9
        for <linux-input@vger.kernel.org>; Sun, 07 Feb 2021 02:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EZ2NyIxf6r/NIa95Lz0kTigmjh+yVnxtRLDiE0g2UJY=;
        b=RDiC2VfYN9+ucBFqXTv3MpyMZbqB5nnPttDTaWuEBsDwiN7iftAurOu0b+t2x4Sorh
         KBpFJA+dGfrk18XAtCqEBL4CthPtUXluazF/BmcnPcAkXGIeZJcwTMWFKYkOCAQWSLBb
         JS+HtAFjPG2fLp3eF5pFAtOugNG2T5sWvuJKGptTZ4fvXJw0Bj37g47lPuX/dxY+W9b3
         Jf4zaDje00kuh5JCEB2RUxsNnQdams4fVJ7vQEG4KYAYkg+14b0xAiUOpch2N2r6o+/K
         /CyB8kJnWfuE4Dk+z1pEINXWVruMmpd+U63kGj9U1xbvpjkCS28njRukpnXwiCcCtwfe
         uGKg==
X-Gm-Message-State: AOAM531thlimUe3HuzFWwRdYjHjDtdsjtKXzCB7VL68irJp2+PLFMi3w
        4lkMhiJhs2rKmjblwiYnIkqdHHBm7NHqS0PiDK5rofO+05ZNrEcMN9NANmjDuQ3BFWx3hrK6wq2
        0IeQ5OSW6nwXm0i26WGIj/mo=
X-Received: by 2002:a17:906:3a13:: with SMTP id z19mr12457852eje.317.1612693935870;
        Sun, 07 Feb 2021 02:32:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynt5RcbjbWjEscrjnKI9AW6p2ZEi10XR+wMXyZ8/NYunIcGq2YCKh+O0sv5yYafLcghJMLQQ==
X-Received: by 2002:a17:906:3a13:: with SMTP id z19mr12457842eje.317.1612693935678;
        Sun, 07 Feb 2021 02:32:15 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id c27sm3503626eja.104.2021.02.07.02.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Feb 2021 02:32:15 -0800 (PST)
Subject: Re: [PATCH] Input: synaptic - reverting
 dcb00fc799dc03fd320e123e4c81b3278c763ea5 because it breaks the touchpad for
 one guy on Reddit.
From:   Hans de Goede <hdegoede@redhat.com>
To:     Colton Booth <colton@boothsoftware.ca>, dmitry.torokhov@gmail.com
Cc:     colton@boothlinux.ca, Lyude Paul <lyude@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dennis Kadioglu <denk@eclipso.email>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Yussuf Khalil <dev@pp3345.net>, Ilya Katsnelson <me@0upti.me>,
        Gaurav Agrawal <agrawalgaurav@gnome.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210207035024.69095-1-colton@boothsoftware.ca>
 <08362ef4-c407-9cd0-20fa-354cd8e73fcb@redhat.com>
Message-ID: <354e080e-4ddb-9097-2ca9-4834982e925b@redhat.com>
Date:   Sun, 7 Feb 2021 11:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <08362ef4-c407-9cd0-20fa-354cd8e73fcb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/7/21 11:18 AM, Hans de Goede wrote:
> Hi,
> 
> On 2/7/21 4:50 AM, Colton Booth wrote:
>> I can't test myself since I don't have the correct hardware, BUT this change seems to work for him. I'm thinking he has an early version of the X1E which may use slightly different trackpad revision.
> 
> Who is "him"? Do you have a bug-report link or some such ?
> 
> With which kernel version is this ?  Could it be that the commit you are reverting was
> backported to a stable-series release while that stable series is missing the rmi4
> updates necessary to make things work on newer models ?
> 
> What are the symptoms / problems "him" is seeing when not reverting this?
> 
> On case it is not clear: NACK due to insufficient information why this is
> necessary / missing description and root cause analysis of the actual problem.

p.s.

My apologies if this sounds a bit grumpy, I got out of bed on the wrong side this morning.

Regards,

Hans





> 
> Regards,
> 
> Hans
> 
> 
>>
>> Signed-off-by: Colton Booth <colton@boothsoftware.ca>
>> ---
>>  drivers/input/mouse/synaptics.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
>> index ffad142801b3..2d3f03921dbc 100644
>> --- a/drivers/input/mouse/synaptics.c
>> +++ b/drivers/input/mouse/synaptics.c
>> @@ -179,9 +179,7 @@ static const char * const smbus_pnp_ids[] = {
>>  	"LEN0093", /* T480 */
>>  	"LEN0096", /* X280 */
>>  	"LEN0097", /* X280 -> ALPS trackpoint */
>> -	"LEN0099", /* X1 Extreme Gen 1 / P1 Gen 1 */
>>  	"LEN009b", /* T580 */
>> -	"LEN0402", /* X1 Extreme Gen 2 / P1 Gen 2 */
>>  	"LEN200f", /* T450s */
>>  	"LEN2044", /* L470  */
>>  	"LEN2054", /* E480 */
>>

