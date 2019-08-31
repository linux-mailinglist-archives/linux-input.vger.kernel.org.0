Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93322A4523
	for <lists+linux-input@lfdr.de>; Sat, 31 Aug 2019 17:50:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728119AbfHaPui (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 31 Aug 2019 11:50:38 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46237 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbfHaPui (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 31 Aug 2019 11:50:38 -0400
Received: by mail-ed1-f68.google.com with SMTP id z51so11399626edz.13;
        Sat, 31 Aug 2019 08:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U3VxUoUQ9u6OvqsxWIcfgHA20dcK/6B+yxini8J+f3c=;
        b=AfZiUAuCkdI0dPBv3wfNc93qQetOvDpgu/DUYEjl8Of2P3IpkjUZdC0vxWiDj1PRVj
         6MYDpzeK00Oprc3mfcQp+G+/U9833AaGkYEgXc3cKLJ+Tq2nJd6CtqDca3lCJl0CfJN8
         lu8XD+HhQFylBq+R+aOQ4IYDfMgsrHoaDAj1hjrt7/ZDY/HzhswaMueieIYWvxZBxjuO
         6tP8kct1vwamSYr2FwxdWuopLGGlQAJuLYEAzDGO4MHKnA+HB5e16wIAOp3DtDPmtKzT
         100ZlcuZ9YZufJ+Nn0WnPk0AVluh8+LUBBOiqoWUSrjnQIXtRwtCr5AkcgS7TW/wHv0H
         /Mcg==
X-Gm-Message-State: APjAAAXz1p6xQpnWPyLUjlsC2QvGYtpPycpPzWF5DI0eIAreDQmB6P9P
        y/jNuMR4x+Xp9BlQvNzVuFJuhV5Q
X-Google-Smtp-Source: APXvYqwLsBnt+ls3Ae2KJ8wNFQ6/qBxMpkKnH0LUKdIYH5srrOD+5H9LGSXSiGFDkZRqOIoF2/gjHQ==
X-Received: by 2002:a17:906:9385:: with SMTP id l5mr17240507ejx.8.1567266636484;
        Sat, 31 Aug 2019 08:50:36 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id w11sm706756eju.9.2019.08.31.08.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2019 08:50:35 -0700 (PDT)
Subject: Re: [PATCH v3 09/11] Input: alps - remove unlikely() from IS_ERR*()
 condition
To:     =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-input@vger.kernel.org
References: <20190829165025.15750-1-efremov@linux.com>
 <20190829165025.15750-9-efremov@linux.com> <20190829175039.GA187474@dtor-ws>
 <20190831152500.eg7xqo5ace6wu427@pali>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <e1713d4e-c12e-8925-a93a-50da560c6c13@linux.com>
Date:   Sat, 31 Aug 2019 18:50:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190831152500.eg7xqo5ace6wu427@pali>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 31.08.2019 18:25, Pali Rohár wrote:
> On Thursday 29 August 2019 10:50:39 Dmitry Torokhov wrote:
>> On Thu, Aug 29, 2019 at 07:50:23PM +0300, Denis Efremov wrote:
>>> "unlikely(IS_ERR_OR_NULL(x))" is excessive. IS_ERR_OR_NULL() already uses
>>> unlikely() internally.
>>
>> The keyword here is _internally_.
>>
>> https://lore.kernel.org/lkml/20190821174857.GD76194@dtor-ws/
>>
>> So please no.
> 
> Dmitry and I already rejected this patch, see also linked-list:
> https://lore.kernel.org/lkml/20190820111719.7blyk5jstgwde2ae@pali/
>

Looks like this is a very long recurring story with this patch.
Thanks, for the clarification.

Regards,
Denis
