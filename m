Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDEA128CA5C
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 10:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403917AbgJMIiU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 04:38:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57455 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403907AbgJMIiU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 04:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602578298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nqAaKKGiC+o6rq21xrjB30mtbgNYtiQcq9guMv2UpHU=;
        b=X3wlpRaInAgoNo06pI0t9rGghkLV5l3bDATtS0KJNVuZ1gOmdCzR/Vo2yOnaVINbIqdJzN
        IZVlervMKAWHOCyPg+cKF36mV6SvT6luihsYKYTkvbBpGYl45zi5dqSXG8qKrfzOEDqBgI
        lYyRE/jRJs1fZe78Xg0bJfhs5xWRC7E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-bDH9CsKJMzG3VGW9i1v-Ig-1; Tue, 13 Oct 2020 04:38:17 -0400
X-MC-Unique: bDH9CsKJMzG3VGW9i1v-Ig-1
Received: by mail-ed1-f72.google.com with SMTP id t4so1895445edv.7
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 01:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nqAaKKGiC+o6rq21xrjB30mtbgNYtiQcq9guMv2UpHU=;
        b=raHh2yK5FQhSqJsxHOGtdqXxvpm7b41FyiGNmOMUJqueUUQJvo08kacwgsK0v1U5IO
         7CEZmi7FvtDuEX6NXki9WHAcnwblBsYx4dMsuE1Fv1w911nldbO0suF4U4rFMT3mUNRU
         k2By+rr9eC1Ox4RnidaTROzEEeo9J3iBBowJCPJO252mcb4F6vvjPebfuf5Mqgjey2d1
         vtlnY2XYFT5f5UjAlqfIcpbFBYoXgZ4jzbX2+NGd142XQf1IY/lM+FdNO3hqn+UxEqyb
         /t4fbTpRX058j9/1mcm5oQukglxjl2wG5cNZUQYkrw62P27X6PUvwH6FaZReeejkcALG
         3bKQ==
X-Gm-Message-State: AOAM5337g8tgiA5vgw3tsFWRdNMshk6FNkpSh4cyIqP8FRjuLYkvaPDO
        VE5239ffm3t3YuUPGfsr+o3RbM0Cc/JKxc0vqOaL+popzKZygsXqHdhEco5/MixobTdxY9ITga3
        X4a3ih6P6s1fN2A6/93yZeAw=
X-Received: by 2002:a17:906:6409:: with SMTP id d9mr31687024ejm.344.1602578296125;
        Tue, 13 Oct 2020 01:38:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx5rd7Cxt0KjcRzHrFTspsRkBCqtz/CBjP7ck+Xb0Tvdpsaad4TRszj626QDPLcawyRUJVk/w==
X-Received: by 2002:a17:906:6409:: with SMTP id d9mr31687012ejm.344.1602578295899;
        Tue, 13 Oct 2020 01:38:15 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id e4sm12171515edk.38.2020.10.13.01.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 01:38:15 -0700 (PDT)
Subject: Re: [External] Using IIO to export laptop palm-sensor and lap-mode
 info to userspace?
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Jeff LaBundy <jeff@labundy.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        Mark Pearson <markpearson@lenovo.com>,
        linux-iio@vger.kernel.org, Nitin Joshi1 <njoshi1@lenovo.com>,
        linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
References: <9f9b0ff6-3bf1-63c4-eb36-901cecd7c4d9@redhat.com>
 <5a646527-7a1f-2fb9-7c09-8becdbff417b@lenovo.com>
 <20201007083602.00006b7e@Huawei.com>
 <218be284-4a37-e9f9-749d-c126ef1d098b@redhat.com>
 <b400b6956270a2433373dd6cbdae3332aa683f4f.camel@hadess.net>
 <cadabe4d-7cce-281e-75fe-fcc2099848da@redhat.com>
 <5273a1de9db682cd41e58553fe57707c492a53b7.camel@hadess.net>
 <272074b5-b28e-1b74-8574-3dc2d614269a@redhat.com>
 <20201008001424.GA3713@labundy.com>
 <9893a32c-02c8-f00c-7f00-6287d55043ab@redhat.com>
 <f4f00263-3beb-d941-eb3a-2be95684db66@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <152411c5-da14-c685-5252-5a4fa6fdbcb4@redhat.com>
Date:   Tue, 13 Oct 2020 10:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f4f00263-3beb-d941-eb3a-2be95684db66@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

Enrico, thank you for your input.

See Mark's excellent email for answers to most of your questions,
I just have one little thing to add.

On 10/12/20 2:36 PM, Enrico Weigelt, metux IT consult wrote:
> On 08.10.20 09:10, Hans de Goede wrote:

<snip>

> Back to the technical side: IMHO we should first work out what the
> actual purpose of these sensors could be - are they useful for
> anything else than just these specific cases ? If not, I'm not
> sure whether it makes sense to put them into IIO at all, but using
> a specific board driver instead.

Right, also note that although there are doubtlessly sensors involved
we don't actually get any meaningful / direct access to these sensors.

We only get to talk to firmware which basically gives us:

Laptop is on someone's lap: yes/no
Someone is resting on the palmrest: yes/no

The lack of direct sensor access also makes this a less then
ideal case for using iio. So I believe that the suggestion
to extend the existing evdev/input SW_FRONT_PROXIMITY support
with 2 new SW_LAP_PROXIMITY and SW_PALMREST_PROXIMITY suggestion
makes a ton of sense. Switches are binary and given that this
really is a derived value and not raw sensor access using the
input system seems a better match.

Regards,

Hans

