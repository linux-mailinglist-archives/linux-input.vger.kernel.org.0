Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2002115216D
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 21:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbgBDUOM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 15:14:12 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42699 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbgBDUOL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Feb 2020 15:14:11 -0500
Received: by mail-lj1-f194.google.com with SMTP id d10so19967384ljl.9;
        Tue, 04 Feb 2020 12:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=RtwZ0dU9OzkHAayQ8zy3/HI60wd3MAoLJN3IFH+1fb8=;
        b=SM8y8dECMOerjfTX6TIDC+OyJ5li8ESqbBmhw6MNdYqW0uyXU0Y38S+Wx8xriNaprk
         Ge/YaXVE+emjPOQDURrcNc6a7R08bRwDX92LoEgtjKQiAGhIHV+M/X47Y8afHCh1HiRi
         Ixbi98puyX5TjZerVAA3xD9BjwbBLDFK1XOKaF+A8RFMyTJdJd8W+W8uhj4NG6HqDAYJ
         3h0a7umgDhKrFeLUtwzMK8Jz8XuyZMAOOZJruNQM5PAUcgPFjT9AqvVZumEJNkqtW2Ve
         fJtWgchGI7ioV3Bo2Yc9l/OyHHxd6/2orLgm4cj5mbjtJ4OF3Dv60gtkq4C2E7l0pngg
         Q2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=RtwZ0dU9OzkHAayQ8zy3/HI60wd3MAoLJN3IFH+1fb8=;
        b=rlwuhHpcuUI/K7ah4Tt/9S/akNkgMDl8IvLKSbZnSmAQfR/P33uxf0yWR6q9TgttTW
         Qmrk+qooAkIoOcV3ldj5B5HG2Rq5k8qPyQqNBrJ4NFwpH2ZHcegplGLbfsMGZdg5nBjU
         AexhLw7btXD3nFDY4vyiL+roKJvFBdTSfLZOz5V6BiZyp726sTHSnaeuNN0ytB1W9WkE
         Uj6A5Ig8sTQLy97BYT3My/mC/sTYDCLivyfr1npx1BzzWgDYJELDcof57gyrd0BQvdOM
         DzjD9d5W+jj5+FYqfley9OVb05zHzYs0kNvAFLSpJrS02eI5mCqldk571mpTXSKGagdj
         dMLQ==
X-Gm-Message-State: APjAAAXUAX5ItMW75uhMtiK3+Cb/cveWixMsZLnAOk0amAV0FsU1jTIL
        77sHHNApPKCI6/R6EZbzI6m81SOtMzP+sQ==
X-Google-Smtp-Source: APXvYqy/tgcESLhHYk40lEiLbSzJREbsK1XBmiPr7en4gYx2Q+6dXxnJdXgy14vCZmUr/sGknyqkiw==
X-Received: by 2002:a2e:96da:: with SMTP id d26mr18832700ljj.6.1580847249235;
        Tue, 04 Feb 2020 12:14:09 -0800 (PST)
Received: from ?IPv6:2001:2003:f41e:c300:224:1dff:fe12:e61a? ([2001:2003:f41e:c300:224:1dff:fe12:e61a])
        by smtp.gmail.com with ESMTPSA id u16sm11850842ljo.22.2020.02.04.12.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2020 12:14:08 -0800 (PST)
Subject: Re: [PATCH v5] USB: HID: random timeout failures tackle try.
To:     Alan Stern <stern@rowland.harvard.edu>, Lauri Jakku <lja@iki.fi>
Cc:     oneukum@suse.com, benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
References: <Pine.LNX.4.44L0.2002041306100.1587-100000@iolanthe.rowland.org>
From:   Lauri Jakku <ljakku77@gmail.com>
Message-ID: <1d94d306-396a-3576-c70c-7d60f255e864@gmail.com>
Date:   Tue, 4 Feb 2020 22:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.44L0.2002041306100.1587-100000@iolanthe.rowland.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,


Inline reply.

On 4.2.2020 20.07, Alan Stern wrote:
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
>>
>> -- v2 ------------------------------------------------------------
>>
>> If there is timeout, then sleep 20ms and try again. Retry count is 20
>> witch translates maximium of 400ms before giving up. If the 400ms
>> boundary is reached the HW is really bad.
>>
>> JUST to be clear:
>>     This does not make USB HID devices to sleep anymore than
>>     before, if all is golden.
>>
>> Why modify usb-hid-core: No need to modify driver by driver.
> Please note: Your patch does _not_ modify usb-hid-core (that is, 
> drivers/hid/usbhid).  It modifies usb-core (that is, drivers/usb/core).
>
> Alan Stern

Uh, sorry about that misleading commit message, i'll fix it in next version.


Thank you for pointing that out :)


Br,

Lauri J.

