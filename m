Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 528F96012A2
	for <lists+linux-input@lfdr.de>; Mon, 17 Oct 2022 17:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiJQPUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Oct 2022 11:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbiJQPT5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Oct 2022 11:19:57 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC7F1FCC5
        for <linux-input@vger.kernel.org>; Mon, 17 Oct 2022 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1666019994;
        bh=oGC7i6J0lllAwNAFWqumKtkWzZVtLllpBSE7BelU+0Q=;
        h=X-UI-Sender-Class:From:Date:Subject:To;
        b=E4Dr/t1B5WpwH1JtNFRXsODFHy7EDa78+U8gKEzj7VpiE4Bj4Sdwe6pGypCNVoirT
         LrOqsHdnwphSimQQ29LwvrJj8Yx+Cfo6Fcf/vWBF8lCt2uu9EXgaSwtZmtZqo/whza
         JHAuXyMxYs13b83uaYjftClXbOUX6d2dUB0clyQ4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mail-ej1-f44.google.com ([209.85.218.44]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MlNpH-1pOzKO3qf7-00ljGv for <linux-input@vger.kernel.org>; Mon, 17 Oct 2022
 17:19:53 +0200
Received: by mail-ej1-f44.google.com with SMTP id a26so25716353ejc.4
        for <linux-input@vger.kernel.org>; Mon, 17 Oct 2022 08:19:53 -0700 (PDT)
X-Gm-Message-State: ACrzQf1GUtON16OfOf8q6n82vecdK/+Y0WiBHveNYHZz6DPsmYKTERHa
        Ok914YlQcJ7KQfT7i1YFPNaPsN4Va+Tfy1eHFOI=
X-Google-Smtp-Source: AMsMyM5ijTRN+AyyS11mmd6whANvPputS9g2dd5pfbz/4kpZOIEbiK8pZ0ZBOrzGBhvZSIWTFhL+SE5w941GI1RDx04=
X-Received: by 2002:a17:907:7244:b0:78d:cedc:7a9e with SMTP id
 ds4-20020a170907724400b0078dcedc7a9emr8908915ejc.600.1666019993544; Mon, 17
 Oct 2022 08:19:53 -0700 (PDT)
MIME-Version: 1.0
From:   Andreas Bergmeier <abergmeier@gmx.net>
Date:   Mon, 17 Oct 2022 17:19:42 +0200
X-Gmail-Original-Message-ID: <CABfF9mNN+P-dKNZd2HR=H1=ywYjC-3DwhgdpsE+WsH8HO4z4TQ@mail.gmail.com>
Message-ID: <CABfF9mNN+P-dKNZd2HR=H1=ywYjC-3DwhgdpsE+WsH8HO4z4TQ@mail.gmail.com>
Subject: Using Litra Glow in Linux
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CVadd7Zp1XkaVzBB/oFjUMuHZsCRwanmSPvNqAcYCETsdfBg1bR
 jV9g4vd0fQCZNgNwOHta97uMyJH+mMCRdokbcuBMk+V8Q6WooPOyJoRoE8G1rXZF1D128oZ
 scrrEwVKjP4MOwmg98oxydL+EljAR1JEeD62n3UcZJEInvsG9tWGdFQRGN9RtNIhCnvO/sv
 Rl3fjrdGmTzra8kZ3R05A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kjlqLQxogtU=:uZlGewSN6NeCqj938kr20o
 T1k3YkKTx/nQrZ4beBxvOsws9MRJG17j4cmBvJD9LNY0KLCyebTV+FIRT4IBkmUUt913u4kNu
 emFaar2gNlVKPSVfNxjfUPJSwqG2TEvnjOXDa7XYIhNFDXmdu8LH4pcY86qQL6NPBqpyI0Uuw
 whdWuzBDxxGpPeQ4CWx9eZQEvsjloY0i6EyELd5tbNPzv+RkJeu5zfQxxdv+MkR7VqmqpOe6N
 4F5BqzHoROS5CWkOu2cekFiOCaUrDvgD3MkjBL/jvn5qeakdssLUnY+n19qtjDjECzeQJ3TMK
 NRI6sUhTJG20Vt4IUwoq+Og798hwSytP19zggKaPZd7DwLbeH22I5eDH7XP96kw26s0idpX5x
 lwAE/jfrq/TPibBtKgsiFXs/9ol4Bw4VocsvSBQgnQmFPi4ujstgzul82cLA1/VkzC4PK66U+
 Q69FfdAN7SMXHkdFm+q+y1JKFd0LDTFrG1VCbJh8z7xU/INmOaIvBTGREVG2T5bUpq4hZc8uT
 BzXHUvE5lNHf7IgiilGrONmTXeB4FBqszgjdSyCQUop8j3FNhPyvfDg4xWpFEJA0iXGth9mF9
 c6+x1wyBvmBXn7UEWhLaUD041LZ3O6PViMC6FfihcXNwAEubWggwVaZw3Af1ltJlPMJRW+rz+
 oBqKZkDpSIrrwW6U2e51tpJ/hLlGP1PnRW73JixXDGxtZnyawNxW727kKD25lIGxUmg1ZvfD7
 FcvqSU4EBxYIqfmbzXbcfCqJ4Vf6mo20SKNzhAdbJx0xtGRgyEIuaQxUS7A3X12itG8U3Dc+I
 xkLSgamvO6PFqkYU5tptFWYrbandHppPC/+bQbW5DpTl6KG8pAbtJCkK90PMWslAUGVDuW3eP
 FqDrpDMMMsu1J9b0WRxnNziFxtOvHR6bQ1sArbKGiJ0b3POEmE+xqyN7jtS2QHDJ6evvguNYV
 Ewyg4cGkW6TPPQPr6fAhmQJdvtCzOVdQS1ermP8X1Bebx1d96W8TMTqSnHKqhG25mEj/1dctH
 T0xu39AEVCoNerGq79GB/oen/su/z6jqYxh6wGhLXyzey97Sbo+UrWg0JmSBwoUcbyRXuDUA+
 b/z9bSWD/516eFghQX76wrker7tSX/EGbZ8/P+GTnPCL+KjY/6C1pcVWw9DbFMUSn1bd1xSgJ
 QSxJyJbXZxvYqzp7+4/wq4bPPzasMRodViZdv1c+B0eKa4dvOWFsRSrYii6FaJzLuNUfVmWSV
 Y5aatmAItTEwu4C9fyPImgMbuiXwE2aTe/yeQKcWPUnxnYDpRgQXfdm/6xVnepjF9LiYJodqF
 4T4aMYvvMx3+6rRnpNkNl2SpjeANRejfXoQM8H6zgY6vJkW/JDb3FJTnx44+7XOhJDDI2sGOZ
 55jxHAjT/yVAjcWtpFpszZiIgAR5BAx4ZkhRKD4m3j48ium+IEh93NNpRbvYhxlOHOjawfBK7
 NoJTS8T4dsOua1ig4Z1H0g3+y0N14tB+dqPWVnOtbj02zV0BXEpBs9HWpo2URKIs6MTJprDWi
 nLOucj+IUzoK1WzBvfGowX4jKqLY89I4lcgkV86qwPib2L0JJ151HSHU3OFDn93Aado9Jipn1
 ufssNk8QgBnX3/rHUpBE6ndEDcFjO5aNmYAuVPbHs63eI9KXwcU2WJR5GeS3FQhmPaOm67qnf
 d27adNGhN74xGOrPNbr/CApyiI0
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On my Ubuntu machine i am running 5.15.0. Now when I plugin in my
Logitech Litra Glow, it gets detected and the following shows up in my
dmesg:

```
input: Logi Litra Glow Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb3/3-4/3-4.2/3-4.2:1.0/0003:046D:C900.00=
0B/input/input75
hid-generic 0003:046D:C900.000B: input,hiddev0,hidraw2: USB HID v1.11
Device [Logi Litra Glow] on usb-0000:00:14.0-4.2/input0
```

Via (hardware) buttons you can switch the device on, regulate the
color temperature as well as the brightness.
I know of no way to fully control the device from my computer and
would like to change that.

It seems to me like I need to solve 4 problems (in userspace and maybe
kernelspace):
1. Handle plugging in and off
2. Listen to events (button pressed) from the device
3. Get the current state of the device
4. Send events to the device


The device seems to provide a pretty bare HID Report interface with no
alternate configurations:
https://github.com/abergmeier/litra_glow_linux/blob/main/lsusb
The HID seems to define 3 Reports:
https://github.com/abergmeier/litra_glow_linux/blob/main/parsed_descriptor

Ignoring 1. for now.

Trying to solve 2. I wrote a basic HIDDEV application. Using `read` I
only see events from Report 17 (0x11). For all my experimenting with
the device I have never seen a Report 1 or 2.
So I get events, but it seems like the provided
`hiddev_usage_ref.value` is sometimes wrong (seems to be 0 and 1 for
most of the time even if I adjust the brightness).
Doing a recording (turning on, adjusting brightness, turning off) of
the raw HID events seems like the "correct" events are sent from the
device: https://github.com/abergmeier/litra_glow_linux/blob/main/hid-record=
er.
So it seems to me like maybe the values get mixed up somewhere in the HID c=
ode.
Alternatively I did a `evtest` run on the /dev/input/event* for the
`Logi Litra Glow Consumer Control`:
https://github.com/abergmeier/litra_glow_linux/blob/main/evtest
When pressing (hardware) buttons no events showed up in `evtest=C2=B4.
Probably not surprising since these would be from Report 1 and 2 IIUC.
Now I am not sure whether the USB interface is sketchy or whether one
needs to activate the _Consumer Control_ somehow.

Trying to solve 3. from what I understand with HID there usually is no
way of reading the current state of the device?

Trying to solve 4. there are userspace libraries in Python and Go
which send events to the device bypassing HID. So there may be some
quirks handling necessary in HID but I would defer that until 2. is
done.

With all that I am pretty much at my wits end and would appreciate any
input how to further analyze the device situation.

Cheers
