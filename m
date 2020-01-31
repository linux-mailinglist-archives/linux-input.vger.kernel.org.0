Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE8B714EDD2
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 14:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgAaNtQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 08:49:16 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:39386 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728696AbgAaNtP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 08:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580478554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4Qsgf1BmJQeN7UmdO9vRu4ZrlW1VvUvJZ22OTiZbYdk=;
        b=AqmFEPWVlXd1U7XPP+EitSaS83ArWqRjWg9+61e+qHH3N83Fbgt7QNsTFjyg6FtMD6QUoR
        9cqWOSIbMolx6/hrwUlknhz4ToqY+kv4i5GMdZrEbTJuk1PPcx6yT4HQACagyDBVGtGFz4
        0OaAqG5xkk0nyTQO7DyyDUTgQOKJxX4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-PqtseR0EN3mwBrRSA3GxVQ-1; Fri, 31 Jan 2020 08:49:11 -0500
X-MC-Unique: PqtseR0EN3mwBrRSA3GxVQ-1
Received: by mail-wm1-f69.google.com with SMTP id s25so2834467wmj.3
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 05:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4Qsgf1BmJQeN7UmdO9vRu4ZrlW1VvUvJZ22OTiZbYdk=;
        b=GpbmP1xt/z02P/JWGm7g4taqKhV6RoVlxiFCHwPe0CQkjzaj1R2mCQIdoghvtOj20b
         PDEiBkoz2QbMTwkjDkwgDlLqrq+c+afCx8/uxG3l8zc+ZCqAxU6kOQMRyG1a/5V6N1Gr
         N+Se3nWqGeJJZBmmB70yJuBkmzZXg+fKA2dghS05hODe4RxGeA1MXC49QEWvJHW1SUk2
         b2ZiIu9VdN/Afk8w374144ux/x/unD1V1s3kbXaKfu/06rFJEbHaAXGb0oQU0ODFaw4g
         kis5pNEpiqo4DxaS+1kyYcuTznvQC4zQP9jGuUtEeCm4eJGStalboI1uQquBPP9VYMWI
         fk9Q==
X-Gm-Message-State: APjAAAUpuSkfbmCNLdeScTWMZdywT2wHK1o4GVGwDZuiPtMifXJpQl/i
        y0kl4eTDyOYBkO4GvEhNSJHdP+voOaKVFPlry6qgtYl6fqdnasD80nuimumax6UoOEyJCcbdcCb
        apfoFjbF/q7oQS5kmBjevDt8=
X-Received: by 2002:a1c:7d8b:: with SMTP id y133mr12608827wmc.165.1580478550134;
        Fri, 31 Jan 2020 05:49:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxVFPsIAtfjkYVlzOSWUsuNi2O1rpOonlNxiTbMvFsWX9Q7Gl3I39A9BXJUGxeBJjOoFE217A==
X-Received: by 2002:a1c:7d8b:: with SMTP id y133mr12608810wmc.165.1580478549852;
        Fri, 31 Jan 2020 05:49:09 -0800 (PST)
Received: from localhost.localdomain ([62.72.193.75])
        by smtp.gmail.com with ESMTPSA id y6sm11983736wrl.17.2020.01.31.05.49.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2020 05:49:09 -0800 (PST)
Subject: Re: [PATCH] HID: generic: Check other drivers match callback from
 __check_hid_generic
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <20200131124615.27849-1-hdegoede@redhat.com>
 <CAO-hwJL_5JKGjoKFyybfpA=89eK4C3nJtZMb5_8oxnzf9EJGaQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d90a5b8f-08fa-b358-900c-b579f64e8782@redhat.com>
Date:   Fri, 31 Jan 2020 14:48:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJL_5JKGjoKFyybfpA=89eK4C3nJtZMb5_8oxnzf9EJGaQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/31/20 2:39 PM, Benjamin Tissoires wrote:
> Hi Hans,
> 
> On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> __check_hid_generic is used to check if there is a driver, other then
>> the hid-generic driver, which wants to handle the hid-device, in which
>> case hid_generic_match() will return false so that the other driver can
>> bind.
>>
>> But what if the other driver also has a match callback and that indicates
>> it does not want to handle the device? Then hid-generic should bind to it
>> and thus hid_generic_match() should NOT return false in that case.
>>
>> This commit makes __check_hid_generic check if a matching driver has
>> a match callback and if it does makes its check this, so that
>> hid-generic will bind to devices which have a matching other driver,
>> but that other driver's match callback rejects the device.
> 
> I get that part, but I am not sure I'll remember this in 2 months time
> when/if we need to extend the .match() in another driver.
> I am especially worried about the potential circular calls where an
> other driver decides to check on all the other drivers having a match
> callback...
> 
> Could you add a little blurb either in hid-generic.c explaining the
> logic, or (and) in hid.h where .match is defined?
> 
> Because now, we have 2 callers for .match(): hid-core and hid-generic
> (and 2 is usually one too many :-/).

Ok, how about the following:

static int __check_hid_generic(struct device_driver *drv, void *data)
{
	struct hid_driver *hdrv = to_hid_driver(drv);
	struct hid_device *hdev = data;

	if (hdrv == &hid_generic)
		return 0;

	if (!hid_match_device(hdev, hdrv))
		return 0;

	/*
	 * The purpose of looping over all drivers to see if one is a match
	 * for the hdev, is for hid-generic to NOT bind to any devices which
	 * have another, specialized, driver registerd. But in some cases that
	 * specialized driver might have a match callback itself, e.g. because
	 * it only wants to bind to a single USB interface of a device with
	 * multiple HID interfaces.
	 * So if another driver defines a match callback and that match
	 * callback returns false then hid-generic should still bind to the
	 * device and we should thus keep looping over the registered drivers.
	 */
	if (!hdrv->match)
		return 1;

	return hdrv->match(hdev, false);
}

?

Let me know if you like this then I'll send a v2 with this.

Regards,

Hans

