Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8AD7612157
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 10:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbiJ2IVg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 04:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbiJ2IVf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 04:21:35 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C8AABE51C;
        Sat, 29 Oct 2022 01:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1667031692; bh=UeBZfZtqO+BN/UBgi9dcPxnLUY3TXkUlpsdxPLph4Ik=;
        h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
        b=SP6zSPV/pHxsFarHHvZVi7Cx4YSJm9z/MAnaFMhFTCMHrdssYGmngH+D+O3yh7+Bf
         848Mz3i/OonagI6foPB6T6AB2am820lyvEeLhGRx4VRfmxk9aacstR9q8PnGpnWTir
         U3SPpuoUoO7RQr9+dLGad9HItdL0EKglgsUI7xfXgP1drmjAkAEao2pvz4Ojz43vtC
         zdh35McbWU9rmeC7uTIDIjK/lL/zLTHr7qAzLiUb3gSPbRJSCDXbPcjMEkUJICEzMi
         kXkYAKCFGp5Xd37YbD2MDFjaXG6RlfTB75wBAx/ziVjBHPJ3uZZfrVL0LqwyS13SG1
         RKSMqHytzhd/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mail-ej1-f47.google.com ([209.85.218.47]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MOiHl-1oQBIR059T-00QBDE; Sat, 29 Oct 2022 10:21:32 +0200
Received: by mail-ej1-f47.google.com with SMTP id 13so18085495ejn.3;
        Sat, 29 Oct 2022 01:21:31 -0700 (PDT)
X-Gm-Message-State: ACrzQf3C50m4KMVhMBnqttH6UHI5B3KkySM+JdbtaY8R5hcp0i8K4WfO
        ism7ehALe0nxHcI9WByKONo/Euzlv0CSyQB1iug=
X-Google-Smtp-Source: AMsMyM7TZbXAFjV4fqevnDWnb4kZYI3SULIUF0F8dR2HjB5/6cOY0h6jbuixFrosK9Ylr6OdAp706NuHTtemaG+DK4k=
X-Received: by 2002:a17:907:7244:b0:78d:cedc:7a9e with SMTP id
 ds4-20020a170907724400b0078dcedc7a9emr3004064ejc.600.1667031691666; Sat, 29
 Oct 2022 01:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <Y1AVDck5sQf8+QFX@rowland.harvard.edu> <CABfF9mPU52OXTGcsbatJCG4nbP4zaPN3iJnttMg+xRyGY6dUEQ@mail.gmail.com>
 <CAO-hwJJ7cF-4kd8Mi6bb5n-k5LuMrWbpdMqFs82y7iQOscr-7g@mail.gmail.com>
 <CABfF9mNfU=swmpVXfVr7pYWs72jrd-HDY8+_NXyBDAKa4CWG5Q@mail.gmail.com> <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
In-Reply-To: <CAO-hwJ+i3zd=CyU0T+Nb1vGfZfenMBH16ern_ncTTKEpyGAuBA@mail.gmail.com>
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Sat, 29 Oct 2022 10:21:20 +0200
X-Gmail-Original-Message-ID: <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
Message-ID: <CABfF9mNrMx2BzU5tbBeapY15M4Ls_5xYBGfVB=Up5TJu=eWCcg@mail.gmail.com>
Subject: Re: Litra Glow on Linux
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        USB mailing list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:JNuks/2cWKkFr9FqIe6e1t+qDDm+6ConrPR5+wc/z8QLTtCIPmy
 kQUY0WMn/WZkL7mIR0oIf1to36l2uAuareBmpUXxk/eCpuZyGiqnYG9aNk0EMKGssKYPKux
 Tb9QULVtSS47hF+/LxA147ikRRcTSriGeep5yFd8Sg3PeLUMXCyITh3sEW6h7X1t6hAIlDe
 BpsJMxQ5b4wteF6AfSC7w==
UI-OutboundReport: notjunk:1;M01:P0:Ju8WBwtUZb0=;Doi9DzHmv50QdVSIKYj0ILM+mvl
 Azr9SP0Q7RqMpXFbg/zyPiETCiPB3aLu981kEt2D3LSkDIkOLiPF3lb087VGMUJtsMZUjxET3
 0J0wTeu4i6+zA2m279CzuMvd+zt6g6hy6G80f0uQ0ZAnOUd+P/uK79uRSOXUp4cVnGev8nqxW
 c5lS/VE6JQ7ugcGZ+rO1lAVRSUz33Kpe5efW0HwpMYSKw/+zqRkEYqWgSK57aAzF6dg+ROtVA
 uFmbLnXc9qcq9GlC4X2nwjLgkK1htSDWB4SJGr+IoQq0SbE9eITPh6Vv+cWNyydGVwndjIAte
 p4rujQTSo+cFf0kpi1DyW8RdhnUeNP/KrdWeSFtRHrKRRZ1xJPx9knS8QLsTX9Wz/bw1IYp8j
 v5FHXSSbhXG6utP5+z9D5X4r8dPO551DA6hPOQX3SrfBijopw5fqcxwl0J4kW2aFruD2uBvAw
 DKjgQ2lKY+hmNnoskHhGhQDE0dGNOJ1k8At3VUE/q5C53HlW37Bh1VhW3kBtzTIVfSzE/fJ2V
 qafc16HPK+Xa1B+96KJ0BggaGWsvwuCaDlt9BGVjE1qNhwVTtDO7JYEQKmIK7t9KRFT012zNc
 MJatrhGD+Ztn3BnpbXVSmPUB/2Bg+WzylCrzhvdFU3z/S1e7d0HqYtxbI+fdfX2zrMC0wcmUO
 VPzpGo7s5eXm8quacQZGLyUlOlCGmkB/ig4KnhHZWsEOgVcy26YYBk/RaJR5WK3cNpitRsgpk
 hS8flfSCorKZi1fnUtAKH5pO9lW8HssmMeicLurkUbAVnU0eLO0MwyqF8VyrnjMpYhWFKmMOR
 mDDqlKVBJPYomGQkgUGfV26KejI1xq5Y8eKo31aMR3owUC73M0ZgeWOdKFbxLFAGg4Hqe+z5j
 jw5QGkwvUUCWi/RejyaG3W6p1VrEiAe71BkP6vJMC5ohCsfjUpGw32FQefSoYHtvCop4Y36B0
 r83KqYuC8tD8K8/YQ69p/gMpui8=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sorry, another set of questions - seems like I am a bit dense.

On Thu, 27 Oct 2022 at 11:44, Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
> It's just Logitech's common HID protocol. The advantage is that if
> Logitech reuses the feature on a different hardware, we won't have to
> implement anything new in the kernel.
Started implementing some illumination code but will take a while
until I figure out the driver I think.

> But from where you are now, you should probably be able to implement
> the basic on/off feature by looking at the function 0x1000 in the
> hid-logitech-hidpp code:
> - you need define a few macros for your functionality (the class, the
> commands, the events)
So my approach would be to identify the GLOW device and then at some
later point create the
illumination state and from there only handle common illumination.

> - you need to add a hook in connect_event to register the led class
> device that will hook on to the actual LED of the device
I did read all the LED specs/headers that I could find and from what I
have seen all you can currently do with this interface is control
brightness. There seems to be no way of controlling the Color
temperature, though.
So either this then would have to be exposed as a special device or
get handled entirely in userspace.
The latter seems to work against "implementing illumination handling
once in driver and reusing it".

> [0] https://pwr-solaar.github.io/Solaar
> [1] https://github.com/pwr-Solaar/Solaar/blob/master/docs/hidpp-documentation.txt
Thanks. Never would have found the specs on my own.
That said - I read x1990 spec and tried to access getIllumination from
userspace.
The spec seems a bit vague for my limited experience level.
For example I have not yet figured out what the communication (bytes)
difference between _getIllumination()_ and _illuminationChangedEvent_
is.
What seems to work is accessing events:

So I tried:
```c

#define LONG_REPORT_ID 0x11

    struct hiddev_usage_ref_multi multi;
    memset(&multi, 0, sizeof(multi));
    multi.uref.report_type = HID_REPORT_TYPE_INPUT;
    multi.uref.report_id = LONG_REPORT_ID;
    multi.uref.field_index = 0x0;
    multi.uref.usage_index = 0x03;
    multi.uref.usage_code = 0xff430002;
    multi.num_values = 1;

    if (ioctl(fd, HIDIOCGUSAGES, &multi) < 0)
    {
        perror("HIDIOCGUSAGES getIllumination");
        return -11;
    }

    printf("VALUE: %0x\n", multi.values[0]);

```
Which seems to report the illumination state until I press another
hardware button. So this seems to access the last event, which seems
to be _illuminationChangedEvent_ in my case.
No idea currently how to get _getIllumination_ to work.

Cheers
Andreas
