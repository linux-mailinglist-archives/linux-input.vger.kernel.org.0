Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512DB739C70
	for <lists+linux-input@lfdr.de>; Thu, 22 Jun 2023 11:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232260AbjFVJRW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jun 2023 05:17:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFVJQ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jun 2023 05:16:56 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180762D57
        for <linux-input@vger.kernel.org>; Thu, 22 Jun 2023 02:09:00 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-bc476bf5239so6777425276.2
        for <linux-input@vger.kernel.org>; Thu, 22 Jun 2023 02:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687424938; x=1690016938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rS4vrBt74sGHErSh5k3beKHxuHfkjfXtkU/3q7uLokE=;
        b=jweiG3iIp9OKSJNHywOaDLrILv9ii6uMq/ShC5C7eI0arl20mLkMXGbDn50/kvUFBa
         tSmCJjvpcpiW1MeiK4JjB6ZQhm31MMci5t/ctuX5XOelUadAa7+F1tJnlK53M9nqLkCK
         N1KhUYuo5reMmSWvNjq5yugrLBh9blV3WRpRTSxf4Sz6LYhLt3abqgGu+MEwtsytxhEZ
         oRL/PtXYPwBHsdAhCXhhXmfhM9pRxyPBEMyEmey/L7OZUdkw1Dw+QDfXMS6bujQ+H3ms
         fjPJeklmfiQ3Pff8Xrt3aiMvePCGjNEw23r7bttc33wlj7Tbe7HovOElHZqReCc9WDJp
         VRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687424938; x=1690016938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rS4vrBt74sGHErSh5k3beKHxuHfkjfXtkU/3q7uLokE=;
        b=XnLCAxcdjhowKftN8fHP5T/yDRbdByaoSgFHxVOK25aWkLmlZkI0Oy27pj6E1WrWPC
         B8Bq86d/C3cwg6gZpdkLm8QelkH8HD0TW9cD+UnDzSgZHgO0LYVvdyCA1xqbpASi/he1
         FlVsC4dP3tNMZhv9sdIYGc69Y9oNWpQjJ8S9SocXCINj1nkT3c5ui2Q/c6OGccUtLdLA
         XdTLz3sva3858N1vKztU57FGKsMiwLbDGZ2r12z4YOlfIL6ApCo5bQCl5QK58QImiSXV
         GaBUT2PveUc+Y33KipU1hXFRIJRsrxtlrw5IRgYkz9oCOEqhyuuUdhNUUbTRqxQULU1C
         L/yA==
X-Gm-Message-State: AC+VfDzsA8/t1hPC9DEOm425YPODEWz8vFna4OBQ8S+SVJvAHwsISXiM
        8E2NLNXpXM0lancdooeFZMPv7M3CH7dA67WuwGU=
X-Google-Smtp-Source: ACHHUZ6WPh8GIKHUAzdcyo8ild28tVRrNvS6dJYcwgLnWgTi0K/6CMqYjL1n0G4fHiOSfroHj3f6c1Q8+murRj+TUDw=
X-Received: by 2002:a5b:88e:0:b0:bab:b3e3:d4e1 with SMTP id
 e14-20020a5b088e000000b00babb3e3d4e1mr14809627ybq.12.1687424938607; Thu, 22
 Jun 2023 02:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
 <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com>
 <CAGjSPUCBPSXTHji-aSs64QHNYjBms9-WhohBYuc9Tiom5KaSow@mail.gmail.com>
 <CAGjSPUAnGndHOzEkux2DcjOKZ14BKv+Cccn0Hk3=VhMzoTbC5A@mail.gmail.com>
 <CAGjSPUC4q_tGmC8EZ4CMTVGa7e9AV9jkWOgwexJAtE-=rFDHHA@mail.gmail.com> <1f24c83c-fe36-d2ab-c755-e83fc6a265eb@redhat.com>
In-Reply-To: <1f24c83c-fe36-d2ab-c755-e83fc6a265eb@redhat.com>
From:   Xiaofan Chen <xiaofanc@gmail.com>
Date:   Thu, 22 Jun 2023 17:08:47 +0800
Message-ID: <CAGjSPUCE_zs4L7+5skEhgwjZ-u_yr-J34SoFKCEEkrwzQ5rfEg@mail.gmail.com>
Subject: Re: Clarification about the hidraw documentation on HIDIOCGFEATURE
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Ihor Dutchak <ihor.youw@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 21, 2023 at 11:05=E2=80=AFPM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Jun 21, 2023 at 1:27=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail.com>=
 wrote:
> >
> > On Tue, Jun 20, 2023 at 7:28=E2=80=AFAM Xiaofan Chen <xiaofanc@gmail.co=
m> wrote:
> > >
> > > On Mon, Jun 19, 2023 at 11:14=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail=
.com> wrote:
> > > >
> > > > On Mon, Jun 19, 2023 at 2:09=E2=80=AFPM Xiaofan Chen <xiaofanc@gmai=
l.com> wrote:
> > > > >
> > > > > I know that thurrent documentation has been there since it was cr=
eated by
> > > > > Alan Ott many years ago. And he started the HIDAPI project around=
 that
> > > > > time as well. However, I am starting to doubt whether it is corre=
ct or not
> > > > > based on the testing using HIDAPI.
> > > > >
> > > > > Please help to clarify. Thanks.
> > > > >
> > > > > https://docs.kernel.org/hid/hidraw.html
> > > > > +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > HIDIOCGFEATURE(len):
> > > > >
> > > > > Get a Feature Report
> > > > >
> > > > > This ioctl will request a feature report from the device using th=
e
> > > > > control endpoint. The first byte of the supplied buffer should be
> > > > > set to the report number of the requested report. For devices
> > > > > which do not use numbered reports, set the first byte to 0. The
> > > > > returned report buffer will contain the report number in the firs=
t
> > > > > byte, followed by the report data read from the device. For devic=
es
> > > > > which do not use numbered reports, the report data will begin at =
the
> > > > > first byte of the returned buffer.
>
>
> Yep, this is wrong.
>
> This should be read:
> ```
> The returned report buffer will contain the report number in the first
> byte or 0 when the device doesn't use numbered reports. The data read
> from the device will be stored in the following bytes.
> ```
>
> FWIW, the difficulty to find out what the code does is because this part
> is handled in each HID transport driver: USB, Bluetooth, I2C.
>
> Looking at drivers/hid/usbhid/hid-core.c, lines 869+, the function
> usbhid_get_raw_report() is the one used by hidraw in the end and is
> still the original code from Alan:
>
> ```
> /* Byte 0 is the report number. Report data starts at byte 1.*/
> buf[0] =3D report_number;
> if (report_number =3D=3D 0x0) {
>         /* Offset the return buffer by 1, so that the report ID
>            will remain in byte 0. */
>         buf++;
>         count--;
>         skipped_report_id =3D 1;
> }
> ```
>
> > Hi Jiri and Benjamin,
> >
> > Sorry to ping the two maintainers, hopefully you two can give the
> > answer. Thanks.
>
> See above, I also think the documentation is wrong.
>

Thanks a lot for the confirmation.

On the same note, I think it is the same for HIDIOCGINPUT as well, but ther=
e
is no need to update the documentation once the documentation is fixed
for HIDIOCGFEATURE.

++++++++++++++
HIDIOCGINPUT(len):

Get an Input Report

This ioctl will request an input report from the device using the
control endpoint. This
is slower on most devices where a dedicated In endpoint exists for
regular input reports,
but allows the host to request the value of a specific report number.
Typically, this is
used to request the initial states of an input report of a device,
before an application
listens for normal reports via the regular device read() interface.
The format of the
buffer issued with this report is identical to that of HIDIOCGFEATURE.
++++++++++++++


--=20
Xiaofan
