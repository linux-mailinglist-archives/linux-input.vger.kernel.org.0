Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDA157CDDD
	for <lists+linux-input@lfdr.de>; Thu, 21 Jul 2022 16:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiGUOjM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jul 2022 10:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiGUOjL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jul 2022 10:39:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC9486881
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 07:39:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z22so2426607edd.6
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=jGqXwa0JyzvazHvnY2MF3ub6yN3Yt1xO+w/+Pd3Ke2Y=;
        b=jIx6WEqjZKGRup7L23HQAZvTnZ1O2m4tW6y0CfCrq7oWNkufIjuCe7HTdSR2VuH65t
         A+7mKmX/ZoasXN0DNZEkZG7wftpPw8LjcJf/xf/QpEUTYeseCS6cMT4xl8FND3GwrNoI
         3RkUVqgsj7mnUxUqzReS7LfFTjmJ1aon40BVpqW745LlQkyzv0sOZWo7EjnRbqWnVbFL
         33ukqzEwEeALT1abG6NUfueaXQzzfSVE4J4823KEuKbsgBcnBjYTIltHIgesF6wtw+jF
         Zu8J42aIFS48w50Ih5r0ofbX/umbBXvwU6/azcQlra9XiSABl0Bs9CUg5EgtMRqO7oRR
         FbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jGqXwa0JyzvazHvnY2MF3ub6yN3Yt1xO+w/+Pd3Ke2Y=;
        b=lurf9yTg7A6zeOI+l3WgjbYwUszJ7lix2hM2BrdIPZofs/Fd4WOz83ZdWRHuPt9/qD
         /gsEIYWt/agyQdpNoRG/detoat5jNMwR1xwIYnfE3yCHfapank6Z/uJMjC4+7H7VAdeG
         8p5/NM3nkupf3KGEbsliUiIJu8UMQnCV9Msiq+RJJ19a7QB7UhbVd/Xt5dloDVOSsAj+
         wyG12Qb6fEnL+m8kjZW2xNfdXrfTBKR0QNvvItPJSXpY9ZDjN0RxStpMPugOicN0RkER
         f+faTR8sgBBvoAX2gTexxuk9MDV7tiLAhiUEGnuqQJCT6EPJIxA+PPfxYkI52JVZcMgH
         wz/w==
X-Gm-Message-State: AJIora8+OLqwkpKtN4eckq6FWlIaL8KxpG3ynIuajAC+7mqb9r2rzcJ+
        ghch4yDByotlDRb+QPOPC1S9tD3mAEY=
X-Google-Smtp-Source: AGRyM1u8HB5mGRrJnwjt2SzjvHPpMY1dBreOf6+ZlwZzzYEKl6jN3wd0liS8uVTMbPF+8FsnM1Ij6g==
X-Received: by 2002:a05:6402:280b:b0:43b:5d75:fcfa with SMTP id h11-20020a056402280b00b0043b5d75fcfamr30049340ede.114.1658414348364;
        Thu, 21 Jul 2022 07:39:08 -0700 (PDT)
Received: from ?IPV6:2a02:908:e944:95e0:6c56:74ab:9b8a:c988? ([2a02:908:e944:95e0:6c56:74ab:9b8a:c988])
        by smtp.gmail.com with ESMTPSA id c1-20020a17090618a100b0072321c99b78sm919931ejf.57.2022.07.21.07.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 07:39:07 -0700 (PDT)
Message-ID: <9ba2643b-5fd5-d49d-74fd-fc682b7836f6@gmail.com>
Date:   Thu, 21 Jul 2022 16:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Stylus battery reported as having 1% charge even though fully
 charged
Content-Language: de-DE
To:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
References: <5d775fec-1c42-927b-affd-c9f7d3c602a8@gmail.com>
 <28d18d2f39fef4da00021d21cf2ccd7eb4a29ac9.camel@hadess.net>
From:   Sebastian Arnhold <sebastian.arnhold387@gmail.com>
In-Reply-To: <28d18d2f39fef4da00021d21cf2ccd7eb4a29ac9.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sadly, I'm not a programmer. Anyways, I wanted to report it - and would 
be very thankful if this bug could be fixed in one of the next kernel 
releases. :) Thanks in advance, Sebastian

Am 21.07.22 um 10:53 schrieb Bastien Nocera:
> On Tue, 2022-07-19 at 11:38 +0200, Sebastian Arnhold wrote:
>> Dear developers,
>>
>> when using GNOME 42.3 on Wayland on my ASUS ExpertBook B5 Flip, it
>> reports my stylus battery to be stuck at 1% all the time, independent
>> of
>> its actual charging status. This is also independent from the stylus
>> I
>> use, as I've tried with two different ones.
>>
>> The battery device registers as ELAN9008:00 04F3:2E12 in GNOME energy
>> settings.
>>
>> The GNOME developers helped me track the bug down to upower, as
>> upower
>> itself shows the charging status to be stuck at 1%. The upower
>> developers then sent me here.
>>
>> My kernel version is 5.18 on an x86_64 architecture on Fedora 36. My
>> upower version is 0.99.19.
>>
>> Observed behaviour: Kernel reports 1% after pen is switched on and
>> touches the touchscreen for the first time. upower reports this to
>> GNOME
>> which then throws a "Battery low"-warning message.
>> Expected behaviour: Kernel reporting the correct charging percentage
>> from the pen to upower, or 0% if charging status cannot be
>> determined.
>> The latter would be a workaround since 0% seems to be ignored by
>> GNOME.
>>
>> Can you help me to resolve this bug?
> You'll probably want to implement a patch similar to this one:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3193ea1b6779023334faa72b214ece457e02656
>
> Cheers
