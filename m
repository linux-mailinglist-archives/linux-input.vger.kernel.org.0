Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C24932063E
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 17:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhBTQfq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 11:35:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51612 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229808AbhBTQfp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 11:35:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613838859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9KvkwIEcOJBS9Ko4zj0pXyIYWD4igHCW24tkd/kPKQE=;
        b=JHCvkkAv20BvXZhqe16F2yMJ1FceUidZ2eouNXwdTQhQ/uM37I73kDZfuaBTCs1d33nHq6
        gm1EJgYZICwRda9XW1+cOHtuo2V4qh3UacdzPWUq+dmhCbcf0vbBtwoeFTZLl8adnbOjle
        u2rDuMNe8LL1NZvMVISwpbKys4MQ6EI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-PZUNIwgCOjifQghiMNdlUw-1; Sat, 20 Feb 2021 11:34:18 -0500
X-MC-Unique: PZUNIwgCOjifQghiMNdlUw-1
Received: by mail-ed1-f72.google.com with SMTP id y90so4607698ede.8
        for <linux-input@vger.kernel.org>; Sat, 20 Feb 2021 08:34:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9KvkwIEcOJBS9Ko4zj0pXyIYWD4igHCW24tkd/kPKQE=;
        b=fFbcZvIqP0OgLYwUT1TvzYkL8rT1cQoBh3f6n7QccVVgiZP9JzVKE1rtTJu47eoCp3
         NdAhDEGpi9r+CAoLNyD8Npb6Ai/YdFONU3rku4GUZgbZTIYR6nyY40PqWf0gy3JQvr3T
         NL5lMTB9pyp3gu4F5Pzdi59sqxxmMlkxq1e9rUKwboJwNreGMNgDhB9oInaqiIXajq4e
         w6fm8XichEoJw5g64icXcG1CpWGDJzHohBPsN3nYoG0hms9TnTyy4dqIpn51mRycxfKY
         GhvT6lAdmd7ZJ1ychJSddnPHwjmnSNUztECweHOwQFbh49Cjcsy/f5dh2hYI230EEnNo
         0zXw==
X-Gm-Message-State: AOAM53073wbx6wmNQ+4/8zYoyZ7IWmwpA6NrvwiMkZUjzQdBEWwG1v3/
        72f9buTU57pueT13fLypONCF+3jJEzic1YSs4joV5Zpx4o2M6WSwvRClvm9Q4K7X1rM/ojwfZnx
        WEr3D4iVzM8rtHwAM55Iqm0g=
X-Received: by 2002:a17:906:bc85:: with SMTP id lv5mr4647434ejb.412.1613838856854;
        Sat, 20 Feb 2021 08:34:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFFVn6pezSVu8Tu1PX1N3TQ9FQYHbnoIs6QJ5LDcIMbBOWWdDTmAMd4JwUpCy32y9RIAUh4w==
X-Received: by 2002:a17:906:bc85:: with SMTP id lv5mr4647426ejb.412.1613838856690;
        Sat, 20 Feb 2021 08:34:16 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id w24sm1547230edv.67.2021.02.20.08.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 08:34:13 -0800 (PST)
Subject: Re: [PATCH v2 5/7] HID: lenovo: Set LEDs max_brightness value
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
References: <20210220122438.21857-1-hdegoede@redhat.com>
 <20210220122438.21857-6-hdegoede@redhat.com> <20210220161645.778fd38f@nic.cz>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <387a8e36-21fe-2b52-41a5-b2945989cd07@redhat.com>
Date:   Sat, 20 Feb 2021 17:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210220161645.778fd38f@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 2/20/21 4:16 PM, Marek Behun wrote:
> On Sat, 20 Feb 2021 13:24:36 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> +	data->led_mute.max_brightness = LED_ON;
> 
> These constants are obsolete since we now support variable maximum
> brightness. Just put 1 there.

Ok, any other remarks wrt the LED bits before I send out a v3 ?

Regards,

Hans

