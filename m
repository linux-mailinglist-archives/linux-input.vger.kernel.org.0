Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A7A6A5028
	for <lists+linux-input@lfdr.de>; Tue, 28 Feb 2023 01:32:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjB1Acc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 19:32:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjB1Ac3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 19:32:29 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FA326CDF
        for <linux-input@vger.kernel.org>; Mon, 27 Feb 2023 16:32:28 -0800 (PST)
Received: from [192.168.0.22] (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 932D2A27C;
        Mon, 27 Feb 2023 16:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1677544348; bh=aM2CN+WBQSReaTbVFvbQ0SHsOhrrTOKqIqlryLBNyKw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qiG5JG7SETPz3M2j3Rlbq/r22yDVLja5ImFZocGU/NV+JPmW5crOGqkQz1mr2YmAL
         x7uzwHX85TwbYI+fa7XE6W9USWuJqGHdEpjXhrRYyQt3evBUsi3YPAOGgQGu2hIfkK
         wr6A+z96TfMKpK7Yn1wuffyMoYSwGGCTzbyjdiyXx0S7OUF+nLwXN+cXTtdxvhAQUs
         yoly0KqJrJeM0TgM4sFUNmz1hE8vpsQMzFGS9y6QI2DPAXOkSe5mEwPIHgeuTQ/pAK
         D1BG4t0Y1YRFAT6KQyKB48eIe/7SzotwD2VmiNfBLcRB1wXmJH6ZzFrD7lKRwrfObB
         vL5DG1DldYCtQ==
Message-ID: <d153e498-fda9-21dc-6b4c-c6b45a1edd76@endrift.com>
Date:   Mon, 27 Feb 2023 16:32:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] Input: xpad - fix PowerA EnWired Controller guide button
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lyude Paul <lyude@redhat.com>
Cc:     Michael Cullen <michael@michaelcullen.name>,
        Marcos Alano <marcoshalano@gmail.com>,
        linux-input@vger.kernel.org
References: <20221006221209.2016372-1-vi@endrift.com>
 <d4b320fcca34c25713836c1ef5a34157c67071f0.camel@redhat.com>
 <Y/pS+NAqCwdQNJNQ@google.com>
From:   Vicki Pfau <vi@endrift.com>
In-Reply-To: <Y/pS+NAqCwdQNJNQ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 2/25/23 10:27, Dmitry Torokhov wrote:
> Hi Lyude,
> 
> On Sat, Feb 25, 2023 at 02:14:27AM +0100, Lyude Paul wrote:
>> Poke, Dmitry - any chance we could get this pushed?
> 
> I was waiting for Vicki to respond to Mattijs' comments...
> 
> Thanks.
> 

I'm a little confused as to what's happened here. This appears to be the thread for the v1 of this patch, but the v2 appeared later in a separate series (https://lore.kernel.org/linux-input/20230203022758.3982393-1-vi@endrift.com/T/#m98b35653c34a180e08cebb63b43b3690943f6e77) that was reviewed already. It moves the check into a separate function that will wind up properly freeing the URB if it fails. I tried moving it directly into probe, but that broke resume; it works properly when put in this function.

Vicki
