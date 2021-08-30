Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46DA23FB317
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 11:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhH3JZK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 05:25:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37667 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235258AbhH3JZJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 05:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630315455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=36uqjXHuD8Rkm/IO/cCKOytwgd5ntE2uz3ACVwelMH8=;
        b=ZgMnK7mxhaNOt/IKT5XZRFLPuMIn2J57BsIbHhmJZrbOsUxu36dEUEAOJg0xg5EypRVEbF
        9ZlnXx3QpG9uTasCPRytEelE4/1vxN14LrxLAXOiLwf3JNik4unLa2zo9XNGV4HBe4iY1a
        havqNGMhCRo0ytGB6nMtZF0ogzQ9Ll0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-4npxzHhgN0CBjxbW9TdI0Q-1; Mon, 30 Aug 2021 05:24:13 -0400
X-MC-Unique: 4npxzHhgN0CBjxbW9TdI0Q-1
Received: by mail-ed1-f69.google.com with SMTP id ch11-20020a0564021bcb00b003c8021b61c4so3273071edb.23
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 02:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=36uqjXHuD8Rkm/IO/cCKOytwgd5ntE2uz3ACVwelMH8=;
        b=Z8feUVWi5o/IYVwbvN8xXrAE1lZEXE8znVLtkbUgQJv6/38NT9m9kwkYiQUE06Av3b
         8oFbp+MjybEW+2KdJz/+lXM9PavoQLFhhTS1lYhJouZY1im1ZhbxcjevSNvFf0D6vt5R
         mfwkx/IE7cD7BfXH6DtH6qEjG7iuiWlxSI7puJR8cXDgk0gG/W+SLyTcoSyoNoR6Tuxl
         8yPPN3BxZcaoGAa+jD5f3meWBMz+jetfq17zrMoo8EbyhAFZfs5aMhP61EIiAtgzuUoE
         ut3fDidxtcE+hKl/w95/e4SquzM4e2x0bbaaNZW+suupTpwws+6lFx09P4beoodIF29a
         87mg==
X-Gm-Message-State: AOAM531q/YtTB7/D0cICCCFA1xJdgh5NfTxTlbxcPTHhMuG0kRf2DWEj
        DHPZ2hAwBDaMZzG4bmNgeWxRm0oextEVjxupbXEGZPxtZ/X2sdsJY8vCYGSRcm3lNtr+1p55aPU
        Ld5vKqf30YtKkTJAxtzL3N2mvO1sftabTnz6R4HcexdE9P/rOUYMQ9eVhps1SFBTpt6wpAB7DjX
        Q=
X-Received: by 2002:a05:6402:5154:: with SMTP id n20mr22852257edd.33.1630315452509;
        Mon, 30 Aug 2021 02:24:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzI1TtkPgHTCfZR2Ytl15n/NKKUEZHTeeHbTUiMZXTC5BS6zl0AgPATu07uFinV9lq/wUwnqw==
X-Received: by 2002:a05:6402:5154:: with SMTP id n20mr22852242edd.33.1630315452283;
        Mon, 30 Aug 2021 02:24:12 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id q9sm6444303ejf.70.2021.08.30.02.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 02:24:11 -0700 (PDT)
Subject: Re: fn-key issue with hid_apple and keychron keyboards
To:     Bastian Venthur <mail@venthur.de>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
 <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
 <155865d7-f964-ac9a-2c02-1eabeac0e443@venthur.de>
 <897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com>
 <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
 <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
 <5815adb9-f9b4-308b-6ac8-3e7b10bd71b8@venthur.de>
 <a23380fb-579a-68ee-55f1-8bc429e09a2f@venthur.de>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ef0c02f1-67f1-8514-408e-239fb5edc26b@redhat.com>
Date:   Mon, 30 Aug 2021 11:24:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a23380fb-579a-68ee-55f1-8bc429e09a2f@venthur.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastian,

On 8/27/21 9:39 AM, Bastian Venthur wrote:
> Hi Hans et al,
> 
> 
> any updates on this one?

I'm afraid not, this is still on my todo list, but there are a bunch of
higher priority things on there, so I'm not sure when I will get around
to this.

> On 24.06.21 09:35, Bastian Venthur wrote:
>> On 23.06.21 16:16, Hans de Goede wrote:
>>> Does anyone (including you, Bastian) has any opinion on making
>>> fnmode=2 the default on this keyboard model ?
>>
>> If i understand you correctly, you're saying you cannot make the fnmode depend on the Mac- or PC-mode that the keyboard is currently running on? I mean that would be of course the best solution, but if that is not possible I'd prefer the fnmode=2 switched on by default as this is not a Mac keyboard AND this is not an Apple operating system.

Right, there is no way to detect if the keyboard is in Mac- or PC-mode, so the plan would be to make fnmode=2 the default for this "Mac clone" (mac USB-ids (ab)using) keyboard.

Regards,

Hans

