Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66FE14A47F0
	for <lists+linux-input@lfdr.de>; Mon, 31 Jan 2022 14:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244517AbiAaNVJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 31 Jan 2022 08:21:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21402 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231808AbiAaNVI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 31 Jan 2022 08:21:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643635267;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G/KPezsCASiBPxJkLUR0Vur9OVvC7o/MlYUL6QGttbs=;
        b=gUp7ffv3sY2Ichsqf74ZluvdR9CE405z+fqpGXFKHQ8C0F/ZbVMG9ZD9W+hnqjR9aFVYx4
        +VOvKi4mMtpKqgiiIGGWUGzRKT5Q6CPSKO9Pdes+gwiZ/KVgyYV2p9eomzQ8eMxQb7b0ah
        kFN5tY07u2YV/hJLQCej6lovnBHszvI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-T7jIreJ4OROUh-7BMuqOdQ-1; Mon, 31 Jan 2022 08:21:06 -0500
X-MC-Unique: T7jIreJ4OROUh-7BMuqOdQ-1
Received: by mail-ej1-f72.google.com with SMTP id mp5-20020a1709071b0500b0069f2ba47b20so4932774ejc.19
        for <linux-input@vger.kernel.org>; Mon, 31 Jan 2022 05:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=G/KPezsCASiBPxJkLUR0Vur9OVvC7o/MlYUL6QGttbs=;
        b=7MwWiJ4QLhLM7/yrUjDR/zjG02z08Wy53ivITQgzSdjQNFn8WDfKQMo560nHpQZ6yo
         Ef4/Gsu3DbGCNyPY00hmE6xHpAG6Dt1hdlD9BhKLrAV8gnp+/QnM27trFw4kHGdf+AmD
         Si7wxpQINxkmFvFzWs/pk2Vlmf4nqB/zapqu+PQ8sUpKRes2gziXhkIo1TSTcaJQgV3F
         NV/c0qqh99hgc+7eTB5xc0lBGmv9fLNLILVUKZVBRob5amM4ebTJozHYhNcsDoL30mSo
         tzPSlGyiJym3unRvlO9dLBZ9yv7RxtWMxZpBQIqRzu3i914qNNVtuHqix1JcA8CU6uHs
         C4Rg==
X-Gm-Message-State: AOAM532EBPKOdqp56GSM9BWISPS3suPRREqp/qZVeP9cQJg7YYEAb/nB
        jrBBVFYj3bLd9YLMilo9/N5cE+5k8OTzgS0OEjykLCJpGcAubo1eqdaCtE/4ME6E7Ud8HB+47aY
        Iyrvju4dnYCysg4XcUu/RpLo=
X-Received: by 2002:a17:906:7307:: with SMTP id di7mr16532484ejc.485.1643635264997;
        Mon, 31 Jan 2022 05:21:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzRqUOooqiHitiZYmuhloTTt5Ox6qy42+2pHFBs8Kov9H9QFn4xzCps1YXpNAFdk7Nq35VJwQ==
X-Received: by 2002:a17:906:7307:: with SMTP id di7mr16532470ejc.485.1643635264798;
        Mon, 31 Jan 2022 05:21:04 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id bo19sm16484814edb.56.2022.01.31.05.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jan 2022 05:21:03 -0800 (PST)
Message-ID: <939ea349-bfd7-4580-0745-013fcbc98100@redhat.com>
Date:   Mon, 31 Jan 2022 14:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/5] Input: Add input_copy_abs() function
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <20211212124242.81019-1-hdegoede@redhat.com>
 <20211212124242.81019-2-hdegoede@redhat.com> <YbbTERA000U9bPPR@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YbbTERA000U9bPPR@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thank you for your review of this patch series; and sorry for
being so slow in getting back to you on this.

On 12/13/21 05:58, Dmitry Torokhov wrote:
> Hi Hans,
> 
> On Sun, Dec 12, 2021 at 01:42:38PM +0100, Hans de Goede wrote:
>> Add a new helper function to copy absinfo from one input_dev to
>> another input_dev.
>>
>> This is useful to e.g. setup a pen/stylus input-device for combined
>> touchscreen/pen hardware where the pen uses the same coordinates as
>> the touchscreen.
>>
>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/input/input.c | 34 ++++++++++++++++++++++++++++++++++
>>  include/linux/input.h |  2 ++
>>  2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/input/input.c b/drivers/input/input.c
>> index ccaeb2426385..60f3eb38906f 100644
>> --- a/drivers/input/input.c
>> +++ b/drivers/input/input.c
>> @@ -526,6 +526,40 @@ void input_set_abs_params(struct input_dev *dev, unsigned int axis,
>>  }
>>  EXPORT_SYMBOL(input_set_abs_params);
>>  
>> +/**
>> + * input_copy_abs - Copy absinfo from one input_dev to another
>> + * @dst: Destination input device to copy the abs settings to
>> + * @dst_axis: ABS_* value selecting the destination axis
>> + * @src: Source input device to copy the abs settings from
>> + * @src_axis: ABS_* value selecting the source axis
>> + *
>> + * Set absinfo for the selected destination axis by copying it from
>> + * the specified source input device's source axis.
>> + * This is useful to e.g. setup a pen/stylus input-device for combined
>> + * touchscreen/pen hardware where the pen uses the same coordinates as
>> + * the touchscreen.
>> + */
>> +void input_copy_abs(struct input_dev *dst, unsigned int dst_axis,
>> +		    const struct input_dev *src, unsigned int src_axis)
>> +{
>> +	/*
>> +	 * input_alloc_absinfo() may have failed for the source. Our caller is
>> +	 * expected to catch this when registering the input devices, which may
>> +	 * happen after the input_copy_abs() call.
>> +	 */
>> +	if (!src->absinfo)
>> +		return;
> 
> I'd probably check if source device actually declared EV_ABS/src_axis
> and yelled loudly (WARN?) in such case.

Ack, I will add this for v2.

> 
>> +
>> +	input_alloc_absinfo(dst);
>> +	if (!dst->absinfo)
>> +		return;
>> +
>> +	dst->absinfo[dst_axis] = src->absinfo[src_axis];
>> +
>> +	__set_bit(EV_ABS, dst->evbit);
>> +	__set_bit(dst_axis, dst->absbit);
> 
> input_set_capability() ?

Ack.

Regards,

Hans



> 
>> +}
>> +EXPORT_SYMBOL(input_copy_abs);
> 
> Thanks.
> 

