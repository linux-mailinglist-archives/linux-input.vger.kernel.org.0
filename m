Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611EE35F249
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 13:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348916AbhDNLYh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 07:24:37 -0400
Received: from smtpcmd01-sp1.aruba.it ([62.149.158.218]:49682 "EHLO
        smtpcmd01-sp1.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349071AbhDNLYg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 07:24:36 -0400
Received: from [192.168.126.129] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WdcyllWxJkdBBWdcyl2YpR; Wed, 14 Apr 2021 13:24:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618399452; bh=1QQRifXVR0oTRxBo0DxVJYGcPyQtnZXzwUZ3jWxWIcY=;
        h=Subject:To:From:Date:MIME-Version:Content-Type;
        b=b+gWbmOSEwN+GDOsMwEwTRGAgRBBjH8r7SECt2j2u+kZwtTxUcH5f60Kji2jLGbnO
         vl87sWp9da+o9pf+4H9yKw9MesHx0hnKmcgi3iX+NkaLRU+OG1IFII0UbZ8sBNZpKc
         ATRUR3ArDNm43X+b/z9Ta4xIJ4KJhDCUT2K6h5OowirDamzVVFD0BYicxRbXXQ1f9y
         AnO/sNhO+qUrhXfPlEebfZ9or+e288H5J8yq65xj2qOz9ALYiTEyiXr+RZSMM5lJOU
         blP2iHyUrmpNVD7OjUz19JROoeJHHw1iWHkNCJzThYFu9M3SwW19dLefYw1/OtR8ez
         /0qfTujDpSSkQ==
Subject: Re: [PATCH v7 3/3] Input: add driver for the Hycon HY46XX touchpanel
 series
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
 <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
 <YHaBJ6MX9c28MUQY@google.com>
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <d065ad6f-4f60-60f9-6d95-d3c772a3aa63@benettiengineering.com>
Date:   Wed, 14 Apr 2021 13:24:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHaBJ6MX9c28MUQY@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIHovaEG2odf866I67FeotfeLzP4bSdwkp7WLNi93RSPvdfq0exsyZ7wfUCuPFBehTO6h4l0GRJrDrrHTOyGOdUrrHUJe+F21PILFrqdQFH9dnbrSGd9
 tGMTxeCQDfzrjhe5KCeKNjEtMcdRu1nQ/+aWi1zAQotiyNulEge3BtbxQdxWM/UP4JCySf/boexi/lhzCYIewVxlmOTN3/SRxXi0HxemxfB4qNorXEEiSrqG
 IROUAih0LkRXDTYCXVhaYtuMaEsiPxkDbKambtTYHxiNdf3q4S6sSdIrOPnkKKZFV5yeAMXvkMgiDzRjpdtkxu7v9pp3LIwFIR1ap/psv5MYL4m71LYxh0c7
 m1uOtHSqu/Z62nEbHvS3+DemXtyjAVUyqKIa1XrARRONda+b5Lnj0L7Tdho/8gJNQN59k7Yh
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/14/21 7:44 AM, Dmitry Torokhov wrote:
> Hi Giulio,
> 
> On Tue, Apr 13, 2021 at 04:44:46PM +0200, Giulio Benetti wrote:
>> +
>> +	input_mt_report_pointer_emulation(tsdata->input, true);
> 
> For touchscreens it does not make much sense to report BTN_DOUBLETAP,
> BTN_TRIPLETAP, etc, events (they are really for touchpads), so I changed
> this to
> 
> 	input_mt_report_pointer_emulation(tsdata->input, false);
> 
> to only report ABS_X, ABS_Y, and BTN_TOUCH, and applied.
> 
> Thanks.
> 

Thank you, I've re-tested and it works correctly, I've answered to Peter 
Hutterer with what I've understood about that. Please correct me if I'm 
wrong.

Thanks a lot for reviewing
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
