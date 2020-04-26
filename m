Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258121B93FD
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 22:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgDZUmp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 16:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726176AbgDZUmp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 16:42:45 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146BCC061A0F
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 13:42:45 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id p13so7514715qvt.12
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o02YoCE2j8/KJVup8fHrquyVbDiDuLF29MAS0u2fW7s=;
        b=BF1oWjTk3lls5uyjPwK1w0wHGzpNBfDTIHhjQhJukrOKU6xLQwWdYLhMMjmu2osWw5
         UCmXU/ADo+vtIY5/Nof1xkjyBBCBlzVe50XZdWuq5dAb5oBBrf5piCITPqoMRqOCXG5U
         UErOapWJr9yinoIMv+1fDyEc9j2aMGi1KhzU7RJq5wAMY8zLuhb4WL6mgZFRTdYDMo78
         RF36yXmsB+Yw91WMBMUEArOmDgqD01BmUcABWIgkv8OMrUTvQ2EwLDSdOec0BJ4yo5mI
         rNYzf6K5QoeUwDCGgJ244n6BqcZORRifMgJ5ZRMyCF1H77qGbvkii4BNLmelhRixWx36
         5Rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o02YoCE2j8/KJVup8fHrquyVbDiDuLF29MAS0u2fW7s=;
        b=h6ICZhplr/GpWI46qTzP6EpppbZm0U+YACsNQ4w0XCzcHkMhi58B5In0RaERy/3vPx
         XEA6D4ZkYtwwGheTRQPDnNwtjIWXg3b1pT/tQWpmuqxAW2BqaTbcCO/0DYiSVpBb/vjx
         CS7XwBzb8U1AMyJHKRqeRkcRAKTojUKvQo/hzaIMTwUbVX68H+vtmEZ8fcypruWJEzaL
         m6h8ZsIV1mLpHHFVPqUoxQsGNfUqleCKUSPyZVeNgYswpYgXzCnnjiQKSvdwQdahohN7
         wJAXiBuRAgi1d4ZIIe6uIDTFseO+SNJWu/AjrvbbyUUNPtUn3+TY7qg+8Ib61PP8mlxQ
         eIxQ==
X-Gm-Message-State: AGi0PuZIEGwr+N5xIkU5d1dlttMucLotXXbVkwOPn+5bcW1vn4Ecv48I
        rvt+eoJ0SAzNB0sq19lnxWqL0aKNxa1R0IyljDk=
X-Google-Smtp-Source: APiQypKCeEBtsu8yDeak8DoiqsFVyjHBapBiDjUQxBNE8a7sCVrIB8gsdLqSsfXO8AelD920l5Zv/DMHoCuycrZVPHs=
X-Received: by 2002:a0c:e88d:: with SMTP id b13mr19027734qvo.245.1587933764212;
 Sun, 26 Apr 2020 13:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200317032928.546172-1-djogorchock@gmail.com> <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
In-Reply-To: <64ed771ebdd6c47c11a94f4e0ae365c6106b93f6.camel@hadess.net>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Sun, 26 Apr 2020 13:42:32 -0700
Message-ID: <CAEc3jaACUvyrP=9=JZeUZEC16zDJ2NByJzaPHVO24024jwKJoA@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] HID: nintendo
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Billy Laws <blaws05@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Siarhei Vishniakou <svv@google.com>, s.jegen@gmail.com,
        Carl Mueller <carmueller@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 25, 2020 at 6:01 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> Hey Daniel,
>
> On Mon, 2020-03-16 at 22:29 -0500, Daniel J. Ogorchock wrote:
> > I removed the IMU patch for now, since I have some more work on it to
> > do
> > before it's ready. This version fixes a bug with joy-con S-trigger
> > configuration and switches the pro controller's Dpad input to a hat.
>
> I don't have a Nintendo Switch Pro controller, but I recently got an
> 8Bitdo "GBros" adapter along with a third-party GameCube adapter for
> less than 20=E2=82=AC, and tried out the "Switch" mode against your drive=
r.
>
> When plugging it in via USB:
> [  593.228423] input: Nintendo Co., Ltd. Pro Controller as /devices/pci00=
00:00/0000:00:14.0/usb3/3-1/3-1:1.0/0003:057E:2009.0007/input/input34
> [  593.229859] hid-generic 0003:057E:2009.0007: input,hidraw4: USB HID v1=
.11 Joystick [Nintendo Co., Ltd. Pro Controller] on usb-0000:00:14.0-1/inpu=
t0
> [  593.317011] nintendo 0003:057E:2009.0007: hidraw4: USB HID v81.11 Joys=
tick [Nintendo Co., Ltd. Pro Controller] on usb-0000:00:14.0-1/input0
> [  595.476014] nintendo 0003:057E:2009.0007: Failed to set baudrate; ret=
=3D-110
> [  595.485961] nintendo 0003:057E:2009.0007: probe - fail =3D -110
> [  595.486019] nintendo: probe of 0003:057E:2009.0007 failed with error -=
110
>
> After pairing it with Bluetooth:
> [ 3974.268521] nintendo 0005:057E:2009.0009: unknown main item tag 0x0
> [ 3974.271295] nintendo 0005:057E:2009.0009: hidraw4: BLUETOOTH HID v80.0=
1 Gamepad [Pro Controller] on 44:85:00:1e:ab:f8
> [ 3976.494269] nintendo 0005:057E:2009.0009: controller MAC =3D 98:B6:E9:=
42:A8:DD
> [ 3977.036391] nintendo 0005:057E:2009.0009: Failed to set home LED dflt;=
 ret=3D-110
> [ 3977.036402] nintendo 0005:057E:2009.0009: Failed to create leds; ret=
=3D-110
> [ 3977.049328] nintendo 0005:057E:2009.0009: probe - fail =3D -110
> [ 3977.564465] leds 0005:057E:2009.0009:home: Setting an LED's brightness=
 failed (-110)
> [ 3978.076440] leds 0005:057E:2009.0009:player4: Setting an LED's brightn=
ess failed (-110)
> [ 3978.589367] leds 0005:057E:2009.0009:player3: Setting an LED's brightn=
ess failed (-110)
> [ 3979.101347] leds 0005:057E:2009.0009:player2: Setting an LED's brightn=
ess failed (-110)
> [ 3979.612308] leds 0005:057E:2009.0009:player1: Setting an LED's brightn=
ess failed (-110)
> [ 3979.612977] nintendo: probe of 0005:057E:2009.0009 failed with error -=
110
>
> I'm guessing the LED and baudrate setting failures should probably be
> non-fatal. Let me know if there's anything else you'd like me to test.
>
> For Fedora users who want to try out this v11 version of the driver:
> https://koji.fedoraproject.org/koji/taskinfo?taskID=3D43730136
> (note that the build will be removed in a bit less than a week)
>
> Cheers

I really wonder how a device like this should be handled. It looks
like the device can also handle a bunch of other classic Nintendo
controllers.

Is there anyway of detection this adapter? It feels nasty to have to
hack in quirks for this device...

Thanks,
Roderick
