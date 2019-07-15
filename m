Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9AB685E2
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 11:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbfGOJCW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 05:02:22 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44214 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOJCV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 05:02:21 -0400
Received: by mail-ed1-f65.google.com with SMTP id k8so14608534edr.11
        for <linux-input@vger.kernel.org>; Mon, 15 Jul 2019 02:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iE7cuuveDosBAiWYUExanMBgFYSheRMOvkk6eKAbTHo=;
        b=BoOC6TpZHlNJg0NxKzpAOVReKoyFpbZNxUW5ENT5p3cNnlp6i6PmTIdeMj1Pt0/pog
         dkzHcny9cCiyHbbShOyRNP8VmAqhIMz2syqM0TIIphXaro0ECDNUepp7i2sIjUFTKsSw
         DvfuscyBBflM1PzAMP1V8iuDbv84OCH755X/aVF/FzwNalDD1khnzEC1dleiISjoYiH3
         0LGNIxJClsyp+aZjHkUxXRf7y2t8SZTVdugCVL6Hm0m5PRn5c5ZoirdfagCSBz6HYxRK
         vH4ZVl2arZ0uNlOu7mru+NRL6pQSPrJ59wOW2fAJG4MmJ0mktcn/hFFbseYvwHHe6HFc
         snRQ==
X-Gm-Message-State: APjAAAUO+Gm7tEswT8rfiAtoNamqgt4MjSbOS+O504IhGhHIwSXtMpdv
        CqoJg2BallU3dfoyLFaYzOXuZ6Zym9E=
X-Google-Smtp-Source: APXvYqwoJSOqtrpBYwiemtC4p9/aW3SJkrOKn7cLsD/oXp6m5+LYsFsg2jLWSR+4CM//09c9qn4nHw==
X-Received: by 2002:a17:906:5409:: with SMTP id q9mr19846063ejo.209.1563181339246;
        Mon, 15 Jul 2019 02:02:19 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id lw5sm3562941ejb.59.2019.07.15.02.02.17
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 02:02:18 -0700 (PDT)
Subject: Re: [PATCH 0/7] Input + HID: Add support for extra keys and LEDs on
 Logitech "G" series keyboards
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
References: <20190520181525.4898-1-hdegoede@redhat.com>
 <667518bb-d788-11ad-72b1-68c93ef7f807@redhat.com>
Message-ID: <393215b5-9ee9-5ea3-71ed-db826424e493@redhat.com>
Date:   Mon, 15 Jul 2019 11:02:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <667518bb-d788-11ad-72b1-68c93ef7f807@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 09-06-19 10:23, Hans de Goede wrote:
> Hi,
> 
> On 20-05-19 20:15, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a patch series adding support for the extra keys and LEDs on
>> Logitech G15, G15 v2 and G510 keyboards, as well as adding support for
>> controlling the keyboard backlight on these models.
>>
>> Dmitry, the first patch adds a bunch of new key-codes for these and other
>> similar keyboards to input-event-codes.h, the other patches depend on this.
>> It is probably best if this patch is merged through the HID tree as part of
>> the rest of the series. If that is ok with you, can we please have your ack
>> for this?
> 
> ping?
> 
> Dmitry, can you please review the first patch in this series (should be an
> easy review) and let us know how you want to proceed with this series?

ping again?

It would be nice to get some progress on this series...

Regards,

Hans
