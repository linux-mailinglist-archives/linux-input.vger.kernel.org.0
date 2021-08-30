Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B5C3FB319
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 11:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235258AbhH3J0V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 05:26:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43560 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235073AbhH3J0U (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 05:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630315527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+724l/KwZgpjKUoQEkGnNd1AMhnF9buavDcdLHc/VAQ=;
        b=GO6xPtUCycQOcpWebSW69Xa3Sjdll/vtJc4xe2ERUsA2js91vziAEzCXl74kSX8+THS43d
        peRGmGY+oK512cNdhExhvTZ7OXNUknkhLukq4FBoKlkidJ8u5TcEAxTZFWYvHWwenZrAEt
        hMHzmykVLNw1NfRkUlz1W7PGg+DuibQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-FxRfTYjVN6C93HgjAq8-QQ-1; Mon, 30 Aug 2021 05:25:25 -0400
X-MC-Unique: FxRfTYjVN6C93HgjAq8-QQ-1
Received: by mail-ej1-f70.google.com with SMTP id x6-20020a170906710600b005c980192a39so5371787ejj.9
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 02:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+724l/KwZgpjKUoQEkGnNd1AMhnF9buavDcdLHc/VAQ=;
        b=PKckBeny9eBI6G6YLLTHPo0TwMXVwgNYWVMwFXQ9e5rRR67HFdmSGMktlUaiDaB9aA
         YFngQDIiD33FGv4RCcRomezj2b4+Y9YWV6Bvb6xFPtU0MlnMxwowytVMVH54tF00ifTQ
         jHp9M0WW5WXDs+TBL05ZC7HNyuJ0WP1bFMDdmO3E6GqECICFvDSufDo4GRXzf4+nq7RE
         NZFtSAYSIGyMpaVbvmz2/dtvjVtQghYonUTasx5nxIrKuw8nTVvgV4z2jy4vozCBCwvb
         5Lx/czvDgjTt9IoNOaBDP9o21LWO61xbTTKa3SjcclSMaDnHqpzbSWowVEz0C9QCKPhQ
         LmPg==
X-Gm-Message-State: AOAM5317BX3o6KkL9TKqQ+uiYh0IrYdZc7IPPvhF1PiGCPcGC7pPn7lu
        Kgz746U3K12dsKRXPC3xJk/15rYL+htzHRAxIIlWbCU39CgPqfqX2qOn/wNgZIToI/CuGOs9fKh
        iMbQuvLkzpRe+jnmt5DxB31CfYyjA3O3ZG7BV1XvghBd+MnqWYHnS031D4eSUO1a+IRm+XQGurc
        4=
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr24084282ejd.275.1630315524164;
        Mon, 30 Aug 2021 02:25:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6ZaQs2OZg01K63R0V4J5l78HWEJXUpbwWtaYttOJUM+p35cEJvIvWqxYx8GhgCNwGKHQZhQ==
X-Received: by 2002:a17:906:150c:: with SMTP id b12mr24084263ejd.275.1630315523911;
        Mon, 30 Aug 2021 02:25:23 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id bm1sm6511317ejb.38.2021.08.30.02.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 02:25:23 -0700 (PDT)
Subject: Re: fn-key issue with hid_apple and keychron keyboards
From:   Hans de Goede <hdegoede@redhat.com>
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
 <ef0c02f1-67f1-8514-408e-239fb5edc26b@redhat.com>
Message-ID: <9f282e9a-fe01-8c4f-8af6-6457b795db00@redhat.com>
Date:   Mon, 30 Aug 2021 11:25:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ef0c02f1-67f1-8514-408e-239fb5edc26b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/30/21 11:24 AM, Hans de Goede wrote:
> Hi Bastian,
> 
> On 8/27/21 9:39 AM, Bastian Venthur wrote:
>> Hi Hans et al,
>>
>>
>> any updates on this one?
> 
> I'm afraid not, this is still on my todo list, but there are a bunch of
> higher priority things on there, so I'm not sure when I will get around
> to this.

p.s.

If you know C (the programming language) you could try to make the change
yourself, I can give you some pointers where to get started.

 



>> On 24.06.21 09:35, Bastian Venthur wrote:
>>> On 23.06.21 16:16, Hans de Goede wrote:
>>>> Does anyone (including you, Bastian) has any opinion on making
>>>> fnmode=2 the default on this keyboard model ?
>>>
>>> If i understand you correctly, you're saying you cannot make the fnmode depend on the Mac- or PC-mode that the keyboard is currently running on? I mean that would be of course the best solution, but if that is not possible I'd prefer the fnmode=2 switched on by default as this is not a Mac keyboard AND this is not an Apple operating system.
> 
> Right, there is no way to detect if the keyboard is in Mac- or PC-mode, so the plan would be to make fnmode=2 the default for this "Mac clone" (mac USB-ids (ab)using) keyboard.
> 
> Regards,
> 
> Hans
> 

