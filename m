Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1CB932094
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2019 21:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfFATHZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 1 Jun 2019 15:07:25 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:39856 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfFATHZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 1 Jun 2019 15:07:25 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so7853624wma.4;
        Sat, 01 Jun 2019 12:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:cc:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=9t2l3NuVxa0aZMyvkn87qI+SJPjkg845w5lS4yfH5bQ=;
        b=BwcJC/Jm90DOAIpiy76hnt3jlP53J0ET/1wPixpJeicDUHajRxNCHoBH8iqtY8R5iE
         SrqjM7lVUh+/NV9W30pSewkFQ0bOa2Q3mw8UWaLlC+aqHnpK85znwV/AkYvqN0wQJe7y
         tXTkXuyYeONmfKHJmpvU+VC/T9cuMlX0YaeXSLpMiyWsYQbD5Q3jp8DVb/0DZbg95NKe
         HZ+JiobxGjWJPQcl3YzvCdotM0broe/UiMu76ecWNgNUMmcffnnT3iw2OaE/wJDvopQy
         IgFLkmVKPSpbf9xo+FS+OiOZ7HNzVb0wBs10rJOe1CShjQ7AFUMetSlHr6nR2n8Eiwrn
         wkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9t2l3NuVxa0aZMyvkn87qI+SJPjkg845w5lS4yfH5bQ=;
        b=UbEIAFrux1dnc30UAdI3HON8jHsPwdA+meaxLm49A+MdK22zDsTwwAq83faNe3Oe7V
         9TOd/YYZGf9spCP98R45kXYMG6zEBLi6AlLcHxgWjJ+KE8n8Unh48bKTN+LjB82iXvqh
         3aukW7blf4KiRQxHwnmtSLH9NrQWDf7VHffDmHFrFee4t1DAvkOP/SUg0cmKQ1v1Ht7O
         B4y7P84dLFZ+hXuScsAuhskc/zy+8Da0gM1OenbzlzjUMuQLiffBGkZKepTnvFEZRDUX
         V1Un0B7bculU5P8Vy6GQIU35dlHoed3Hi4jK9vJAZPkc2gWTqZ4PrDr6+3p8nLWSdflX
         8VBQ==
X-Gm-Message-State: APjAAAV57Ho/CB8bpGRaAEEPB6YY079YrvytQqSIg9qWlbV/QAk87P+T
        mYEZdnBVTvoTjpQbY6Vy47g=
X-Google-Smtp-Source: APXvYqzWNOhVnskl2Yi09eRNWFwis8pVkN+fPY+PJ9XfnnxE+iWb60MHK5ITo4wXUp4IhaelPdvlQg==
X-Received: by 2002:a1c:c105:: with SMTP id r5mr9502761wmf.46.1559416042468;
        Sat, 01 Jun 2019 12:07:22 -0700 (PDT)
Received: from [192.168.2.202] (pD9E5A76A.dip0.t-ipconnect.de. [217.229.167.106])
        by smtp.gmail.com with ESMTPSA id k184sm21379536wmk.0.2019.06.01.12.07.20
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 12:07:21 -0700 (PDT)
Subject: Re: [RFC 0/2] Support for buttons on newer MS Surface devices
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
References: <20190516142523.117978-1-luzmaximilian@gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <a0f93af3-c587-40d5-2a85-fdc0f9e6b79f@gmail.com>
Date:   Sat, 1 Jun 2019 21:07:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190516142523.117978-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

any comments on this?

I should also mention that this has been tested via
https://github.com/jakeday/linux-surface.

Maximilian


On 5/16/19 4:25 PM, Maximilian Luz wrote:
> This series adds suport for power and volume buttons on 5th and 6th
> generation Microsoft Surface devices. Specifically, it adds support for
> the power-button on the Surface Laptop 1 and Laptop 2, as well as
> support for power- and (on-device) volume-buttons on the Surface Pro 5
> (2017), Pro 6, and Book 2.
> 
> These devices use the same MSHW0040 device as on the Surface Pro 4,
> however, whereas the Pro 4 uses an ACPI notify handler, the newer
> devices use GPIO interrupts to signal these events.
> 
> The first patch of this series ensures that the surfacepro3_button
> driver, used for MSHW0040 on the Pro 4, does not probe for the newer
> devices. The second patch adapts soc_button_array to implement the
> actual button support.
> 
> I think the changes to soc_button_array in the second patch warrant a
> thorough review. I've tried to make things a bit more generic to be able
> to integrate arbitrary ACPI GPIO power-/volume-button devices more
> easily, I'm not sure if there may be reasons against this.
> 
> Maximilian Luz (2):
>    platform: Fix device check for surfacepro3_button
>    input: soc_button_array for newer surface devices
> 
>   drivers/input/misc/soc_button_array.c     | 134 ++++++++++++++++++++--
>   drivers/platform/x86/surfacepro3_button.c |  38 ++++++
>   2 files changed, 160 insertions(+), 12 deletions(-)
> 
