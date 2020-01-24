Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD7FA147A38
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2020 10:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730275AbgAXJRC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Jan 2020 04:17:02 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25757 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729575AbgAXJQz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Jan 2020 04:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1579857414;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eVwp3U5GzOX2o0jWqVHj3WHwgjI/zlg9dOk4xt7JmuA=;
        b=E79lQPTcctw213Bcy4FceYJpMfyyaH6Pokwhj/xuRiK4PtsS89wTVZGZqADKMzOLRsYeAI
        A6Z1ts4VB8ZKflTAsmPQybAZcziUiKvFxWs1D5O68bg20hYYL0IcgxJ9usRKX3FlgB9Qf+
        ckAvrMk7TUt8kRw4s8B12h3Kn13CRvQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-ghpZl3TmO_mXA0DksHUwwA-1; Fri, 24 Jan 2020 04:16:53 -0500
X-MC-Unique: ghpZl3TmO_mXA0DksHUwwA-1
Received: by mail-wm1-f71.google.com with SMTP id t17so389791wmi.7
        for <linux-input@vger.kernel.org>; Fri, 24 Jan 2020 01:16:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eVwp3U5GzOX2o0jWqVHj3WHwgjI/zlg9dOk4xt7JmuA=;
        b=qKIHQQZnbOfH2TDqO18FCrza4DbTpsFG04iY9WqAP9daXGW64WPBtgZ4uqZnoSllvq
         AO2uAaMDqVdE9MXNsTMNEUPk7Q6agF874XONq/eL1jENysMjdkvAC1QqhZwu/6QsyJQ3
         tcAxQ9k/0s0e0SOpkQBx3FobGjbpvbYrTgag9sJoYMwtWWRUCJ9aYkH54hmIE0fkTo2o
         3xsltbjBYqo6UieSfrTx2SQY6B54BQlpQ2pyRN9hR9WUZUj+0KgAlAaXBlZlhK4UI7i1
         t/gyyIG5De+QbVfqsUhjxE/QtieojLjHf3njwe+CY/4UvUI7qmQM01m+roPOWr078giS
         6Vnw==
X-Gm-Message-State: APjAAAXnZA3DtAlQAx5rd3XgIFYhHOlMX3kOq/XZCUN+UDqUD2gQyr20
        Q1tNXwfXA4z00cVRWJdEnZD+A4STt2yyqdZKvW2b9rJztauOYKbiJbg9MrOz70rH68h5aVV1S2E
        ZL58dvPYmioiDLGmqP0Af0FA=
X-Received: by 2002:a1c:a445:: with SMTP id n66mr2460533wme.151.1579857411456;
        Fri, 24 Jan 2020 01:16:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUiU565WJyxONGgI7w4xQRq/ENXZEynENvjhqk4CBvmo8g5IcgWmw96rLrMcfuNGJKf9m74A==
X-Received: by 2002:a1c:a445:: with SMTP id n66mr2460489wme.151.1579857411156;
        Fri, 24 Jan 2020 01:16:51 -0800 (PST)
Received: from localhost.localdomain ([109.38.141.136])
        by smtp.gmail.com with ESMTPSA id a132sm6060770wme.3.2020.01.24.01.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2020 01:16:50 -0800 (PST)
Subject: Re: [PATCH v12 03/10] firmware: Rename FW_OPT_NOFALLBACK to
 FW_OPT_NOFALLBACK_SYSFS
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Lutomirski <luto@kernel.org>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Dave Olsthoorn <dave@bewaar.me>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20200115163554.101315-1-hdegoede@redhat.com>
 <20200115163554.101315-4-hdegoede@redhat.com>
 <20200124085751.GA2957916@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d25d5d6e-0348-b19f-539e-048cfa70d6a6@redhat.com>
Date:   Fri, 24 Jan 2020 10:16:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200124085751.GA2957916@kroah.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/24/20 9:57 AM, Greg Kroah-Hartman wrote:
> On Wed, Jan 15, 2020 at 05:35:47PM +0100, Hans de Goede wrote:
>> This is a preparation patch for adding a new platform fallback mechanism,
>> which will have its own enable/disable FW_OPT_xxx option.
>>
>> Note this also fixes a typo in one of the re-wordwrapped comments:
>> enfoce -> enforce.
>>
>> Acked-by: Luis Chamberlain <mcgrof@kernel.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've taken this in my tree for now in a quest to try to get others to
> pay attention to this series...

Thank you.

As mentioned before I believe that this series is ready for merging now.

Andy Lutomirski had one last change request for v12 of the second
patch in the series, specifically to replace the loop searching for
the prefix with a memem, but the kernel does not have memmem.

Andy, are you ok with v12 as is, given that we don't have memmem ?

Assuming Andy is ok with v12 as is, then to merge this we need
to probably wait for 5.6-rc1 and then have the x86/efi folks do
an immutable branch with the first 2 patches of the series.

After that you (Greg) can merge patches 3-10 (after merging the
branch) and the platform/drivers/x86 folks can take 11 and 12
(also after merging the branch).

Regards,

Hans

