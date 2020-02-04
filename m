Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A317151D9D
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 16:48:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbgBDPsQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 10:48:16 -0500
Received: from mta-out1.inet.fi ([62.71.2.226]:58200 "EHLO julia1.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727317AbgBDPsQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 10:48:16 -0500
Received: from [192.168.1.134] (84.248.30.195) by julia1.inet.fi (9.0.019.26-1) (authenticated as laujak-3)
        id 5E37D3E20005F751; Tue, 4 Feb 2020 17:48:13 +0200
Subject: Re: [PATCH v4] USB: HID: random timeout failures tackle try.
To:     Alan Stern <stern@rowland.harvard.edu>, Lauri Jakku <lja@iki.fi>
Cc:     oneukum@suse.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002040954190.1587-100000@iolanthe.rowland.org>
From:   Lauri Jakku <lauri.jakku@pp.inet.fi>
Message-ID: <10da971f-2935-7883-1283-d9f22e73a21a@pp.inet.fi>
Date:   Tue, 4 Feb 2020 17:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2002040954190.1587-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 4.2.2020 16.57, Alan Stern wrote:
> On Tue, 4 Feb 2020, Lauri Jakku wrote:
>
>> -- v1 ------------------------------------------------------------
>> send, 20ms apart, control messages, if error is timeout.
>>
>> There is multiple reports of random behaviour of USB HID devices.
>>
>> I have mouse that acts sometimes quite randomly, I debugged with
>> logs others have published that there is HW timeouts that leave
>> device in state that it is errorneus.
>>
>> To fix this I introduced retry mechanism in root of USB HID drivers.
>>
>> Fix does not slow down operations at all if there is no -ETIMEDOUT
>> got from control message sending. If there is one, then sleep 20ms
>> and try again. Retry count is 20 witch translates maximium of 400ms
>> before giving up.
>>
>> NOTE: This does not sleep anymore then before, if all is golden.
> How do other operating systems handle these problems?  Perhaps we 
> should use the same approach.
>
> Also, if this problem only affects USB HID devices, why not put the 
> fix in the usbhid driver rather than the USB core?
>
> Alan Stern

hmm, i investigate, what i know now is few mentions about mouse

acting up etc.


I do more research, tomorrow.


I think in my mind, that the core is good place, the thing ppl are forgetting

that it does not make any unnecessary sleeps and when it does it it is

about 70-100ms max per loop, and they are restricted to 20.


The patch does not enforce any different use, in non-timeout case it is

as fast as without the patch.


I can easilly debug, cause my mouse acts up and that 5 loop version that

I tried on my PC+ usb keyboard + usb mouse. It was way better.


And now i got confirmation from my dad (Suse user) that with latest kernel,

there have been acting up.


The timeout retry loop done in patch within the USB core activates only

when the timeout happens, and latest version adapts the 5000ms (common)

to 50ms timeout, and sleeps 20ms per loop.


But, keep comments coming & suggestions .. and if someone could test too,

so I do not be only one to test this :) ..



-- 
Br,
Lauri J.

