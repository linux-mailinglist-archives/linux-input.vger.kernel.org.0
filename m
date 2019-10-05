Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64709CCAAC
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 17:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfJEPBY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 11:01:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36005 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfJEPBY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 11:01:24 -0400
Received: by mail-wr1-f65.google.com with SMTP id y19so10423983wrd.3;
        Sat, 05 Oct 2019 08:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=gw016/XWIUt0fMd7M1Dcv9gEgXKBPOQ0lQttG8eRBpU=;
        b=gY6kyIbjmKFoGNSKaLauhHYk1XL22ReJLZFFkqZ5y5BRSko/k3H2roAj7WpyzkHQFZ
         Ahy1PhAQ3n7AwmOXxbidfeMs4yZ4oL9VrlMcLRTjvOtIS874WAr7zy942jyPPC5jjYO6
         DV8q+fwXb0EB5C5omHY/Vt5YO45CXUMMjaecmhr0wU6A0M680WvKPyXs1EymHlNml4h6
         XysSxUxBmf/fLaXTcMjkuYCVuYmwxJGsfYg0aS7stgXkwcy684s9yo4CLUXfDXiBts5N
         npXYx9KnNqQKJ/7KA0dqCaq3bkB6IE3R3+SFY1E97On/Yd55CY9Mfdj8bCrJVN5SoVzD
         iCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gw016/XWIUt0fMd7M1Dcv9gEgXKBPOQ0lQttG8eRBpU=;
        b=stzOMQB6QtOjIb7BaVS60ISi/yyntS3GhE1JORwZMRl9SxwgXMK1S29bHMQagnjtl2
         MOnwqVjn/cepD3VWbLFh1RV3BEZEUlgQMrp6kKQOucLWPZ9VjhMo9Lil3TdpWRO/GZF8
         6I+myu9fcTrrh5iERtWKGglqHwyuu9b9I7gXTffU4W/iq7bZNYRhSOhUZ+dt0wDJagQB
         jnUUyoMjdbJGw2909jx0aA96m7yOZMzYK6JajBsknzbjjyY7rdhKgsQ6ezWNqkvIHZNV
         oxSs3h+BEmKD0qYgebnKH1M/M0xvTCB/1BhENTVAJ7w1O5RlUXBSXf9njoMhyN5O2/Qz
         Y2ZA==
X-Gm-Message-State: APjAAAW8zUYm2jLy+sK+o9rAUoM2eXOUv7LaOOYvwyOn9FkOEiL1b2XF
        Iwk4cDHGay11xJlRKJ4eGO4u7Jwm
X-Google-Smtp-Source: APXvYqxV0ltkf52Kf6RWDpONswjP2BjySP6z4seCDhtY41bKvGxqVBa41zsJL2ZjFOF6r/PnWW105Q==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr15248205wrw.386.1570287681461;
        Sat, 05 Oct 2019 08:01:21 -0700 (PDT)
Received: from [192.168.2.202] (p5487B13B.dip0.t-ipconnect.de. [84.135.177.59])
        by smtp.gmail.com with ESMTPSA id y186sm16934693wmd.26.2019.10.05.08.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 08:01:20 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
 <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
 <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <65b265d2-f7a8-bcd7-e63f-f8efb7349324@gmail.com>
Date:   Sat, 5 Oct 2019 17:01:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, again

On 10/5/19 3:20 PM, Hans de Goede wrote:
> Ok, on x86 the GPIO drivers really should all be builtin because
> various ACPI methods including device D0 / D3 (power-on/off) methods
> may depend on them. So normally this should never happen.
> 
> If this (-EPROBE_DEFER on surface devices) somehow still is happening
> please let me know and we will figure something out.

I have never personally experienced this, only received reports which
indicated this and that the change (as well as manually reloading
soc_button_array) fixed it. I will come back to you if I hear anything
in regards to this again.

I have now also tested your patch on the Surface Book 2. Does not cause
any issues as far as I can tell.

Tested-by: Maximilian Luz <luzmaximilian@gmail.com>

And if that is needed/wanted

Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

Regards,

Maximilian
