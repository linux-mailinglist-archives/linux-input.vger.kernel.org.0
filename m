Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0787076D3A2
	for <lists+linux-input@lfdr.de>; Wed,  2 Aug 2023 18:28:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbjHBQ2B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Aug 2023 12:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231439AbjHBQ2A (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Aug 2023 12:28:00 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70D32103
        for <linux-input@vger.kernel.org>; Wed,  2 Aug 2023 09:27:55 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b9c55e0fbeso104264491fa.2
        for <linux-input@vger.kernel.org>; Wed, 02 Aug 2023 09:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1690993673; x=1691598473;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr1TRSCGBMc/xSIn+L6Cksufenm3IMvW6TDeD0ousZ0=;
        b=Yvlx/Ay+AcGnYt6aAKtJHO65LPj+M/oqxabGFeafo5lqCkMoRKRgF86r5sDMJBwC6p
         Q5UEq1/UhqLcADIDNT6rwrLRc+5wOiuldaXS9eqsLasaz6n9+66oTTDlw3bGc1Z7lCv2
         SNvKyJ2dnMjAMk5DliU+uZUdN22CzXuOUfGZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690993673; x=1691598473;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kr1TRSCGBMc/xSIn+L6Cksufenm3IMvW6TDeD0ousZ0=;
        b=gpimRL/vZcKomPo1uw9FrvT0Y4POLJ//Suj343RDjg993v2Okl9vUzCpKcoEx0a32a
         YKW/F1sd9sr1Xy+rODFZW30gL4Jptlc5Ryq+3RV1Ayury9kkzrpZ/liCGvjyeFEArnMp
         sFkCm8k2ZynwJMvdJoffwbnaDNsUkYqRGS6V1Fr/s1rVhTKq00g5oLZi/wre21IpMYmd
         QIB+/pUhglZZSdhvSchdtRJ3Z4Nod3jVk0lEumwfFWcGGJibkRCn6tKZlo41aE+bg2nI
         bu6tCjXuzahclGNjXDOCh7rdZD+AnJ0b5JZbFH4e4wR6DrzryX8mRFjXbRuhVGrtHBI9
         xkng==
X-Gm-Message-State: ABy/qLa/p4W0K2wmO5zLjES3GRoCnVHpqWYZftDXi8ncZuIvs3Koh4A0
        pS9p1TwFVK/5rI74HF2MlNyOLfWdyCViGdbZIRjbELEXPbrFqEUZ6uY=
X-Google-Smtp-Source: APBJJlFyRX/4qt5oRrrqJydSnToav7xqcPd+FZCbCIOjdBk5xGyeun9EHrb8tS2h6IguSmqSrPvwh3/USe/K4Aewfkw=
X-Received: by 2002:a2e:9457:0:b0:2b9:e501:a6a6 with SMTP id
 o23-20020a2e9457000000b002b9e501a6a6mr5724020ljh.30.1690993673197; Wed, 02
 Aug 2023 09:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALNJtpVH0DAcnkJ+++H0ng2AWW1t1ZW0RCfbHn=fyRnRN9CJ8w@mail.gmail.com>
In-Reply-To: <CALNJtpVH0DAcnkJ+++H0ng2AWW1t1ZW0RCfbHn=fyRnRN9CJ8w@mail.gmail.com>
From:   Jonathan Denose <jdenose@chromium.org>
Date:   Wed, 2 Aug 2023 11:27:42 -0500
Message-ID: <CALNJtpVVukK-w8Edpi6OtFT8+JkziLZx0ie1jrzBBp2TYhT4XQ@mail.gmail.com>
Subject: Re: Lenovo N24: Touchpad lost sync at byte 6
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 17, 2023 at 2:59=E2=80=AFPM Jonathan Denose <jdenose@chromium.o=
rg> wrote:
>
> Hello,
>
> I am on a Lenovo N24 laptop.
>
> When this device resumes after closing the lid, the mouse freezes and
> is unusable. After right-clicking multiple times the touchpad resumes
> working. I am seeing the following in the logs:
>
> [ 1188.690138] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.699636] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.709124] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.718557] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.728110] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.975964] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.985456] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1188.994954] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1189.004443] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
> [ 1189.013930] psmouse serio1: Touchpad at isa0060/serio1/input0 lost
> sync at byte 6
>
> This device has an ETPS/2 Elantech Touchpad. I am on kernel version:
> 5.15.117-19629-gf1eb3139d206.
>
> Greg KH suggested that I try later kernel versions, and I've tried 6.4
> and 6.1 and the issue is present on both of those versions. This issue
> is also present on 5.10.
>
> Currently the device suspends to ram when the lid closes. When the
> device idles without the lid closing, the touchpad works fine on
> resume.
>
> I have tried adding various i8042 and psmouse kernel parameters from
> searching different forums related to these error messages, but none
> of them fix the issue. I have tried
> - psmouse.resetafter=3D0
> - psmouse.resetafter=3D1
> - i8042.nomux=3D1
> - i8042.resetafter=3D1/0
> - i8042.reset=3D1 i8042.nomux=3D1
> - i8042.noloop=3D1 i8042.nopnp=3D1 i8042.nomux=3D1 i8042.reset=3D1
>
> I was able to resolve this issue by doing `modprobe -r psmouse &&
> modprobe.psmouse proto=3Dimps`. proto=3Dbare and proto=3Dexps also resolv=
e
> the issue. However, with those options enabled I can no longer use
> gestures like two-finger scroll.
>
> This issue reproduces on ChromeOS Flex and Ubuntu 22.04 but not on
> Windows. On Windows the touchpad resuming after closing the lid works
> fine.
>
> What can I do to resolve this issue while also keeping touchpad gestures?
>
> Any help is greatly appreciated!

Hello,

As an update, this error is getting thrown from case 4 in elantech_process_=
byte:
```
static psmouse_ret_t elantech_process_byte(struct psmouse *psmouse)
{
...
case 4:
  packet_type =3D elantech_packet_check_v4(psmouse);
  switch (packet_type) {
  case PACKET_UNKNOWN:
    return PSMOUSE_BAD_DATA;
  case PACKET_TRACKPOINT:
    elantech_report_trackpoint(psmouse, packet_type);
    break;
  default:
    elantech_report_absolute_v4(psmouse, packet_type);
    break;
  }
    break;
  }
return PSMOUSE_FULL_PACKET;
}
```
The issue is fixed by running `rmmod psmouse && modprobe psmouse` but
I haven't found a good way to replicate that in code for the failure
case.
