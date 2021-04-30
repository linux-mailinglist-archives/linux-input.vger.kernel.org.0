Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 240B637001B
	for <lists+linux-input@lfdr.de>; Fri, 30 Apr 2021 20:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhD3SCb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Apr 2021 14:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbhD3SCa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Apr 2021 14:02:30 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0E6C06174A;
        Fri, 30 Apr 2021 11:01:41 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x5so21281409wrv.13;
        Fri, 30 Apr 2021 11:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8P8AUIJDD0CsuvU0cN5V+UaLYi6WAreX/VWn7wkB1hc=;
        b=VAztjF92+NdUNr64Zc1zgfhAJfbpoJ/UJRXuzuiw+JolgdvgWczfpYGvF/NAJMNNjG
         jnd7DrSwOFrJDqo9hjoe/mhtWcBno4yWHL5WErn5jrBFmdSY5X2pgbVY7VsZ/Vv40cLS
         AEqtMs3FynkfDCoDRMO5ev3Jk1im15mCAePtJmsKiRxxWJPZiylQP7bxsISs23TfWF3Y
         7r88Bs9SXXPCrW4gMfSkzKi4M7T9FUtOVIAvRMZDyOHAkQDwuklVzTRd5o8+mw5NsFn7
         uYvePjmIkr6PoL9grk/rUta1CE1zqlor1x5etdWe9MmuNXvF2W4thaBXEVFeE0Aw6pwr
         Q1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8P8AUIJDD0CsuvU0cN5V+UaLYi6WAreX/VWn7wkB1hc=;
        b=iXdmpbjgEcmYu1EggkCstCsZHlUN8soNmJjXWcCm4WONBhPBqujrAyvuhRR+8UJYYT
         1W5XUfDSdnLyKKybBREieE40XXY/RUXlM/YUegdpzl7Gwj77EbUuRE/fs7euDTr5kIBi
         vdbeFqwlfT33XnC8j0BiP+bGXG3YqlRmA/P7O6CbJBuU1SExliKevGc6E3aNok7jLp5L
         qSpHTCVzisa5KtdAOj2woX3snMG4VbRqt1+ocdHmwLATSOZB4TsH8qy1nyfLUDlBcF9e
         emFAHTsxzcQtcN0f5VKda87rReI1Ei9k9Em2gVKX6AMXzNT6JmrFxtLASnME6gd47Do8
         2jNQ==
X-Gm-Message-State: AOAM530obVYv2zHLf/4yERvQtdT+xAE0Sj/EFwKVuF16YWXYej59g+SB
        yfB8skT/vV/yvXBGq+UafeuHAlAGGQ0=
X-Google-Smtp-Source: ABdhPJz2RgZglpa3i3SHM9YnkMH3HkwmgJjY3o98L5iz7pSaaCNmGiXBeqWd+H2Gos00yk0Khbdujw==
X-Received: by 2002:a05:6000:192:: with SMTP id p18mr8468813wrx.347.1619805700726;
        Fri, 30 Apr 2021 11:01:40 -0700 (PDT)
Received: from [10.17.0.10] ([37.58.58.229])
        by smtp.gmail.com with ESMTPSA id a2sm3334782wrt.82.2021.04.30.11.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 11:01:40 -0700 (PDT)
Subject: Re: [PATCH] HID: surface-hid: Fix integer endian conversion
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210411113402.2594945-1-luzmaximilian@gmail.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <16133d79-eac0-4407-f494-c38459eadea4@gmail.com>
Date:   Fri, 30 Apr 2021 20:01:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210411113402.2594945-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 4/11/21 1:34 PM, Maximilian Luz wrote:
> We want to convert from 16 bit (unsigned) little endian values contained
> in a packed struct to CPU native endian values here, not the other way
> around. So replace cpu_to_le16() with get_unaligned_le16(), using the
> latter instead of le16_to_cpu() to acknowledge that we are reading from
> a packed struct.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: b05ff1002a5c ("HID: Add support for Surface Aggregator Module HID transport")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Friendly ping as it seems this hasn't made it into the PR for v5.13 :)

Regards,
Max
