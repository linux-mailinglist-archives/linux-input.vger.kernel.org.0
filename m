Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2151292504
	for <lists+linux-input@lfdr.de>; Mon, 19 Oct 2020 11:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727380AbgJSJyh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Oct 2020 05:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55906 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727088AbgJSJyg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Oct 2020 05:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603101274;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6iKrWxZFguKiC3/FAGY5esxaLrM4e5HmYodMvmzfCMU=;
        b=M3oCgOl3iXjaRxrkXo9Cva/YoEHjUegWspQaHK1+EyY3PN6fcpktY8bDLN5k17FwJhJHN7
        T/GcwqlYOZncRYg4nOFV7fhHwOcaSPwEIikKYjmxkh1M/YrWoJriWSg9/CaI1p5SoRYbAe
        hH6bTY0Ar7NoY3ba4ZkkO08J0UIIJgc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-puJBifkVNvSYlbtQE0-fOA-1; Mon, 19 Oct 2020 05:54:33 -0400
X-MC-Unique: puJBifkVNvSYlbtQE0-fOA-1
Received: by mail-ed1-f71.google.com with SMTP id dc23so4375338edb.13
        for <linux-input@vger.kernel.org>; Mon, 19 Oct 2020 02:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6iKrWxZFguKiC3/FAGY5esxaLrM4e5HmYodMvmzfCMU=;
        b=irhqM9xmKZTA6P4k+TTHL9rfBsGybqnvc2rLVMlIywo/Lq7Ft19l8+b/q/rMKiZU/E
         fHIaTmu5SVtvDqWcfqTJt0xgrDbZ1khzobIuVgO6HwYatXiuZP/wWV1G7IRhfFJ+ie4D
         i+fOuUPgWVOJmSz4unkd16a9oEKvKIp06iNIU1S8IpM1oNbQq0xOhX3DWIPFoS+DRh+9
         aZPpeGIgZO9TWy5QiJUF8ff+y4F7Sj6FDsecwnGCGJgtWSgHg3ojELjvcY8Td09rrnJd
         Om5mEMd1dOavt/jlEfGGDV92KK8f+TyV9S5//OSmOmiUsKRIoKSwI3ldmsO5oojJeokX
         pRZQ==
X-Gm-Message-State: AOAM533XEpxjLAGkMMfeV6WFScaDXxwVvDc2kZFFBj5xwRu0FCg8oyhe
        OXE8hssLFwY4cwSKmN0ZHNH0od5BSrgTcI+zfb7Go7pjMqnk3mHl/JfkEjb10jU2qdu3YDrigoM
        SeitZkHXcKgF3sWHo0Jh+Kns=
X-Received: by 2002:aa7:d394:: with SMTP id x20mr17284562edq.14.1603101271809;
        Mon, 19 Oct 2020 02:54:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr9mpKi1NmMLNAQgXsoC3zDASSIZ4FzR/uvnykbi6jqtELuZQHtlvt8YdM6abje48UQka1MQ==
X-Received: by 2002:aa7:d394:: with SMTP id x20mr17284550edq.14.1603101271636;
        Mon, 19 Oct 2020 02:54:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q10sm10158518ejb.117.2020.10.19.02.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 02:54:30 -0700 (PDT)
Subject: Re: [PATCH V8] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Luke Jones <luke@ljones.dev>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20201013073508.10476-1-luke@ljones.dev>
 <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
 <8P2FIQ.M2MLXE7M40153@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b95839dc-82eb-7413-9000-17939f21b35b@redhat.com>
Date:   Mon, 19 Oct 2020 11:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <8P2FIQ.M2MLXE7M40153@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 10/18/20 11:36 PM, Luke Jones wrote:
> 
> 
>>>  +               */
>>>  +               if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
>>>  +                               report->id == FEATURE_KBD_LED_REPORT_ID2) {
>>
>>>  +                       return -1;
>>
>> is -1 a good return code? (this Q for all cases)
>>
>>>  +               /* Additional report filtering */
>>>  +               } else if (report->id == FEATURE_KBD_REPORT_ID) {
>>>  +                       /* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
>>>  +                       if (data[1] == 0xae) {
>>>  +                               ret = asus_wmi_send_event(drvdata, 0xae);
>>>  +                               if (ret < 0) {
>>>  +                                       hid_warn(hdev, "Asus failed to trigger fan control event");
>>>  +                               }
>>
>>>  +                               return -1;
>>>
> 
> In the case of this block I really don't have any idea how
> to handle it. I want to stop these particular keycodes from
> being evaluated elsewhere. Returning -1 seemed to be the only
> way to do this, unless my understanding is very incorrect.
> 
> Any help or guidance on how to handle this is definitely
> appreciated.

Sorry, I missed that Andy's comment on this where for the raw-event handler,
in this case -1 has the special meaning of don't process this event further,
rather then being an error code.

So, since in this case -1 has a special meaning and it is NOT an error
code, using -1 is fine. IOW you can keep this part as is.

Regards,

Hans

