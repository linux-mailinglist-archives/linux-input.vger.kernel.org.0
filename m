Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFF535F9A7
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 19:20:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbhDNRR0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 13:17:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbhDNRR0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 13:17:26 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A87A2C061756
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 10:17:04 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g17so23908304edm.6
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 10:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=adirat-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=rFkkjxqHpWb5oS2G5iwZaP+zKzf4ZbCevn2f+ZXYmBQ=;
        b=XDPQzlWAmTGGDU0UUms3P6TvEyasewv9bVvRbyQsLQllL6bIh+ShaUDY3kLUc+ANmV
         kKdJZnhuZez1381X4UWFyINleqoxjjUhOBTN5cncba0mz/disFhLJk/exy/ZwCYCUZ3x
         JddJAdlkp/RwxxuNkIVzKITJaQOxOLDK7YIalTx6qPnyapvomvN1fsC76VNaZkZv8ndt
         YEDYbpYSiWdqIPRK9R5l1/YNi6GCDz6i4Pkm6xBfneHtNAfmIRQNv417yLx3IBz2H783
         5i/kdnMNw3IiDrsHP347RV7IowGyq6bExbb7VubQL3H7lN/CXYpDS4bzySMO+3nLrNVf
         N3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=rFkkjxqHpWb5oS2G5iwZaP+zKzf4ZbCevn2f+ZXYmBQ=;
        b=gEU0E3xMd2ynWfSZdgfJm7FmS4GVAi3RTlE4rO6++PF9rJyLNeg8IAvneRsy9Dcaz2
         e7bn8YFAkDovz5i15qK6O8PXZBqj3J2fBlrn2DObWiKCqD3cxuT4T6PNNB5BTwi8VIfn
         urDUI6T6Htc6KhdOK6b4KMeVTsvtK7bHk/XPqqDDz/aI11TV2cP6Zy/F2vCAbC4shGYb
         PTARbdCb9sQTNtdtvhUgT5N0wquV+WwqI/A8dh7IwqC5T8tAAO8Htw6Q3/JDGaeqLK+M
         AZKOK7zJoBSFohLlcYrpHe0R4ye563z3XfrbIdlHHtK4CvKmnYCvdZd5XkoSoNzEYIaP
         9U/g==
X-Gm-Message-State: AOAM5318PS06gUednEhy5eWup100ozlG9ybmuffuWlWB1AnG/m2zrodb
        DGXGOCG+5RqhT3GbrW1xz+zTFg==
X-Google-Smtp-Source: ABdhPJxPS4Z3wTzfaWJwh+M5g6HZt1gMnX7j4nwwg8Rteb6I1kI1rWraEiYgKObVNIiY4j/Exqhijw==
X-Received: by 2002:aa7:d341:: with SMTP id m1mr41865073edr.120.1618420623380;
        Wed, 14 Apr 2021 10:17:03 -0700 (PDT)
Received: from ryzen9 ([79.119.97.29])
        by smtp.gmail.com with ESMTPSA id g25sm141343edp.95.2021.04.14.10.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 10:17:02 -0700 (PDT)
From:   Ioan-Adrian Ratiu <adi@adirat.com>
To:     Salvatore Bonaccorso <carnil@debian.org>,
        Alessandro Grassi <alessandro@aggro.it>,
        986561@bugs.debian.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jkosina@suse.cz>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Bug#986561: linux: Regression in drivers/hid/hid-dr.c causing
 horizontal D-pad to malfunction on SNES joystick
In-Reply-To: <YHb2Dt24465WcN1r@eldamar.lan>
References: <161779964431.889220.2857033195611862828.reportbug@malacoda>
 <YHb2Dt24465WcN1r@eldamar.lan>
Date:   Wed, 14 Apr 2021 20:17:01 +0300
Message-ID: <87o8eg946q.fsf@ryzen9.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, 14 Apr 2021, Salvatore Bonaccorso <carnil@debian.org> 
wrote:
> Hi Ioan-Adrian, 
> 
> On Wed, Apr 07, 2021 at 02:47:24PM +0200, Alessandro Grassi 
> wrote: 
>> Source: linux Severity: normal Tags: upstream X-Debbugs-Cc: 
>> alessandro@aggro.it  Greetings,  I am encountering the issue 
>> described in this thread[1], using a gamepad identified as 
>> "DragonRise" with USB ID 0079:0011.   The joypad works as 
>> intended except for the D-pad: up and down are detected in 
>> jstest (though misinterpreted: the input graph shows the points 
>> in the left up/down corners instead of the center), the left 
>> and right buttons are completely ignored.   Running 
>> 'input-events' shows events 0/127 and 255/127 on up and down 
>> respectively, nothing at all on left and right.   I was able to 
>> identify that the misbehaviour was caused by this commit[2] on 
>> the kernel source tree. To determine this I have rebuilt the 
>> Debian kernel using hid-dr.c from the previous commit[3] and 
>> loaded hid-dr.ko manually, with which the gamepad worked as 
>> intended. I have replaced the file again with the one from the 
>> breaking commit iself ([2]) and the behaviour was again broken. 
>> Furthermore, to confirm that that was the breaking commit, I 
>> have commented line 315 (the input mapping one in the struct) 
>> from the current Debian source tree and rebuilt it, the joypad 
>> works as it should.   Regards, Alessandro  [1]: 
>> https://retropie.org.uk/forum/topic/25657/controler-issue-no-left-and-right-not-working-at-all 
>> [2]: 
>> https://github.com/torvalds/linux/commit/e15944099870f374ca7efc62f98cf23ba272ef43 
>> [3]: 
>> https://github.com/torvalds/linux/commit/313726cad3b68039c8e4dcad5a2840a0d375678c 
> 
> A user in Debian reported that e15944099870 ("HID: hid-dr: add 
> input mapping for axis selection") introduced a regression, 
> described above. 
> 
> Does this ring some bell to you? 

Unfortunately no and I do not have the HW to test anymore.

It is possible that change introduced a regression on newer 
"DragonRise" gamepads and maybe that mapping logic needs to be a 
bit more complex, depending on the HW differences.

Sorry I can't be more helpful,
Adrian

>
> Regards,
> Salvatore
