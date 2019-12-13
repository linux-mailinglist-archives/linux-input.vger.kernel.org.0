Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B816611DA5F
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 01:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731192AbfLMAGO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Dec 2019 19:06:14 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34746 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731095AbfLMAGO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Dec 2019 19:06:14 -0500
Received: by mail-lj1-f195.google.com with SMTP id m6so570297ljc.1;
        Thu, 12 Dec 2019 16:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hpUvAuqmvVxYFVTREXWG7TifUGUkF/THEEP70oCQSnI=;
        b=q1OZLlVg43/x4ST4OMccqIKIlHXS0zzuZpD9pNqMTUy/VFa3JNunlTxc0WGfGLUMbk
         3oKfUEieKvZlxGLWMNkl07HbW+6XaH9jDvo8LkcG8mS/Ervbzk9RqQcrLo/gziNDiizl
         GNxe38UDIyZ8NVuP8KbVJm+gchb6wgqxPTTw52lojOAV/X+txgO4Kl2tdg4PQLzZPxLu
         JMw7PNLw9E0WMsXmeBSD2jHScduZTkKfNUHXhHAAhD+awdX9rP4MZ3XssTa8ndtjUIve
         xQ6LgAqe7MpKFoFU0MvHkT2Jlf1mQWBNpQxZkaUV6e5TclfCSTH72k6q8nEC4cSWyORO
         BPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hpUvAuqmvVxYFVTREXWG7TifUGUkF/THEEP70oCQSnI=;
        b=bgR/5eVYhRJvVREsDfkliD68XBrhjl28aLCGXamddpitNM5zvEJypEDSirQCPnR0/y
         6wdLUKLNzMT583U0rtrRjdvbINn+3CFoMYRVlq/t042tA/31BQQPvnf/8N137Ym0vcCt
         QWQZTeytYisTcWwoTXoosbXKXqrEvkz4tzOnS7jX26tb+Yg9fgqm/GoeS3k4gBl3F6cV
         cASa8LaA95uQtEi95Xd8mYPRqdvCAsyKAV23ac/aRB3/hwrEOFp3F4qIfLe3jwkLxsC+
         i20Rsj3rBHsbjFdYyt1sbO2pDbE4OLVzmcSlX30hpW1CHhe/RMYxFd91ot26/wOEGqo8
         mLLg==
X-Gm-Message-State: APjAAAVpuJWKq0My3fx/GtNgrKl92t6y677TfzDNq7fTLE8YSFOgr/cB
        xSlx3Hw9bg5m5JwmtnUPnd4=
X-Google-Smtp-Source: APXvYqxNaTaKrdQ62I9SAGG7A4AsrInfBMFyWB8qeY69HvZynpU7GJMZ7k66oNPJpCM+ZfKHtTInyA==
X-Received: by 2002:a2e:6e03:: with SMTP id j3mr7968775ljc.27.1576195572112;
        Thu, 12 Dec 2019 16:06:12 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.googlemail.com with ESMTPSA id c27sm3608171lfh.62.2019.12.12.16.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2019 16:06:11 -0800 (PST)
Subject: Re: [PATCH v2 2/9] input: elants: support old touch report format
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh-dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>
References: <cover.1576079249.git.mirq-linux@rere.qmqm.pl>
 <2b5e15ea600c33dfab4aa50e360ec553f1af7db0.1576079249.git.mirq-linux@rere.qmqm.pl>
 <f53b507c-76dd-8733-9698-952aa7a7301f@gmail.com>
 <20191212194552.GA22553@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d30d60e6-f9cc-d92e-f875-3d862c8e8c44@gmail.com>
Date:   Fri, 13 Dec 2019 03:06:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191212194552.GA22553@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

12.12.2019 22:45, Michał Mirosław пишет:
> On Thu, Dec 12, 2019 at 03:54:13AM +0300, Dmitry Osipenko wrote:
>> 11.12.2019 19:03, Michał Mirosław пишет:
>>> Support ELAN touchpad sensor with older firmware as found on eg. Asus
>>> Transformer Pads.
> [...]
>>> @@ -814,8 +817,16 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
>>>  			pos = &buf[FW_POS_XY + i * 3];
>>>  			x = (((u16)pos[0] & 0xf0) << 4) | pos[1];
>>>  			y = (((u16)pos[0] & 0x0f) << 8) | pos[2];
>>> -			p = buf[FW_POS_PRESSURE + i];
>>> -			w = buf[FW_POS_WIDTH + i];
>>> +			if (report_len == PACKET_SIZE_OLD) {
>>> +				w = buf[FW_POS_WIDTH + i / 2];
>>> +				w >>= 4 * (~i & 1);	// little-endian-nibbles
>>> +				w |= w << 4;
>>> +				w |= !w;
>>> +				p = w;
>>
>> Did you copy this from the downstream driver as-is? I'm looking at the
>> Nexus 7 driver and it does the following for older format:
>>
>> u8 size_idx[] = { 35, 35, 36, 36, 37, 37, 38, 38, 39, 39 };
>> unsigned int s;
>>
>> if (i & 1)
>> 	s = buf[size_idx[i]];
>> else
>> 	s = buf[size_idx[i]] / 16;
>>
>> w = s & 0xf;
>> p = s * 16;
> 
> This is the same thing modulo (w), which is scaled here to declared axis
> range (1-255 from 0-15, assuming 0 means "no touch" so it should not occur).
> 
> OTOH, I admit, that I don't have any software that can verify those
> settings. It might be that eg. one of MT_PRESSURE or MT_TOUCH_MAJOR axes
> should be dropped in this case, but with no docs I can't be sure what
> the reported values really are.
> 
> This is from the original (GPL) code dump labeled 'Asus 10_6_1_27_5':
> 
> |  touch_size = ((i & 0x01) ? buf[size_index[i]] : (buf[size_index[i]] >> 4)) & 0x0F;
> |  if(touch_size == 0) touch_size = 1;
> |  if (touch_size <= 7)
> |      touch_size = touch_size << 5;
> |  else
> |      touch_size = 255;
> |    
> |    input_report_abs(idev, ABS_MT_TOUCH_MAJOR, touch_size);
> |    input_report_abs(idev, ABS_MT_PRESSURE, touch_size);

Okay, I also don't know how to test it properly.

If anyone knows, please let us know :)


