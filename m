Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EAF8736020
	for <lists+linux-input@lfdr.de>; Tue, 20 Jun 2023 01:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjFSX3f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jun 2023 19:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjFSX3W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jun 2023 19:29:22 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80FC3AF
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 16:29:12 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-573491c4deeso17578107b3.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 16:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687217351; x=1689809351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IPtYmG9xJ9W8NGWfzuBCSZ79WDYyQl7MqTq/mrXGOK4=;
        b=d9NNbilL+OpHqKmhIdI9RUF4KZfhL3T76Xz2aNvzOt34jqx9waiaaTPyE96gO4XGda
         zz9CQf2IuFceR2X7J2I2YdhSuDBuKvVm7XtwrmDIhF7EIBf7tYvkxC+dcCmiMFjudGJb
         KW0HETQOpXlMs8dP77MzXDN3ewfjlXd2T+XmkrjrpnJiSPB6lmYb1XbijAaTA/AdKJ3C
         opQa1CMSnkMfjevWWB8RU6xW4CF/RtZXNXGUeZxTYTZq+lY8EEB3aSIyAa4EEkwYCog9
         Pr7IqkHDew3EiIRZjqTBn9tcOtRGWYPEb+fun4/ghKNEzXy1Pv7yiytzcK1PfK4RIbTk
         ACSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687217351; x=1689809351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPtYmG9xJ9W8NGWfzuBCSZ79WDYyQl7MqTq/mrXGOK4=;
        b=HxCpIUKuYZAGY6Es9fRm6qqisvGp6zH4IZ+wfrLjF57HtxLK56BO+y/wvQC9TkBXQy
         Z490zFdJN+tTahrV2B8mcqupVjGqQ506O5RTV+gaGXm8ZaVfX59V5ngDc5jvj8CcMIjP
         NbJzAehsmSTi22blrebQKJhMyF01DTGbe0FFuN4F2m+oxg1R1czA1QAmmFsfE2Q6dkVl
         uEa2SvjR4M+PerjKd6M5jjDEOErZWXlQfepSnHFR+y7OsWAHJMFR6UYQhZSGrftkRJe3
         uoS/6k1KvdVeyP8QxvXtllqukum3GPpEEdBC9wL12KTO6ha0X//BJHcaz2v0r2tbWYoa
         7yVg==
X-Gm-Message-State: AC+VfDwXhXM8mKytqgoUGlBQ07LPwEr/rNjTvc7SJfoY0gL6yYLgN05c
        ocojGsTRvfQ2WY17Av5sUF5ZlUrThLjwvHnRwYMYcofermfilw==
X-Google-Smtp-Source: ACHHUZ4UFX1kocZZAN6+EDkij4llc+YzomjURgxI3EWS92AuQN0oGLWNlEIJ2gdncark7B3qo5s/sOOh6eRBxppBPVo=
X-Received: by 2002:a0d:df54:0:b0:570:8b91:256 with SMTP id
 i81-20020a0ddf54000000b005708b910256mr8346070ywe.43.1687217351156; Mon, 19
 Jun 2023 16:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
 <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com> <CAGjSPUCBPSXTHji-aSs64QHNYjBms9-WhohBYuc9Tiom5KaSow@mail.gmail.com>
In-Reply-To: <CAGjSPUCBPSXTHji-aSs64QHNYjBms9-WhohBYuc9Tiom5KaSow@mail.gmail.com>
From:   Xiaofan Chen <xiaofanc@gmail.com>
Date:   Tue, 20 Jun 2023 07:28:59 +0800
Message-ID: <CAGjSPUAnGndHOzEkux2DcjOKZ14BKv+Cccn0Hk3=VhMzoTbC5A@mail.gmail.com>
Subject: Re: Clarification about the hidraw documentation on HIDIOCGFEATURE
To:     linux-input@vger.kernel.org
Cc:     Ihor Dutchak <ihor.youw@gmail.com>
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

On Mon, Jun 19, 2023 at 11:14=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail.com> =
wrote:
>
> On Mon, Jun 19, 2023 at 2:09=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail.com>=
 wrote:
> >
> > I know that thurrent documentation has been there since it was created =
by
> > Alan Ott many years ago. And he started the HIDAPI project around that
> > time as well. However, I am starting to doubt whether it is correct or =
not
> > based on the testing using HIDAPI.
> >
> > Please help to clarify. Thanks.
> >
> > https://docs.kernel.org/hid/hidraw.html
> > +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > HIDIOCGFEATURE(len):
> >
> > Get a Feature Report
> >
> > This ioctl will request a feature report from the device using the
> > control endpoint. The first byte of the supplied buffer should be
> > set to the report number of the requested report. For devices
> > which do not use numbered reports, set the first byte to 0. The
> > returned report buffer will contain the report number in the first
> > byte, followed by the report data read from the device. For devices
> > which do not use numbered reports, the report data will begin at the
> > first byte of the returned buffer.
> > ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >
> > I have doubts about the last sentence. It seems to me that for
> > devices which do not use numbered reports, the first byte will
> > be 0 and the report data begins in the second byte.
> >
> > This is based on testing results using hidapi and hidapitester, which
> > use the ioctl.
> > int HID_API_EXPORT hid_get_feature_report(hid_device *dev, unsigned
> > char *data, size_t length)
> > {
> >     int res;
> >
> >     register_device_error(dev, NULL);
> >
> >     res =3D ioctl(dev->device_handle, HIDIOCGFEATURE(length), data);
> >     if (res < 0)
> >          register_device_error_format(dev, "ioctl (GFEATURE): %s",
> > strerror(errno));
> >
> >     return res;
> > }
> >
> > Reference discussion:
> > https://github.com/libusb/hidapi/issues/589
> >
> > Test device is Jan Axelson's generic HID example which I have tested us=
ing
> > libusb and hidapi across platforms as well as using Windows HID API.
> > So I believe the FW is good.
> > http://janaxelson.com/hidpage.htm#MyExampleCode (USB PIC MCU)
> >
>
> Modified testing code from the following Linux kernel
> samples/hidraw/hid-example.c
> https://github.com/libusb/hidapi/issues/589#issuecomment-1597356054
>
> Results are shown here. We can clearly see that the "Fake Report ID" 0 is
> in the first byte of the returned buffer, matching the output from
> hidapi/hidapitester,
>
> mcuee@UbuntuSwift3:~/build/hid/hidraw$ gcc -o myhid-example myhid-example=
.c
>
> mcuee@UbuntuSwift3:~/build/hid/hidraw$ sudo ./myhid-example
> Report Descriptor Size: 47
> Report Descriptor:
> 6 a0 ff 9 1 a1 1 9 3 15 0 26 ff 0 75 8 95 3f 81 2 9 4 15 0 26 ff 0 75
> 8 95 3f 91 2 9 5 15 0 26 ff 0 75 8 95 3f b1 2 c0
>
> Raw Name: Microchip Technology Inc. Generic HID
> Raw Phys: usb-0000:00:14.0-1/input0
> Raw Info:
> bustype: 3 (USB)
> vendor: 0x0925
> product: 0x7001
> ioctl HIDIOCSFEATURE returned: 64
> ioctl HIDIOCGFEATURE returned: 64
> Report data:
> 0 41 42 43 44 45 46 47 48 14 4 18 4 4d 72 31 50 51 52 53 54 55 56 57
> 58 59 5a 5b 5c 5d 5e 5f 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e
> 6f 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f
>
> write() wrote 64 bytes
> read() read 63 bytes:
> 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37
> 38 39 3a 3b 3c 3d 3e 3f 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e
> 4f 50 51 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e 5f
>

Moreover the kernel codes here seem to prove that the documentation
is wrong for both HIDIOCGFEATURE and HIDIOCGINPUT.

https://github.com/torvalds/linux/blob/master/include/uapi/linux/hidraw.h

/* The first byte of SFEATURE and GFEATURE is the report number */
#define HIDIOCSFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x06, len)
#define HIDIOCGFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x07, len)
#define HIDIOCGRAWUNIQ(len)     _IOC(_IOC_READ, 'H', 0x08, len)
/* The first byte of SINPUT and GINPUT is the report number */
#define HIDIOCSINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x09, len)
#define HIDIOCGINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0A, len)
/* The first byte of SOUTPUT and GOUTPUT is the report number */
#define HIDIOCSOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0B, len)
#define HIDIOCGOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0C, len)

--=20
Xiaofan
