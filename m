Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D7F25E025
	for <lists+linux-input@lfdr.de>; Fri,  4 Sep 2020 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgIDQr6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Sep 2020 12:47:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26233 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726063AbgIDQr6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Sep 2020 12:47:58 -0400
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-Wn3UREnhP3iwMn0GxuRIPA-1; Fri, 04 Sep 2020 12:47:55 -0400
X-MC-Unique: Wn3UREnhP3iwMn0GxuRIPA-1
Received: by mail-pl1-f199.google.com with SMTP id bd4so1276915plb.17
        for <linux-input@vger.kernel.org>; Fri, 04 Sep 2020 09:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PJ4hSEKWKSTrxjSP7x9HCXuDYemLPEO7rW3O3QQ6gNo=;
        b=TyMR1EYC/hFKo0Op4P+K3ByLoWpWuOko2qPIUiKgs1aSVDDR/fK5mYrEQ5Z8tqI/OO
         H+r6NEXX7TtC6oAXMcf3SGYgIRffu2/bCwq7lN0KeqNvre4wGR3spOQKF7Sf+GJ5aMzo
         2TwYFDVIdwBFnLYp1HSs3ipHbbok14vkMz6YklpeCG5cSaKi8qv3EQYnsNbtdUzfoNQF
         gwHANkb5ZlTVZQyzGRbmE2u+ui179V13fHYdsRMsm4awxkBhVAfMaDEcKM9npavWczTr
         vhpCqhYRggB7LEFhRYgSapAbcFyXlUIzfZqkd6Ya9psSnvESorJBR/gDHyq01CtKC++G
         fhQg==
X-Gm-Message-State: AOAM532SXnuYSqKvbOvUjNflzcwZtPp/lBXHIxRRCzMQaPbnVtPgb5/+
        Tl3IoJv1dAo3+0EbMktHlq+mauDVX5NGhJP8yvxAx/9jQQzy15sE/phUUTNnDAyXYECXVw/Vx06
        qIDCu+ydJlhNou4eoZ8MH3p3TNJSbXbQu720XOKI=
X-Received: by 2002:a63:42:: with SMTP id 63mr1715317pga.419.1599238073672;
        Fri, 04 Sep 2020 09:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZx7/tsrodaThOaKdQwDjWvk+9amCWwGSoO/9TeDKrT3cHH1VCT4WCkdP9A6+QouFvnfW+rldoDYFQSc3b8Hg=
X-Received: by 2002:a63:42:: with SMTP id 63mr1715295pga.419.1599238073319;
 Fri, 04 Sep 2020 09:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200811091445.erp2b23xmx3ceyzp@Rk> <CAO-hwJ+3LTUviWxDGQoXaBO-USwP4n6LRscJEzHJShqBEJ3oBg@mail.gmail.com>
 <20200904145916.nighviqyrvbm2ybx@Rk>
In-Reply-To: <20200904145916.nighviqyrvbm2ybx@Rk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 4 Sep 2020 18:47:42 +0200
Message-ID: <CAO-hwJJAOGNVnu1_dwXTMUyoSsNQifGFDUV6e9g96wHKmaZqSA@mail.gmail.com>
Subject: Re: Advice on fixing the bug of MSFT0001:00 04F3:Touchpad being
 handled by hid_multitouch by mistake
To:     Coiby Xu <coiby.xu@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 4, 2020 at 4:59 PM Coiby Xu <coiby.xu@gmail.com> wrote:
>
> On Fri, Sep 04, 2020 at 10:16:51AM +0200, Benjamin Tissoires wrote:
> >Hi,
> >
> >On Tue, Aug 11, 2020 at 11:15 AM Coiby Xu <coiby.xu@gmail.com> wrote:
> >>
> >> Hi,
> >>
> >> I'm working on a touchpad device issue as reported on
> >> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1887190.
> >>
> >> This touchpad device MSFT0001:00 04F3:Touchpad should be handled by
> >> hid_rmi. But currently hid-core.c chooses hid_multitouch by mistake,
> >>
> >>      1. When scanning this device's report descriptor, HID_DG_CONTACTID
> >>         usage is found. Thus group HID_GROUP_MULTITOUCH is assigned to
> >>         the device.
> >>      2. The flag HID_SCAN_FLAG_MT_WIN_8 is also found. Thus group
> >>         HID_GROUP_MULTITOUCH_WIN_8 is assigned to the device.
> >>      3. hid-multitouch.c claims handling devices with the group of
> >>         HID_GROUP_MULTITOUCH_WIN_8
> >>
> >>          static const struct hid_device_id mt_devices[] = {
> >>                 /* Generic MT device */
> >>                 { HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH, HID_ANY_ID, HID_ANY_ID) },
> >>
> >>                 /* Generic Win 8 certified MT device */
> >>                 {  .driver_data = MT_CLS_WIN_8,
> >>                         HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> >>                                 HID_ANY_ID, HID_ANY_ID) },
> >>                 { }
> >>          };
> >>
> >> There are several potential solutions,
> >>      - Let the device vendor fix this problem since this device's report
> >>        descriptor shouldn't have the HID_DG_CONTACTID usage.
> >>      - Make it a special case by setting the device's group to
> >>        HID_GROUP_RMI in hid_scan_report when vendor id and product ID
> >>        are matched.
> >>      - hid-quirks.c seems to be designed to handle special cases, is it
> >>        suitable for this case?
> >
> >AFAIU, the touchpad doesn't work at all with hid-multitouch. So I
> >guess the best is to add the VID/PID to hid-quirks.c in
> >hid_have_special_driver[], and add it to the hid-rmi driver too.
> >This way, you will ensure hid-rmi will pick up the device all the time.
> >
> >Cheers,
> >Benjamin
>
> Thank you for the advice! I have exactly adopted this approach by looking
> at commit e9287099ba6539bccb20cd791269186f3ae28b85
> ("HID: rmi: Add support for the touchpad in the Razer Blade 14 laptop")
> as an example.
>
> My previous email is a bit misleading because 0x04F3 is the vendor code
> of ELAN while hid-rmi is for the Synaptics touchpad. And actually this
> laptop model of Lenovo Legion-5 15ARH05 is shipped with both kinds of
> touchpads,
>
> - for the Synaptics touchpad, hid-rmi could almost handle it perfectly
>    except the clicking is not sensitive enough. I need to let my finger
>    linger on the touchpad for a while. I notice when I click on the touchpad,
>    an HID report would be received by hid-recorder. But evtest couldn't receive
>    any EV_ event. If hid-multitouch is handling the device, the cursor
>    won't move but 2-4 finger touching events could still be received by
>    evtest.
>
> - for the ELAN touchpad, only HID reporters can be read and parsed by
>    hid-core then two input devices (mouse and touchpad) could created by
>    hid-multitouch as seen from /proc/bus/input/devices. But hid-recorder
>    could never get any HID report.

huh. So in both cases you have a buggy touchpad with hid-multitouch :(

Do both touchpads share the same VID/PID? If so, this is going to be
interesting to decide how any of those touchpad should be handled.

>
> AFAIU, isn't hid-multitouch supposed to be the implementation of Windows
> Precision Touchpad?

yes, it works for most of those. The only ones that are not working
are usually because OEM or device makers tend to do "fun" things.

>  And since Precision touchpad is mandatory for
> Windows 10 notebooks and this laptop model of Lenovo Legion-5 15ARH05
> seem to have been certificated by Windows 10, does it mean by theory
> hid-multiouch could handle these two touchpad devices?

Well, it should, yes, but it clearly can not. You can try to give a
try at hid-recorder from
https://gitlab.freedesktop.org/libevdev/hid-tools. This will show what
is actually exported by the hardware before any processing by the
kernel. Maybe there is a new simple thing to do in hid-multitouch to
handle those devices.

Also, last time I heard, Synaptics dropped the use of hid-rmi in favor
of hid-multitouch. Any hid-rmi touchpad should be able to use
hid-multitouch, as this is the preferred way on Windows. But sometimes
the various teams decide to change the rules.

>
> Anyway, it seems I need to install Windows Driver Kit to capture&analyze
> HID reports to see what's happening. Or do you have any suggestion?

Unless it changed recently (I think I have seen something like that
recently), I had to write a I2C man-in-the-middle to dump the logs
from Windows. Project is at
https://github.com/bentiss/SimplePeripheralBusProbe and requires a
little bit of manual work to be able to start capturing data :(

Cheers,
Benjamin

>
> --
> Best regards,
> Coiby
>

