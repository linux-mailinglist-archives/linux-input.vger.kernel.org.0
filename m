Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E9D7C963A
	for <lists+linux-input@lfdr.de>; Sat, 14 Oct 2023 22:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229644AbjJNUW0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Oct 2023 16:22:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjJNUWZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Oct 2023 16:22:25 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF26B7
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 13:22:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3296b49c546so2671241f8f.3
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697314941; x=1697919741; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFUPXUFLWqavcHQwu8UrP/CIk7fBbAOQaU+XW/A7oGs=;
        b=bza9KQAj2yPZWh7zqRztCGcqvchsWSJ2mBDI8JXxtYeRFgsdPFoJVSooXN6lqFHTQh
         0ZWR9zc9xiQHWlKFxqsImn1Fwl+9+fJyRdOg90PgizzRc3drBKa9XRSsgP7MOeKOxpW1
         NowQjqWTwylFlQLQkNjjmbLYntUisYHhzV0WLwjTEd/2v8VPT8fDsA8JNhT45JfHIYMX
         Yrfx4zYZHTcB5BijwQs1L3dAEp4iONEHFzPJwIoOXldZ/UUnUkOMt1595czN0IMCjzgc
         vJwe9dHrrONSaBc/bmt1LexNZ94YZmdeSjYw9mi+SVUE2YyxaYH4uWeY2xJVIhR56+1L
         iZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697314941; x=1697919741;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFUPXUFLWqavcHQwu8UrP/CIk7fBbAOQaU+XW/A7oGs=;
        b=MQxqGmLWGtBH1I3dk6X9mP42rFYrYJdWmsbcq0u0baC77wS3Z6YnSLog4EMn07sqPR
         JnKgATnrhqQyQ4DVE7WQVruO+abJeL/vw3wJGd/0Q09Rhl5HRQmI91i+YSB0ytg73wkW
         bw5oFCkh1p8+Nxg8v4j7puv+kGiKYWV6NFep9kfw4od+zGoJAb497UYvbdNWvF5sBBbV
         MzC5W0fvrPro+cbfW1DsHceVhgirxMkuXS1h9f1iT1tvDVi+Wo4jt4zDutqtqXXbc6RO
         tBG5tNBqbb9N+wXxsp3ykihtlS5IgaO1gQcqXGrnmW41MIiYD/VVVBax+ictDt3a6aTS
         yDdg==
X-Gm-Message-State: AOJu0Yxnl0ruv60zkVwUBw0sg8vu5RrL6h5ndpd+fZr7oJadTj8WTpjY
        DfugxHqMG8Yt4LtXqU8ZGDQ=
X-Google-Smtp-Source: AGHT+IEWkbecMcp4ZqqDCpyI/mM2y+lwNCyQxx7NRz1cFq3F8rGLrYVUZ/MhiWDGKSao1QsmJ/lV0Q==
X-Received: by 2002:a5d:6489:0:b0:32d:a2a3:9533 with SMTP id o9-20020a5d6489000000b0032da2a39533mr3681782wri.59.1697314941258;
        Sat, 14 Oct 2023 13:22:21 -0700 (PDT)
Received: from [192.168.44.109] ([109.78.70.68])
        by smtp.gmail.com with ESMTPSA id d14-20020a5d644e000000b003231ca246b6sm7847727wrw.95.2023.10.14.13.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 13:22:20 -0700 (PDT)
Message-ID: <4a1de7c3dfd7c2d2ced08c6d2b589555c1205dab.camel@gmail.com>
Subject: Re: Help getting ELAN066C touchpad working in Linux
From:   Jonathan Dieter <jdieter@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Date:   Sat, 14 Oct 2023 21:22:20 +0100
In-Reply-To: <f5016787-c4c7-c8d9-f208-6e355d8b7db0@redhat.com>
References: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
         <f5016787-c4c7-c8d9-f208-6e355d8b7db0@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2023-10-14 at 21:39 +0200, Hans de Goede wrote:
> Hi Jonathan,
>=20
> For starters, did you see this in dmesg? :
>=20
> [=C2=A0=C2=A0=C2=A0 0.422648] i8042: PNP: PS/2 Controller [PNP0303:KBC0] =
at
> 0x60,0x64 irq 1
> [=C2=A0=C2=A0=C2=A0 0.422652] i8042: PNP: PS/2 appears to have AUX port d=
isabled, if
> this is incorrect please boot with i8042.nopnp
>=20
> And did you try booting with "i8042.nopnp" ?
>=20
> Also what is the output of:
>=20
> ls -l /sys/bus/i2c/devices
>=20
> and of:
>=20
> ls -l /sys/bus/acpi/devices/ELAN066C:00/
>=20
> and of:
>=20
> cat /sys/bus/acpi/devices/ELAN066C:00/status
>=20
> ?

Hey Hans,

Yeah, I did see that in my dmesg and did try i8042.nopnp by itself and
with combinations of pci=3Dnocrs and the other i8042 options, with no
effect except breaking audio.

# ls -l /sys/bus/i2c/devices
total 0
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-0 -> ../../../devices/platform/A=
MDI0010:00/i2c-0
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-1 -> ../../../devices/platform/A=
MDI0010:01/i2c-1
lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-2 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/i2c-2
lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-3 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/i2c-3
lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-4 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/i2c-4
lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-5 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/drm/card1/card1-eDP-1/i2c-5
lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-6 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/drm/card1/card1-DP-1/i2c-6
lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-7 -> ../../../devices/pci0000:00=
/0000:00:14.0/i2c-7
lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-8 -> ../../../devices/pci0000:00=
/0000:00:14.0/i2c-8
lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-9 -> ../../../devices/pci0000:00=
/0000:00:14.0/i2c-9
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-ELAN238E:00 -> ../../../devices/=
platform/AMDI0010:00/i2c-0/i2c-ELAN238E:00

# ls -l /sys/bus/acpi/devices/ELAN066C:00/
total 0
-r--r--r--. 1 root root 4096 Oct 14 21:16 hid
-r--r--r--. 1 root root 4096 Oct 14 21:16 modalias
-r--r--r--. 1 root root 4096 Oct 14 21:16 path
lrwxrwxrwx. 1 root root    0 Oct 14 21:16 physical_node -> ../../../../plat=
form/AMDI0010:01/ELAN066C:00
drwxr-xr-x. 2 root root    0 Oct 14 21:16 power
-r--r--r--. 1 root root 4096 Oct 14 21:16 status
lrwxrwxrwx. 1 root root    0 Oct 14  2023 subsystem -> ../../../../../bus/a=
cpi
-rw-r--r--. 1 root root 4096 Oct 14  2023 uevent

# cat /sys/bus/acpi/devices/ELAN066C:00/status
15

The above is exactly the same on a clean Fedora 6.5.6 kernel and my
custom build with the alias added to elan_i2c.

Thanks for the swift reply!

Jonathan
