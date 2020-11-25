Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEF92C4AD0
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 23:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387489AbgKYW1R (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 17:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387474AbgKYW1Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 17:27:16 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AB3C0613D4
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:27:00 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id n137so3694034pfd.3
        for <linux-input@vger.kernel.org>; Wed, 25 Nov 2020 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fourwalledcubicle-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Aw9+qK8lNShmny9X2N23cbFKo1gG50HEh9Kht0+ULMM=;
        b=d2mIiBf7qwy6npI5ygbb7cytV5fwsAPol/EM0sfWYKhEpKq4EWTjgSbevHqiGI1xNX
         J814C19Y2jg8RtForPDLnJmn0TzGfr7mFe137R5UqkcI2hkR+aA0wnQwYptqr8WkmqO7
         81m/KjsyxGktgFZlNV5m0L2k+kWf6R+837sWuKA+qHotKdrbwRLXhoFL5xbUTTks7cZE
         eBq0ZYP9DaXQa84mVMAG+AzQdhLZhM96IcjN4ImrJ/PTZSgBzN/7o3z4nQSZqKcsQK0B
         Qz8czJ6KaYXlCxJNUiXlRFzlbugdh7p63TJze+b3PWlixCLVfSEWLIm9oKPow3rY7uA+
         8fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Aw9+qK8lNShmny9X2N23cbFKo1gG50HEh9Kht0+ULMM=;
        b=uaRWpJ2clNa1lNNFgBE00Rt7I1EqkoQWrZtMOsD27Oz7X/AevRcygQHEuoqfFiXkII
         9YKURryU17OvAkNK0InswPgxecq8dzZpNJ/Hejf8hzDMb3nqmRIiEthFqJgnU88hsaqg
         Lz6/sc3WZBEfgtiSg2CJEZ6/mbfbTIUf56aYk46t/1OicPMEFxUXpGv6PLptOTg6TpeU
         OwAGKbBEpzDpiUGEM+fz9vFUu52I0ipnuaXvH+PL+U5/8HIv4ZGfxzusJ9Qsh20lBBfQ
         vUTM/Z3boNNhjpvLRY6aB8ykwmJZdbZdEOqaw57FsPCMe0eAlAiTXyyBKn9vkpNGoa7Z
         ZO4g==
X-Gm-Message-State: AOAM530o5Y8xyPMg1lqsD+IU+VQBHRYe5jOlVvf4xFxNwpRoZMNJjJMx
        H68LacRfywdfQcRcJ84n8LN8y9lfaqgJf4xQ
X-Google-Smtp-Source: ABdhPJyRvT24QCkNaj77PkPleaxwJkho4kWbG3+oyw5QZv9qpqLV1O3Yk4fV3JEvM4eiNdBwfu3/NA==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr6806622pjo.120.1606343219697;
        Wed, 25 Nov 2020 14:26:59 -0800 (PST)
Received: from [10.0.0.4] (203-123-108-233.ip4.superloop.com. [203.123.108.233])
        by smtp.gmail.com with ESMTPSA id e29sm2857924pgl.58.2020.11.25.14.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 14:26:59 -0800 (PST)
Subject: Re: [PATCH 1/2] Increase HID_MAX_BUFFER_SIZE to 8KB to support
 additional, devices.
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <acdda6f0-3675-7e8b-b57c-711fe8199ce9@fourwalledcubicle.com>
 <nycvar.YFH.7.76.2011251412230.3441@cbobk.fhfr.pm>
From:   Dean Camera <dean@fourwalledcubicle.com>
Message-ID: <74873fa6-0234-b642-adb3-62683671222a@fourwalledcubicle.com>
Date:   Thu, 26 Nov 2020 09:26:55 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2011251412230.3441@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sure, I'll do that now (and do the same for my other unreviewed patch, 
which adds additional ioctls(). It's suprisingly frustratingly difficult 
to get Thunderbird to send a one-time unformatted plain-text email, as 
it seems to be a global setting that has to be changed.

I've given up on that and just set up git-send-email, which I've never 
used before but hope doesn't mangle anything.

Cheers!
- Dean

On 26/11/2020 12:12 am, Jiri Kosina wrote:
> On Wed, 18 Nov 2020, Dean Camera wrote:
> 
>> Currently the maximum HID report size which can be buffered by the
>> kernel is 8KB. This is sufficient for the vast majority of HID
>> devices on the market, as most HID reports are fairly small.
>>
>> However, some unusual devices such as the Elgate Stream Deck exist
>> which use a report size slightly over 8KB for the image data that
>> is sent to the device. Reports these large cannot be buffered by
>> the regular HID subsystem currently, thus the only way to use such
>> device is to bypass the HID subsystem entirely.
>>
>> This increases the maximum HID report size to 16KB, which should
>> cover all sanely designed HID devices.
>>
>> Signed-off-by: Dean Camera <dean@fourwalledcubicle.com>
> 
> Dean,
> 
> thanks for the patch.
> 
> It has been whitespace-damaged by your mail client though. Could you
> please fix that and resubmit?
> 
