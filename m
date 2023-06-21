Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E616738888
	for <lists+linux-input@lfdr.de>; Wed, 21 Jun 2023 17:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231624AbjFUPNE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jun 2023 11:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjFUPMt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jun 2023 11:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF304228
        for <linux-input@vger.kernel.org>; Wed, 21 Jun 2023 08:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687360028;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d8soFY3a5EG8JUj3Y6jWQO2I1Qg96GmxARIZQ5J8Lpk=;
        b=BKkJpLKD3+tQtfgf6d31jMiEWorqh0PpMRxJyGQ9w1Ij1eFdXLlCgFxs/2qZ1H0PCPZ1Om
        peHJ8fqTSnsCfYHkOecjZEvo2F+wDAylwcZwQZIBeNyonuhkVYPvcDJU9VpSJzQB4upghl
        uY5ErHPq1W235glK5DTZYO9mzcMzBu8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-yR3mk2PvP_WtGFw82fssYg-1; Wed, 21 Jun 2023 11:05:50 -0400
X-MC-Unique: yR3mk2PvP_WtGFw82fssYg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f7e4dc0fe5so32390905e9.3
        for <linux-input@vger.kernel.org>; Wed, 21 Jun 2023 08:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687359944; x=1689951944;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d8soFY3a5EG8JUj3Y6jWQO2I1Qg96GmxARIZQ5J8Lpk=;
        b=MUBNJ1QRkF/Cl0fXrfGzbnQSUb5x7GEFr1OeF9GKUOPUA8voARY7eas/Oym4mUUunB
         3ZPmPXlIHXQJCc4CKEQyaQZDbpZJ5d2NjJz5UslW9nTcKJcfQfo1cYN5Y5iXaeVir8lK
         VDz3+6LxdS0auoF/raXFLsJNCMmdofgxUNBX60cywG7WL92WUoZfE0kmGCSB5hiQH88o
         aS6/R6ZNCQqhgGduCHwEzPhyaWzQnD/Pe0Ca5MyBwtPl/mOVC1yVSHA6qAopPgey1EFZ
         rNQA+a0XbubjY4drJOXpwn0p8iqb1hLaanEabOIOYgYEsJxgsBtsBQ5DgrKWQ6FOiKyS
         VU0w==
X-Gm-Message-State: AC+VfDwlcNqB9wHJcNvAYJfxWXGMEFZjf5jx9ZbiVCB7Eth+dNvwWCMy
        eOD89wBosG3A8xcjxklfys79L4W5Qt/dhPDAJnbwanQ7UH3ZLC6hRHlT0Qnwm+CGjHhjVJ3ykT4
        xZNOqYWq+KXh61gMcn72Sj68=
X-Received: by 2002:a1c:ed08:0:b0:3f7:f584:5796 with SMTP id l8-20020a1ced08000000b003f7f5845796mr15367493wmh.2.1687359944405;
        Wed, 21 Jun 2023 08:05:44 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48NHMD+mPg2mxgNNIUrw+0fveB+NS7DaoH71KLQmdtMOladVxJWk2Wbf+VVVuUDLjXP5isYg==
X-Received: by 2002:a1c:ed08:0:b0:3f7:f584:5796 with SMTP id l8-20020a1ced08000000b003f7f5845796mr15367478wmh.2.1687359944017;
        Wed, 21 Jun 2023 08:05:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:2bc:381::432? ([2a01:e0a:2bc:381::432])
        by smtp.gmail.com with ESMTPSA id s10-20020a1cf20a000000b003f9b0cfbe30sm5217488wmc.36.2023.06.21.08.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 08:05:43 -0700 (PDT)
Message-ID: <1f24c83c-fe36-d2ab-c755-e83fc6a265eb@redhat.com>
Date:   Wed, 21 Jun 2023 17:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: Clarification about the hidraw documentation on HIDIOCGFEATURE
To:     Xiaofan Chen <xiaofanc@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>, Ihor Dutchak <ihor.youw@gmail.com>,
        linux-input@vger.kernel.org
References: <CAGjSPUA1A0RVrf1OmgUKL3prOBuNFvhPJXJ4n7YbKrPLZb5h9A@mail.gmail.com>
 <CAGjSPUAosFY7svBoqAU3xsDD-ij2Qa3nZ2nf+jF4i2yC7sWpWw@mail.gmail.com>
 <CAGjSPUCBPSXTHji-aSs64QHNYjBms9-WhohBYuc9Tiom5KaSow@mail.gmail.com>
 <CAGjSPUAnGndHOzEkux2DcjOKZ14BKv+Cccn0Hk3=VhMzoTbC5A@mail.gmail.com>
 <CAGjSPUC4q_tGmC8EZ4CMTVGa7e9AV9jkWOgwexJAtE-=rFDHHA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAGjSPUC4q_tGmC8EZ4CMTVGa7e9AV9jkWOgwexJAtE-=rFDHHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Wed, Jun 21, 2023 at 1:27 PM Xiaofan Chen <xiaofanc@gmail.com> wrote:
>
> On Tue, Jun 20, 2023 at 7:28 AM Xiaofan Chen <xiaofanc@gmail.com> wrote:
> >
> > On Mon, Jun 19, 2023 at 11:14 PM Xiaofan Chen <xiaofanc@gmail.com> wrote:
> > >
> > > On Mon, Jun 19, 2023 at 2:09 PM Xiaofan Chen <xiaofanc@gmail.com> wrote:
> > > >
> > > > I know that thurrent documentation has been there since it was created by
> > > > Alan Ott many years ago. And he started the HIDAPI project around that
> > > > time as well. However, I am starting to doubt whether it is correct or not
> > > > based on the testing using HIDAPI.
> > > >
> > > > Please help to clarify. Thanks.
> > > >
> > > > https://docs.kernel.org/hid/hidraw.html
> > > > +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > HIDIOCGFEATURE(len):
> > > >
> > > > Get a Feature Report
> > > >
> > > > This ioctl will request a feature report from the device using the
> > > > control endpoint. The first byte of the supplied buffer should be
> > > > set to the report number of the requested report. For devices
> > > > which do not use numbered reports, set the first byte to 0. The
> > > > returned report buffer will contain the report number in the first
> > > > byte, followed by the report data read from the device. For devices
> > > > which do not use numbered reports, the report data will begin at the
> > > > first byte of the returned buffer.


Yep, this is wrong.

This should be read:
```
The returned report buffer will contain the report number in the first 
byte or 0 when the device doesn't use numbered reports. The data read 
from the device will be stored in the following bytes.
```

FWIW, the difficulty to find out what the code does is because this part 
is handled in each HID transport driver: USB, Bluetooth, I2C.

Looking at drivers/hid/usbhid/hid-core.c, lines 869+, the function 
usbhid_get_raw_report() is the one used by hidraw in the end and is 
still the original code from Alan:

```
/* Byte 0 is the report number. Report data starts at byte 1.*/
buf[0] = report_number;
if (report_number == 0x0) {
	/* Offset the return buffer by 1, so that the report ID
	   will remain in byte 0. */
	buf++;
	count--;
	skipped_report_id = 1;
}
```
  >
> > > > ++++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > >
> > > > I have doubts about the last sentence. It seems to me that for
> > > > devices which do not use numbered reports, the first byte will
> > > > be 0 and the report data begins in the second byte.
> > > >
> > > > This is based on testing results using hidapi and hidapitester, which
> > > > use the ioctl.
> > > > int HID_API_EXPORT hid_get_feature_report(hid_device *dev, unsigned
> > > > char *data, size_t length)
> > > > {
> > > >     int res;
> > > >
> > > >     register_device_error(dev, NULL);
> > > >
> > > >     res = ioctl(dev->device_handle, HIDIOCGFEATURE(length), data);
> > > >     if (res < 0)
> > > >          register_device_error_format(dev, "ioctl (GFEATURE): %s",
> > > > strerror(errno));
> > > >
> > > >     return res;
> > > > }
> > > >
> > > > Reference discussion:
> > > > https://github.com/libusb/hidapi/issues/589
> > > >
> > > > Test device is Jan Axelson's generic HID example which I have tested using
> > > > libusb and hidapi across platforms as well as using Windows HID API.
> > > > So I believe the FW is good.
> > > > http://janaxelson.com/hidpage.htm#MyExampleCode (USB PIC MCU)
> > > >
> > >
> > > Modified testing code from the following Linux kernel
> > > samples/hidraw/hid-example.c
> > > https://github.com/libusb/hidapi/issues/589#issuecomment-1597356054
> > >
> > > Results are shown here. We can clearly see that the "Fake Report ID" 0 is
> > > in the first byte of the returned buffer, matching the output from
> > > hidapi/hidapitester,
> > >
> > > mcuee@UbuntuSwift3:~/build/hid/hidraw$ gcc -o myhid-example myhid-example.c
> > >
> > > mcuee@UbuntuSwift3:~/build/hid/hidraw$ sudo ./myhid-example
> > > Report Descriptor Size: 47
> > > Report Descriptor:
> > > 6 a0 ff 9 1 a1 1 9 3 15 0 26 ff 0 75 8 95 3f 81 2 9 4 15 0 26 ff 0 75
> > > 8 95 3f 91 2 9 5 15 0 26 ff 0 75 8 95 3f b1 2 c0
> > >
> > > Raw Name: Microchip Technology Inc. Generic HID
> > > Raw Phys: usb-0000:00:14.0-1/input0
> > > Raw Info:
> > > bustype: 3 (USB)
> > > vendor: 0x0925
> > > product: 0x7001
> > > ioctl HIDIOCSFEATURE returned: 64
> > > ioctl HIDIOCGFEATURE returned: 64
> > > Report data:
> > > 0 41 42 43 44 45 46 47 48 14 4 18 4 4d 72 31 50 51 52 53 54 55 56 57
> > > 58 59 5a 5b 5c 5d 5e 5f 60 61 62 63 64 65 66 67 68 69 6a 6b 6c 6d 6e
> > > 6f 70 71 72 73 74 75 76 77 78 79 7a 7b 7c 7d 7e 7f
> > >
> > > write() wrote 64 bytes
> > > read() read 63 bytes:
> > > 21 22 23 24 25 26 27 28 29 2a 2b 2c 2d 2e 2f 30 31 32 33 34 35 36 37
> > > 38 39 3a 3b 3c 3d 3e 3f 40 41 42 43 44 45 46 47 48 49 4a 4b 4c 4d 4e
> > > 4f 50 51 52 53 54 55 56 57 58 59 5a 5b 5c 5d 5e 5f
> > >
> >
> > Moreover the kernel codes here seem to prove that the documentation
> > is wrong for both HIDIOCGFEATURE and HIDIOCGINPUT.
> >
> > https://github.com/torvalds/linux/blob/master/include/uapi/linux/hidraw.h
> >
> > /* The first byte of SFEATURE and GFEATURE is the report number */
> > #define HIDIOCSFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x06, len)
> > #define HIDIOCGFEATURE(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x07, len)
> > #define HIDIOCGRAWUNIQ(len)     _IOC(_IOC_READ, 'H', 0x08, len)
> > /* The first byte of SINPUT and GINPUT is the report number */
> > #define HIDIOCSINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x09, len)
> > #define HIDIOCGINPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0A, len)
> > /* The first byte of SOUTPUT and GOUTPUT is the report number */
> > #define HIDIOCSOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0B, len)
> > #define HIDIOCGOUTPUT(len)    _IOC(_IOC_WRITE|_IOC_READ, 'H', 0x0C, len)
>
> Hi Jiri and Benjamin,
>
> Sorry to ping the two maintainers, hopefully you two can give the
> answer. Thanks.

See above, I also think the documentation is wrong.

Cheers,
Benjamin

>
>
> --
> Xiaofan
>

