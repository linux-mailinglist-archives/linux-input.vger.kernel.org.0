Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D33A429A5
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 16:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbfFLOoE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 10:44:04 -0400
Received: from mout.gmx.net ([212.227.17.21]:38425 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726851AbfFLOoD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 10:44:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1560350641;
        bh=skS5buEgxsD9Rt4mFouFB/4LkspCqy177A8CpTLDQnA=;
        h=X-UI-Sender-Class:To:Cc:References:From:Subject:Date:In-Reply-To;
        b=VglMiIgycAZeYQOQhBiYKy5lJymJUNUMsZMrBS3fhh+PPxfxKdmQqgOxcW7fVFzgl
         uKccHEwJYXAj6fNXs4lPGv2lJgJ7fXwukX5ZN2wtm1ZAeMSwiUED5Q1V1D697Qv8NY
         lbJp0RaPX+6XJxbWYim9441WL1zT1zWioLhGlGiY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.2.0.3] ([79.195.235.197]) by mail.gmx.com (mrgmx102
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MdXSC-1i0RWX1Jnw-00PL4A; Wed, 12
 Jun 2019 16:44:01 +0200
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180918004732.9875-1-dmitry.torokhov@gmail.com>
 <0541f46d-1f4f-05f4-8e93-6663f6c13bd9@gmx.de>
 <20180919171039.GA116719@dtor-ws>
From:   Tim Schumacher <timschumi@gmx.de>
Openpgp: preference=signencrypt
Autocrypt: addr=timschumi@gmx.de; keydata=
 mQINBFcuQFEBEADFdq6ifgHlI42LHxPoK3pxL85GeV6TEww5LMnXVMvmi22Q+olTrnqETIvH
 LYYqIAj5YPpCs9S9ROFi7YqgCneqnyABx7r3MAjfM9Pnvb7LzIZIlAhDcZ799HSJgRmnEoaF
 8og/QJmVKnEvSep+gLk97/DPxj/E1KFWgxysTRfuhyivf/ZFl6/oEnyVfZMY5IEx5bNN60tr
 uA6fjbXitqM1GRep1jG17Q6YrtADuu/DIawjMujqnIYwlZRsyEfvP1ezJCxSYZpm6ox+mEwx
 wrUPyhs76LyEoiLXCAJko57mBB/OvqCMNuVy8BVPB3UDOI9TiUAkzWUiqayPRrM9khGXQtYn
 8gOz3Y4GiBI94iHD/EweSF34Uttm3ELl1cxJtfWTCxjn7shN/xdCJCMWdbHzpjZ7O4wFacs7
 1dvb5n0dnIdWCIQGneT8Rfq4tF7wbkHKM26TwijMiRFoxXv+ud4oM7qecsfZfwy4+DAsVghV
 Sy6jCIkduBPyP2DoNhiT9ZeavLYjdAIaxewqjGhKi8N7Uvd8xMxJeVkkgZQqA3/Aewm52j1n
 pFiStR3C6394iumBBykc5BH5akcYkA90BjXP7IaRvfrG92abty2zJPQ6LF01/oxbBggMjd/f
 9oVhC4eAMoTdIjPQkIj6Elvn9l4fRcVk4Y3KQcgjMVY1lAjZkQARAQABtCFUaW0gU2NodW1h
 Y2hlciA8dGltc2NodW1pQGdteC5kZT6JAlcEEwEKAEECGwMFCwkIBwMFFQoJCAsFFgIDAQAC
 HgECF4AFCQcHnSwWIQTMtsAhgfa2/uTeYPwmIHQiLhnCvQUCXFSuzgIZAQAKCRAmIHQiLhnC
 vbnCD/94ae11DAfgfOpKXfqkAU1mr+/J01773tcX0D1y7VjZ8Y26OJoixndLvU2hSMmAx3lA
 lmmt+3XR2g1zNiqk7jxEoLqJ79Jt87CxnvVUbZy+fzyq+C+bodAoeFEr3sv4xdabcHR+finr
 aZLfLFpC7eDrYCQvER18IiD/uUeO9zIX/Ff1wfUfCRHhmmN8+Qmt4CjPSfJoCsZb1Kch6Khr
 8zPEbrHxxE6qwRtDDevyz3Y9f+kREHr914hnXyRrwekCc7ckFmYGfDT29rjqVsgx4k19cagA
 epxqEUONI3s6bIRhhzLXwCAB4Y6G6HNFoK3hBgna3OhIZvoiuUJ5SlWrtyJXb2BPsXcjUHO2
 NEaaV/iySqx1B6/FKiX8/zJMZmf4doip6abLbTQKLiEwAoAy3Z0gduWO5J6rtjoy42RgsPXv
 j/cLsrHivOaqZiTVlxE5aeoHdnzQlw/wN979MXEglo9OE0d9LQ2hHFiL5jmZoF1Ahnats9RE
 CR+XHG4DKrOUI3zvs8a6lwOWAL9kgflPnGx6nMrEp82qIJhkagEaPCyreE32JiD0oz2UyOhU
 ATvZiwVQ2jBytvOgA6qMqWGdsNQ0O57U7UJJbETJmu5u3McXxunc0IB1tjm7QMdm/lhbYjyi
 b66OPCuzb/Fp22cMPK+ObDblNk6UpE4aqkKRNGv/rbkCDQRXLkBRARAAoFqgxu6yPL2rp3qo
 BquCvvkACYD5GZDkAXng2ghhSFgifsmEbSo0UXrxP2FkCP0S9jZ+C4X1j6FYEa1iGeH8TFc5
 M3o7jsvrUhKcsoF6CzjAQ3KCqD6u0wN+pCmOfQdJEZmuYTwvZPe952mHJzJJ8BSsT26WDY04
 MOF5jbC5Naao8tO+PUCSZ+djoU+rGfKecH/8ua/rcv6LGcc/1k5R9umBmNmy1pJCcDrGZzg5
 AXi92Zu4mFGv0XkaReGze6zfxwmSi79j52xcTIi5lV7SVJDkFFWCMqUR6rUFPLZc3YFTUDa+
 cBNalT90rwqYlq50BFFkGE4Vw34/WyYGcWn7iSy+CFNB0wvQGMclVJSXtPzpv7BzHAK6qnOa
 74pkr5QpYXNEgojHjBGGACp/3Tf0c5f4FptbWzzQOCqAV1+XdnfUV3BeGIYfYy+xX0MQQMm6
 d9nRtvPfO3oOfgts1+H6hGAavw92m84hTdlpZOWaXm+7322ULI5tR4kcov6sMJ4lp6+ZzKId
 PmdvyBBkLjG6C1TxUjkc3FR4QkVkrDMzNp+GlYFW0LCshF1zuc6cquTOM395oXDtzxM5FQji
 EAXV1WOlqDYJ+fUkGTHfIkXKuex9zgtB3aqg2kxmlyBoEWOq+5Wo8ltW0xMXbkAT9Env6Xjt
 qG7Ks8/AwczayJ+aitkAEQEAAYkCPAQYAQoAJgIbDBYhBMy2wCGB9rb+5N5g/CYgdCIuGcK9
 BQJcVKouBQkHB51dAAoJECYgdCIuGcK9vtkP/2kD6crT3YBVifbbEaOSYDU3UjBsJTHPpIIB
 gRrffhav/g1CIfqwHM2zertIFPSjFEbg4br3aGKUwM7mUsuzKgj2xrixrkrALOUXbjSTr07o
 XAgliLLzXL/PHCWfFv53GZPptBblVtGxrd76DX9KeEZYk9fdy6+DHLufsB59h7dnaOswv9Un
 faMrCd8jhTIfhWXocJCe8a2epZz82cFlx1rd38pkBs2/DDNpGNBeD4qcYZVMhbzpBPDT8RhZ
 YiTi4Ge485am8r8sNk93M3ewsVfHIA6P3ChQIDJsuEgjiE4jjzJskcjnU/m5qIYy/m5eeJ9P
 zLHiQaBZIHcZrqSBhEUR7n9QSJJ0oERoZOYfBmCTYtbnGOHHyrhy/STBs/RhUOLBHEXzahSq
 hSq96S3lliFUgq0D5ADMVbNd5h/WHur//8y4n04aO8CpXgUeE/OJ/0ShS4OzltSRpJrtTXdk
 iJGcvmZ2wplkVM25rT0i88hU58R4SqXEDGxOB92gH5dr5FMWBXvKzXtksX+x5ktlShdFye2X
 Z+NRWzsKyM0lEu7YUiWIHn4oidqn43FTrc9I4EqUw5EtDr9aeEmgNYFxGCQUg9yL85uykgZo
 yZgTz2jxUNaSz0i7LOeOc6G8JMM7GtChNxrDGxvvvOEBXBQZ0WIjPfC4ngYAl3bUV5B/eL1X
Subject: Re: [PATCH 01/20] Input: iforce - remove "being used" silliness
Message-ID: <3505434a-f5ec-de50-5f94-7347c6926f40@gmx.de>
Date:   Wed, 12 Jun 2019 16:44:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20180919171039.GA116719@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DpZURLMn7G66vd70EQkrBlBcsjwkdiGWTQn38X/W1IIri6syRb2
 vgX2zWDhSozLNXLJM/CqjqETYlwxY+efSHNBpCJ7TKembEBdyRDkjNggHvn/sXSwr/p9Bmq
 vOB0/T0l1X32plX1YqfonDHTycM49Ez8fujtegEt5bIUdhBlEfDSMtnPzCiJWPuH7miMQ6x
 //P/pnoSrv4IOTtI5ACPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yGVKvdZKLvU=:WnQa+0xHY+9iRke4j+OtiG
 x3wArQHmvoC/AegGptYJreaEhLpChZU+dX0GY6yT+4gmemVJsEcRUQMFEIweqT+UreSDx1L8g
 MgBeyVUGsqgf6EElBMqgxRH9hzc4Il2lPPdV9ZG8+RhHp0SYxYcgKTPnShTkpPmy0mwxR2eh0
 /moty8MUKvx7XsfIf8xdNinE1HL8muAT8EHnpa48q8MHbPC2C+pPLxTGd3GxkKM9H0ZSo5Ln8
 e/VbOz6gnaJ2b5Ntd9hRt0M8Dlmlq5aRwX1gwyG1QPMthyYLy7I5odkOM4k5aiTiCiAguEYPn
 x5K8CW4ABFJ3z7lo+gwVvAiqJgNkqKPsD/1HmI3jbPopV4KKpZVNT2Jw2oEov/bqzVnO8ODka
 VpLcAvBeLsf6VLgSdU7Oa9u3y0yzoHiaOuy7RK/A0mmrW9UJzB2KbKiJ1h9IDVa+rr+Aa5xaD
 PvCYpDheFg96GalBVZziJn+GCZ5GDCKlvDS8axvIXAdBoViEc6sPAQZ1LJRezwHzRu5hbAsaB
 dVIhPeZNZknUIs1HX9ZYgYhkGM3xCuuufrbQNdf2LRwFhUOhkUEhmLdK9hmu3ZlfSLO4bmOl2
 xvPasGmzSsrHOXYvRYZSBzx4g9hcPKG1nOLO4GtKMaF2Ymfn0UO23zbeFJKX+pscbXl36Ar7M
 UwGS8SzYqrt7i7xCtA3qeHQQ9Tv+RUIx5dtqkSvMTDBB0X4Syhp/JCHtLLIM5FEJ2G2aFQoR+
 gbT/xlYW3GTpdnS38yjfktazMqVoK2047RiMA19tgiIfQGus/Zz006WgatUqyg1DibrFQBkOA
 b1xXZCoqs+5XSryCpIpOyJalu1U3Dlsctpvo6KAQUWaVwyd4ydUOJ9Ci8JOyAdnRap6C8o69k
 JW/Tlo3XM4wy3Ptf2uCEbp0xg/5Tro69YJyTNXtNKPfkCFaYcIu9uGdFVb5WdVoh0TCZe3hxx
 RKivIinkx5bq4ZqHQzI3rCqcRwili0Z8nqsJT6jHvMnh2RySSe4tX
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 19.09.18 19:10, Dmitry Torokhov wrote:
> On Wed, Sep 19, 2018 at 04:51:26PM +0200, Tim Schumacher wrote:
>> On 18.09.18 02:47, Dmitry Torokhov wrote:
>>> The kernel is supposed to handle multiple devices, static flags
>>> in packet handling code will never work.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>
>>> This is a random assortment of iforce patches that I made a few weeks =
back.
>>>
>>> Tim, I do not have hardware, so I was bound to screw it up, but if you
>>> have some time I'd appreciate if you try them out (and if I indeed bro=
ke
>>> things if you could identify issues that would be even more awesome).
>>>
>>> Thanks!
>>>
>> Hello Dmitry,
>>
>> I tested those patches and I didn't find any obvious issues. The basic =
functions
>> do work (i.e. buttons and axes, don't have a HAT so I can't test that),=
 force
>> feedback seems to work to the extent it was before (I only have fftest =
though,
>> no games that support force feedback). I'll go through a few more appli=
cations
>> and see if anything not obvious is broken.
>>
>
> Thank you for taking a look.
>
>> Unfortunately, I only have that one wheel and I can only test USB conne=
ctions
>> at the moment (unless I find a proper serial adaptor, but I'm not sure =
if that
>> would even work).
>>
>> Are those patches planned to go into 4.19 or are they intended to be me=
rged in
>> the next development cycle?
>
> Definitely not 4.19. Could be 4.20 or 4.21...
>
> Thanks.
>

Hello Dmitry,

as a followup to the last E-Mail I sent about this topic, the complete cha=
in
of patches has been in my personal tree since September of 2018 and there
have been no issues so far as well. I tested a few more games and utilitie=
s,
and I was able to test with multiple wheels simultaneously as well.

In the end it's still your decision, but imo those patches should be fine
to pull in.

Tim
