Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81B943AF6A1
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 22:06:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhFUUIx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 16:08:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhFUUIw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 16:08:52 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C84C061574;
        Mon, 21 Jun 2021 13:06:37 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id f15so5574575wro.8;
        Mon, 21 Jun 2021 13:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JJdybyrFm3sc9G1fk+wA0YIvjFKAT4+yejKWKcRx9U4=;
        b=A5MMk89kUCJ0GqJ2/bA0p9rr2dkLBGgl9M1BSgMHgbC6U62htQd1M12HWiCE31ouQR
         Q92VWzsYO6iHCgIGB2iBP2NJMj/s0e6+16Mfpl59lDfZ8CTtMcJ5twmaLxxGIpPQQpUi
         FoxQXmymn0W7JH4Jq60YI9RvMbN/gL4DA9ksTSOWrGo7PGFC8bkX3MOfyv4g/AJOaLxk
         XsPjX84eEW6ZiPU9uXskZ22OM3wmoULutkxiRDnzNdH6v98/EX2qeHe60VQQo/6bleOT
         ZQqe0g0rqytl36tBBpxVlTXbJnfO3AqNRUQKDKaTQgQss9SSyWdbXmpwRsfyKmo6rWkF
         ebAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JJdybyrFm3sc9G1fk+wA0YIvjFKAT4+yejKWKcRx9U4=;
        b=msfUouxUKV1nAQvtuT/20NJlUI+nFmMCdNskkL799K8176O6HSlHrtjeraOsfC9jS/
         Em0/BDHLMfaR344NppQU6/cBoyb2tZ0Clkc2wWhwI6u96GPy/vv+sKPaFbLxlu1P5iW2
         4mmhBI0SQsYocR8ZkbxJjTl2G18gcKmiZ3sm+uZC3MjRygt+VqbM45tZowu15MhX2Nj5
         SvoMS1XrTf6CvP+43xPOh3nrldNW7f+2Wp7oDgBy3ViOAfwV3qow46Q8S81uwDcX1cRK
         O80yU7E7+/y3XmkjpdDLwf1sSE2M1rNjBb9O7dd2Xw1V3icsiR9BL6L9k4Z6/tKcGKwU
         Rv1g==
X-Gm-Message-State: AOAM533SB3QWejsRh6vOcFts7wxmmj8qwRkO+U3lsIG9RSX1nFYMwbv6
        AXoNSsVgzXixxW5AtL2zMng=
X-Google-Smtp-Source: ABdhPJwTTOqPevMf33l5cObk3wVX7E9iRJSj3Trbw4Ho0XajwZN0oEibkkGs1/diofVy74IJiWUyTw==
X-Received: by 2002:adf:8061:: with SMTP id 88mr143664wrk.233.1624305996422;
        Mon, 21 Jun 2021 13:06:36 -0700 (PDT)
Received: from allarkin.lan ([176.230.197.133])
        by smtp.googlemail.com with ESMTPSA id 4sm28367wmf.34.2021.06.21.13.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 13:06:36 -0700 (PDT)
From:   Alexander Larkin <avlarkin82@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     avlarkin82@gmail.com, dan.carpenter@oracle.com,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, murray.mcallister@gmail.com,
        security@kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in ioctl
Date:   Mon, 21 Jun 2021 23:06:23 +0300
Message-Id: <20210621200623.1690329-1-avlarkin82@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
References: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I did manual testing with virtual machine (for /dev/input/js0 the driver name is "VirtualBox USB Tablet").
I used program jswap.c from https://bbs.archlinux.org/viewtopic.php?pid=641803#p641803
I compiled both kernel and all modules (including new module with the patch suggested by Linus) and if using updated module:
1. No fail for the poc anymore.
2. Different tests like "./jswap b:0,1 /dev/input/js0" or "./jswap b:4,5 /dev/input/js0"" gives expected result (with seeing the result by cmd "./jswap /dev/input/js0"").
3. Tried to reboot with older kernel (where panic happened) and replayed these few manual tests: results are the same. Both for this older kernel (before fix) for poc.c still seeing fail.
4. For being sure that the kernel module being tested is the same as source code that
I'm compiled, I used command "objdump -S joydev.ko" (after decompress of /lib/../joydev.ko.xz).

I noted one other minor issue when used jswap.
For some reason jswap expected that ioctl JSIOCGBTNMAP returns 0 on success
(because there is separate JSIOCGBUTTONS for getting amount of buttons),
but instead JSIOCGBTNMAP returns number of buttons too (like JSIOCGBUTTONS is).
Is it mistake inside jswap.c and should then keep it as is for joydev.c?
So, for making jswap working, first I had to change return status check of JSIOCGBUTTONS
inside this test jswap.c program (and I don't know if possible to change return status of
JSIOCGBTNMAP to zero on success or of should keep it as is, because many other programs
could be broken if fixing success ret status to zero instead of amount of return values).
Dmitry, what do you think of this?

If no other tests required, maybe let's commit patch that is suggested by Linus.
Dmitry, could you please continue with this?

Thank you.
