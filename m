Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 767CE7382E1
	for <lists+linux-input@lfdr.de>; Wed, 21 Jun 2023 14:13:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbjFUL1N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jun 2023 07:27:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjFUL1M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jun 2023 07:27:12 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59EEF135
        for <linux-input@vger.kernel.org>; Wed, 21 Jun 2023 04:27:11 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id a1e0cc1a2514c-791a0651fa3so734469241.0
        for <linux-input@vger.kernel.org>; Wed, 21 Jun 2023 04:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687346830; x=1689938830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBwNU828FokZ9RIA2wC25WDMNyS8ljSQPVWs2ql5sHc=;
        b=szJHZsfQ1W+nOOGnIb0VqmpW58ho8GSc4WdqppsZf2Ra217yOdbdZQpS9aHGB0KWWP
         4xWnQBTrbUJQwjEzFi1M6fD245fvYTeoIlwGLTQw2PbRRRaci7yROUR8s19rfHD1Ue4C
         8syZPDDx6KfYvuCovekKxYygdO9SAMrhbaikmQajvEqW6fHk/MRQ8lXhpqwCcL2mkPFm
         XPHf7OjFwFelGsePtrHDiUr/WQOot7TBNCstWvlygz9kNKmFpJwmx2UhU92GIdjG5+lV
         ssmgCzHB8AqPvP7pW5+5OpJfMKaB3d3kkEDRMaTttPRko/uG8BCwqQuHx3Jqqv5h0emm
         KU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687346830; x=1689938830;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBwNU828FokZ9RIA2wC25WDMNyS8ljSQPVWs2ql5sHc=;
        b=jXC2aIZdJ5M8daRn+FsHUwycuv0H/rr/Dj1Jyx5ONUBwhyXAUR2sSy8iCfigdb+eMQ
         do2iKpOG4pbchcZvCyCCyxYszEc9ThxzB94k6SfN8YXcmyAc6Z02EALfD69bx8VsHg9u
         ChkFlnC2qi0RQKvO9RtQX2cURiOWkgA3IKNfY4IoORI90QEUHhLsMAlhYDZW3yeQjreF
         wdM4wYa/eG90ppVkT0HAPnXLZS4/0u2D4m6iuYKobqqnJ4xmGtmLHyDbyVJ02pEgkIBe
         dxIecovYM6+pMFjgHzxNaO6EOf1x88JgM8LD4Jv9BEsN+ruxyZp0q3HFnzgr5WseUhTY
         ERaw==
X-Gm-Message-State: AC+VfDwaz6aPeyBCUcPeIQvpL0QKxnVSShcFw7K4chJmtC0kwAmz+kh5
        Ybc5vwPa+8MH6XG2y/u875EYQsOYR+URpnEGb8MHAy6cXkg=
X-Google-Smtp-Source: ACHHUZ6oq2joQG5qAdL+A/dD+q9S9+AqunOP3ZWx11W776gVjW3ZzGw1hlKX9g9JvifDcHnEAQgzZabsIbj0SBcFu3I=
X-Received: by 2002:a67:ec4c:0:b0:440:981b:3846 with SMTP id
 z12-20020a67ec4c000000b00440981b3846mr6169433vso.23.1687346830303; Wed, 21
 Jun 2023 04:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
 <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com>
 <CAGjSPUCBPSXTHji-aSs64QHNYjBms9-WhohBYuc9Tiom5KaSow@mail.gmail.com> <CAGjSPUAnGndHOzEkux2DcjOKZ14BKv+Cccn0Hk3=VhMzoTbC5A@mail.gmail.com>
In-Reply-To: <CAGjSPUAnGndHOzEkux2DcjOKZ14BKv+Cccn0Hk3=VhMzoTbC5A@mail.gmail.com>
From:   Xiaofan Chen <xiaofanc@gmail.com>
Date:   Wed, 21 Jun 2023 19:26:57 +0800
Message-ID: <CAGjSPUC4q_tGmC8EZ4CMTVGa7e9AV9jkWOgwexJAtE-=rFDHHA@mail.gmail.com>
Subject: Re: Clarification about the hidraw documentation on HIDIOCGFEATURE
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Ihor Dutchak <ihor.youw@gmail.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 20, 2023 at 7:28=E2=80=AFAM Xiaofan Chen <xiaofanc@gmail.com> w=
rote:
>
> On Mon, Jun 19, 2023 at 11:14=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail.com=
> wrote:
> >
> > On Mon, Jun 19, 2023 at 2:09=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail.co=
m> wrote:
> > >
> > > I know that thurrent documentation has been there since it was create=
d by
> > > Alan Ott many years ago. And he started the HIDAPI project around tha=
t
> > > time as well. However, I am starting to doubt whether it is correct o=
r not
> > > based on the testing using HIDAPI.
> > >
> > > Please help to clarify. Thanks.
> > >
> > > https://docs.kernel.org/hid/hidraw.html
> > > +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > HIDIOCGFEATURE(len):
> > >
> > > Get a Feature Report
> > >
> > > This ioctl will request a feature report from the device using the
> > > control endpoint. The first byte of the supplied buffer should be
> > > set to the report number of the requested report. For devices
> > > which do not use numbered reports, set the first byte to 0. The
> > > returned report buffer will contain the report number in the first
> > > byte, followed by the report data read from the device. For devices
> > > which do not use numbered reports, the report data will begin at the
> > > first byte of the returned buffer.
> > > ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >
> > > I have doubts about the last sentence. It seems to me that for
> > > devices which do not use numbered reports, the first byte will
> > > be 0 and the report data begins in the second byte.
> > >
> > > This is based on testing results using hidapi and hidapitester, which
> > > use the ioctl.
> > > int HID_API_EXPORT hid_get_feature_report(hid_device *dev, unsigned
> > > char *data, size_t length)
> > > {
> > >     int res;
> > >
> > >     register_device_error(dev, NULL);
> > >
> > >     res =3D ioctl(dev->device_handle, HIDIOCGFEATURE(length), data);
> > >     if (res < 0)
> > >          register_device_error_format(dev, "ioctl (GFEATURE): %s",
> > > strerror(errno));
> > >
> > >     return res;
> > > }
> > >
> > > Reference discussion:
> > > https://github.com/libusb/hidapi/issues/589
> > >
> > > Test device is Jan Axelson's generic HID example which I have tested =
using
> > > libusb and hidapi across platforms as well as using Windows HID API.
> > > So I believe the FW is good.
> > > http://janaxelson.com/hidpage.htm#MyExampleCode (USB PIC MCU)
> > >
> >
> > Modified testing code from the following Linux kernel
> > samples/hidraw/hid-example.c
> > https://github.com/libusb/hidapi/issues/589#issuecomment-1597356054
> >
> > Results are shown here. We can clearly see that the "Fake Report ID" 0 =
is
> > in the first byte of the returned buffer, matching the output from
> > hidapi/hidapitester,
> >
> > mcuee@UbuntuSwift3:~/build/hid/hidraw$ gcc -o myhid-example myhid-examp=
le.c
> >
> > mcuee@UbuntuSwift3:~/build/hid/hidraw$ sudo ./myhid-example
> > Report Descriptor Size: 47
> > Report Descriptor:
> > 6 a0 ff 9 1 a1 1 9 3 15 0 26 ff 0 75 8 95 3f 81 2 9 4 15 0 26 ff 0 75
> > 8 95 3f 91 2 9 5 15 0 26 ff 0 75 8 95 3f b1 2 c0
> >
> > Raw Name: Microchip Technology Inc. Generic HID
> > Raw Phys: usb-0000:00:14.0-1/input0
> > Raw Info:
> > bustype: 3 (USB)
> > vendor: 0x0925
> > product: 0x7001
> > ioctl HIDIOCSFEATURE returned: 64
> > ioctl HIDIOCGFEATURE returned: 64
> > Report data:
> > 0 41 42 43 44 45 46 47 48 14 4 18 4 4d 72 31 50 51 52 53 54 55 56 57
> > 58 59 5a 5b 5c 5d 5e 5f 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e
> > 6f 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f
> >
> > write() wrote 64 bytes
> > read() read 63 bytes:
> > 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37
> > 38 39 3a 3b 3c 3d 3e 3f 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e
> > 4f 50 51 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e 5f
> >
>
> Moreover the kernel codes here seem to prove that the documentation
> is wrong for both HIDIOCGFEATURE and HIDIOCGINPUT.
>
> https://github.com/torvalds/linux/blob/master/include/uapi/linux/hidraw.h
>
> /* The first byte of SFEATURE and GFEATURE is the report number */
> #define HIDIOCSFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x06, len)
> #define HIDIOCGFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x07, len)
> #define HIDIOCGRAWUNIQ(len)     _IOC(_IOC_READ, 'H', 0x08, len)
> /* The first byte of SINPUT and GINPUT is the report number */
> #define HIDIOCSINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x09, len)
> #define HIDIOCGINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0A, len)
> /* The first byte of SOUTPUT and GOUTPUT is the report number */
> #define HIDIOCSOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0B, len)
> #define HIDIOCGOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0C, len)

Hi Jiri and Benjamin,

Sorry to ping the two maintainers, hopefully you two can give the
answer. Thanks.


--=20
Xiaofan
