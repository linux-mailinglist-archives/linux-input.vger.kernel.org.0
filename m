Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35D32C4ADE
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbgKYWmX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbgKYWmX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:42:23 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC7CC0613D4
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:42:11 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t37so3682370pga.7
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=atGY8NqASiaGygUZ+69zYOZlPyFLaORocERIPi5FmfQ=;
        b=iJNUyqW4JvKBfOggU/cFp2s0qZ3BNtmP+S/HFTBbdGu/TkuHP58USpB5xepFhD1ZCG
         qyuEzF3kZiIlag606wT/rpmCZqMwgjkj9WlInvERfXdFsRoWFHjktneghd8xlVVXjcq/
         bntlb+6qY+8rQUaSyl/d/R9VnhkbGD5Nc5rPlSgQ8UZvY/C/zvD8+q69a+dGOfToytbp
         47UEdAy4Qx1f6Qmsy6rYOw0m6ENGwh6wG9Ccl6ceP6TZlvJOBeuarkArGsNYex6pDnIS
         f/te0/crkEKH7e5sXhRvDOG4gsAYv82SPLpiQ8U3A5V+ESk6q3xkPggvQ/dKiycT4C1i
         lvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=atGY8NqASiaGygUZ+69zYOZlPyFLaORocERIPi5FmfQ=;
        b=IL5VT4BKZJ/qR7WMi/1SjYRIFJgLY8v/yKgPUprKsVniR7cv39OJ2Mw8S2P0sWm70/
         UkBykVsZwBf/4dy+nwSXPwsqNQbLQRpliCnQx01zEkHYlLzHK2rLvBIZG+IDHnNhud2C
         NpLbYNEnWVXd+8C5cYbmtkIKp6/uj725wfmobhDNmeyi5bK220/qg2jq6vJbS2u7UN6z
         8TeQ1lwdwY/a8TOk7MmdE9PoRgNn3uCRO1q+jdy0t4COHnDFALpTlLjtwGUXGYv9Om/i
         5UO0xZ3579E8m3baK6whRtYZ799IgleY+TDEsfx/uVoU46D3nOwF2lIbiOXFhBsp0hCy
         /Bfw==
X-Gm-Message-State: AOAM530CRT6eoIBT75/1eOiVtIhehF5W0VuEPl2+SWst3bYzWjhUyYLh
        KCc/Xx3rIs136GKAKPVcNuXkvZ4fiLEkJwcR
X-Google-Smtp-Source: ABdhPJxRlHHQ2CZrI/+/1LN55LgYH3ZNr2A4tEjxR51GTOg1e6AC/i6M8CyJbwGUCccFkLFFMBn+ww==
X-Received: by 2002:a17:90a:d249:: with SMTP id o9mr7031256pjw.158.1606344130417;
        Wed, 25 Nov 2020 14:42:10 -0800 (PST)
Received: from [10.0.0.4] (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.gmail.com with ESMTPSA id gb4sm3943562pjb.30.2020.11.25.14.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 14:42:09 -0800 (PST)
Subject: Re: [PATCH 1/2] Increase HID_MAX_BUFFER_SIZE to 8KB to support
 additional, devices.
From:   Dean Camera <dean@fourwalledcubicle.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <acdda6f0-3675-7e8b-b57c-711fe8199ce9@fourwalledcubicle.com>
 <nycvar.YFH.7.76.2011251412230.3441@cbobk.fhfr.pm>
 <74873fa6-0234-b642-adb3-62683671222a@fourwalledcubicle.com>
Message-ID: <a0413872-9649-ed63-0915-2162d5fde9fb@fourwalledcubicle.com>
Date:   Thu, 26 Nov 2020 09:42:05 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <74873fa6-0234-b642-adb3-62683671222a@fourwalledcubicle.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Argh, and of course I forgot I hadn't added the requisite cover letter 
and descriptions for those patches on that machine.

Sorry for the noise - I've sent V3 of both which should now be formatted 
correctly, and have the correct description.

- Dean

On 26/11/2020 9:26 am, Dean Camera wrote:
> Sure, I'll do that now (and do the same for my other unreviewed patch, 
> which adds additional ioctls(). It's suprisingly frustratingly difficult 
> to get Thunderbird to send a one-time unformatted plain-text email, as 
> it seems to be a global setting that has to be changed.
> 
> I've given up on that and just set up git-send-email, which I've never 
> used before but hope doesn't mangle anything.
> 
> Cheers!
> - Dean
> 
> On 26/11/2020 12:12 am, Jiri Kosina wrote:
>> On Wed, 18 Nov 2020, Dean Camera wrote:
>>
>>> Currently the maximum HID report size which can be buffered by the
>>> kernel is 8KB. This is sufficient for the vast majority of HID
>>> devices on the market, as most HID reports are fairly small.
>>>
>>> However, some unusual devices such as the Elgate Stream Deck exist
>>> which use a report size slightly over 8KB for the image data that
>>> is sent to the device. Reports these large cannot be buffered by
>>> the regular HID subsystem currently, thus the only way to use such
>>> device is to bypass the HID subsystem entirely.
>>>
>>> This increases the maximum HID report size to 16KB, which should
>>> cover all sanely designed HID devices.
>>>
>>> Signed-off-by: Dean Camera <dean@fourwalledcubicle.com>
>>
>> Dean,
>>
>> thanks for the patch.
>>
>> It has been whitespace-damaged by your mail client though. Could you
>> please fix that and resubmit?
>>
