Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C97944F625
	for <lists+linux-input@lfdr.de>; Sun, 14 Nov 2021 02:35:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbhKNBhv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Nov 2021 20:37:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhKNBhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Nov 2021 20:37:50 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99200C061714
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 17:34:57 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so20484033otl.3
        for <linux-input@vger.kernel.org>; Sat, 13 Nov 2021 17:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=J07Uj7pWvSDRsEFQU2T3xt9L2kOzNo/8bKwrqaYbUKU=;
        b=Zo5QWOGJ8Bzz4J+Ys3stN6Mj5NefaeqmBYknVjtt9/YPabHQiyqkXLLqW4BLGTeBmA
         5XNQvSDsyfFBdmfDhMcEA958QmJMR7EgvUc439m/qt5pNRoU5tKdQTeOBDQWNn8wsOCm
         hAdj5vkS8nlgPsO09sfggcmeI2r9d1kT1gbt6iwWQwfikKlxK/Av4poRt0mF7KvtMc9A
         INhjtMebdE/iinlFsfJAaHIeE7i+Z7mpww40GGSnDMXQ9snOcttPUhc1GwwxPSSV/eJZ
         Kies7adE0CMOc8dU8YEC+8I2Z3nE/3mmpq6hGfgM/7oZl1hmQU9WLNjfdPL3Wh0fBmzU
         wUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J07Uj7pWvSDRsEFQU2T3xt9L2kOzNo/8bKwrqaYbUKU=;
        b=MWNVHnNSp0AcXBS5VrqnSlbbGW0etOz0cmua6uVJOKy19exoQFwsjK2Y67U0ja5/WZ
         XoATxSDA92sWJYZ2umrZfH5XuXD1LA91YL1GTqqpOwGTyhQ1CkY8zCp6BFhQH6JX3DNO
         ZW7a8gCVJe+ay9jh6grXIl/3oBzqKloJpGQtf3xCF97YwILvqZVVRco+YLf57sUOZ0Ey
         gk8cdI0XQE6ewvTW7alVmENXXCpwqVF79RU5LE9pzFvtt/6QNqAJ87SBVZDI7WlvjQoJ
         rxmiWDr0iA8tonIjM9XUB4IA/GOuXdtvz7mW1tPp3KiJ88q1EIAVq4kW9strc0pztGY7
         8X9Q==
X-Gm-Message-State: AOAM532DyF13IAiPdHffPYXqpruQNrFz5/F4+7PlHnQJ/IRSfHoN8LWQ
        YuK135L0PKUeM0MMBBKbEFA=
X-Google-Smtp-Source: ABdhPJzjoLMQDGx6JTVXcQ69NUSL03oB6leNxBZ1vdVlbfVz7wwIyuPTSwlOa9w2o47GGfTumfCwhg==
X-Received: by 2002:a05:6830:1681:: with SMTP id k1mr22531897otr.242.1636853696468;
        Sat, 13 Nov 2021 17:34:56 -0800 (PST)
Received: from ?IPV6:2600:1700:4830:3f7f:7aac:34da:1863:159e? ([2600:1700:4830:3f7f:7aac:34da:1863:159e])
        by smtp.gmail.com with ESMTPSA id r5sm1846997oov.48.2021.11.13.17.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Nov 2021 17:34:56 -0800 (PST)
Message-ID: <dd40fcf9-582f-d5fd-4eec-ef06a8ecdf3b@gmail.com>
Date:   Sat, 13 Nov 2021 19:34:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Input: xpad - add more Xbox one controller IDs
Content-Language: en-US
To:     Benjamin Valentin <benpicco@googlemail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>
References: <20211113131734.46fbc9bf@rechenknecht2k11>
From:   Cameron Gutman <aicommander@gmail.com>
In-Reply-To: <20211113131734.46fbc9bf@rechenknecht2k11>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 11/13/21 06:17, Benjamin Valentin wrote:
> These are collected from issue reports on [0].
> 
> I wonder a bit why we need to maintain this list to begin with, when
> the consoles (and Windows) can apparently identify any new third party
> controller just fine.

There are 2 related problems here:

1) Detection of compatible gamepads
2) User-visible identification of gamepads and quirks

For 1, the way Windows does it is via the Microsoft OS descriptor [0].
AFAIK, the specific OS descriptor strings are "XUSB20" for Xbox 360 and
"XGIP10" for Xbox One.

That functionality is handled by xpad_table[] and the bInterfaceProtocol
detection logic in xpad_probe(). The xpad_device[] entry isn't required for
detection or functionality of devices, unless those devices need special
treatment like MAP_TRIGGERS_TO_BUTTONS or something.

Since the protocols are vendor-defined, we end up having to maintain the
vendor list. If we could detect that Microsoft OS descriptor, that would
avoid the need to maintain the xpad_table[] vendor list.

2 is the main reason xpad_device[] exists (other than special devices).
Most devices have pretty useless string descriptors which doesn't really
allow userspace to provide a human-friendly descriptor for the user. OTOH,
Windows totally abdicates this responsibility and just refers to XInput
gamepads by a player index, so maybe it's not something we have to solve.

[0]: https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-os-1-0-descriptors-specification

> I don't have *that* many controllers to do extensive tests, but I wonder
> if there could be a better way.
>> [0] https://github.com/paroj/xpad/issues
> 
> Signed-off-by: Benjamin Valentin <benpicco@googlemail.com>

Regards,
Cameron
