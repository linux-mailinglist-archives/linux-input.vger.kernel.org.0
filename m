Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CDE32D30
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2019 11:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfFCJvc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jun 2019 05:51:32 -0400
Received: from mail-ed1-f48.google.com ([209.85.208.48]:38054 "EHLO
        mail-ed1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726341AbfFCJvc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jun 2019 05:51:32 -0400
Received: by mail-ed1-f48.google.com with SMTP id g13so26069121edu.5
        for <linux-input@vger.kernel.org>; Mon, 03 Jun 2019 02:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rFgMYWZVFF/pv2yQUfl1pVX/S/7PJrbgn5hFnfiX3Ao=;
        b=Gft9An4sb/z5Pc7XKpJUQUwrcORz5zXK2gKp6oZs4PDeWoJUKJr2HD1Jx35YjM9KDM
         OIVu7dzd5CyNEy/WX5w98hzwTcsQXWVS2nbF8ocFNX2U7SlKYEIPzOasOkEL7FRj86rt
         wpbUioFfpfiBq1mSbZTPRfCv4xHMCSnmuPP+KeX0CtKL7RJmgh28mYH9YAUQ95fnc0WF
         EWhbdtmiGgh3/PoRyosv7Z0OnTl/rQiPTWiNI7f3inCZKrB+BwqDPc2sXJv39AVmG7Vx
         QAp8Ubjf8X+WqiiisbTLArwAZH1a7N9VglqpVOy9mnaO4qRYmR6dnkX8R3ndkef27xCE
         9uAw==
X-Gm-Message-State: APjAAAVLpKS1z14f0ikE1F225nxqbYTEJkrUz4Q925OsWUk6rh2tB2J7
        zeZcZmmOcD1mP63owTt+rOFXrw==
X-Google-Smtp-Source: APXvYqyWeH+AOs5iqMi+X6vzrvGzGfd5Wup2yVJUR4wVxwhOVY++WwxZic/YzC1hS8zijT302FZJpQ==
X-Received: by 2002:aa7:db56:: with SMTP id n22mr11375926edt.192.1559555490316;
        Mon, 03 Jun 2019 02:51:30 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id dc1sm2470642ejb.39.2019.06.03.02.51.29
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 02:51:29 -0700 (PDT)
Subject: Re: hid-related 5.2-rc1 boot hang
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>, Dave Hansen <dave.hansen@intel.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com>
 <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm>
 <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com>
 <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com>
 <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com>
 <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
 <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com>
Message-ID: <5471f010-cb42-c548-37e2-2b9c9eba1184@redhat.com>
Date:   Mon, 3 Jun 2019 11:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e158d983-1e7e-4c49-aaab-ff2092d36438@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Again,

On 03-06-19 11:11, Hans de Goede wrote:
<snip>

>> not sure about the rest of logitech issues yet) next week.
> 
> The main problem seems to be the request_module patches. Although I also
> have 2 reports of problems with hid-logitech-dj driving the 0xc52f product-id,
> so we may need to drop that product-id from hid-logitech-dj, I'm working on
> that one...

Besides the modprobe hanging issue, the only other issues all
(2 reporters) seem to be with 0xc52f receivers. We have a bug
open for this:

https://bugzilla.kernel.org/show_bug.cgi?id=203619

And I've asked the reporter of the second bug to add his logs
to that bug.

Regards,

Hans

