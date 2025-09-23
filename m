Return-Path: <linux-input+bounces-15020-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38905B97AA9
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 23:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5F3F4A65EF
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 21:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB3C30DEC7;
	Tue, 23 Sep 2025 21:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUQqxsZL"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE38275B19
	for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 21:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758664600; cv=none; b=mN8NnF31D/44aCfxD4Cm+SyDe6mAr1jIm8HMmyH4ZGdfTjYzQQ8bMVTvt/WL+I7a8WHNQEfpzQh4tWBsWZR28zskN7PXDBlccYymlIgT8uw1Ewv5ZrB/X96DU315UTe2MYt4Su9I/C5WMHop6miycjiKbX4fFPMLS2svdj5JPdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758664600; c=relaxed/simple;
	bh=mXvFVuOjAEF3ZJcrTs/kyL/jzOQWNaY+j3LIfOTL/b8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r3PgvQMZx7dSr5sUN8F3Nivw5ZaVgGgCZJFu7QOGgnTblzWUd3bVQi3e9upHMl0jzgN8NWEYf7nFCihe2c19pZ2ufT/1QLBjSRFIqQylvawkYVdsdTqMtgiyj4Z5/HN3t3a14pB0CpCsGqfhRskphYDeVwVrUY0P2xn0vfLQl7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUQqxsZL; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8072bb631daso516920085a.1
        for <linux-input@vger.kernel.org>; Tue, 23 Sep 2025 14:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758664598; x=1759269398; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qsIqVul5TrzdGcdS0u0ousn4U4O74/bcb+sGPFZsNyk=;
        b=IUQqxsZLdnNVhWtymTksTK+1NCwEeNTUGv3aresyLmZJXXYDFOhh1dcV/Npy9POZbO
         TKQpkWGOHU02/iyEkN/9grqqhdQP7PcdqaKi+LsQdz/ql2+ACRtGKIAGkh3xYHe3VoYK
         1bdlQJbHaltQatT/Uz4z29MD3qNZAMp9cifSGGR02NccDS4rx6ld9Qr/YJQ7QcZEOLWn
         1/7NzH/9ZQwAUo3ZEzgiK880Gi1+WWygV0b2bu5mX1mec/+WQgm/kMA2LhdTfUbsJXM1
         8FNXUKvc6j+e0siEIQ8OP4kgCkg5/p2/S8P/1J1s5GSUm4gC2c9dQeFJnfppuP6ciXRB
         Mk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758664598; x=1759269398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qsIqVul5TrzdGcdS0u0ousn4U4O74/bcb+sGPFZsNyk=;
        b=ekekhherRmGi78MDSAB4pBe8DhBS4mbUjSI/n7EDtDtlmt6ckBXmDhFquhF+qJv+tw
         rH2kguqd1PlDzvjShAu/ZmTOSLKUg0F2H9s6qJjczPjgHkXlRr/juN7rRS1nRpqHySSm
         F5/z837S1Ude95YdvTABiAt3QtV/jEZGveDyyr67es9KxpleE4NDh888TPdfRKluYCfo
         GLy4NE7bMMQnHS77U/qgzj7Mpb5mELf/bMbz/rc7u+N9VOBPMd561/PX7Pv0CX6oKqfD
         mcLkB8hz4p7cG6IZ6QlVpzgO+nSptw3JcZN0Ty0OvtYLOr/kSsWPzzDh6q3MGmVzh9SR
         E6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCX8LbdMeZE0lqi9NhmJNXo7vuc0r/Htjw8lIMN2kRFOFLk3y6dxIUlM1GI1TMDkEE7GKcmOY+cyjZSKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8855fsmWItXWPklK/bk0sjs7nLTk2txF8rSkr0tMFYFqV82l+
	83Thx5itRenB42FlcD1Nt2T/dk94/W7PuPCqXqf2VM7/V2wmTHkpvQc2+02dUurwnpt6mTVHES5
	9zH9xzybmVwPvtTUDxXEeWqXJ8HfNENg=
X-Gm-Gg: ASbGnctYaBudN2mZZPrUGUXg21Yj+KZx3XOTFq+ue+yNP4VV19PKzxUtnuXu6vOm23T
	e5kGT1aQQLq9433zKQfSt5gD8f7Is4idNXe/JCCm6zXgjsUNe1i0ByBsBZA/aWxPWFlUP/36HSs
	3hqQc+9+qkPjQRQG6iuaiEqHmikN/MCavZQB9QcfiuZoZD6SirgdKrWat01ioF192QZ4gQJKtBw
	2Bsw7N0IFrgjMzoELXnPqq889c0fRjKqOFZSc3O1g==
X-Google-Smtp-Source: AGHT+IGZ2aYJhSmeR/Vq+qPj4UpUurfr8enMonGVPEnAiKZzoukE5Bl9aljg9I+ku/XMaK23RRJwT131b6anaju92hI=
X-Received: by 2002:a05:620a:1723:b0:84a:f8a2:a4e6 with SMTP id
 af79cd13be357-85173700fe4mr518628285a.44.1758664597680; Tue, 23 Sep 2025
 14:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
 <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
 <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>
 <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
 <CAEU-x4mJiBM_zKg1DaeJkKB3W3Ay08bUTc-D3QjFjDxNiZGd0g@mail.gmail.com> <iav7hzeaarxifwxk7zlfnt6vipqkp4h4ldt634exlvcswz62gj@a7ongaeduylz>
In-Reply-To: <iav7hzeaarxifwxk7zlfnt6vipqkp4h4ldt634exlvcswz62gj@a7ongaeduylz>
From: Yinon Burgansky <yinonburgansky@gmail.com>
Date: Wed, 24 Sep 2025 00:56:25 +0300
X-Gm-Features: AS18NWBTRZRGoj3iMPuhGYLJ38hdiNJcbzwCCEFcO6dJB0f9EZaiwaFEfRuXlpw
Message-ID: <CAEU-x4k_56w17y0DOKG2TRtegGvzVKS9USAERMa1MtO+3wZivA@mail.gmail.com>
Subject: Re: Touchpad multitouch leaves ghost fingers
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 7:30=E2=80=AFPM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
> Got something out with https://gitlab.freedesktop.org/libevdev/udev-hid-b=
pf/-/merge_requests/204
> that seems to solve your case on the hid-recorder you provided.

Thank you so much!
The install command didn't work properly for me:
```
$ ./install.sh "*DLL0945*"
$ tree /usr/local/lib/firmware
/usr/local/lib/firmware
=E2=94=94=E2=94=80=E2=94=80 hid
    =E2=94=94=E2=94=80=E2=94=80 bpf
        =E2=94=94=E2=94=80=E2=94=80 0011-Synaptics__DLL0945.bpf.o
$ reboot
$ sudo tree /sys/fs/bpf
/sys/fs/bpf
0 directories, 0 files
```
I tried to add it manually and it seems to work now :)
```
$ sudo udev-hid-bpf add /sys/bus/hid/devices/0018:06CB:CE26.0005
/usr/local/lib/firmware/hid/bpf/0011-Synaptics__DLL0945.bpf.o
$ sudo tree /sys/fs/bpf
/sys/fs/bpf
=E2=94=94=E2=94=80=E2=94=80 hid
    =E2=94=94=E2=94=80=E2=94=80 0018_06CB_CE26_0005
        =E2=94=94=E2=94=80=E2=94=80 0011-Synaptics__DLL0945_bpf
            =E2=94=94=E2=94=80=E2=94=80 synaptics_dll0945

4 directories, 1 file
```
But I have to do it manually every time.
Not sure what's wrong, maybe the added udev rule:
```
$ cat /etc/udev/rules.d/81-hid-bpf.rules
ACTION!=3D"add|remove|bind", GOTO=3D"hid_bpf_end"
SUBSYSTEM!=3D"hid", GOTO=3D"hid_bpf_end"

# We lookup the hwdb during bind to set the property, but we don't do
anything else
IMPORT{builtin}=3D"hwdb --subsystem=3Dhid --lookup-prefix=3Dhid-bpf:"
#ACTION=3D=3D"add", ENV{.HID_BPF}=3D=3D"1",
RUN{program}+=3D"@@BINDIR@@/udev-hid-bpf add $sys$devpath"
#MARKER
ACTION=3D=3D"add", ENV{.HID_BPF}=3D=3D"1",
RUN{program}+=3D"/usr/local/bin/udev-hid-bpf add $sys$devpath"
#ACTION=3D=3D"remove", ENV{.HID_BPF}=3D=3D"1",
RUN{program}+=3D"@@BINDIR@@/udev-hid-bpf remove $sys$devpath"
#MARKER
ACTION=3D=3D"remove", ENV{.HID_BPF}=3D=3D"1",
RUN{program}+=3D"/usr/local/bin/udev-hid-bpf remove $sys$devpath"

LABEL=3D"hid_bpf_end"
```
this is the udevadm info (after reboot, it is sometimes hidraw3
sometimes hidraw4):
```
$  udevadm info --query=3Dall --name=3D/dev/hidraw4
P: /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-DLL0945:00/0=
018:06CB:CE26.0005/hidraw/hidraw4
M: hidraw4
R: 4
J: c242:4
U: hidraw
D: c 242:4
N: hidraw4
L: 0
E: DEVPATH=3D/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-DL=
L0945:00/0018:06CB:CE26.0005/hidraw/hidraw4
E: DEVNAME=3D/dev/hidraw4
E: MAJOR=3D242
E: MINOR=3D4
E: SUBSYSTEM=3Dhidraw
E: USEC_INITIALIZED=3D3980846
E: ID_VENDOR_FROM_DATABASE=3DDell Inc
E: ID_PATH=3Dpci-0000:00:15.1-platform-i2c_designware.1
E: ID_PATH_TAG=3Dpci-0000_00_15_1-platform-i2c_designware_1
E: ID_FOR_SEAT=3Dhidraw-pci-0000_00_15_1-platform-i2c_designware_1
E: TAGS=3D:seat:
E: CURRENT_TAGS=3D:seat:
```

Thank you for the quick fix, it seems to work great so far!
Yinon

