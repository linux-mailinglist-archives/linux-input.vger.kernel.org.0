Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7C9342B1D
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 17:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbfFLPix (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 11:38:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55506 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726829AbfFLPiw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 11:38:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D684A60312; Wed, 12 Jun 2019 15:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560353931;
        bh=jo5xwzUkOXexvviKPM6NFNmRQs5GnOMsMW7FYO6sJ00=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Nt7sd7cZDHTP1ZD9BGLhpg5rSQFdvUK1R2mXkRYJL0U5w1JoCvtR0q/ezvfDFcguR
         v+sth8LZmLK/T5mYzGlxiOli7B6WvVQacdXZq/gcVvXUFmAyfs5pDpdm5G04OEVHp1
         +0+PzOfZriOjnXhHw9ba88bitXd41PRgS6n+a6bM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D3A4602F3;
        Wed, 12 Jun 2019 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1560353930;
        bh=jo5xwzUkOXexvviKPM6NFNmRQs5GnOMsMW7FYO6sJ00=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=I8Hju8KJNFAyrfSlI3R59XQCdY9ihtqyUcwtNqUKPb95ly8WzJGcN12ELC8YgP2mB
         KtTLMuPpeSgMIsiPD5Nv32DIRd4XdrXpRTke6G4KcxZl72wgMXQ2Vsoy/wdlVc069m
         1fNeCLC0pOkSVCHPuS/ymcijn+tTp8u+gt1ZXfo4=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5D3A4602F3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v5 2/3] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
 <20190606161322.47192-1-jeffrey.l.hugo@gmail.com>
 <20190612003507.GG143729@dtor-ws>
 <nycvar.YFH.7.76.1906121644160.27227@cbobk.fhfr.pm>
 <CAKdAkRQOxTX51rhodoFyYpwi85pk8apvWjCLLX5Sw6NTH=j1kA@mail.gmail.com>
 <CAO-hwJKDxu0Bxxjd9reAojHODQTnW1POmifBCVsnjt8+CT4rmw@mail.gmail.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <13ffac55-7760-9dda-8c80-d15283cf8f92@codeaurora.org>
Date:   Wed, 12 Jun 2019 09:38:48 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAO-hwJKDxu0Bxxjd9reAojHODQTnW1POmifBCVsnjt8+CT4rmw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 6/12/2019 9:21 AM, Benjamin Tissoires wrote:
> On Wed, Jun 12, 2019 at 5:14 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> On Wed, Jun 12, 2019 at 7:45 AM Jiri Kosina <jikos@kernel.org> wrote:
>>>
>>> On Tue, 11 Jun 2019, Dmitry Torokhov wrote:
>>>
>>>>> +static const char *hid_elan_i2c_ignore[] = {
>>>>
>>>> If this is a copy of elan whitelist, then, if we do not want to bother
>>>> with sharing it in object form (as a elan-i2c-ids module), can we at
>>>> least move it into include/linux/input/elan-i2c-ids.h and consume from
>>>> hid-quirks.c?
>>>
>>> Let's just not duplicate it in both objects. Why not properly export it
>>> from hid_quirks?
>>
>> Strictly speaking Elan does not depend on HID; exporting it from
>> quirks would mean adding this dependency. This also mean that you
>> can't make Elan built-in while keeping HID as a module (I think this
>> at least used to be config on some Chromebooks).
>>
> 
> I also think it would me things cleaner to have the list of devices in elan_i2c.
> If we put the list of devices supported by elan_i2c in a header, and
> have HID read this .h file directly, there will be no runtime
> dependency.
> 
> I am sure we can work something out to remove Jeffrey's fears.

Works for me.  I plan to have the next rev posted by the end of the week.

