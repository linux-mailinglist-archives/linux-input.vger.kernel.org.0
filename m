Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D90B1735AE8
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 17:14:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjFSPOU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jun 2023 11:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjFSPOT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jun 2023 11:14:19 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCCCBD
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 08:14:17 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-570808d8ddeso34371427b3.0
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 08:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187656; x=1689779656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V1P80GLbB1P+QCLo9sePDKKOVfDoXpG6ABk1BvxOeoo=;
        b=OngT6cRRJHc0AQ2pPOWCU/RshBXzk/4uDe5CNNOsC9EdEPtg/X+0G8OUcN55f/XTUc
         QKQRE185oFvR0YDjhcXcumkWRl911lzzJUDsrohK680Nz6ZTfcv3oKZAlyQOHlkWzTDj
         JOprueuu1AR8l4GPEMRoqbiQAAG9gtpAd51LrwkUzPdZH1vbrvAU6pT+qy3v/0DV2f1+
         Rwt8yKFG4Er+blKbVjQOHosYB8Gu8XIxNS6VmjAdf6kfJjjVS9ASYMFr4Sk4W0ehpxNF
         1gzHi5kBkyqIBtx7YDrBIw1qcTlN290/E3pQgHxGIbcdJsvbBn69lFLatPfbFh/Pf5qy
         JubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187656; x=1689779656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1P80GLbB1P+QCLo9sePDKKOVfDoXpG6ABk1BvxOeoo=;
        b=TtfEKPRRXPyd8F9qK4TbLjjU+xr/lieduc+LEKs9kpz/h6Y1ASS2MLihdJwY/8X1Mg
         K/kuQlKPMSm/yXEXTcIAMZErnSuI24GGPwFDd2TfeWkG6dJFtDp7fMX6esMtIMkqPQ70
         UbH70qep4xiTosxiW5GPtA7yKCW0pmHP+u9KgptyDXUQ0wex1uanPmuHAXkr5AbRNUIX
         gT8nX0UyMRpkXMRv7vXhXIDhyG8vohu/P4BX+IbJXZRg9bwKP/keuzIyww0wNzLEvx17
         SC6Q8BxbCZyq+Ebhpcz1vrCaWW5VbKvTlhsf7Yv8dST3p697SaUyGFWy4IdGt8+RLsFL
         uURw==
X-Gm-Message-State: AC+VfDxeaQr6ak+kaCqj2D67zm5JKiP/6hiYXOGva5KhdRdYQ2ud9Udi
        NHsIaSxmUGeYzVD29b/4lL1LX65T+ZabJhwJSsCXGyze5p52YA==
X-Google-Smtp-Source: ACHHUZ4DKh6yX4ASYKccIQRRx/fV31dTUfKzqZroN/Foytud5WTXHD18mC4Od6bkI1mNjar9SXHsW9k2rEUP37PAa/8=
X-Received: by 2002:a25:e786:0:b0:b9e:b9b4:bb12 with SMTP id
 e128-20020a25e786000000b00b9eb9b4bb12mr6887466ybh.48.1687187655947; Mon, 19
 Jun 2023 08:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
 <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com>
In-Reply-To: <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com>
From:   Xiaofan Chen <xiaofanc@gmail.com>
Date:   Mon, 19 Jun 2023 23:14:04 +0800
Message-ID: <CAGjSPUCBPSXTHji-aSs64QHNYjBms9-WhohBYuc9Tiom5KaSow@mail.gmail.com>
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

On Mon, Jun 19, 2023 at 2:09=E2=80=AFPM Xiaofan Chen <xiaofanc@gmail.com> w=
rote:
>
> I know that thurrent documentation has been there since it was created by
> Alan Ott many years ago. And he started the HIDAPI project around that
> time as well. However, I am starting to doubt whether it is correct or no=
t
> based on the testing using HIDAPI.
>
> Please help to clarify. Thanks.
>
> https://docs.kernel.org/hid/hidraw.html
> +++++++++++++++++++++++++++++++++++++++++++++++++++++
> HIDIOCGFEATURE(len):
>
> Get a Feature Report
>
> This ioctl will request a feature report from the device using the
> control endpoint. The first byte of the supplied buffer should be
> set to the report number of the requested report. For devices
> which do not use numbered reports, set the first byte to 0. The
> returned report buffer will contain the report number in the first
> byte, followed by the report data read from the device. For devices
> which do not use numbered reports, the report data will begin at the
> first byte of the returned buffer.
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>
> I have doubts about the last sentence. It seems to me that for
> devices which do not use numbered reports, the first byte will
> be 0 and the report data begins in the second byte.
>
> This is based on testing results using hidapi and hidapitester, which
> use the ioctl.
> int HID_API_EXPORT hid_get_feature_report(hid_device *dev, unsigned
> char *data, size_t length)
> {
>     int res;
>
>     register_device_error(dev, NULL);
>
>     res =3D ioctl(dev->device_handle, HIDIOCGFEATURE(length), data);
>     if (res < 0)
>          register_device_error_format(dev, "ioctl (GFEATURE): %s",
> strerror(errno));
>
>     return res;
> }
>
> Reference discussion:
> https://github.com/libusb/hidapi/issues/589
>
> Test device is Jan Axelson's generic HID example which I have tested usin=
g
> libusb and hidapi across platforms as well as using Windows HID API.
> So I believe the FW is good.
> http://janaxelson.com/hidpage.htm#MyExampleCode (USB PIC MCU)
>

Modified testing code from the following Linux kernel
samples/hidraw/hid-example.c
https://github.com/libusb/hidapi/issues/589#issuecomment-1597356054

Results are shown here. We can clearly see that the "Fake Report ID" 0 is
in the first byte of the returned buffer, matching the output from
hidapi/hidapitester,

mcuee@UbuntuSwift3:~/build/hid/hidraw$ gcc -o myhid-example myhid-example.c

mcuee@UbuntuSwift3:~/build/hid/hidraw$ sudo ./myhid-example
Report Descriptor Size: 47
Report Descriptor:
6 a0 ff 9 1 a1 1 9 3 15 0 26 ff 0 75 8 95 3f 81 2 9 4 15 0 26 ff 0 75
8 95 3f 91 2 9 5 15 0 26 ff 0 75 8 95 3f b1 2 c0

Raw Name: Microchip Technology Inc. Generic HID
Raw Phys: usb-0000:00:14.0-1/input0
Raw Info:
bustype: 3 (USB)
vendor: 0x0925
product: 0x7001
ioctl HIDIOCSFEATURE returned: 64
ioctl HIDIOCGFEATURE returned: 64
Report data:
0 41 42 43 44 45 46 47 48 14 4 18 4 4d 72 31 50 51 52 53 54 55 56 57
58 59 5a 5b 5c 5d 5e 5f 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e
6f 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f

write() wrote 64 bytes
read() read 63 bytes:
21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37
38 39 3a 3b 3c 3d 3e 3f 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e
4f 50 51 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e 5f


--=20
Xiaofan
