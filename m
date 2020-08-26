Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA1E253316
	for <lists+linux-input@lfdr.de>; Wed, 26 Aug 2020 17:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727124AbgHZPMV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Aug 2020 11:12:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50264 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727042AbgHZPMU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Aug 2020 11:12:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598454739;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RXqh9vDKtsqu0uMtgz4E47GKyNBkVyPjz1iexD+khD8=;
        b=OpefgXOsw+z/FvPA+OVBwdDfVaVEF3hBO1lbepEa0/S8W6uDu4POkUrLtEy8uWu/6Q7tg1
        8MDliR1Hu5hfnlRzGgI3edrqZ9kNBAP0mcxwVPd+g6i0kZe6jW8QGobzFkb57ghyMoBz3m
        /Nlnn9wPXRbv6JdpQ0GTQqerGWM9t4U=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-hvE5RTNZNyu1YEwEd-7N2Q-1; Wed, 26 Aug 2020 11:12:16 -0400
X-MC-Unique: hvE5RTNZNyu1YEwEd-7N2Q-1
Received: by mail-ed1-f70.google.com with SMTP id v11so796658edr.13
        for <linux-input@vger.kernel.org>; Wed, 26 Aug 2020 08:12:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RXqh9vDKtsqu0uMtgz4E47GKyNBkVyPjz1iexD+khD8=;
        b=N2are+cyLuWTWAu2GFbxm231fu8hqoh2+skTZvG5qnzuO2+1t1Zp/kXeu1Y/Z6w3Nu
         gsczgHEBihRP3kPs/kCSBnLEQfeheVxtqNcbG529OlWHEk3T2lkCWxmx7NuU2/R9F5CW
         thGpkWSeHUAXIBO2MCBG/ebN172iLEQ6+dcnfkQe/VzddZ4QPrAAA5EXw/ai5zz6l9hT
         ATBSSQa+pt0If78reIX+KQ5pXv6uS429PPtTq+HDMAjXAd6d9zXYgGGMhcwHr/85m1Ca
         b5mWcC7aHTZ5Ew5KzBGUDaz9WN9sE5Qa7SMuaa2qKDXEeUhuOrccQ/EqfcsiI1uWl4vd
         El6g==
X-Gm-Message-State: AOAM533HoP7Dhl0YnlAajcZ32dY0Y4t2uAaGBhkCUjka7oiGPLP1CVDE
        rcUro4n4bjquKUsYKd8MfmVluf6jV71qkV7lU2ozIPM0ucRvJe3fxidlhEM7Les6ecdKWQxnqgQ
        XJm07OSgK6ghLb0RFW+dyqo8=
X-Received: by 2002:aa7:ce15:: with SMTP id d21mr15171105edv.55.1598454734921;
        Wed, 26 Aug 2020 08:12:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZxU1frY0JaTpG9m3IBN2zGr2l9QVoi8/sXv8kJCax1c1y8cZtHEgZdzWOSoBUISm94BHThg==
X-Received: by 2002:aa7:ce15:: with SMTP id d21mr15171076edv.55.1598454734731;
        Wed, 26 Aug 2020 08:12:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t23sm2241356eds.50.2020.08.26.08.12.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 08:12:13 -0700 (PDT)
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200717114155.56222-1-hdegoede@redhat.com>
 <20200719225649.GA4341@khazad-dum.debian.net>
 <20200722054144.GQ1665100@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7726b68c-4b84-4acc-d08c-59f746a75000@redhat.com>
Date:   Wed, 26 Aug 2020 17:12:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722054144.GQ1665100@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 7/22/20 7:41 AM, Dmitry Torokhov wrote:
> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
>> On Fri, 17 Jul 2020, Hans de Goede wrote:
>>> This is a simple patch-series adding support for 3 new hotkeys found
>>> on various new Lenovo Thinkpad models.
>>
>> For all three patches, pending an ack for the new keycodes by the input
>> maintainers:
>>
>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> 
> Do you want me to merge all 3 through input tree?

Despite Andy's acked-by:

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

For merging these through the input tree I'm not seeing these in 5.9-rc2 ?

Regards,

Hans

