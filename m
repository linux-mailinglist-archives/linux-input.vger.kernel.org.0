Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE0375860B8
	for <lists+linux-input@lfdr.de>; Sun, 31 Jul 2022 21:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbiGaTTE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 Jul 2022 15:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiGaTTD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 Jul 2022 15:19:03 -0400
X-Greylist: delayed 364 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 31 Jul 2022 12:19:01 PDT
Received: from puss.venthur.de (puss.venthur.de [138.201.246.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1692F64C2
        for <linux-input@vger.kernel.org>; Sun, 31 Jul 2022 12:19:01 -0700 (PDT)
Received: from [10.0.0.100] (ip5b40c278.dynamic.kabel-deutschland.de [91.64.194.120])
        by puss.venthur.de (Postfix) with ESMTPSA id 9A18A1E0033;
        Sun, 31 Jul 2022 21:12:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venthur.de;
        s=default; t=1659294776;
        bh=Q60dY03hdt5NNiBGKLHnQa+vQLDG+2xeh9PTUqXy0uU=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=L67gDoqSjcTyaIqIAiKkpg0EvZnNtB52nEErZbQV0XX27qWfQxwYZqXRBfPKC7B1E
         P1OPWHnLnycMAqssCzXhxis4Hri1FYiw7YmR8WDt52ndyeuh4kgqE2Yohnkm1u7V3O
         HMN50S5rDsjBnjauTt42RVRUm6Y3y1eGEGwt2K4my45Z62fNIn6gFHeZzRChO/zXZ/
         4il5FqQgJ12ZKoNyJ2tcg9Lqg+orokQ1ni04QfVxVNgjaFRHfMOZevVbSbFHWCFm6O
         4CKuabnlTVKZifWDpgRTz18PosfnJARVK7N763vhY4zpwhVnan0Tkf7K0tdmRZ4D3G
         fT7avTdnFPZfg==
Message-ID: <8d018877-a4e9-c216-687e-8e026e21ed0e@venthur.de>
Date:   Sun, 31 Jul 2022 21:12:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: fn-key issue with hid_apple and keychron keyboards
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
 <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
 <155865d7-f964-ac9a-2c02-1eabeac0e443@venthur.de>
 <897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com>
 <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
 <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
 <5815adb9-f9b4-308b-6ac8-3e7b10bd71b8@venthur.de>
 <a23380fb-579a-68ee-55f1-8bc429e09a2f@venthur.de>
 <ef0c02f1-67f1-8514-408e-239fb5edc26b@redhat.com>
 <9f282e9a-fe01-8c4f-8af6-6457b795db00@redhat.com>
From:   Bastian Venthur <mail@venthur.de>
In-Reply-To: <9f282e9a-fe01-8c4f-8af6-6457b795db00@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans et al,

I've noticed that the issue has been fixed by now: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa33382c7f74a1444f90f324007da1431d7180b2

Thank you and whoever else was involved very much for your work!


Cheers,

Basti

Am 30.08.21 um 11:25 schrieb Hans de Goede:
> On 8/30/21 11:24 AM, Hans de Goede wrote:
>> Hi Bastian,
>>
>> On 8/27/21 9:39 AM, Bastian Venthur wrote:
>>> Hi Hans et al,
>>>
>>>
>>> any updates on this one?
>>
>> I'm afraid not, this is still on my todo list, but there are a bunch of
>> higher priority things on there, so I'm not sure when I will get around
>> to this.
> 
> p.s.
> 
> If you know C (the programming language) you could try to make the change
> yourself, I can give you some pointers where to get started.
> 
>   
> 
> 
> 
>>> On 24.06.21 09:35, Bastian Venthur wrote:
>>>> On 23.06.21 16:16, Hans de Goede wrote:
>>>>> Does anyone (including you, Bastian) has any opinion on making
>>>>> fnmode=2 the default on this keyboard model ?
>>>>
>>>> If i understand you correctly, you're saying you cannot make the fnmode depend on the Mac- or PC-mode that the keyboard is currently running on? I mean that would be of course the best solution, but if that is not possible I'd prefer the fnmode=2 switched on by default as this is not a Mac keyboard AND this is not an Apple operating system.
>>
>> Right, there is no way to detect if the keyboard is in Mac- or PC-mode, so the plan would be to make fnmode=2 the default for this "Mac clone" (mac USB-ids (ab)using) keyboard.
>>
>> Regards,
>>
>> Hans
>>
> 

-- 
Bastian Venthur
https://venthur.de

