Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9297422E6DE
	for <lists+linux-input@lfdr.de>; Mon, 27 Jul 2020 09:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbgG0Hpg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Jul 2020 03:45:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35956 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726451AbgG0Hpf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Jul 2020 03:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595835934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oMBVeCMrmTVhEtBWGjsG1unFoTQ5DrgjjzDJ6NMzZfs=;
        b=NcBw8XlUZ5Cm435c7oC2aPpbyvaDE5705DciVpP6XPz/UkpRwmBOen3ixcP1zz4k0TRwmI
        xpV2STdRyYnaAZQSK8RlqogxwxxWcLhTMhok4TgcCHHng5QBynPI5npJca8dYfKNfnsSNR
        TNxKEZUTTRdkkhvoh/81Y6fpIAeWm9o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-rZMfBWQMOtOuhCTCdxB3hg-1; Mon, 27 Jul 2020 03:45:32 -0400
X-MC-Unique: rZMfBWQMOtOuhCTCdxB3hg-1
Received: by mail-ej1-f71.google.com with SMTP id gv21so5682155ejb.8
        for <linux-input@vger.kernel.org>; Mon, 27 Jul 2020 00:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oMBVeCMrmTVhEtBWGjsG1unFoTQ5DrgjjzDJ6NMzZfs=;
        b=YjZsM7qNve/UvqKiJv/siMyIhahHknRAKWTnYBXIVa2XC+nR81VK1zQ7oKGRXWbVsT
         0Vn7hyVspgdrCdPc5WRCUoYLFZ78StkWarR0qpHFFTUWrZWev/D6FUbeBluNYTgGPrln
         g/M1X35zhuCICTWVcJ8jVR1M4I78cSqLBMVvCV43B4kebXjbYqs8llfjnXofRALmS+Mq
         puBD7m0/KOe1/R3fbLL0DlvXeCQ/DYyL4VxpuoCDsTDSAzyhJRKEfrDAB6f3KUw7/Tcf
         UmjAI1gKgfik0XVG/+KJjNCSDi2WQGWfbdqUXho4yLUSdR6Ej238O8y9McQr94RDdHcP
         iQ6Q==
X-Gm-Message-State: AOAM532OEc0NQNYuyFUAb5V6EMcoH9V6C/YR3S//8NitrzY5HsxX7/tn
        At6KzTErr6i2hTGQWI4ZgfnSbG3qVomWIOP8pilrrjK5bekzWWcmusLRust85qAgXnJ07pkkel0
        yfrP9TEjeP2AXVxGswJIf3ys=
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr2115102ejz.223.1595835931531;
        Mon, 27 Jul 2020 00:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfnpzm5w2mw/jNUlDtxiqUY/d9iJ0u0qln5b8dW/aH3LeubhQN1b6Sy5Yno4zk+7u2dQ26dw==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr2115093ejz.223.1595835931381;
        Mon, 27 Jul 2020 00:45:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id r25sm5659889edy.93.2020.07.27.00.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 00:45:30 -0700 (PDT)
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
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
 <20200727005049.GA10254@khazad-dum.debian.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f67ede61-c9d4-6abc-9b59-a5b2b615d1b6@redhat.com>
Date:   Mon, 27 Jul 2020 09:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200727005049.GA10254@khazad-dum.debian.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 7/27/20 2:50 AM, Henrique de Moraes Holschuh wrote:
> On Tue, 21 Jul 2020, Dmitry Torokhov wrote:
>> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
>>> On Fri, 17 Jul 2020, Hans de Goede wrote:
>>>> This is a simple patch-series adding support for 3 new hotkeys found
>>>> on various new Lenovo Thinkpad models.
>>>
>>> For all three patches, pending an ack for the new keycodes by the input
>>> maintainers:
>>>
>>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>>
>> Do you want me to merge all 3 through input tree?
> 
> Hans, Daren, Andy, what do you prefer?

Taking all this upstream through Dmitry's input tree is fine with
me, but this really is up to Andy and/or Daren.

Regards,

Hans

