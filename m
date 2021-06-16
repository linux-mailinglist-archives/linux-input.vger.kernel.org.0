Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1F253AA254
	for <lists+linux-input@lfdr.de>; Wed, 16 Jun 2021 19:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhFPRW4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Jun 2021 13:22:56 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:34555 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhFPRWz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Jun 2021 13:22:55 -0400
Received: from [192.168.1.155] ([95.115.35.150]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mwfn8-1l4cC13sXS-00y6qI; Wed, 16 Jun 2021 19:20:44 +0200
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     leo60228 <leo@60228.dev>, hdegoede@redhat.com,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
Date:   Wed, 16 Jun 2021 19:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:sNis7DF6TvPRoij61WnAqevQDgOmlfhPdE0weeEa47oJaqFQOG5
 FQD8TLBFgbufCoX27UwJbVw4HZl3viTqz9XNSn1gaHPA3JJEvyLXOVX7LzdKRE59bRH8VF+
 beQdpeEXMzt5wUvW1HbgM/7vIIo+cFVUmPEmnvyTQ1tckYsANgGjOyjYnyrYtfhB6Z/wxyX
 Pr3NhVnL2sbx4QNaMEPiw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y1tbBRJ3Zeo=:wFlwFoPTiToXDyuH1ZQlrJ
 9WBkfsEWnqvj1ptWKpACxbXAZr1dMglYPEzD6fWkx+YOBZoTSBjbIb///mgMEut2Z0+PJQ16F
 BazwGEN6pe82C8uaDZ31f/e6imsmMhnAO3jS7d7ywMQGlW4kMJYhDmmR8McXvkQTE4Sc2BbeF
 rjCeMjc6Xzbfq8GMmPHu/viWgqfZuHrKdeFFB0D+5cFXE9AKf/6QhMC8PXfi4jCbMYoJ92ynv
 HiKtsSQ4fXa65vytdeXpc9nHKU4UjxK0TGOZf4uE49Be+FsYoxf6jlKRrosWSjwhKrxE4wPxp
 dseWFdc5lxONrljSAHfKEQjadaYkaQcb4YbftCytVjsW2IfBRR5cMoA/nxFd1SpIP3krfE/Hs
 NkrTL+09FquXtISk8c9F2sC9N1ccyEvbj8Oy9xN+UviumZKwCESZv73l0GnYjqFhAuA7WLEQQ
 5TZSWSMzkurqQWtPs5lFnyO38BnyKwgeNXr4nrTkbKZ5RxdMcwvyifY45tqXzb7WVfQj5WdMP
 0zs1wDWm1BTLkzkSIav238=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16.06.21 17:56, leo60228 wrote:
>> Can you please tell a bit more what these LEDs are actually used for ?
>> Do they have some names or symbols ? Are they also controlled by
>> something else (e.g. numlock or shiftlock leds)
> 
> They're used for the keyboard backlight. This functionality is pretty 
> common on gaming laptops.

hmm, keyboard backlight ... don't we already have something for that
in input subsys ? I believe that some lone LEDs aren't the right subsys
for those stuff.

CC'ing linux-input list: guys, could you have a look at this ? is input
sysbsys already capable of handling this ?



--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
