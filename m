Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B107445394
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 06:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbfFNE0S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 00:26:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33422 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfFNE0R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 00:26:17 -0400
Received: from [222.129.53.81] (helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <aaron.ma@canonical.com>)
        id 1hbdn3-0003dc-NI; Fri, 14 Jun 2019 04:26:14 +0000
From:   Aaron Ma <aaron.ma@canonical.com>
Subject: Re: [PATCH 1/2] Input: synaptics-rmi4 - clear irqs before set irqs
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Cheiny@synaptics.com, aduggan@synaptics.com,
        benjamin.tissoires@redhat.com
References: <20190220164200.31044-1-aaron.ma@canonical.com>
 <20190609165551.GB90002@dtor-ws>
 <7da443d0-f433-c5a5-5194-707362eb2ee5@canonical.com>
 <20190611173545.GE143729@dtor-ws>
Openpgp: preference=signencrypt
Autocrypt: addr=aaron.ma@canonical.com; prefer-encrypt=mutual; keydata=
 mQENBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAG0IUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPokBNwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrauQENBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAGJAR8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
Message-ID: <189fc7c3-d0f7-a25e-9d4d-446b095e853f@canonical.com>
Date:   Fri, 14 Jun 2019 12:26:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190611173545.GE143729@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/12/19 1:35 AM, Dmitry Torokhov wrote:
> On Tue, Jun 11, 2019 at 12:55:58AM +0800, Aaron Ma wrote:
>> On 6/10/19 12:55 AM, Dmitry Torokhov wrote:
>>> Hi Aaron,
>>>
>>> On Wed, Feb 20, 2019 at 05:41:59PM +0100, Aaron Ma wrote:
>>>> rmi4 got spam data after S3 resume on some ThinkPads.
>>>> Then TrackPoint lost when be detected by psmouse.
>>>> Clear irqs status before set irqs will make TrackPoint back.
>>> Could you please give me an idea as to what this spam data is?
>>>
>> It should be some data 0 during suspend/resume.
>> Actually I don't know how these data 0 is produced.
>> Not all synaptics touchpads have this issue.
>>
>>> In F03 probe we clear all pending data before enabling the function,
>> Yes we did, but not after resume.
> Yes, I understand that. The question I was asking: if we add code
> consuming all pending data to f03->suspend(), similarly to what we are
> doing at probe time, will it fix the issue with trackstick losing
> synchronization and attempting disconnect?
> 

I just do some test via adding code in suspend or resume.
But they didn't work out.

>>> maybe the same needs to be done on resume, instead of changing the way
>>> we handle IRQ bits?
>> This patch is supposed to clear irq status like it in fn probe. Not
>> changing IRQ bits.
> What I meant is changing how we enable IRQ bits. I would really prefer
> we did not lose IRQ state for other functions when we enable interrupts
> for given function.
> 

Not only F03 with problem, F12 too which is touchpad .
User verified this patch fixes problem of F12 too.
Clear IRQ status before enable IRQ should be safe.

Or we can add code before enable IRQ in F03/F12.

Thanks,
Aaron

> Thanks.
> 
> -- Dmitry
> 
