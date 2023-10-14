Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B547C967D
	for <lists+linux-input@lfdr.de>; Sat, 14 Oct 2023 23:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjJNVQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 14 Oct 2023 17:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbjJNVQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 14 Oct 2023 17:16:39 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532B1DF
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 14:16:37 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso37555165e9.3
        for <linux-input@vger.kernel.org>; Sat, 14 Oct 2023 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697318195; x=1697922995; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCsKqnw8oUiwRyMgJ0mCOLmuYIgEBE6IT/OJvjUZGrw=;
        b=Box8eQM26JsD5YaOFvYABnukVcDddvOqWqN5FmV2e8aCG07bByTniCBDkGd7KoEBMa
         cC39LaYqL9S5ofxtR4lJIzxTtKLoUjwyykHkyR2cgeDVFMO0JbR0/2pD7z+vaPD7jkMD
         DyqDlD3Y7HA3+vwtQnBmKzvs/kTUU+ADXS8tWXTSttuFEbgGnSrBBYtqS3Bgi8XUTqlO
         mf3XulvZvXVEVYR/Q8RwB7+LQZ1OGwKannV4Q2ZxRaKwoMZlP3MtDuRUUGUnIsHQ0TXn
         15p4/CZKsUnd93U0ZTYZrMW6hMZS6ZuYcxsOnZtVZ72TE1amGEB8JBH7ohC5Zal14mUf
         CvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697318195; x=1697922995;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCsKqnw8oUiwRyMgJ0mCOLmuYIgEBE6IT/OJvjUZGrw=;
        b=ppRZ2rpuF6lEmIk1smTx6geSbm91Rd4rEt/nEPfurX87FCR2YGA06OV8EDI95mCL3u
         OSMgfx2g3GOZHpLFW9mjBO2EG/V1NOGVPDuBXdXNBwwx3jD2lLqbAhWizbtdq13Pxkyn
         E8ZlkR0ubJElXnLp+CSokRKm8lHTkDPEaZEzLDNpM400Vao8tossVt2+f9jwczCuiCMt
         omFYkr0akvkLsC1divGSF5JmkZGoGmzidlEv/l//bWvBtnWOdmG2zMr2YnXIKDDIRL2d
         2sxQzPV52ZcbptyTtWMJtrnvMWjqulWlohcZGO2kE1nEIAYeaoq5HWTt2iLvfCD/irUk
         oXHw==
X-Gm-Message-State: AOJu0YwBkLgVgp0QtBE/1J9KzVRKcXQ8pfJDIPBFTq55f6KgWWfDwCJC
        9chixi4DwrkUt12Ql2aUNieK6pz8DeQ=
X-Google-Smtp-Source: AGHT+IHvATpS87/qV+c/P649Efae06eI0EcrsiFfQUj77p0k21S0C+5bl3MUNxJUcjOpgBitJBif1Q==
X-Received: by 2002:a05:6000:1c02:b0:32d:4545:3832 with SMTP id ba2-20020a0560001c0200b0032d45453832mr14827577wrb.14.1697318195312;
        Sat, 14 Oct 2023 14:16:35 -0700 (PDT)
Received: from [192.168.44.109] ([109.78.70.68])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c028400b004064741f855sm2819275wmk.47.2023.10.14.14.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:16:34 -0700 (PDT)
Message-ID: <f37f08d92587b7ecdbc32cc071dbabe7738695a2.camel@gmail.com>
Subject: Re: Help getting ELAN066C touchpad working in Linux
From:   Jonathan Dieter <jdieter@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Date:   Sat, 14 Oct 2023 22:16:33 +0100
In-Reply-To: <fdfc2766-0885-7cbe-0e96-6358a08aa3c7@redhat.com>
References: <27131a7fae2794a63f4f285a20e41116ba4198f3.camel@gmail.com>
         <f5016787-c4c7-c8d9-f208-6e355d8b7db0@redhat.com>
         <4a1de7c3dfd7c2d2ced08c6d2b589555c1205dab.camel@gmail.com>
         <fdfc2766-0885-7cbe-0e96-6358a08aa3c7@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 2023-10-14 at 22:30 +0200, Hans de Goede wrote:
> On 10/14/23 22:22, Jonathan Dieter wrote:
> > # ls -l /sys/bus/i2c/devices
> > total 0
> > lrwxrwxrwx. 1 root root 0 Oct 14=C2=A0 2023 i2c-0 ->
> > ../../../devices/platform/AMDI0010:00/i2c-0
> > lrwxrwxrwx. 1 root root 0 Oct 14=C2=A0 2023 i2c-1 ->
> > ../../../devices/platform/AMDI0010:01/i2c-1
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-2 ->
> > ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/i2c-2
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-3 ->
> > ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/i2c-3
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-4 ->
> > ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/i2c-4
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-5 ->
> > ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/car
> > d1-eDP-1/i2c-5
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:11 i2c-6 ->
> > ../../../devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/car
> > d1-DP-1/i2c-6
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-7 ->
> > ../../../devices/pci0000:00/0000:00:14.0/i2c-7
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-8 ->
> > ../../../devices/pci0000:00/0000:00:14.0/i2c-8
> > lrwxrwxrwx. 1 root root 0 Oct 14 21:15 i2c-9 ->
> > ../../../devices/pci0000:00/0000:00:14.0/i2c-9
> > lrwxrwxrwx. 1 root root 0 Oct 14=C2=A0 2023 i2c-ELAN238E:00 ->
> > ../../../devices/platform/AMDI0010:00/i2c-0/i2c-ELAN238E:00
> >=20
> > # ls -l /sys/bus/acpi/devices/ELAN066C:00/
> > total 0
> > -r--r--r--. 1 root root 4096 Oct 14 21:16 hid
> > -r--r--r--. 1 root root 4096 Oct 14 21:16 modalias
> > -r--r--r--. 1 root root 4096 Oct 14 21:16 path
> > lrwxrwxrwx. 1 root root=C2=A0=C2=A0=C2=A0 0 Oct 14 21:16 physical_node =
->
> > ../../../../platform/AMDI0010:01/ELAN066C:00
>=20
> Ok this looks like a platform-device is being instantiated for the
> touchpad
> rather then an i2c_client.
>=20
> Can you do:
>=20
> ls -l /sys/bus/platform/devices | grep ELAN066C
>=20
> and let me know the output of that ?
>=20
> If that confirms that a platform device is being instantiated
> then the issue likely is that neither of the 2 if-s here:
>=20
...
>=20
> Returns true causing no i2c-client to get instantiated.
>=20
>=20
> If that is the case the first thing to do is try a DSDT overlay
> replacing the
> first if:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If ((^^^PCI0.LPC0.H_EC.ECRD (R=
efOf (^^^PCI0.LPC0.H_EC.TPTY))
> =3D=3D 0x01))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> With dropping the If so you get:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0...
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> See:
> https://docs.kernel.org/admin-guide/acpi/initrd_table_override.html
>=20
> And then specifically the "How does it work" section.

Hans,

Thank you so much!  Adding a DSDT overlay worked perfectly!  The
touchpad is functioning exactly as you would expect (using the
i2c_hid_acpi driver).

# ls -l /sys/bus/i2c/devices/
total 0
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-0 -> ../../../devices/platform/A=
MDI0010:00/i2c-0
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-1 -> ../../../devices/platform/A=
MDI0010:01/i2c-1
lrwxrwxrwx. 1 root root 0 Oct 14 22:02 i2c-2 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/i2c-2
lrwxrwxrwx. 1 root root 0 Oct 14 22:02 i2c-3 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/i2c-3
lrwxrwxrwx. 1 root root 0 Oct 14 22:02 i2c-4 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/i2c-4
lrwxrwxrwx. 1 root root 0 Oct 14 22:02 i2c-5 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/drm/card1/card1-eDP-1/i2c-5
lrwxrwxrwx. 1 root root 0 Oct 14 22:02 i2c-6 -> ../../../devices/pci0000:00=
/0000:00:08.1/0000:04:00.0/drm/card1/card1-DP-1/i2c-6
lrwxrwxrwx. 1 root root 0 Oct 14 22:03 i2c-7 -> ../../../devices/pci0000:00=
/0000:00:14.0/i2c-7
lrwxrwxrwx. 1 root root 0 Oct 14 22:03 i2c-8 -> ../../../devices/pci0000:00=
/0000:00:14.0/i2c-8
lrwxrwxrwx. 1 root root 0 Oct 14 22:03 i2c-9 -> ../../../devices/pci0000:00=
/0000:00:14.0/i2c-9
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-ELAN066C:00 -> ../../../devices/=
platform/AMDI0010:01/i2c-1/i2c-ELAN066C:00
lrwxrwxrwx. 1 root root 0 Oct 14  2023 i2c-ELAN238E:00 -> ../../../devices/=
platform/AMDI0010:00/i2c-0/i2c-ELAN238E:00

# ls -l /sys/bus/acpi/devices/ELAN066C:00/
total 0
-r--r--r--. 1 root root 4096 Oct 14 22:10 hid
-r--r--r--. 1 root root 4096 Oct 14 22:10 modalias
-r--r--r--. 1 root root 4096 Oct 14 22:10 path
lrwxrwxrwx. 1 root root    0 Oct 14 22:10 physical_node -> ../../../../plat=
form/AMDI0010:01/i2c-1/i2c-ELAN066C:00
drwxr-xr-x. 2 root root    0 Oct 14 22:10 power
-r--r--r--. 1 root root 4096 Oct 14 22:10 status
lrwxrwxrwx. 1 root root    0 Oct 14  2023 subsystem -> ../../../../../bus/a=
cpi
-rw-r--r--. 1 root root 4096 Oct 14  2023 uevent
drwxr-xr-x. 3 root root    0 Oct 14  2023 wakeup

Is there some way we can get a fix in the kernel for this buggy ACPI table =
or should I be asking Lenovo for a fix?

Thanks again,

Jonathan
