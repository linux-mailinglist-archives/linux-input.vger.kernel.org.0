Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2BE31CDCA6
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730105AbgEKOJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 10:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729963AbgEKOJa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 10:09:30 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8077EC061A0C
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 07:09:30 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id j2so7683637qtr.12
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=66ivZziC6fWt/OXZbDftr9QaYB14HUunfqNhoQgSQPk=;
        b=EMeuTqlh5TWbpkEdlgXd80JOaJToeEUhudmjGjZWgG5lx7ohM/1kOjUCLGxgI2okfN
         khzanuSaw3erzMtejB0jTGiWJ6Pfmh6zscHtqG2SYFGlLunF9aresERhURgfJPf6mFAK
         S7TYYqYSG9OB8L2XE9AsBTPQ/rLUIgYgjoSCMjDanJ0dz9Fa7I6F226VrXMY+ooYxUSd
         /mFjVKqq48m6nQ7wdgAHli2kU2E0Bk1soxe8iNIRMl8PWCqdGKxa2hsziZC8qzpe6kWq
         TEu94TUJwwMBe0hJUN8qNjTDnBJle/bR61ItJfo3jLhWGCIRcSyrNwmrFOKnECsPrdBp
         f+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=66ivZziC6fWt/OXZbDftr9QaYB14HUunfqNhoQgSQPk=;
        b=fXYthXXkJfJh1Y8t+zOI1lHz6XCDJeS6SbD85LVcKJyT13w9bzLdLT2ou9cY5q81cK
         ekh/XAy0q4mOOV6PjonOFgX0rhmPnl9VeRRbr1ueXb04jT+qZI3AA4hXoak7rfpCa+Hf
         +TT0bPffgu3wcy5S4vkEk197Vm1m73WUGrgrT7oF2HIrKFyq5gEDbQp+Q3pTuRP4aCr6
         WV/lumqZoFXpgcQ71X4epZ0MkBWEvxA/U5qpKVM4wgxh2sBFsIT/Q8hOZmWw1PEF5w17
         maVoiMd/A47QCkzcwQEwNoHiJa80hW5VPT318//YhlgEUC3N9lMyv6jXnyTRubd8JxTW
         QoNA==
X-Gm-Message-State: AGi0Puacau/bGnZBNL5I/g0WkPNe4F3quFStGcboIrOJtFTV9LvY3+UK
        /bME0YhvcWK65Icmhh742yiEU5R4qk8=
X-Google-Smtp-Source: APiQypKTp3R2ZWhotItf3QnYK2YG73RMwSaAVJvrc3DPJqByGQwcYYw+pzXHenuTQSpT/Q3sdipbbQ==
X-Received: by 2002:ac8:7552:: with SMTP id b18mr15584725qtr.312.1589206169288;
        Mon, 11 May 2020 07:09:29 -0700 (PDT)
Received: from ?IPv6:2605:a601:53d0:120:b89d:bda0:a559:80d4? ([2605:a601:53d0:120:b89d:bda0:a559:80d4])
        by smtp.googlemail.com with ESMTPSA id q54sm8525327qtj.38.2020.05.11.07.09.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 07:09:28 -0700 (PDT)
Subject: Re: [PATCH 1/3] HID: gamecube-adapter: add nintendo gamecube adapter
To:     Bastien Nocera <hadess@hadess.net>,
        =?UTF-8?Q?Fran=c3=a7ois-Xavier_Carton?= <fx.carton91@gmail.com>,
        linux-input@vger.kernel.org
References: <20200506004801.9478-1-fx.carton91@gmail.com>
 <21978190912689256db8cc547a25313559e94019.camel@hadess.net>
From:   Ethan Lee <flibitijibibo@gmail.com>
Message-ID: <0e4f2671-00e8-b5d3-f309-8355bc92f118@gmail.com>
Date:   Mon, 11 May 2020 10:09:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <21978190912689256db8cc547a25313559e94019.camel@hadess.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Looks just like the SDL hidapi driver so this should be okay! The only 
thing I'm unsure of is the axis inversion, in SDL we read the axes 
directly and invert them in the SDL_GameController configuration. 
Someone also added a bunch of dead zone work after I wrote the driver, 
but unfortunately I don't know the details of that.

The meat of our driver is here...

https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/hidapi/SDL_hidapi_gamecube.c#l226

... and the SDL_GameController config is here:

https://hg.libsdl.org/SDL/file/4298bf108b06/src/joystick/SDL_gamecontrollerdb.h#l614

The '~' char denotes an input value that is flipped after it is read 
from the joystick; the vendor/product/version matchup may cause this 
config to accidentally flip the axes twice when using the kernel driver.

-Ethan

On 5/10/20 08:45, Bastien Nocera wrote:
> On Wed, 2020-05-06 at 02:47 +0200, François-Xavier Carton wrote:
>> The hid-gamecube-adapter driver supports Nintendo Gamecube Controller
>> Adapters.  They are USB devices on which up to four Nintendo Gamecube
>> Controllers can be plugged. The driver create independent input
>> devices
>> as controllers are connected.
> I think Ethan might be interested in testing this, as he's been using a
> user-space version of that in the past:
> https://patchwork.kernel.org/patch/11530107/
>

