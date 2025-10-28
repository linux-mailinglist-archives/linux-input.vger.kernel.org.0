Return-Path: <linux-input+bounces-15781-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 021C0C15216
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 15:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6543647D91
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 14:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35C432BF43;
	Tue, 28 Oct 2025 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z779qz83"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777532A3E1
	for <linux-input@vger.kernel.org>; Tue, 28 Oct 2025 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660819; cv=none; b=jz/6BBBUt7WUIl8FZDjuNldTtH+U23fKTKSJNHDokbRGJQ41k+SugW89W7Gy+MxwPA6wkbtuTcPguF2N5pCgAWDn0bO5CPqc26t26XKJZoorZA484ss4MxqrmNo6i7q4Pm/LFa+yGFsT49YBO0sZP65ExHT2mr5s5MeyjNhAZT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660819; c=relaxed/simple;
	bh=Ypq4lH8j7BoEeFkD6PcOdYnj4BECSVQ0K3aDIyda0VM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=IrQ4rCl6FnX0oEkzfwLKqDx4OiATmfAzdeGqvc/vmvdHU3vnEehiTbiZzF57RF8ZK/68BVySbnj5LIo7MWQtY85PW/LWIzvofIDPs82dQgml+O95pwFDwie/yCLb6o3liFU/k8F+7eygczjA4kCXiWR57u9kU/ta/wKX8eUn3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z779qz83; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-431d78f05c2so3216095ab.2
        for <linux-input@vger.kernel.org>; Tue, 28 Oct 2025 07:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761660816; x=1762265616; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5WxKcvw6MCBaEtzNR/JoZ+gbpUwtezU7I+zb0zBo34g=;
        b=Z779qz83Sh78p6bHOP1cPLYyU6JQFC6A2m8hZZIidl6mZ0F44Zyia9YEg1yLZCgZRy
         qoe4VyYBpQGq8yKW540SVyrKeCbgwajiWO1LhyZjdzNEJPSNGXM7e8k+0e18Dqgx1Tn5
         o/GIfFe54BOj1Nyaxagg6mHZInYY7LEX6f+1YttHoTqd3NumEvKfelaUbCduHYGCfCHL
         tv3aHorxzbvlOoBRzzWFNtVTdgREBadF73YACVbElpbDhDajitlQmoLOMHC0oq9sgSsm
         bAFwHH1CDS406mkfTIL9Wawtllirmgsr4tWQXdoQaCXKbmK6pojLC6dNINvzTnKfWjgH
         tOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761660816; x=1762265616;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WxKcvw6MCBaEtzNR/JoZ+gbpUwtezU7I+zb0zBo34g=;
        b=XE7pmL2r8c2XEEzp4Z63GxNJ1DrEOzKWobuZhBjF98wLsu85p2heT0oylFHSwhp+8D
         zrWqxGMIC3VjxrhgyAw2v9verT/1NibMxMFGa1dqvIsC/4UFD39D50RUizPah1S6BKyQ
         Zf+1bOmosIJRMiQ1VypKVxJJz5OGUh/Fhy3kxVRfDQKI4BnQ1DM2wpXYYq3rcEkoy8gs
         kI2vCTTyAaVuwbsiNaTh9N3xs7FnxUDsAnCAXhc+ldFM7buworXPv8dbGy8LDCnXHkwe
         YDM5YO5Xkb7p2kzn6piFNwuizy1VWjIi6RUcijpB/gOayeAIOmbpOO/1EGr5jDycWfGR
         n63A==
X-Gm-Message-State: AOJu0YzN4/hXBDqEQgUMirbYJETIkX9bEFL03PULsfhjPWeKftn9+txU
	txzDj4X+0vmKCBl7nC/g6AJNC3V5Lf7qYWg9GCsfvF9a2JSKdNRVpNdvVlZMaaDm/R5szvzbqrn
	DOqOnCpVphFqZwHq8VjMTnCeZnij2h43WtNbFpLVY3g==
X-Gm-Gg: ASbGncuRino2vv8ch5bFovP8HM9iw6e9UvxHAQ5MJM2G0rkHvfyXAmzqXj75cjav7Yo
	+INaOJ+nnZbk61cRwn94fl9os/5WGPn7FKFHeaU0co+QL0U0Up/VEJqy3gB5eNsPHFYSfG4mAdW
	ZxtU/O/aSao7Xz48Wu7ODtO7rtiWUlRw9F//O4pCFTgPlY4bkY3QQUm3d6r5zFXrR9pvZW57TRv
	hUcqzcqdRv4F4xslrqVQlrH86WvQXRXFyIXXd6P66Mocaq6JA6UP3gpI8W+2R2riKGUxw/FHA==
X-Google-Smtp-Source: AGHT+IFGE8G3p56PcO1tfFeYIAQKCFDBW66mjxo++I4teK8JYR0Iw3TMfag3AXNg1hpeyzC8tMGOjGNorunuETR1Cy4=
X-Received: by 2002:a05:6602:3fce:b0:940:da07:620d with SMTP id
 ca18e2360f4ac-945b80050ecmr221957839f.1.1761660815047; Tue, 28 Oct 2025
 07:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0KfQsNC/0LvRjyDQmNCy0LDQvQ==?= <87554y23210@gmail.com>
Date: Tue, 28 Oct 2025 17:13:23 +0300
X-Gm-Features: AWmQ_bllri1qtdL5Yz4yLY3CjYsSjbBhi7-KiN0QoYh9xnRSTN0615dwMT9WFsM
Message-ID: <CAADDCK7SgZvOdpoPMwBGQp=bFTQsrD8fTaj7KpDGfCKMUPd_zA@mail.gmail.com>
Subject: [Bug Report] Libwacom broken user space
To: linux-input@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000018a85a0642389ffc"

--00000000000018a85a0642389ffc
Content-Type: multipart/alternative; boundary="00000000000018a8570642389ffa"

--00000000000018a8570642389ffa
Content-Type: text/plain; charset="UTF-8"

[libwacom](https://github.com/linuxwacom/libwacom)  is a library to
identify graphics tablets and their model-specific features. It provides
easy access to information such as "is this a built-in-screen tablet",
"what is the size of this model", etc. libwacom is currently used by GUI
toolkits (GNOME, KDE, others?) to map built-in tablets to the correct
screen and by libinput to determine configuration options such as the
left-handed settings. SVG layout files are used to describe the tablet
visually.
Until recently, this library worked perfectly fine. I have a GAOMON S620
graphics tablet that used to work correctly some time ago. I decided to use
it now, and it turned out that I can no longer use the buttons on it; they
simply don't work. This functionality is handled precisely by the libwacom
library. The configuration for each device in this library is stored in a
static .tablet file. Such a file exists for my tablet as well and looks
like this:

```
[Device]
Name=GAOMON S620
ModelName=
DeviceMatch=usb|256c|006d|GAOMON Gaomon Tablet Pen;usb|256c|006d|GAOMON
Gaomon Tablet Pad;usb|256c|006d|GAOMON Gaomon Tablet
Pen|OEM02_T18e;usb|256c|006d|GAOMON Gaomon Tablet Pad|OEM02_T18e;
Width=6
Height=4
Layout=gaomon-s620.svg
IntegratedIn=
Styli=@generic-no-eraser;

[Features]
Stylus=true
Reversible=true

[Buttons]
Left=A;B;C;D
EvdevCodes=BTN_0;BTN_1;BTN_2;BTN_3
```

But for some reason, the library no longer recognizes it.
`libwacom-list-local-devices` output:
```
/dev/input/event8 (usb:256c:006d - "GAOMON Gaomon Tablet Dial") is a tablet
but not supported by libwacom
/dev/input/event7 (usb:256c:006d - "GAOMON Gaomon Tablet Touch Strip") is a
tablet but not supported by libwacom
/dev/input/event6 (usb:256c:006d - "GAOMON Gaomon Tablet") is a tablet but
not supported by libwacom
/dev/input/event5 (usb:256c:006d - "GAOMON Gaomon Tablet") is a tablet but
not supported by libwacom
Failed to find any devices known to libwacom.
```

The library retrieves device information from the `/proc/bus/input/devices`
file. I tested the tablet's functionality on various kernel versions and
obtained the following results:

- 6.17.4 problem occurs
- 6.16.12 problem occurs
- 6.15.10 problem occurs
- 6.14.11 problem occurs
- 6.14.8 problem occurs
- 6.14.7 marked as "obsolete" in fedora koji, unable to install
- 6.14.6 problem do not occurs

`cat /proc/bus/input/devices` output when tablet is broken:

```
I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0002/input/input8
U: Uniq=OEM02_T18e_200919
H: Handlers=mouse2 event5
B: PROP=1
B: EV=1b
B: KEY=1c01 0 0 0 0 0
B: ABS=d000003
B: MSC=10


I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0002/input/input9
U: Uniq=OEM02_T18e_200919
H: Handlers=event6 js0
B: PROP=0
B: EV=1b
B: KEY=800 201ff 0 0 0 0
B: ABS=3
B: MSC=10

I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet Touch Strip"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0002/input/input10
U: Uniq=OEM02_T18e_200919
H: Handlers=event7 js1
B: PROP=0
B: EV=b
B: KEY=1 0 0 0 0
B: ABS=1000000001b

I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet Dial"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0002/input/input11
U: Uniq=OEM02_T18e_200919
H: Handlers=mouse3 event8 js2
B: PROP=0
B: EV=1f
B: KEY=1 0 0 0 0
B: REL=900
B: ABS=10000000003
B: MSC=10
```

`cat /proc/bus/input/devices` output when tablet works fine:
```
I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet Pen"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0004/input/input11
U: Uniq=OEM02_T18e_200919
H: Handlers=mouse2 event8
B: PROP=1
B: EV=1b
B: KEY=1c01 0 0 0 0 0
B: ABS=d000003
B: MSC=10

I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet Pad"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0004/input/input12
U: Uniq=OEM02_T18e_200919
H: Handlers=event9 js0
B: PROP=0
B: EV=1b
B: KEY=800 3ff0000000003ff 0 0 0 0
B: ABS=3
B: MSC=10

I: Bus=0003 Vendor=256c Product=006d Version=0111
N: Name="GAOMON Gaomon Tablet Touch Strip"
P: Phys=usb-0000:00:1d.0-1.5/input0
S:
Sysfs=/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0004/input/input13
U: Uniq=OEM02_T18e_200919
H: Handlers=event10 js1
B: PROP=0
B: EV=b
B: KEY=1 0 0 0 0
B: ABS=1000000001b

```

It turns out that for some reason, the pen and pad parameters necessary for
identifying the device are now missing from this file. Simply replacing the
old names `GAOMON Gaomon Tablet Pen` and `GAOMON Gaomon Tablet Pad` with
the new `GAOMON Gaomon Tablet` in the configuration didn't solve the
problem. It leads to the recognition of the tablet
```
devices:
  - name: 'GAOMON S620'
    bus: 'usb'
    vid: 0x256c
    pid: 0x006d
    nodes:
      - /dev/input/event11: 'GAOMON Gaomon Tablet Dial'
    styli:
      - id: 0xffffd
        vid: 0x0000
        name: 'General Pen with no Eraser'
        type: 'general'
        axes: ['x', 'y' , 'pressure']
        buttons: 2
        erasers: []
  - name: 'GAOMON S620'
    bus: 'usb'
    vid: 0x256c
    pid: 0x006d
    nodes:
      - /dev/input/event10: 'GAOMON Gaomon Tablet Touch Strip'
    styli:
      - id: 0xffffd
        vid: 0x0000
        name: 'General Pen with no Eraser'
        type: 'general'
        axes: ['x', 'y' , 'pressure']
        buttons: 2
        erasers: []
  - name: 'GAOMON S620'
    bus: 'usb'
    vid: 0x256c
    pid: 0x006d
    nodes:
      - /dev/input/event9: 'GAOMON Gaomon Tablet'
      - /dev/input/event8: 'GAOMON Gaomon Tablet'
    styli:
      - id: 0xffffd
        vid: 0x0000
        name: 'General Pen with no Eraser'
        type: 'general'
        axes: ['x', 'y' , 'pressure']
        buttons: 2
        erasers: []

```
Although an option to assign key combinations for the tablet buttons now
appears, the physical buttons themselves are not detected and do not react
when pressed.

For some reason, starting after version 6.14.6, the pen and pad pointers
disappear during device initialization. There is also at least one other
known case of the [same issue](
https://github.com/linuxwacom/libwacom/issues/914). Unlike me, the user's
problem no longer occurs after renaming DeviceMatch. I have also opened an
[issue](https://github.com/linuxwacom/libwacom/issues/928) on libwacom's
GitHub.

I'm not a programmer, just an end user, I do not know how to write code or
solve problems of such type. So I would be grateful for your help

--00000000000018a8570642389ffa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[libwacom](<a href=3D"https://github.com/linuxwacom/libwac=
om">https://github.com/linuxwacom/libwacom</a>)=C2=A0 is a library to ident=
ify graphics tablets and their model-specific features. It provides easy ac=
cess to information such as &quot;is this a built-in-screen tablet&quot;, &=
quot;what is the size of this model&quot;, etc. libwacom is currently used =
by GUI toolkits (GNOME, KDE, others?) to map built-in tablets to the correc=
t screen and by libinput to determine configuration options such as the lef=
t-handed settings. SVG layout files are used to describe the tablet visuall=
y.<br>Until recently, this library worked perfectly fine. I have a GAOMON S=
620 graphics tablet that used to work correctly some time ago. I decided to=
 use it now, and it turned out that I can no longer use the buttons on it; =
they simply don&#39;t work. This functionality is handled precisely by the =
libwacom library.=C2=A0The configuration for each device in this library is=
 stored in a static .tablet file. Such a file exists for my tablet as well =
and looks like this:<br><br>```<br>[Device]<br>Name=3DGAOMON S620<br>ModelN=
ame=3D<br>DeviceMatch=3Dusb|256c|006d|GAOMON Gaomon Tablet Pen;usb|256c|006=
d|GAOMON Gaomon Tablet Pad;usb|256c|006d|GAOMON Gaomon Tablet Pen|OEM02_T18=
e;usb|256c|006d|GAOMON Gaomon Tablet Pad|OEM02_T18e;<br>Width=3D6<br>Height=
=3D4<br>Layout=3Dgaomon-s620.svg<br>IntegratedIn=3D<br>Styli=3D@generic-no-=
eraser;<br><br>[Features]<br>Stylus=3Dtrue<br>Reversible=3Dtrue<br><br>[But=
tons]<br>Left=3DA;B;C;D<br>EvdevCodes=3DBTN_0;BTN_1;BTN_2;BTN_3<br>```<br><=
br>But for some reason, the library no longer recognizes it.<br>`libwacom-l=
ist-local-devices` output:<br>```<br>/dev/input/event8 (usb:256c:006d - &qu=
ot;GAOMON Gaomon Tablet Dial&quot;) is a tablet but not supported by libwac=
om<br>/dev/input/event7 (usb:256c:006d - &quot;GAOMON Gaomon Tablet Touch S=
trip&quot;) is a tablet but not supported by libwacom<br>/dev/input/event6 =
(usb:256c:006d - &quot;GAOMON Gaomon Tablet&quot;) is a tablet but not supp=
orted by libwacom<br>/dev/input/event5 (usb:256c:006d - &quot;GAOMON Gaomon=
 Tablet&quot;) is a tablet but not supported by libwacom<br>Failed to find =
any devices known to libwacom.<br>```<br><br>The library retrieves device i=
nformation from the `/proc/bus/input/devices` file. I tested the tablet&#39=
;s functionality on various kernel versions and obtained the following resu=
lts:<br><br>- 6.17.4 problem occurs<br>- 6.16.12 problem occurs<br>- 6.15.1=
0 problem occurs<br>- 6.14.11 problem occurs<br>- 6.14.8 problem occurs<br>=
- 6.14.7 marked as &quot;obsolete&quot; in fedora koji, unable to install<b=
r>- 6.14.6 problem do not occurs<br><br>`cat /proc/bus/input/devices` outpu=
t when tablet is broken:<br><br>```<br>I: Bus=3D0003 Vendor=3D256c Product=
=3D006d Version=3D0111<br>N: Name=3D&quot;GAOMON Gaomon Tablet&quot;<br>P: =
Phys=3Dusb-0000:00:1d.0-1.5/input0<br>S: Sysfs=3D/devices/pci0000:00/0000:0=
0:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0002/input/input8<br>U: Uniq=
=3DOEM02_T18e_200919<br>H: Handlers=3Dmouse2 event5 <br>B: PROP=3D1<br>B: E=
V=3D1b<br>B: KEY=3D1c01 0 0 0 0 0<br>B: ABS=3Dd000003<br>B: MSC=3D10<br><br=
><br>I: Bus=3D0003 Vendor=3D256c Product=3D006d Version=3D0111<br>N: Name=
=3D&quot;GAOMON Gaomon Tablet&quot;<br>P: Phys=3Dusb-0000:00:1d.0-1.5/input=
0<br>S: Sysfs=3D/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0=
003:256C:006D.0002/input/input9<br>U: Uniq=3DOEM02_T18e_200919<br>H: Handle=
rs=3Devent6 js0 <br>B: PROP=3D0<br>B: EV=3D1b<br>B: KEY=3D800 201ff 0 0 0 0=
<br>B: ABS=3D3<br>B: MSC=3D10<br><br>I: Bus=3D0003 Vendor=3D256c Product=3D=
006d Version=3D0111<br>N: Name=3D&quot;GAOMON Gaomon Tablet Touch Strip&quo=
t;<br>P: Phys=3Dusb-0000:00:1d.0-1.5/input0<br>S: Sysfs=3D/devices/pci0000:=
00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0002/input/input10<=
br>U: Uniq=3DOEM02_T18e_200919<br>H: Handlers=3Devent7 js1 <br>B: PROP=3D0<=
br>B: EV=3Db<br>B: KEY=3D1 0 0 0 0<br>B: ABS=3D1000000001b<br><br>I: Bus=3D=
0003 Vendor=3D256c Product=3D006d Version=3D0111<br>N: Name=3D&quot;GAOMON =
Gaomon Tablet Dial&quot;<br>P: Phys=3Dusb-0000:00:1d.0-1.5/input0<br>S: Sys=
fs=3D/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:00=
6D.0002/input/input11<br>U: Uniq=3DOEM02_T18e_200919<br>H: Handlers=3Dmouse=
3 event8 js2 <br>B: PROP=3D0<br>B: EV=3D1f<br>B: KEY=3D1 0 0 0 0<br>B: REL=
=3D900<br>B: ABS=3D10000000003<br>B: MSC=3D10<br>```<br><br>`cat /proc/bus/=
input/devices` output when tablet works fine:<br>```<br>I: Bus=3D0003 Vendo=
r=3D256c Product=3D006d Version=3D0111<br>N: Name=3D&quot;GAOMON Gaomon Tab=
let Pen&quot;<br>P: Phys=3Dusb-0000:00:1d.0-1.5/input0<br>S: Sysfs=3D/devic=
es/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/0003:256C:006D.0004/inp=
ut/input11<br>U: Uniq=3DOEM02_T18e_200919<br>H: Handlers=3Dmouse2 event8 <b=
r>B: PROP=3D1<br>B: EV=3D1b<br>B: KEY=3D1c01 0 0 0 0 0<br>B: ABS=3Dd000003<=
br>B: MSC=3D10<br><br>I: Bus=3D0003 Vendor=3D256c Product=3D006d Version=3D=
0111<br>N: Name=3D&quot;GAOMON Gaomon Tablet Pad&quot;<br>P: Phys=3Dusb-000=
0:00:1d.0-1.5/input0<br>S: Sysfs=3D/devices/pci0000:00/0000:00:1d.0/usb2/2-=
1/2-1.5/2-1.5:1.0/0003:256C:006D.0004/input/input12<br>U: Uniq=3DOEM02_T18e=
_200919<br>H: Handlers=3Devent9 js0 <br>B: PROP=3D0<br>B: EV=3D1b<br>B: KEY=
=3D800 3ff0000000003ff 0 0 0 0<br>B: ABS=3D3<br>B: MSC=3D10<br><br>I: Bus=
=3D0003 Vendor=3D256c Product=3D006d Version=3D0111<br>N: Name=3D&quot;GAOM=
ON Gaomon Tablet Touch Strip&quot;<br>P: Phys=3Dusb-0000:00:1d.0-1.5/input0=
<br>S: Sysfs=3D/devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.5/2-1.5:1.0/00=
03:256C:006D.0004/input/input13<br>U: Uniq=3DOEM02_T18e_200919<br>H: Handle=
rs=3Devent10 js1 <br>B: PROP=3D0<br>B: EV=3Db<br>B: KEY=3D1 0 0 0 0<br>B: A=
BS=3D1000000001b<br><br>```<br><br>It turns out that for some reason, the p=
en and pad parameters necessary for identifying the device are now missing =
from this file. Simply replacing the old names `GAOMON Gaomon Tablet Pen` a=
nd `GAOMON Gaomon Tablet Pad` with the new `GAOMON Gaomon Tablet` in the co=
nfiguration didn&#39;t solve the problem. It leads to the recognition of th=
e tablet<br>```<br>devices:<br>=C2=A0 - name: &#39;GAOMON S620&#39;<br>=C2=
=A0 =C2=A0 bus: &#39;usb&#39;<br>=C2=A0 =C2=A0 vid: 0x256c<br>=C2=A0 =C2=A0=
 pid: 0x006d<br>=C2=A0 =C2=A0 nodes: <br>=C2=A0 =C2=A0 =C2=A0 - /dev/input/=
event11: &#39;GAOMON Gaomon Tablet Dial&#39;<br>=C2=A0 =C2=A0 styli:<br>=C2=
=A0 =C2=A0 =C2=A0 - id: 0xffffd<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vid: 0x0000<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: &#39;General Pen with no Eraser&#39;<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: &#39;general&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 axes: [&#39;x&#39;, &#39;y&#39; , &#39;pressure&#39;]<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 buttons: 2<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 erasers: []<=
br>=C2=A0 - name: &#39;GAOMON S620&#39;<br>=C2=A0 =C2=A0 bus: &#39;usb&#39;=
<br>=C2=A0 =C2=A0 vid: 0x256c<br>=C2=A0 =C2=A0 pid: 0x006d<br>=C2=A0 =C2=A0=
 nodes: <br>=C2=A0 =C2=A0 =C2=A0 - /dev/input/event10: &#39;GAOMON Gaomon T=
ablet Touch Strip&#39;<br>=C2=A0 =C2=A0 styli:<br>=C2=A0 =C2=A0 =C2=A0 - id=
: 0xffffd<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vid: 0x0000<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 name: &#39;General Pen with no Eraser&#39;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 type: &#39;general&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 axes: [&#=
39;x&#39;, &#39;y&#39; , &#39;pressure&#39;]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 buttons: 2<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 erasers: []<br>=C2=A0 - name: &#=
39;GAOMON S620&#39;<br>=C2=A0 =C2=A0 bus: &#39;usb&#39;<br>=C2=A0 =C2=A0 vi=
d: 0x256c<br>=C2=A0 =C2=A0 pid: 0x006d<br>=C2=A0 =C2=A0 nodes: <br>=C2=A0 =
=C2=A0 =C2=A0 - /dev/input/event9: &#39;GAOMON Gaomon Tablet&#39;<br>=C2=A0=
 =C2=A0 =C2=A0 - /dev/input/event8: &#39;GAOMON Gaomon Tablet&#39;<br>=C2=
=A0 =C2=A0 styli:<br>=C2=A0 =C2=A0 =C2=A0 - id: 0xffffd<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 vid: 0x0000<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 name: &#39;General=
 Pen with no Eraser&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 type: &#39;general&=
#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 axes: [&#39;x&#39;, &#39;y&#39; , &#39;=
pressure&#39;]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 buttons: 2<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 erasers: []<br><br>```<br>Although an option to assign key co=
mbinations for the tablet buttons now appears, the physical buttons themsel=
ves are not detected and do not react when pressed.<br><br>For some reason,=
 starting after version 6.14.6, the pen and pad pointers disappear during d=
evice initialization. There is also at least one other known case of the [s=
ame issue](<a href=3D"https://github.com/linuxwacom/libwacom/issues/914">ht=
tps://github.com/linuxwacom/libwacom/issues/914</a>). Unlike me, the user&#=
39;s problem no longer occurs after renaming DeviceMatch. I have also opene=
d an [issue](<a href=3D"https://github.com/linuxwacom/libwacom/issues/928">=
https://github.com/linuxwacom/libwacom/issues/928</a>) on libwacom&#39;s Gi=
tHub. <br><br>I&#39;m not a programmer, just an end user, I do not know how=
 to write code or solve problems of such type. So I would be grateful for y=
our help</div>

--00000000000018a8570642389ffa--
--00000000000018a85a0642389ffc
Content-Type: text/html; charset="UTF-8"; name="libwacom broken user space.html"
Content-Disposition: attachment; filename="libwacom broken user space.html"
Content-Transfer-Encoding: base64
Content-ID: <f_mhancbu62>
X-Attachment-Id: f_mhancbu62

PCFET0NUWVBFIGh0bWw+CjxodG1sIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5L3hodG1s
IiBsYW5nIHhtbDpsYW5nPgo8aGVhZD4KICA8bWV0YSBjaGFyc2V0PSJ1dGYtOCIgLz4KICA8bWV0
YSBuYW1lPSJnZW5lcmF0b3IiIGNvbnRlbnQ9InBhbmRvYyIgLz4KICA8bWV0YSBuYW1lPSJ2aWV3
cG9ydCIgY29udGVudD0id2lkdGg9ZGV2aWNlLXdpZHRoLCBpbml0aWFsLXNjYWxlPTEuMCwgdXNl
ci1zY2FsYWJsZT15ZXMiIC8+CiAgPHRpdGxlPi08L3RpdGxlPgogIDxzdHlsZT4KY29kZXt3aGl0
ZS1zcGFjZTogcHJlLXdyYXA7fQpzcGFuLnNtYWxsY2Fwc3tmb250LXZhcmlhbnQ6IHNtYWxsLWNh
cHM7fQpkaXYuY29sdW1uc3tkaXNwbGF5OiBmbGV4OyBnYXA6IG1pbig0dncsIDEuNWVtKTt9CmRp
di5jb2x1bW57ZmxleDogYXV0bzsgb3ZlcmZsb3cteDogYXV0bzt9CmRpdi5oYW5naW5nLWluZGVu
dHttYXJnaW4tbGVmdDogMS41ZW07IHRleHQtaW5kZW50OiAtMS41ZW07fQoKdWwudGFzay1saXN0
W2NsYXNzXXtsaXN0LXN0eWxlOiBub25lO30KdWwudGFzay1saXN0IGxpIGlucHV0W3R5cGU9ImNo
ZWNrYm94Il0gewpmb250LXNpemU6IGluaGVyaXQ7CndpZHRoOiAwLjhlbTsKbWFyZ2luOiAwIDAu
OGVtIDAuMmVtIC0xLjZlbTsKdmVydGljYWwtYWxpZ246IG1pZGRsZTsKfQo8L3N0eWxlPgogIDxz
dHlsZSB0eXBlPSJ0ZXh0L2NzcyI+QGZvbnQtZmFjZSB7CmZvbnQtZmFtaWx5OiBmaXJhLXNhbnM7
CnNyYzogbG9jYWwoIkZpcmFTYW5zLVJlZ3VsYXIiKTsKfQpAZm9udC1mYWNlIHsKZm9udC1mYW1p
bHk6IGZpcmEtbW9ubzsKc3JjOiBsb2NhbCgiRmlyYU1vbm8tUmVndWxhciIpOwp9CkBmb250LWZh
Y2Ugewpmb250LWZhbWlseTogY29sb3ItZW1vamk7CnNyYzogbG9jYWwoIk5vdG8gQ29sb3IgRW1v
amkiKSwgbG9jYWwoIkFwcGxlIENvbG9yIEVtb2ppIiksIGxvY2FsKCJTZWdvZSBVSSBFbW9qaSIp
LCBsb2NhbCgiU2Vnb2UgVUkgU3ltYm9sIik7Cn0KOnJvb3QgewotLXRleHQtY29sb3I6ICMyNDI5
MmU7Ci0tYmFja2dyb3VuZC1jb2xvcjogI2ZmZmZmZjsKLS1hbHQtYmFja2dyb3VuZC1jb2xvcjog
I2Y2ZjhmYTsKLS1saW5rLWNvbG9yOiAjMDM2NmQ2OwotLWJsb2NrcXVvdGUtdGV4dC1jb2xvcjog
IzZhNzM3ZDsKLS1ibG9ja3F1b3RlLWJvcmRlci1jb2xvcjogI2RmZTJlNTsKLS1oZWFkZXItYm9y
ZGVyLWNvbG9yOiAjZWFlY2VmOwotLWhyLWJhY2tncm91bmQtY29sb3I6ICNlMWU0ZTg7Ci0tdGFi
bGUtdHItYm9yZGVyLWNvbG9yOiAjYzZjYmQxOwotLXRhYmxlLXRkLWJvcmRlci1jb2xvcjogI2Rm
ZTJlNTsKLS1rYmQtdGV4dC1jb2xvcjogIzQ0NGQ1NjsKLS1rYmQtYmFja2dyb3VuZC1jb2xvcjog
I2ZhZmJmYzsKLS1rYmQtYm9yZGVyLWNvbG9yOiAjYzZjYmQxOwotLWtiZC1zaGFkb3ctY29sb3I6
ICM5NTlkYTU7Ci0tdG9wYmFycy1oZWlnaHQ6IDBweDsKfQoqIHsKYm94LXNpemluZzogYm9yZGVy
LWJveDsKfQpodG1sIHsKZm9udC1zaXplOiAxNnB4Owp9CmJvZHkgewpjb2xvcjogdmFyKC0tdGV4
dC1jb2xvcik7CmJhY2tncm91bmQtY29sb3I6IHZhcigtLWJhY2tncm91bmQtY29sb3IpOwpmb250
LWZhbWlseTogIkZpcmEgU2FucyIsIGZpcmEtc2Fucywgc2Fucy1zZXJpZiwgY29sb3ItZW1vamk7
CmxpbmUtaGVpZ2h0OiAxLjU7CndvcmQtd3JhcDogYnJlYWstd29yZDsKbWF4LXdpZHRoOiA5ODBw
eDsKbWFyZ2luOiBhdXRvOwptYXJnaW4tdG9wOiB2YXIoLS10b3BiYXJzLWhlaWdodCk7CnBhZGRp
bmc6IDAgNGVtOwp9CmJvZHkgPiA6Zmlyc3QtY2hpbGQgewptYXJnaW4tdG9wOiAwICFpbXBvcnRh
bnQ7Cn0KQG1lZGlhIHNjcmVlbiBhbmQgKG1heC13aWR0aDogNzk5cHgpIHsKaHRtbCB7CmZvbnQt
c2l6ZTogMTRweDsKfQpib2R5IHsKcGFkZGluZzogMCAxZW07Cn0KfQpAbWVkaWEgc2NyZWVuIGFu
ZCAobWluLXdpZHRoOiAxMjgwcHgpIHsKaHRtbCB7CmZvbnQtc2l6ZTogMThweDsKfQp9CmEgewpi
YWNrZ3JvdW5kLWNvbG9yOiB0cmFuc3BhcmVudDsKY29sb3I6IHZhcigtLWxpbmstY29sb3IpOwp0
ZXh0LWRlY29yYXRpb246IG5vbmU7Cn0KYTphY3RpdmUsCmE6aG92ZXIgewpvdXRsaW5lLXdpZHRo
OiAwOwp9CmE6aG92ZXIgewp0ZXh0LWRlY29yYXRpb246IHVuZGVybGluZTsKfQpzdHJvbmcgewpm
b250LXdlaWdodDogYm9sZDsKfQppbWcgewpib3JkZXItc3R5bGU6IG5vbmU7Cn0KaHIgewpib3gt
c2l6aW5nOiBjb250ZW50LWJveDsKaGVpZ2h0OiAwLjI1ZW07CnBhZGRpbmc6IDA7Cm1hcmdpbjog
MS41ZW0gMDsKb3ZlcmZsb3c6IGhpZGRlbjsKYmFja2dyb3VuZC1jb2xvcjogdmFyKC0taHItYmFj
a2dyb3VuZC1jb2xvcik7CmJvcmRlcjogMDsKfQpocjo6YmVmb3JlIHsKZGlzcGxheTogdGFibGU7
CmNvbnRlbnQ6ICIiOwp9CmhyOjphZnRlciB7CmRpc3BsYXk6IHRhYmxlOwpjbGVhcjogYm90aDsK
Y29udGVudDogIiI7Cn0KaW5wdXQgewpmb250LWZhbWlseTogaW5oZXJpdDsKZm9udC1zaXplOiBp
bmhlcml0OwpsaW5lLWhlaWdodDogaW5oZXJpdDsKbWFyZ2luOiAwOwpvdmVyZmxvdzogdmlzaWJs
ZTsKfQpbdHlwZT0iY2hlY2tib3giXSB7CmJveC1zaXppbmc6IGJvcmRlci1ib3g7CnBhZGRpbmc6
IDA7Cn0KdGFibGUgewpib3JkZXItc3BhY2luZzogMDsKYm9yZGVyLWNvbGxhcHNlOiBjb2xsYXBz
ZTsKfQp0ZCwKdGggewpwYWRkaW5nOiAwOwp9CmgxLApoMiwKaDMsCmg0LApoNSwKaDYgewpmb250
LXdlaWdodDogYm9sZDsKbWFyZ2luOiAwOwp9CmgxIHsKZm9udC1zaXplOiAyZW07Cn0KaDIgewpm
b250LXNpemU6IDEuNWVtOwp9CmgzIHsKZm9udC1zaXplOiAxLjI1ZW07Cn0KaDQgewpmb250LXNp
emU6IDFlbTsKfQpoNSB7CmZvbnQtc2l6ZTogMC44NzVlbTsKfQpoNiB7CmZvbnQtc2l6ZTogMC44
NWVtOwp9CnAgewptYXJnaW4tdG9wOiAwOwptYXJnaW4tYm90dG9tOiAwLjYyNWVtOwp9CmJsb2Nr
cXVvdGUgewptYXJnaW46IDA7Cn0KdWwsCm9sIHsKcGFkZGluZy1sZWZ0OiAwOwptYXJnaW4tdG9w
OiAwOwptYXJnaW4tYm90dG9tOiAwOwp9Cm9sIG9sLAp1bCBvbCB7Cmxpc3Qtc3R5bGUtdHlwZTog
bG93ZXItcm9tYW47Cn0KdWwgdWwgb2wsCnVsIG9sIG9sLApvbCB1bCBvbCwKb2wgb2wgb2wgewps
aXN0LXN0eWxlLXR5cGU6IGxvd2VyLWFscGhhOwp9CmRkIHsKbWFyZ2luLWxlZnQ6IDA7Cn0KY29k
ZSwKa2JkLApwcmUgewpmb250LWZhbWlseTogIkZpcmEgTW9ubyIsIGZpcmEtbW9ubywgbW9ub3Nw
YWNlLCBjb2xvci1lbW9qaTsKZm9udC1zaXplOiAxZW07CndvcmQtd3JhcDogbm9ybWFsOwp9CmNv
ZGUgewpib3JkZXItcmFkaXVzOiAwLjE4NzVlbTsKZm9udC1zaXplOiAwLjg1ZW07CnBhZGRpbmc6
IDAuMmVtIDAuNGVtOwptYXJnaW46IDA7Cn0KcHJlIHsKbWFyZ2luLXRvcDogMDsKbWFyZ2luLWJv
dHRvbTogMDsKZm9udC1zaXplOiAwLjc1ZW07Cn0KcHJlPmNvZGUgewpwYWRkaW5nOiAwOwptYXJn
aW46IDA7CmZvbnQtc2l6ZTogMWVtOwp3b3JkLWJyZWFrOiBub3JtYWw7CndoaXRlLXNwYWNlOiBw
cmU7CmJhY2tncm91bmQ6IHRyYW5zcGFyZW50Owpib3JkZXI6IDA7Cn0KLmhpZ2hsaWdodCB7Cm1h
cmdpbi1ib3R0b206IDFlbTsKfQouaGlnaGxpZ2h0IHByZSB7Cm1hcmdpbi1ib3R0b206IDA7Cndv
cmQtYnJlYWs6IG5vcm1hbDsKfQouaGlnaGxpZ2h0IHByZSwKcHJlIHsKcGFkZGluZzogMWVtOwpv
dmVyZmxvdzogYXV0bzsKZm9udC1zaXplOiAwLjg1ZW07CmxpbmUtaGVpZ2h0OiAxLjU7CmJhY2tn
cm91bmQtY29sb3I6IHZhcigtLWFsdC1iYWNrZ3JvdW5kLWNvbG9yKTsKYm9yZGVyLXJhZGl1czog
MC4xODc1ZW07Cn0KcHJlIGNvZGUgewpiYWNrZ3JvdW5kLWNvbG9yOiB0cmFuc3BhcmVudDsKYm9y
ZGVyOiAwOwpkaXNwbGF5OiBpbmxpbmU7CnBhZGRpbmc6IDA7Cm1hcmdpbjogMDsKb3ZlcmZsb3c6
IHZpc2libGU7CmxpbmUtaGVpZ2h0OiBpbmhlcml0Owp3b3JkLXdyYXA6IG5vcm1hbDsKfQoucGwt
MCB7CnBhZGRpbmctbGVmdDogMCAhaW1wb3J0YW50Owp9Ci5wbC0xIHsKcGFkZGluZy1sZWZ0OiAw
LjI1ZW0gIWltcG9ydGFudDsKfQoucGwtMiB7CnBhZGRpbmctbGVmdDogMC41ZW0gIWltcG9ydGFu
dDsKfQoucGwtMyB7CnBhZGRpbmctbGVmdDogMWVtICFpbXBvcnRhbnQ7Cn0KLnBsLTQgewpwYWRk
aW5nLWxlZnQ6IDEuNWVtICFpbXBvcnRhbnQ7Cn0KLnBsLTUgewpwYWRkaW5nLWxlZnQ6IDJlbSAh
aW1wb3J0YW50Owp9Ci5wbC02IHsKcGFkZGluZy1sZWZ0OiAyLjVlbSAhaW1wb3J0YW50Owp9Ci5t
YXJrZG93bi1ib2R5OjpiZWZvcmUgewpkaXNwbGF5OiB0YWJsZTsKY29udGVudDogIiI7Cn0KLm1h
cmtkb3duLWJvZHk6OmFmdGVyIHsKZGlzcGxheTogdGFibGU7CmNsZWFyOiBib3RoOwpjb250ZW50
OiAiIjsKfQoubWFya2Rvd24tYm9keT4qOmZpcnN0LWNoaWxkIHsKbWFyZ2luLXRvcDogMCAhaW1w
b3J0YW50Owp9Ci5tYXJrZG93bi1ib2R5Pio6bGFzdC1jaGlsZCB7Cm1hcmdpbi1ib3R0b206IDAg
IWltcG9ydGFudDsKfQphOm5vdChbaHJlZl0pIHsKY29sb3I6IGluaGVyaXQ7CnRleHQtZGVjb3Jh
dGlvbjogbm9uZTsKfQouYW5jaG9yIHsKZmxvYXQ6IGxlZnQ7CnBhZGRpbmctcmlnaHQ6IDAuMjVl
bTsKbWFyZ2luLWxlZnQ6IC0xLjI1ZW07CmxpbmUtaGVpZ2h0OiAxOwp9Ci5hbmNob3I6Zm9jdXMg
ewpvdXRsaW5lOiBub25lOwp9CnAsCmJsb2NrcXVvdGUsCnVsLApvbCwKZGwsCnRhYmxlLApwcmUg
ewptYXJnaW4tdG9wOiAwOwptYXJnaW4tYm90dG9tOiAxZW07Cn0KYmxvY2txdW90ZSB7CnBhZGRp
bmc6IDAgMWVtOwpjb2xvcjogdmFyKC0tYmxvY2txdW90ZS10ZXh0LWNvbG9yKTsKYm9yZGVyLWxl
ZnQ6IDAuMjVlbSBzb2xpZCB2YXIoLS1ibG9ja3F1b3RlLWJvcmRlci1jb2xvcik7Cn0KYmxvY2tx
dW90ZT46Zmlyc3QtY2hpbGQgewptYXJnaW4tdG9wOiAwOwp9CmJsb2NrcXVvdGU+Omxhc3QtY2hp
bGQgewptYXJnaW4tYm90dG9tOiAwOwp9CmtiZCB7CmRpc3BsYXk6IGlubGluZS1ibG9jazsKcGFk
ZGluZzogMC4xODc1ZW0gMC4zMTI1ZW07CmZvbnQtc2l6ZTogMC42ODc1ZW07CmxpbmUtaGVpZ2h0
OiAxOwpjb2xvcjogdmFyKC0ta2JkLXRleHQtY29sb3IpOwp2ZXJ0aWNhbC1hbGlnbjogbWlkZGxl
OwpiYWNrZ3JvdW5kLWNvbG9yOiB2YXIoLS1rYmQtYmFja2dyb3VuZC1jb2xvcik7CmJvcmRlcjog
c29saWQgMXB4IHZhcigtLWtiZC1ib3JkZXItY29sb3IpOwpib3JkZXItYm90dG9tLWNvbG9yOiB2
YXIoLS1rYmQtc2hhZG93LWNvbG9yKTsKYm9yZGVyLXJhZGl1czogM3B4Owpib3gtc2hhZG93OiBp
bnNldCAwIC0xcHggMCB2YXIoLS1rYmQtc2hhZG93LWNvbG9yKTs7Cn0KaDEsCmgyLApoMywKaDQs
Cmg1LApoNiB7Cm1hcmdpbi10b3A6IDEuNWVtOwptYXJnaW4tYm90dG9tOiAxZW07CmZvbnQtd2Vp
Z2h0OiBib2xkOwpsaW5lLWhlaWdodDogMS4yNTsKfQpoMTpob3ZlciAuYW5jaG9yLApoMjpob3Zl
ciAuYW5jaG9yLApoMzpob3ZlciAuYW5jaG9yLApoNDpob3ZlciAuYW5jaG9yLApoNTpob3ZlciAu
YW5jaG9yLApoNjpob3ZlciAuYW5jaG9yIHsKdGV4dC1kZWNvcmF0aW9uOiBub25lOwp9CmgxIHsK
cGFkZGluZy1ib3R0b206IDAuM2VtOwpmb250LXNpemU6IDJlbTsKYm9yZGVyLWJvdHRvbTogMXB4
IHNvbGlkIHZhcigtLWhlYWRlci1ib3JkZXItY29sb3IpOwp9CmgyIHsKcGFkZGluZy1ib3R0b206
IDAuM2VtOwpmb250LXNpemU6IDEuNWVtOwpib3JkZXItYm90dG9tOiAxcHggc29saWQgdmFyKC0t
aGVhZGVyLWJvcmRlci1jb2xvcik7Cn0KaDMgewpmb250LXNpemU6IDEuMjVlbTsKfQpoNCB7CmZv
bnQtc2l6ZTogMWVtOwp9Cmg1IHsKZm9udC1zaXplOiAwLjg3NWVtOwp9Cmg2IHsKZm9udC1zaXpl
OiAwLjg1ZW07Cm9wYWNpdHk6IDAuNjc7Cn0KdWwsCm9sIHsKcGFkZGluZy1sZWZ0OiAyZW07Cn0K
dWwgdWwsCnVsIG9sLApvbCBvbCwKb2wgdWwgewptYXJnaW4tdG9wOiAwOwptYXJnaW4tYm90dG9t
OiAwOwp9CmxpIHsKb3ZlcmZsb3ctd3JhcDogYnJlYWstd29yZDsKfQpsaT5wIHsKbWFyZ2luLXRv
cDogMWVtOwp9CmxpK2xpIHsKbWFyZ2luLXRvcDogMC4yNWVtOwp9CmRsIHsKcGFkZGluZzogMDsK
fQpkbCBkdCB7CnBhZGRpbmc6IDA7Cm1hcmdpbi10b3A6IDFlbTsKZm9udC1zaXplOiAxZW07CmZv
bnQtc3R5bGU6IGl0YWxpYzsKZm9udC13ZWlnaHQ6IGJvbGQ7Cn0KZGwgZGQgewpwYWRkaW5nOiAw
IDFlbTsKbWFyZ2luLWJvdHRvbTogMWVtOwp9CnRhYmxlIHsKZGlzcGxheTogYmxvY2s7CndpZHRo
OiAxMDAlOwpvdmVyZmxvdzogYXV0bzsKfQp0YWJsZSB0aCB7CmZvbnQtd2VpZ2h0OiBib2xkOwp9
CnRhYmxlIHRoLAp0YWJsZSB0ZCB7CnBhZGRpbmc6IDAuMzc1ZW0gMC44MTI1ZW07CmJvcmRlcjog
MXB4IHNvbGlkIHZhcigtLXRhYmxlLXRkLWJvcmRlci1jb2xvcik7Cn0KdGFibGUgdHIgewpiYWNr
Z3JvdW5kLWNvbG9yOiB2YXIoLS1iYWNrZ3JvdW5kLWNvbG9yKTsKYm9yZGVyLXRvcDogMXB4IHNv
bGlkIHZhcigtLXRhYmxlLXRyLWJvcmRlci1jb2xvcik7Cn0KdGFibGUgdHI6bnRoLWNoaWxkKDJu
KSB7CmJhY2tncm91bmQtY29sb3I6IHZhcigtLWFsdC1iYWNrZ3JvdW5kLWNvbG9yKTsKfQppbWcg
ewptYXgtd2lkdGg6IDEwMCU7CmJveC1zaXppbmc6IGNvbnRlbnQtYm94Owp9CmltZ1thbGlnbj1y
aWdodF0gewpwYWRkaW5nLWxlZnQ6IDEuMjVlbTsKfQppbWdbYWxpZ249bGVmdF0gewpwYWRkaW5n
LXJpZ2h0OiAxLjI1ZW07Cn0KLnRhc2stbGlzdC1pdGVtIHsKbGlzdC1zdHlsZS10eXBlOiBub25l
Owp9Ci50YXNrLWxpc3QtaXRlbSsudGFzay1saXN0LWl0ZW0gewptYXJnaW4tdG9wOiAwLjE4NzVl
bTsKfQoudGFzay1saXN0LWl0ZW0gaW5wdXQgewptYXJnaW46IDAgMC4yZW0gMC4yNWVtIC0xLjZl
bTsKdmVydGljYWwtYWxpZ246IG1pZGRsZTsKfQo6cm9vdCB7Ci0tdGV4dC1jb2xvcjogcmdiYSgw
LCAwLCAwLCAwLjgpOwotLWJhY2tncm91bmQtY29sb3I6ICNmNWY1ZjU7Ci0tYWx0LWJhY2tncm91
bmQtY29sb3I6ICNlZWVlZWU7Ci0tbGluay1jb2xvcjogIzBkNzFkZTsKLS1ibG9ja3F1b3RlLXRl
eHQtY29sb3I6ICM3NDdlODU7Ci0tYmxvY2txdW90ZS1ib3JkZXItY29sb3I6ICNkNmQ4ZGE7Ci0t
aGVhZGVyLWJvcmRlci1jb2xvcjogI2UxZTJlNDsKLS1oci1iYWNrZ3JvdW5kLWNvbG9yOiAjZDhk
YWRkOwotLXRhYmxlLXRyLWJvcmRlci1jb2xvcjogI2JkYzFjNjsKLS10YWJsZS10ZC1ib3JkZXIt
Y29sb3I6ICNkNmQ4ZGE7Ci0ta2JkLXRleHQtY29sb3I6ICM0ZTU4NWU7Ci0ta2JkLWJhY2tncm91
bmQtY29sb3I6ICNmMWYxZjE7Ci0ta2JkLWJvcmRlci1jb2xvcjogI2JkYzFjNjsKLS1rYmQtc2hh
ZG93LWNvbG9yOiAjOGM5MzlhOwp9CkBtZWRpYSAocHJlZmVycy1jb2xvci1zY2hlbWU6IGRhcmsp
IHsKOnJvb3QgewotLXRleHQtY29sb3I6ICNlZWVlZWU7Ci0tYmFja2dyb3VuZC1jb2xvcjogIzI2
MjYyQTsKLS1hbHQtYmFja2dyb3VuZC1jb2xvcjogIzM3MzczRDsKLS1saW5rLWNvbG9yOiAjYjVk
YWZmOwotLWJsb2NrcXVvdGUtdGV4dC1jb2xvcjogI2E4YThhNjsKLS1ibG9ja3F1b3RlLWJvcmRl
ci1jb2xvcjogIzRENEQ1NTsKLS1oZWFkZXItYm9yZGVyLWNvbG9yOiAjNDM0MzRBOwotLWhyLWJh
Y2tncm91bmQtY29sb3I6ICM0QjRCNTM7Ci0tdGFibGUtdHItYm9yZGVyLWNvbG9yOiAjNjM2MzZE
OwotLXRhYmxlLXRkLWJvcmRlci1jb2xvcjogIzRENEQ1NTsKLS1rYmQtdGV4dC1jb2xvcjogI2Nl
Y2VjYzsKLS1rYmQtYmFja2dyb3VuZC1jb2xvcjogIzNBM0E0MDsKLS1rYmQtYm9yZGVyLWNvbG9y
OiAjNjM2MzZEOwotLWtiZC1zaGFkb3ctY29sb3I6ICM5MTkxOUI7Cn0KfQo8L3N0eWxlPgo8L2hl
YWQ+Cjxib2R5Pgo8aDEgaWQ9ImJ1Zy1saWJ3YWNvbS1icm9rZW4tdXNlci1zcGFjZSI+W2J1Z10g
TGlid2Fjb20gYnJva2VuIHVzZXIgc3BhY2U8L2gxPgo8cD48YSBocmVmPSJodHRwczovL2dpdGh1
Yi5jb20vbGludXh3YWNvbS9saWJ3YWNvbSI+bGlid2Fjb208L2E+IGlzIGEgbGlicmFyeSB0byBp
ZGVudGlmeSBncmFwaGljcyB0YWJsZXRzIGFuZCB0aGVpciBtb2RlbC1zcGVjaWZpYyBmZWF0dXJl
cy4gSXQgcHJvdmlkZXMgZWFzeSBhY2Nlc3MgdG8gaW5mb3JtYXRpb24gc3VjaCBhcyDigJxpcyB0
aGlzIGEgYnVpbHQtaW4tc2NyZWVuIHRhYmxldOKAnSwg4oCcd2hhdCBpcyB0aGUgc2l6ZSBvZiB0
aGlzIG1vZGVs4oCdLCBldGMuIGxpYndhY29tIGlzIGN1cnJlbnRseSB1c2VkIGJ5IEdVSSB0b29s
a2l0cyAoR05PTUUsIEtERSwgb3RoZXJzPykgdG8gbWFwIGJ1aWx0LWluIHRhYmxldHMgdG8gdGhl
IGNvcnJlY3Qgc2NyZWVuIGFuZCBieSBsaWJpbnB1dCB0byBkZXRlcm1pbmUgY29uZmlndXJhdGlv
biBvcHRpb25zIHN1Y2ggYXMgdGhlIGxlZnQtaGFuZGVkIHNldHRpbmdzLiBTVkcgbGF5b3V0IGZp
bGVzIGFyZSB1c2VkIHRvIGRlc2NyaWJlIHRoZSB0YWJsZXQgdmlzdWFsbHkuIFVudGlsIHJlY2Vu
dGx5LCB0aGlzIGxpYnJhcnkgd29ya2VkIHBlcmZlY3RseSBmaW5lLiBJIGhhdmUgYSBHQU9NT04g
UzYyMCBncmFwaGljcyB0YWJsZXQgdGhhdCB1c2VkIHRvIHdvcmsgY29ycmVjdGx5IHNvbWUgdGlt
ZSBhZ28uIEkgZGVjaWRlZCB0byB1c2UgaXQgbm93LCBhbmQgaXQgdHVybmVkIG91dCB0aGF0IEkg
Y2FuIG5vIGxvbmdlciB1c2UgdGhlIGJ1dHRvbnMgb24gaXQ7IHRoZXkgc2ltcGx5IGRvbuKAmXQg
d29yay4gVGhpcyBmdW5jdGlvbmFsaXR5IGlzIGhhbmRsZWQgcHJlY2lzZWx5IGJ5IHRoZSBsaWJ3
YWNvbSBsaWJyYXJ5LiBUaGUgY29uZmlndXJhdGlvbiBmb3IgZWFjaCBkZXZpY2UgaW4gdGhpcyBs
aWJyYXJ5IGlzIHN0b3JlZCBpbiBhIHN0YXRpYyAudGFibGV0IGZpbGUuIFN1Y2ggYSBmaWxlIGV4
aXN0cyBmb3IgbXkgdGFibGV0IGFzIHdlbGwgYW5kIGxvb2tzIGxpa2UgdGhpczo8L3A+CjxwcmU+
PGNvZGU+W0RldmljZV0KTmFtZT1HQU9NT04gUzYyMApNb2RlbE5hbWU9CkRldmljZU1hdGNoPXVz
YnwyNTZjfDAwNmR8R0FPTU9OIEdhb21vbiBUYWJsZXQgUGVuO3VzYnwyNTZjfDAwNmR8R0FPTU9O
IEdhb21vbiBUYWJsZXQgUGFkO3VzYnwyNTZjfDAwNmR8R0FPTU9OIEdhb21vbiBUYWJsZXQgUGVu
fE9FTTAyX1QxOGU7dXNifDI1NmN8MDA2ZHxHQU9NT04gR2FvbW9uIFRhYmxldCBQYWR8T0VNMDJf
VDE4ZTsKV2lkdGg9NgpIZWlnaHQ9NApMYXlvdXQ9Z2FvbW9uLXM2MjAuc3ZnCkludGVncmF0ZWRJ
bj0KU3R5bGk9QGdlbmVyaWMtbm8tZXJhc2VyOwoKW0ZlYXR1cmVzXQpTdHlsdXM9dHJ1ZQpSZXZl
cnNpYmxlPXRydWUKCltCdXR0b25zXQpMZWZ0PUE7QjtDO0QKRXZkZXZDb2Rlcz1CVE5fMDtCVE5f
MTtCVE5fMjtCVE5fMzwvY29kZT48L3ByZT4KPHA+QnV0IGZvciBzb21lIHJlYXNvbiwgdGhlIGxp
YnJhcnkgbm8gbG9uZ2VyIHJlY29nbml6ZXMgaXQuIDxjb2RlPmxpYndhY29tLWxpc3QtbG9jYWwt
ZGV2aWNlczwvY29kZT4gb3V0cHV0OjwvcD4KPHByZT48Y29kZT4vZGV2L2lucHV0L2V2ZW50OCAo
dXNiOjI1NmM6MDA2ZCAtICZxdW90O0dBT01PTiBHYW9tb24gVGFibGV0IERpYWwmcXVvdDspIGlz
IGEgdGFibGV0IGJ1dCBub3Qgc3VwcG9ydGVkIGJ5IGxpYndhY29tCi9kZXYvaW5wdXQvZXZlbnQ3
ICh1c2I6MjU2YzowMDZkIC0gJnF1b3Q7R0FPTU9OIEdhb21vbiBUYWJsZXQgVG91Y2ggU3RyaXAm
cXVvdDspIGlzIGEgdGFibGV0IGJ1dCBub3Qgc3VwcG9ydGVkIGJ5IGxpYndhY29tCi9kZXYvaW5w
dXQvZXZlbnQ2ICh1c2I6MjU2YzowMDZkIC0gJnF1b3Q7R0FPTU9OIEdhb21vbiBUYWJsZXQmcXVv
dDspIGlzIGEgdGFibGV0IGJ1dCBub3Qgc3VwcG9ydGVkIGJ5IGxpYndhY29tCi9kZXYvaW5wdXQv
ZXZlbnQ1ICh1c2I6MjU2YzowMDZkIC0gJnF1b3Q7R0FPTU9OIEdhb21vbiBUYWJsZXQmcXVvdDsp
IGlzIGEgdGFibGV0IGJ1dCBub3Qgc3VwcG9ydGVkIGJ5IGxpYndhY29tCkZhaWxlZCB0byBmaW5k
IGFueSBkZXZpY2VzIGtub3duIHRvIGxpYndhY29tLjwvY29kZT48L3ByZT4KPHA+VGhlIGxpYnJh
cnkgcmV0cmlldmVzIGRldmljZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSA8Y29kZT4vcHJvYy9idXMv
aW5wdXQvZGV2aWNlczwvY29kZT4gZmlsZS4gSSB0ZXN0ZWQgdGhlIHRhYmxldOKAmXMgZnVuY3Rp
b25hbGl0eSBvbiB2YXJpb3VzIGtlcm5lbCB2ZXJzaW9ucyBhbmQgb2J0YWluZWQgdGhlIGZvbGxv
d2luZyByZXN1bHRzOjwvcD4KPHVsPgo8bGk+Ni4xNy40IHByb2JsZW0gb2NjdXJzPC9saT4KPGxp
PjYuMTYuMTIgcHJvYmxlbSBvY2N1cnM8L2xpPgo8bGk+Ni4xNS4xMCBwcm9ibGVtIG9jY3Vyczwv
bGk+CjxsaT42LjE0LjExIHByb2JsZW0gb2NjdXJzPC9saT4KPGxpPjYuMTQuOCBwcm9ibGVtIG9j
Y3VyczwvbGk+CjxsaT42LjE0LjcgbWFya2VkIGFzIOKAnG9ic29sZXRl4oCdIGluIGZlZG9yYSBr
b2ppLCB1bmFibGUgdG8gaW5zdGFsbDwvbGk+CjxsaT42LjE0LjYgcHJvYmxlbSBkbyBub3Qgb2Nj
dXJzPC9saT4KPC91bD4KPHA+PGNvZGU+Y2F0IC9wcm9jL2J1cy9pbnB1dC9kZXZpY2VzPC9jb2Rl
PiBvdXRwdXQgd2hlbiB0YWJsZXQgaXMgYnJva2VuOjwvcD4KPHByZT48Y29kZT5JOiBCdXM9MDAw
MyBWZW5kb3I9MjU2YyBQcm9kdWN0PTAwNmQgVmVyc2lvbj0wMTExCk46IE5hbWU9JnF1b3Q7R0FP
TU9OIEdhb21vbiBUYWJsZXQmcXVvdDsKUDogUGh5cz11c2ItMDAwMDowMDoxZC4wLTEuNS9pbnB1
dDAKUzogU3lzZnM9L2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFkLjAvdXNiMi8yLTEvMi0x
LjUvMi0xLjU6MS4wLzAwMDM6MjU2QzowMDZELjAwMDIvaW5wdXQvaW5wdXQ4ClU6IFVuaXE9T0VN
MDJfVDE4ZV8yMDA5MTkKSDogSGFuZGxlcnM9bW91c2UyIGV2ZW50NQpCOiBQUk9QPTEKQjogRVY9
MWIKQjogS0VZPTFjMDEgMCAwIDAgMCAwCkI6IEFCUz1kMDAwMDAzCkI6IE1TQz0xMAoKCkk6IEJ1
cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJzaW9uPTAxMTEKTjogTmFtZT0mcXVv
dDtHQU9NT04gR2FvbW9uIFRhYmxldCZxdW90OwpQOiBQaHlzPXVzYi0wMDAwOjAwOjFkLjAtMS41
L2lucHV0MApTOiBTeXNmcz0vZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMC91c2IyLzIt
MS8yLTEuNS8yLTEuNToxLjAvMDAwMzoyNTZDOjAwNkQuMDAwMi9pbnB1dC9pbnB1dDkKVTogVW5p
cT1PRU0wMl9UMThlXzIwMDkxOQpIOiBIYW5kbGVycz1ldmVudDYganMwCkI6IFBST1A9MApCOiBF
Vj0xYgpCOiBLRVk9ODAwIDIwMWZmIDAgMCAwIDAKQjogQUJTPTMKQjogTVNDPTEwCgpJOiBCdXM9
MDAwMyBWZW5kb3I9MjU2YyBQcm9kdWN0PTAwNmQgVmVyc2lvbj0wMTExCk46IE5hbWU9JnF1b3Q7
R0FPTU9OIEdhb21vbiBUYWJsZXQgVG91Y2ggU3RyaXAmcXVvdDsKUDogUGh5cz11c2ItMDAwMDow
MDoxZC4wLTEuNS9pbnB1dDAKUzogU3lzZnM9L2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFk
LjAvdXNiMi8yLTEvMi0xLjUvMi0xLjU6MS4wLzAwMDM6MjU2QzowMDZELjAwMDIvaW5wdXQvaW5w
dXQxMApVOiBVbmlxPU9FTTAyX1QxOGVfMjAwOTE5Ckg6IEhhbmRsZXJzPWV2ZW50NyBqczEKQjog
UFJPUD0wCkI6IEVWPWIKQjogS0VZPTEgMCAwIDAgMApCOiBBQlM9MTAwMDAwMDAwMWIKCkk6IEJ1
cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJzaW9uPTAxMTEKTjogTmFtZT0mcXVv
dDtHQU9NT04gR2FvbW9uIFRhYmxldCBEaWFsJnF1b3Q7ClA6IFBoeXM9dXNiLTAwMDA6MDA6MWQu
MC0xLjUvaW5wdXQwClM6IFN5c2ZzPS9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxZC4wL3Vz
YjIvMi0xLzItMS41LzItMS41OjEuMC8wMDAzOjI1NkM6MDA2RC4wMDAyL2lucHV0L2lucHV0MTEK
VTogVW5pcT1PRU0wMl9UMThlXzIwMDkxOQpIOiBIYW5kbGVycz1tb3VzZTMgZXZlbnQ4IGpzMgpC
OiBQUk9QPTAKQjogRVY9MWYKQjogS0VZPTEgMCAwIDAgMApCOiBSRUw9OTAwCkI6IEFCUz0xMDAw
MDAwMDAwMwpCOiBNU0M9MTA8L2NvZGU+PC9wcmU+CjxwPjxjb2RlPmNhdCAvcHJvYy9idXMvaW5w
dXQvZGV2aWNlczwvY29kZT4gb3V0cHV0IHdoZW4gdGFibGV0IHdvcmtzIGZpbmU6PC9wPgo8cHJl
Pjxjb2RlPkk6IEJ1cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJzaW9uPTAxMTEK
TjogTmFtZT0mcXVvdDtHQU9NT04gR2FvbW9uIFRhYmxldCBQZW4mcXVvdDsKUDogUGh5cz11c2It
MDAwMDowMDoxZC4wLTEuNS9pbnB1dDAKUzogU3lzZnM9L2RldmljZXMvcGNpMDAwMDowMC8wMDAw
OjAwOjFkLjAvdXNiMi8yLTEvMi0xLjUvMi0xLjU6MS4wLzAwMDM6MjU2QzowMDZELjAwMDQvaW5w
dXQvaW5wdXQxMQpVOiBVbmlxPU9FTTAyX1QxOGVfMjAwOTE5Ckg6IEhhbmRsZXJzPW1vdXNlMiBl
dmVudDgKQjogUFJPUD0xCkI6IEVWPTFiCkI6IEtFWT0xYzAxIDAgMCAwIDAgMApCOiBBQlM9ZDAw
MDAwMwpCOiBNU0M9MTAKCkk6IEJ1cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJz
aW9uPTAxMTEKTjogTmFtZT0mcXVvdDtHQU9NT04gR2FvbW9uIFRhYmxldCBQYWQmcXVvdDsKUDog
UGh5cz11c2ItMDAwMDowMDoxZC4wLTEuNS9pbnB1dDAKUzogU3lzZnM9L2RldmljZXMvcGNpMDAw
MDowMC8wMDAwOjAwOjFkLjAvdXNiMi8yLTEvMi0xLjUvMi0xLjU6MS4wLzAwMDM6MjU2QzowMDZE
LjAwMDQvaW5wdXQvaW5wdXQxMgpVOiBVbmlxPU9FTTAyX1QxOGVfMjAwOTE5Ckg6IEhhbmRsZXJz
PWV2ZW50OSBqczAKQjogUFJPUD0wCkI6IEVWPTFiCkI6IEtFWT04MDAgM2ZmMDAwMDAwMDAwM2Zm
IDAgMCAwIDAKQjogQUJTPTMKQjogTVNDPTEwCgpJOiBCdXM9MDAwMyBWZW5kb3I9MjU2YyBQcm9k
dWN0PTAwNmQgVmVyc2lvbj0wMTExCk46IE5hbWU9JnF1b3Q7R0FPTU9OIEdhb21vbiBUYWJsZXQg
VG91Y2ggU3RyaXAmcXVvdDsKUDogUGh5cz11c2ItMDAwMDowMDoxZC4wLTEuNS9pbnB1dDAKUzog
U3lzZnM9L2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFkLjAvdXNiMi8yLTEvMi0xLjUvMi0x
LjU6MS4wLzAwMDM6MjU2QzowMDZELjAwMDQvaW5wdXQvaW5wdXQxMwpVOiBVbmlxPU9FTTAyX1Qx
OGVfMjAwOTE5Ckg6IEhhbmRsZXJzPWV2ZW50MTAganMxCkI6IFBST1A9MApCOiBFVj1iCkI6IEtF
WT0xIDAgMCAwIDAKQjogQUJTPTEwMDAwMDAwMDFiCjwvY29kZT48L3ByZT4KPHA+SXQgdHVybnMg
b3V0IHRoYXQgZm9yIHNvbWUgcmVhc29uLCB0aGUgcGVuIGFuZCBwYWQgcGFyYW1ldGVycyBuZWNl
c3NhcnkgZm9yIGlkZW50aWZ5aW5nIHRoZSBkZXZpY2UgYXJlIG5vdyBtaXNzaW5nIGZyb20gdGhp
cyBmaWxlLiBTaW1wbHkgcmVwbGFjaW5nIHRoZSBvbGQgbmFtZXMgPGNvZGU+R0FPTU9OIEdhb21v
biBUYWJsZXQgUGVuPC9jb2RlPiBhbmQgPGNvZGU+R0FPTU9OIEdhb21vbiBUYWJsZXQgUGFkPC9j
b2RlPiB3aXRoIHRoZSBuZXcgPGNvZGU+R0FPTU9OIEdhb21vbiBUYWJsZXQ8L2NvZGU+IGluIHRo
ZSBjb25maWd1cmF0aW9uIGRpZG7igJl0IHNvbHZlIHRoZSBwcm9ibGVtLiBJdCBsZWFkcyB0byB0
aGUgcmVjb2duaXRpb24gb2YgdGhlIHRhYmxldDwvcD4KPHByZT48Y29kZT5kZXZpY2VzOgogIC0g
bmFtZTogJiMzOTtHQU9NT04gUzYyMCYjMzk7CiAgICBidXM6ICYjMzk7dXNiJiMzOTsKICAgIHZp
ZDogMHgyNTZjCiAgICBwaWQ6IDB4MDA2ZAogICAgbm9kZXM6CiAgICAgIC0gL2Rldi9pbnB1dC9l
dmVudDExOiAmIzM5O0dBT01PTiBHYW9tb24gVGFibGV0IERpYWwmIzM5OwogICAgc3R5bGk6CiAg
ICAgIC0gaWQ6IDB4ZmZmZmQKICAgICAgICB2aWQ6IDB4MDAwMAogICAgICAgIG5hbWU6ICYjMzk7
R2VuZXJhbCBQZW4gd2l0aCBubyBFcmFzZXImIzM5OwogICAgICAgIHR5cGU6ICYjMzk7Z2VuZXJh
bCYjMzk7CiAgICAgICAgYXhlczogWyYjMzk7eCYjMzk7LCAmIzM5O3kmIzM5OyAsICYjMzk7cHJl
c3N1cmUmIzM5O10KICAgICAgICBidXR0b25zOiAyCiAgICAgICAgZXJhc2VyczogW10KICAtIG5h
bWU6ICYjMzk7R0FPTU9OIFM2MjAmIzM5OwogICAgYnVzOiAmIzM5O3VzYiYjMzk7CiAgICB2aWQ6
IDB4MjU2YwogICAgcGlkOiAweDAwNmQKICAgIG5vZGVzOgogICAgICAtIC9kZXYvaW5wdXQvZXZl
bnQxMDogJiMzOTtHQU9NT04gR2FvbW9uIFRhYmxldCBUb3VjaCBTdHJpcCYjMzk7CiAgICBzdHls
aToKICAgICAgLSBpZDogMHhmZmZmZAogICAgICAgIHZpZDogMHgwMDAwCiAgICAgICAgbmFtZTog
JiMzOTtHZW5lcmFsIFBlbiB3aXRoIG5vIEVyYXNlciYjMzk7CiAgICAgICAgdHlwZTogJiMzOTtn
ZW5lcmFsJiMzOTsKICAgICAgICBheGVzOiBbJiMzOTt4JiMzOTssICYjMzk7eSYjMzk7ICwgJiMz
OTtwcmVzc3VyZSYjMzk7XQogICAgICAgIGJ1dHRvbnM6IDIKICAgICAgICBlcmFzZXJzOiBbXQog
IC0gbmFtZTogJiMzOTtHQU9NT04gUzYyMCYjMzk7CiAgICBidXM6ICYjMzk7dXNiJiMzOTsKICAg
IHZpZDogMHgyNTZjCiAgICBwaWQ6IDB4MDA2ZAogICAgbm9kZXM6CiAgICAgIC0gL2Rldi9pbnB1
dC9ldmVudDk6ICYjMzk7R0FPTU9OIEdhb21vbiBUYWJsZXQmIzM5OwogICAgICAtIC9kZXYvaW5w
dXQvZXZlbnQ4OiAmIzM5O0dBT01PTiBHYW9tb24gVGFibGV0JiMzOTsKICAgIHN0eWxpOgogICAg
ICAtIGlkOiAweGZmZmZkCiAgICAgICAgdmlkOiAweDAwMDAKICAgICAgICBuYW1lOiAmIzM5O0dl
bmVyYWwgUGVuIHdpdGggbm8gRXJhc2VyJiMzOTsKICAgICAgICB0eXBlOiAmIzM5O2dlbmVyYWwm
IzM5OwogICAgICAgIGF4ZXM6IFsmIzM5O3gmIzM5OywgJiMzOTt5JiMzOTsgLCAmIzM5O3ByZXNz
dXJlJiMzOTtdCiAgICAgICAgYnV0dG9uczogMgogICAgICAgIGVyYXNlcnM6IFtdCjwvY29kZT48
L3ByZT4KPHA+QWx0aG91Z2ggYW4gb3B0aW9uIHRvIGFzc2lnbiBrZXkgY29tYmluYXRpb25zIGZv
ciB0aGUgdGFibGV0IGJ1dHRvbnMgbm93IGFwcGVhcnMsIHRoZSBwaHlzaWNhbCBidXR0b25zIHRo
ZW1zZWx2ZXMgYXJlIG5vdCBkZXRlY3RlZCBhbmQgZG8gbm90IHJlYWN0IHdoZW4gcHJlc3NlZC48
L3A+CjxwPkZvciBzb21lIHJlYXNvbiwgc3RhcnRpbmcgYWZ0ZXIgdmVyc2lvbiA2LjE0LjYsIHRo
ZSBwZW4gYW5kIHBhZCBwb2ludGVycyBkaXNhcHBlYXIgZHVyaW5nIGRldmljZSBpbml0aWFsaXph
dGlvbi4gVGhlcmUgaXMgYWxzbyBhdCBsZWFzdCBvbmUgb3RoZXIga25vd24gY2FzZSBvZiB0aGUg
PGEgaHJlZj0iaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4d2Fjb20vbGlid2Fjb20vaXNzdWVzLzkx
NCI+c2FtZSBpc3N1ZTwvYT4uIFVubGlrZSBtZSwgdGhlIHVzZXLigJlzIHByb2JsZW0gbm8gbG9u
Z2VyIG9jY3VycyBhZnRlciByZW5hbWluZyBEZXZpY2VNYXRjaC4gSSBoYXZlIGFsc28gb3BlbmVk
IGFuIDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHdhY29tL2xpYndhY29tL2lzc3Vl
cy85MjgiPmlzc3VlPC9hPiBvbiBsaWJ3YWNvbeKAmXMgR2l0SHViLjwvcD4KPHA+SeKAmW0gbm90
IGEgcHJvZ3JhbW1lciwganVzdCBhbiBlbmQgdXNlciwgSSBkbyBub3Qga25vdyBob3cgdG8gd3Jp
dGUgY29kZSBvciBzb2x2ZSBwcm9ibGVtcyBvZiBzdWNoIHR5cGUuIFNvIEkgd291bGQgYmUgZ3Jh
dGVmdWwgZm9yIHlvdXIgaGVscDwvcD4KPC9ib2R5Pgo8L2h0bWw+Cg==
--00000000000018a85a0642389ffc
Content-Type: application/pdf; name="libwacom broken user space.pdf"
Content-Disposition: attachment; filename="libwacom broken user space.pdf"
Content-Transfer-Encoding: base64
Content-ID: <f_mhanca7p0>
X-Attachment-Id: f_mhanca7p0

JVBERi0xLjcKJYCAgIAKCjggMCBvYmoKWzMgMCBSIC9YWVogOTAgNzUwLjU1MTIgMF0KZW5kb2Jq
Cgo5IDAgb2JqCjw8CiAgL1R5cGUgL0ZvbnQKICAvU3VidHlwZSAvVHlwZTAKICAvQmFzZUZvbnQg
L09CTFBDQitMaWJlcnRpbnVzU2VyaWYtQm9sZC1JZGVudGl0eS1ICiAgL0VuY29kaW5nIC9JZGVu
dGl0eS1ICiAgL0Rlc2NlbmRhbnRGb250cyBbMTAgMCBSXQogIC9Ub1VuaWNvZGUgMTIgMCBSCj4+
CmVuZG9iagoKMTAgMCBvYmoKPDwKICAvVHlwZSAvRm9udAogIC9TdWJ0eXBlIC9DSURGb250VHlw
ZTAKICAvQmFzZUZvbnQgL09CTFBDQitMaWJlcnRpbnVzU2VyaWYtQm9sZAogIC9DSURTeXN0ZW1J
bmZvIDw8CiAgICAvUmVnaXN0cnkgKEFkb2JlKQogICAgL09yZGVyaW5nIChJZGVudGl0eSkKICAg
IC9TdXBwbGVtZW50IDAKICA+PgogIC9Gb250RGVzY3JpcHRvciAxMSAwIFIKICAvRFcgMAogIC9X
IFswIDAgNTAwIDEgMSAzOTcgMiAyIDU0MiAzIDMgNTk4IDQgNCA1MjEgNSA1IDM5NyA2IDYgMjUw
IDcgNyA1NzcgOCA4IDMyMiA5IDkgNzc3IDEwIDEwIDUwNS45OTk5NyAxMSAxMSA0NTYgMTIgMTIg
NTUxIDEzIDEzIDkwNSAxNCAxNCA0MjggMTUgMTUgNjEzIDE2IDE2IDQ4OSAxNyAxNyA2MTYgMTgg
MTggNDI3IDE5IDE5IDU4MV0KPj4KZW5kb2JqCgoxMiAwIG9iago8PAogIC9MZW5ndGggNDI5CiAg
L1R5cGUgL0NNYXAKICAvV01vZGUgMAogIC9GaWx0ZXIgL0ZsYXRlRGVjb2RlCj4+CnN0cmVhbQp4
nG2STW/iMBCG7/yK2QMSPbCJoZClqpBKACmHfqhUu+dgD6wlYlu2c+Dfr+1x6KqqJUiemXHed+wZ
/3g7TJ+EPuJ0/rOEd3S6txyn9XNrRuPxVvO+Q+VfEAWKIesewFjNHXqom22jpA+ljeKXXuBQ813J
Bs9SfRZEDah753UXkh/SX0JwQgFInqARQVz6K5R3oeQ3Wie1egAWYKdErbtozo2KrAHFWxA9BNGT
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
jcBJOZxoV6+/th0bndzHRMRlr1qjz3d25xPifwP8c2wvCmVuZHN0cmVhbQplbmRvYmoKCjExIDAg
b2JqCjw8CiAgL1R5cGUgL0ZvbnREZXNjcmlwdG9yCiAgL0ZvbnROYW1lIC9PQkxQQ0IrTGliZXJ0
aW51c1NlcmlmLUJvbGQKICAvRmxhZ3MgMTMxMDc4CiAgL0ZvbnRCQm94IFstNjI3NSAtMzI4IDYx
NzEgMTAxNC4wMDAwNl0KICAvSXRhbGljQW5nbGUgMAogIC9Bc2NlbnQgODk0CiAgL0Rlc2NlbnQg
LTI0NgogIC9DYXBIZWlnaHQgNjQ1CiAgL1N0ZW1WIDE2OC42CiAgL0ZvbnRGaWxlMyAxMyAwIFIK
Pj4KZW5kb2JqCgoxNCAwIG9iago8PAogIC9UeXBlIC9Gb250CiAgL1N1YnR5cGUgL1R5cGUwCiAg
L0Jhc2VGb250IC9TT1ZMQ1grTGliZXJ0aW51c1NlcmlmLVJlZ3VsYXItSWRlbnRpdHktSAogIC9F
bmNvZGluZyAvSWRlbnRpdHktSAogIC9EZXNjZW5kYW50Rm9udHMgWzE1IDAgUl0KICAvVG9Vbmlj
b2RlIDE3IDAgUgo+PgplbmRvYmoKCjE1IDAgb2JqCjw8CiAgL1R5cGUgL0ZvbnQKICAvU3VidHlw
ZSAvQ0lERm9udFR5cGUwCiAgL0Jhc2VGb250IC9TT1ZMQ1grTGliZXJ0aW51c1NlcmlmLVJlZ3Vs
YXIKICAvQ0lEU3lzdGVtSW5mbyA8PAogICAgL1JlZ2lzdHJ5IChBZG9iZSkKICAgIC9PcmRlcmlu
ZyAoSWRlbnRpdHkpCiAgICAvU3VwcGxlbWVudCAwCiAgPj4KICAvRm9udERlc2NyaXB0b3IgMTYg
MCBSCiAgL0RXIDAKICAvVyBbMCAwIDUwMCAxIDEgMjY0IDIgMiAyNzEgMyAzIDQ5MyA0IDQgNzQ3
IDUgNSA0NTcgNiA2IDQyOCA3IDcgNTA0IDggOCA3OTAgOSA5IDI1MCAxMCAxMCAzOTAgMTEgMTEg
MzcyIDEyIDEyIDUxNSAxMyAxMyAzMTYgMTQgMTQgNTA1Ljk5OTk3IDE1IDE1IDQ0NyAxNiAxNiA1
NDIgMTcgMTcgMzEwIDE4IDE4IDUwMCAxOSAxOSA1MTkgMjAgMjAgNTM4IDIxIDIxIDMzOCAyMiAy
MiA1NjAgMjMgMjMgNTMxIDI0IDI0IDIyMCAyNSAyNSAyOTcgMjYgMjYgNDk3IDI3IDI4IDM3NSAy
OSAyOSAyMjAgMzAgMzAgNDI0IDMxIDMxIDY4NSAzMiAzMiA2NjEgMzMgMzMgNTEyIDM0IDM0IDI5
OCAzNSAzNSA2OTkgMzYgMzYgNzAyIDM3IDM3IDgzOSAzOCAzOCA1NTcgMzkgMzkgNjM3IDQwIDQw
IDcwMSA0MSA0MSA0MzUgNDIgNDIgMjk4IDQzIDQzIDU5NiA0NCA0NCA0ODUgNDUgNDUgNjUyIDQ2
IDQ2IDY5NSA0NyA0OSA0NjUgNTAgNTAgMjM2IDUxIDUxIDI2OCA1MiA1MiA1OTcgNTMgNTMgNDkw
IDU0IDU0IDIzNiA1NSA1NSA1ODggNTYgNTYgMzUxIDU3IDYxIDQ2NSA2MiA2MiAyNzIgNjMgNjMg
NDY1IDY0IDY0IDQ4NSA2NSA2NSA3MzBdCj4+CmVuZG9iagoKMTcgMCBvYmoKPDwKICAvTGVuZ3Ro
IDY0MAogIC9UeXBlIC9DTWFwCiAgL1dNb2RlIDAKICAvRmlsdGVyIC9GbGF0ZURlY29kZQo+Pgpz
dHJlYW0KeJxtVE1v4jAQvedXeA9I9MBiO45DqwqphCJx6IdKtXuG2LCRiBPl48C/X9tvoKtVI7Xw
ZiYz7z3smfx4382eTHOws/QnZx+2b8autLPiZd8mk8m6KcfauuHVWmPNNds/sLZryt4OrNiut64a
fOnWlefR2GvNdyUre6rcV0GYwYqxH5raJz+r4eyDUwRY5MS2xg+vhgvjd77kl+36qnEPTHjw7EzR
1IFcn8xpBpu/+6E7P/RYOdPRJHYIcxMhmanKgVD8X9ZeZXh5d+kHW2/dsWEpqszYUiXzz/zDf+2H
7sKmkdgdM/aIzFtnbFe5E5teyf6T3I1te7aBJOMxap2Jn/Mg/nVfWzYnwbcoqWTiK/R5aS01mP9+
acwVCFAsfaRv96Xt9u5kk0funyV73PhnGSb+l9cZXjscyz/7Lpbf+3LOJV8GJCXQAugJ6D4isQYq
gDKgNdAC6DmiVESUomeKCT6YIBiRBNoApUArIAVUAGXgQpUaOTBLcyAwS8HalzCUJBjE0DqBFIax
CegGpIhZDgRmEooUuEj0VOCioEGBiwAzBS4K2hW4CMxTcFDSBOICBxUclCkQHJQKiHjCiYxcQi4j
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
b9OfluwNTDfT1tb17FnhACzBLi4fLEMuX9sPmhydQvAA9Wz+3+80C/1oLzowyPsZOfzkSXA2fABm
//JeR3vEa7sfE/gnuuQg08k0N3bRB3/tlTd4AL1/rWE6maamzt/cy///Vyek8gplbmRzdHJlYW0K
ZW5kb2JqCgoxNiAwIG9iago8PAogIC9UeXBlIC9Gb250RGVzY3JpcHRvcgogIC9Gb250TmFtZSAv
U09WTENYK0xpYmVydGludXNTZXJpZi1SZWd1bGFyCiAgL0ZsYWdzIDEzMTA3OAogIC9Gb250QkJv
eCBbLTYyNzUgLTI1NiA2MTcxIDExMjVdCiAgL0l0YWxpY0FuZ2xlIDAKICAvQXNjZW50IDg5NAog
IC9EZXNjZW50IC0yNDYKICAvQ2FwSGVpZ2h0IDY1OAogIC9TdGVtViA5NS40CiAgL0ZvbnRGaWxl
MyAxOCAwIFIKPj4KZW5kb2JqCgoxOSAwIG9iago8PAogIC9UeXBlIC9Gb250CiAgL1N1YnR5cGUg
L1R5cGUwCiAgL0Jhc2VGb250IC9FVE9MVkcrRGVqYVZ1U2Fuc01vbm8KICAvRW5jb2RpbmcgL0lk
ZW50aXR5LUgKICAvRGVzY2VuZGFudEZvbnRzIFsyMCAwIFJdCiAgL1RvVW5pY29kZSAyMiAwIFIK
Pj4KZW5kb2JqCgoyMCAwIG9iago8PAogIC9UeXBlIC9Gb250CiAgL1N1YnR5cGUgL0NJREZvbnRU
eXBlMgogIC9CYXNlRm9udCAvRVRPTFZHK0RlamFWdVNhbnNNb25vCiAgL0NJRFN5c3RlbUluZm8g
PDwKICAgIC9SZWdpc3RyeSAoQWRvYmUpCiAgICAvT3JkZXJpbmcgKElkZW50aXR5KQogICAgL1N1
cHBsZW1lbnQgMAogID4+CiAgL0ZvbnREZXNjcmlwdG9yIDIxIDAgUgogIC9EVyAwCiAgL0NJRFRv
R0lETWFwIC9JZGVudGl0eQogIC9XIFswIDc0IDYwMi4wNTA4XQo+PgplbmRvYmoKCjIyIDAgb2Jq
Cjw8CiAgL0xlbmd0aCA2NzEKICAvVHlwZSAvQ01hcAogIC9XTW9kZSAwCiAgL0ZpbHRlciAvRmxh
dGVEZWNvZGUKPj4Kc3RyZWFtCnicbZRbT+MwEIXf+yu8D0jwwNaJnQQQQoKWSn3gIop2n0vispFo
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
b250RGVzY3JpcHRvcgogIC9Gb250TmFtZSAvRVRPTFZHK0RlamFWdVNhbnNNb25vCiAgL0ZsYWdz
IDEzMTA3NwogIC9Gb250QkJveCBbLTU1Ny42MTcyIC0zNzQuNTExNzIgNzE3Ljc3MzQ0IDEwMjcu
ODMyXQogIC9JdGFsaWNBbmdsZSAwCiAgL0FzY2VudCA3NTkuNzY1NgogIC9EZXNjZW50IC0yNDAu
MjM0MzgKICAvQ2FwSGVpZ2h0IDc1OS43NjU2CiAgL1N0ZW1WIDk1LjQKICAvRm9udEZpbGUyIDIz
IDAgUgo+PgplbmRvYmoKCjI2IDAgb2JqCjw8CiAgL1R5cGUgL0Fubm90CiAgL1N1YnR5cGUgL0xp
bmsKICAvUmVjdCBbOTAgNzIyLjM2ODE2IDEzMy40OTQgNzE1LjEzMDJdCiAgL0JvcmRlciBbMCAw
IDBdCiAgL0YgNAogIC9BIDw8CiAgICAvVHlwZSAvQWN0aW9uCiAgICAvUyAvVVJJCiAgICAvVVJJ
IChodHRwczovL2dpdGh1Yi5jb20vbGludXh3YWNvbS9saWJ3YWNvbSkKICA+Pgo+PgplbmRvYmoK
CjMgMCBvYmoKPDwKICAvVHlwZSAvUGFnZQogIC9QYXJlbnQgMjQgMCBSCiAgL01lZGlhQm94IFsw
IDAgNTk1LjI3NTYgODQxLjg4OThdCiAgL0NvbnRlbnRzIDI1IDAgUgogIC9SZXNvdXJjZXMgNyAw
IFIKICAvQW5ub3RzIFsyNiAwIFJdCj4+CmVuZG9iagoKMjUgMCBvYmoKPDwKICAvTGVuZ3RoIDI3
NjIKICAvRmlsdGVyIC9GbGF0ZURlY29kZQo+PgpzdHJlYW0KeJztXFmP3DYSfu9fobGdYxIPhzcp
23tgg81DgF1g4XlL52HHwQRYrBtYeYBF/n3YOihWsUpS99jxxDAMq6clsljHV8VikWrVyPTvSqVL
tErE2Mbmzdvd/3aqf6CaNl2kEsZEF93x0fXP3v3S/fvX5s27nWzevTnsrr9PbZywzc3d7m83Y8+e
ZCtaY5qbt7sfv95LKdN/dZme6Gb6qsdPM37a8dONn378DP3nLeh1318Pwz01ULjrrx3qPY6i/GUT
x6HvxlsDYanl+KlQ15ExrWE75WG7/NwQTKVelz81Nz/s/n6z+9fu+l33y+2gPCmss63U6Y/oZNL8
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
y4Nu3t1Y1RhZ6w2QbGZt8lnqtAjNcFn5nos4+eUYeiVvvBZap/Ivgbp6+hkiVxxIQ0HKOfyK6Q3i
G2qk4aL1vnx6tV/w9j273jWmkJ55E8kZ25e4QPCk3I08gMeUUJw97kMloidWUNolOVukzJ6NF+MX
EOFbRk14ndE3/rLE3UtEDqwZXkE90AuGV9CtudWCBhDov/yp8NrHtjSY/RFVL0Pm/M+oPcL8VDCG
rYzcxssJ5bF5gadpSQxyuOo5qP+8KFA29ICsowy4INOz8RzePCOebK+/fQzv+ctn71n3ngbRwxUG
tYcgAYm8LA334lR3O6GautUX9wTMP3Vvq6uBH8PZcJb02d8gKj/8PESB7hTsby8R/kEco67ffRzH
MP6zY3yCjlEVcf8ofkGUiDUg42hNVmxKqKnhvqPcqOp8Xz7Fkp68lCz7/5UyY6RAykmwP3dpLfiy
kQ9GRKtiEYyQ+85FluN7h9ar8L5+U6KiRxWLOkQyV1LAMSXupwfIUc476VRLj6ov7+cF/WqY/AKF
qU9X3nK9uELZWmFHaeG1VobCRT+79GEDoXPQVVtCEs8jJ89h771sY1PNxoagSdFoxW888FR1hK87
E2YBEO1m6txr14uW5Y5R+RhTka4FYp5wcsmUXgSR+OEO3dJOAWECd7WI8QLmHB5xIo7dA8bycETh
GrzavfLWKOSWObkFZzJsHo0ZpSBCo4KyG3yzfg/OjRUvRdCDazAVL/zYi4ajFMftmMJnkKkso4ff
3YIJQRC63G+NNNTT7prCTadN1TmkvCjvvATqMYRMyDLYRW6hFckivYf6mLDDbpOlyOu3CYvb1tLW
d+TjE9l4IZXdJjJuWwv4qrqjHp/ITgor9TaRcdta5JfVnfYxiAyTzLTbJGSUpgnRp3VvKFcm7dTn
N+3ZQ5EKZW5kc3RyZWFtCmVuZG9iagoKNCAwIG9iago8PAogIC9UeXBlIC9QYWdlCiAgL1BhcmVu
dCAyNCAwIFIKICAvTWVkaWFCb3ggWzAgMCA1OTUuMjc1NiA4NDEuODg5OF0KICAvQ29udGVudHMg
MjcgMCBSCiAgL1Jlc291cmNlcyA3IDAgUgogIC9Bbm5vdHMgW10KPj4KZW5kb2JqCgoyNyAwIG9i
ago8PAogIC9MZW5ndGggMTMyMgogIC9GaWx0ZXIgL0ZsYXRlRGVjb2RlCj4+CnN0cmVhbQp4nO1a
S28bNxC+61es0cSwgXo8nOEzdVvETVygtwK+VT3ULtxTDNTRpf++lPahIZdcCbZcx+lCwBLLJYfz
+Gb4LVeqwfg7U/HitQLvg29uPy3O/7Tmr4c//mluPy+w+Xx7vzi/Uo1SzfXd4vJ6ofpZAZvggNg3
158Wv50sEdGf/t5c/7L4eJ0ODMBWjQafry9LZFy3YX35TvZ8v7lZtV3Ebav4tPHNSXuDrmu7h6i6
QW3/jRSA7rQ5c8NMm7bkevGb9r5sBkYnKLBk9zR4NHqHxe+EwjedgkYqdtTbJ21RNrGznXAv+zg6
jXTFa/dZb+rDh+2KWwmskxWp8yEmAVMTug6rKU60Xgkj2yE/pGuwSdZwycqDsyp4WEmL0E3YcJ+M
NKk0VFV0kAVUel905KN3oOP8oPmQRWKVeVJG/2kZdH5FjQdfKB5KW9CGtg4YpK2k3b1WYUiRvtvI
SSHBJnKPGBYP+1CyG2SJkShGks1cqTMwZM9jim0NLhVLYgbUjlzB7FUaPkpSr480lULSaUU6CXSa
ig97JcdDIR2SIoJ1xB2VVreDQ/7uvNAG3QSw0fr1PlNGBjYWrDeBXZ4bF1J+Mc7bikK61CYavs9C
6NLQt/DCTGw/uB9EWRrg4JAMpb1YzmYw7lCcMrXGumPqgj7SZFLD0hXebi/FKhVDFQCD8s4IqN6M
4pCUlfscK+u23cjvJBj76tNDpru/SQTfSfiR3NdGprUzGjmhLwSUFcWOXFRsZgU6OK9Eeh6NTO7w
zpsM+raMvxyXrTpnU+Ds24tq51sJBZCPz4bHIAG6f91bC6r4RDOEOFXCoNveUyB0nYlDTMk7j66x
w+R32QjzaL+G54pIqHjTWGAMNkhvlsHSV5sgb7aBrnSX4j855iLv3sMxTnqlWBJt1W+iaNJo1UL7
uA18j5HHlQhZD04ZK0rA5Qjsl1J6v9pPEuR9Ufumu3Els96sL80QgGMJ+Depe1O/fBjmfKhY4RUo
imYInJ2MzFgmBGS0AyalE5eFVB4V5AzJmO2bA8HMcz7bhPuixLZiXmAwJGuSHhm3KdNJLI6k6tVt
Dw0EZq2nZG+i+j4R1ylcq6JKeWAO8gV4LPbjIPuqIHsgGVp0DsVXP/W+pjgjOG2YphRvN/ZepEoT
gWwJwtXaUtMj7kPKKJqMuUi0jRK24Ma6pR7jm1lAO/PO5YvyTgL3v2KdFEtOBF/QM+vc+kQ5MN56
N9POQ9BOogAhkFcz73xp3lljbKQJOHh57PEaiScZDR518obzHMxzbw5JyeHuz6mwev2x8XOFQstP
oJhT4l08B1PW+MOyTIp7ZzTYPIJkHlfyAEtw2Ohhhsvy8LSTUYMmP03DJ2inq57wWPCsp3n4k2gk
x29pVluajy/xJWkkxzqEhugr5JHplNHL9xAblWg0JEgrBKW7NxtV9VDUrr9YeMUzPd36xMVPF1bj
TE8PQk85KCA3c9OX5qa79jaNDNbFj3Ovm6PqSALQK++/DI76o1w1Iai1zS0yI9DeeXoedqo1gk+/
wO7DTieIaTxABArBPuH48+AUU1sDDs00xZ+gmG+XuLtK7mp3MXodEIySx2EzmfzvyaRBgkDxteEr
ZpPL4W9QWPibVY0cGmWAKbCZyeHWJ+TAseGZGx6CG5q4GSmt5Pv0TA8nQ/C89LBaIw2B0e6Vfzc3
VkMwrL6E7+b5/1v3IpPHclJ+2sk1q50DNkE9D500PoCz5hFHnWaQ+Gv6d8pgIoFHbpy3oCj5XIj9
nH8B3YqrJgplbmRzdHJlYW0KZW5kb2JqCgo1IDAgb2JqCjw8CiAgL1R5cGUgL1BhZ2UKICAvUGFy
ZW50IDI0IDAgUgogIC9NZWRpYUJveCBbMCAwIDU5NS4yNzU2IDg0MS44ODk4XQogIC9Db250ZW50
cyAyOCAwIFIKICAvUmVzb3VyY2VzIDcgMCBSCiAgL0Fubm90cyBbXQo+PgplbmRvYmoKCjI4IDAg
b2JqCjw8CiAgL0xlbmd0aCAxNzEyCiAgL0ZpbHRlciAvRmxhdGVEZWNvZGUKPj4Kc3RyZWFtCnic
7VtLb9w2EL7vr5CRB+I2S3P4ZuCgSOq4bm8BfKt6qF24Jy9QJ5f++1K7osQZklrt2objdJFAArnk
cF6c+UiNoeHh3xLCwylgznnXXN8u/lnA+gdoPO/+h66Tv4z+++7Pf5vrLwvefLleLU7OReOYay5v
Fh8v+wlrSoYZp720qrm8Xfz+puWcq+5x2j1aLnj3/tQ9XnSP8003yO79Kh0T3mrX9vEfzeVvi0+X
hCfwjHtwVk/xJAeefkx5OiNr1daQwJS3DsTUGu3d0B+6oCS7eoi3rTCpJPNcTushMGRTBk2Ry2GB
z/OdI/gSaMWkgpSDNi7xddOSPOXGd4933SN263SS7+f00kvRv2XyI+9nSDvQSkbyZKToZd34QjtY
iqM1x9+lHNRwcg4NAJVYSMm4ssIWBe8F5lHddnSR0JKF3q+Yr2j0wWA8GXVHeI8yAZpD6B43rnmD
2doY/mjdWKWjo7aw25hBJSiOgLFMr+XvwskOweMkc9CirSOf1R2RUvhAzGiJQDrxt4FsHBwHCewT
G8pHBU+NZCWZIfkWxkVJz4h3jlUQbS00Fgyv8Gp8zI+X7VVmh01X7w0rrNLNiu/XjZvUHcFgl+3b
V4jwDXIznS5ARdvMaNIJMRj0O2c0M88sRX3g/fzgfpTpo6co1xvsbdk5qdNueF1OeW58n1Y7X6V+
wtKfl8PPLPXe+YFxIuHluSRmDJJORK4QXdLO3kF4mPyOjNB769U/lkV8RZvaMMm98ak2y84SQ5FP
G6OhK90l+0+OOaXdMxRjU60U46Wp6i2JqCJblb5/aPke6X3GyMmwaByzoE0SBD5m7v4xXSIu+XPq
5jHmvegblgi4HvSyezQDR69Tl3+JFYw1czbMOatI4YCBCGIknvYmE6NFCCVLkCiy8rawmbN4TXyZ
k7Qag0W260mO3pjpdUU2L5kW0/B2HaWRIY5SvqspkWvmpVSTx5q1ST8gcj3X1ZMJOCall27/09IA
QFTSuf8RirZrjEvOrNJy3+NO4kz3OtFASEOgQTzkkYasEJCrNzLN/QdM+gSY1HEmjefmu8ek6Hj1
vgrRBbNppPvf41ERInRwEq8OgPQhAKmAcGB3xtkDIn16RNoxX7OT8Mx74eB5o1KhBJPepTc/jwJL
ZwLMs3TVXzClegQKd3yOq/QQtzP+nCIfgIgAbuTDQlBhPTNg9D4Q9HVlS/Bh7+nhMRfpbUWCGVle
Wv0e2FaE3Br2vt4T2tagquSKKeGmjxD3gqoyxAKhgqMeoGr7hFA13PMzo4xQ3zFUbQg9ahxAHA07
ZEOEp/peZ73qxWsIqVyLw71rohJjmNIO5AHnPgTOlTZ8iTKKH3Bu+/Q4t5o6PTBhnzfCDXmZGRu+
bn4bCJfWG6w7EdKtpTcFhnEHzj0OzA0QiSlnndgN5k4gXKU4c99YSUq4OmXCe+OeslwkPxp8pgUb
RnU7D1+q9Mm9Lx04bpYqJGnnlOxLB+6wswK+4l/VppULISbo4/xUHT5oDlc0lIau0MArFClKlEEm
BROAYg+hNXiE1DPFmlg2XAY0S0vXjdUfJc2So1IPG8u08ZRdhuI2Vt8dZhZ9JSoSj6zaVFaO8e8K
aVqPRlmC7qfcPIBb9Ikxh9/pNh1H9YRvSG8MCWK2AxRjR7cptWbGoLuShLXjZlCXFJgHor7AQ/iM
A04oZairlFy7NH74cJeu28eswvgrxBC2X1VR+aJQYBLt2sIsGjYE9sB8kYhmYdQs8EG1vDLxLSJ/
RbYKYKfMFi1GFDI7R+SzNVeNMbkfWCK92e4CpX0f9TsWyhVrv1TAnQEb+ZJv73QCDl4ouioypUkE
6AdsOQ5n02eejctVb8YI5sCGK5/rWwIAwl1e+tU3K0faUlkIOkAaBYrS6QxkJFPW6a3Bf4tJpGFa
CxM+fNI1djQI6KAF40HuZxAyfcfLimw++ci2Vc/hdtTO0TIOK3ijZcOr+5BQTbNgHl23GFAIYNYH
5PssDbjFMFJoxk1A9XNsg+Pj3tYY4i3BdIJcalLkixDqmIxHFSXF1EVhu1Diwu2xksWcT+FJUtCO
CnwJJI2hXYpCqp9STN87nDsLVcOVcuMrtD2jD0DGKZ1H4egqZ5LPZpzk2BK+HGxDMive3bklkQjo
In8GYzMrtiupxttw6SwDmNyxwLrd8+LvdIfi4XGnrN9L3CltwUc3a6QDL9qdQxcywGhMdINzMb/m
l8qRv8t/iFAQo3LFeLFLse0WXqgZhcl4iTr4FSsm/0hTuSAQPgRhx0OCcYaBQAUpP8U5/wHwJuyd
CmVuZHN0cmVhbQplbmRvYmoKCjMwIDAgb2JqCjw8CiAgL1R5cGUgL0Fubm90CiAgL1N1YnR5cGUg
L0xpbmsKICAvUmVjdCBbMzg0LjIwMzIgMTk4Ljk1ODI3IDQzMi44MjQ4IDE5MS43MjAyNl0KICAv
Qm9yZGVyIFswIDAgMF0KICAvRiA0CiAgL0EgPDwKICAgIC9UeXBlIC9BY3Rpb24KICAgIC9TIC9V
UkkKICAgIC9VUkkgKGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHdhY29tL2xpYndhY29tL2lzc3Vl
cy85MTQpCiAgPj4KPj4KZW5kb2JqCgozMSAwIG9iago8PAogIC9UeXBlIC9Bbm5vdAogIC9TdWJ0
eXBlIC9MaW5rCiAgL1JlY3QgWzQ2OC43OTg1NSAxODQuNTcwMjcgNDkxLjExNzU1IDE3Ny4zMzIy
Nl0KICAvQm9yZGVyIFswIDAgMF0KICAvRiA0CiAgL0EgPDwKICAgIC9UeXBlIC9BY3Rpb24KICAg
IC9TIC9VUkkKICAgIC9VUkkgKGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHdhY29tL2xpYndhY29t
L2lzc3Vlcy85MjgpCiAgPj4KPj4KZW5kb2JqCgo2IDAgb2JqCjw8CiAgL1R5cGUgL1BhZ2UKICAv
UGFyZW50IDI0IDAgUgogIC9NZWRpYUJveCBbMCAwIDU5NS4yNzU2IDg0MS44ODk4XQogIC9Db250
ZW50cyAyOSAwIFIKICAvUmVzb3VyY2VzIDcgMCBSCiAgL0Fubm90cyBbMzAgMCBSIDMxIDAgUl0K
Pj4KZW5kb2JqCgoyOSAwIG9iago8PAogIC9MZW5ndGggMTg1NgogIC9GaWx0ZXIgL0ZsYXRlRGVj
b2RlCj4+CnN0cmVhbQp4nO1abW/bNhD+7l+hYujQYA3D4zvTYtjWbWgLbMDQfKv7YW6RAsNiYI6B
Yf9+tCVKvBNJS6kXxGuRxIokvtwdn3vujjQ0PPycQ/hwCphz3jXvbxZ/LWD/AhrPd7/h0cUHoz9u
fv+neX+74M3t+/Xi4mfROOaaq+vFD1ddh/1IhhmnvbSqubpZvH2y5JwvueC162V7w3X30Oyuz0lL
tbu+Sm+Sq4g9z941V68XP10RocAz7sFZPV2oJZe2u0dyhT/Zvd9fnxemlMCUtw7EnCnx9Ty98Xkh
uEpeRgu2kndmlZ1xZDoM7p7oZNPGj/sPtBov9zfX+89N+wI6scCi+xVSq+2xRVZdYxv3Nt/3aNIO
Mi62JSIT23GBjLFNe70sLJaSzIe558EDzf+UCKdr2NCGSe6NPxI0lpNdR2c+Km5jHLOgzSdAeHzt
EXd3b++vBbEdMBBB7mOK3QFzm4K2RWDRNUZO1d7zMSxj70f5fu1Lh+0WYS8hK+jAWvvnX41mjvBN
hCp5h5dMi3nOcdCcg9NcHjDm2UxjlrQArpmXUqkj6rFNYErCAkE99Aq96v97PVL26aB293jc5nLQ
m8yZXMWoUTcqtyXzgGNSeumOuswqlScBLccg7cNOznZClkSWnFml5XH5SU5xleoy16wcIg1oEBVn
Os/68xzimROTuYj8EXOoTtmWZYvOpDXT2sKsEDZCQ0kN0iL2LApjLPNGzku17hCHojAGW4wXs07H
mTSem4eVCgtm7zMRFoF3gyW8OvVEOBr5ZHLhhozX47W7hzwTtIPw1JKXNfcTYJl2xtl7yp6F8Mx7
4eChp89CCSa9s+rE8mehFXNcfUp9svySQKcGDQFKADfyxFNoYT0zYLT7kkJnzRNCawjA+nQyaMkV
U8IpdToZtATDnFS1OuUkMmgZophQwQgPIYOWYfvXKCPUA8ugZYhEXAvxkBJoaQxT2oG8x71kG7ba
jeL2hFPoH4/mcP9l6lx0EA9MnLL5vz5p8weeZMaGY6V7KjFUCDLcgXMPvcQIwZspZ92pbdErxZmb
d0o4mWQ/yxIjbIMy4b1xJ15iKKOZ5fqopdL/qMRQIRMAAG1Pp8ZQnjMNxz0+OnaJ8Vv2Gw4QDkXo
Fxx8OBXlnHmtE4UYGrgLppEDuU1xnySY7fvtWRjWKhYgH1a1sw/XGMDZNnE8mc7an37bgyNsUMua
HOvks5+h16M4Q0eVYM+aOOJ1ZS6D5Fmly5nMypFkda3X5dkE4B4gD9kprifYgxbVRHZAPTcVG0iE
lU1mnaboxnuAN8PQU+Ame19uzvu3YHGrzlQdHKSebrgsQ+w8CjQLJT2mCFRFd8AhEOwho5Ght3c1
ZmW5V+n8vUXijrk4axwx1xqJ0ptu3HBLFy0FSdfSZAC096tz6j7Zd11/IkycEb8F7IZTpMsoNSyJ
GXfgKmtiFK4HAOSGX+PVyOgaglcRbTKkGA4StH23LHCBE8xbY5zuRl+jhqslIQTavGqadRaJiT/l
J99knZHwYB8vRVG0doBvsGhlzbMYJ1RQjj1ktIu4RLvrvox9lj65OGSJIiOPpM4zWVGwsnNkxyZL
YSaKEe1DVmtTsW0WXAYNsyYKzOHy2vACyzMHYwNvJYGoP4YkJF4JD5ozMB6Fh1E+IHJ+QAJD/1zi
wFHPImIevAtx2jJQWrW6FGgsS/K0L1m23HssO6aLcvtN8T0syzRU7kVsUdHHVnwzza9Qv0dkGTMp
S5ph0jlNRpfDMsbsb9yixCwRmRe3m4+rtkbgYRc41DYi/OM0925fNKTIlU4xEeCewy921tUsrKyJ
X1oi3Ys3OenevPh1ER6q5u/w9nX4+2Px9l0Q9MNCNb8sElkhnGGFau1moaRgTig3PPtz8SZTKKU6
J33GPlvyo4ZgADnrowO2WQ0UA7znGD11fYucY9TuC044JbUZlHXIpmTNfDi30IbGCsQNnOyBEg9d
FQfjlAtoCw557401Wybe0xFyyWV/FaUYRUc5kGSQ5tl0iVR8K+QRuSiEB30y4GNCCNpdHy/HfDpo
riiWqRISiutG9lVzKVXRiMtiIBgvXcRcJfcpVAjl2XsSvgsVqt03yb0LeyY5v5rIbukgminQe5IK
BzMQdpeShxNYKuk0Eqdm0XJNEfblvNJYLZJ0jA5qNHGuxO2RX3VowVnjHpffY2PxsOJiIMGytN4z
6XC93cJWLhHznMvA4k45DgXu2ZRbcl0ZpUaHPUnJjOOvKJecNdpnaJ9M+S0y1Hqi7GnmMWozcihT
0bcQOaYJn3JKRg5DCeHuqzYhG8uPr+Z12BwWOXoJKTtwkZTvaQZhxvsC1Z7jZJW2IVV7bQdoPvKr
icC65M0WJLMWMPeQRHeZoVYS0tLdr+soLI4gKMXiQ6+neDkxZuNy5jydWJHsU+1mHyYk22V5kiA1
dP/VHDzRFr+ly96aoCIvajgqdaI2hRMR4XU4W+aysc4wEOi72M9ij38BDxAvUQplbmRzdHJlYW0K
ZW5kb2JqCgoyNCAwIG9iago8PAogIC9UeXBlIC9QYWdlcwogIC9Db3VudCA0CiAgL0tpZHMgWzMg
MCBSIDQgMCBSIDUgMCBSIDYgMCBSXQo+PgplbmRvYmoKCjMyIDAgb2JqCjw8Pj4KZW5kb2JqCgoz
MyAwIG9iago8PD4+CmVuZG9iagoKMzQgMCBvYmoKPDw+PgplbmRvYmoKCjcgMCBvYmoKPDwKICAv
WE9iamVjdCAzMiAwIFIKICAvUGF0dGVybiAzMyAwIFIKICAvRXh0R1N0YXRlIDM0IDAgUgogIC9D
b2xvclNwYWNlIDM1IDAgUgogIC9Gb250IDw8CiAgICAvRjAgOSAwIFIKICAgIC9GMSAxNCAwIFIK
ICAgIC9GMiAxOSAwIFIKICA+Pgo+PgplbmRvYmoKCjM1IDAgb2JqCjw8CiAgL3NyZ2IgWy9JQ0NC
YXNlZCAxIDAgUl0KICAvZDY1Z3JheSBbL0lDQ0Jhc2VkIDIgMCBSXQo+PgplbmRvYmoKCjEgMCBv
YmoKPDwKICAvTGVuZ3RoIDMyMAogIC9OIDMKICAvUmFuZ2UgWzAgMSAwIDEgMCAxXQogIC9GaWx0
ZXIgL0ZsYXRlRGVjb2RlCj4+CnN0cmVhbQp4nH2QvUvDUBTFT6xalaqDHRwUghYnBdHFSaGVdhKh
H9LWKXnph5DEmBcpztrBSXEQR3URxLmOdvAPEAQHURA31wo6aIn3NUKqoPdyuT8O98LhANKTzgze
KQOG6djJRFTO5vJy8BkBhNGLAYwqjFtLqXgaVFypcObYOn7U2x0ksW+nyoqpbb1creTnpdr2eDUT
f18+x//VpxU4o/1JE2GW7QCSTDxWcSzBi8RhVlY04izxpE0GiXeEXvL4SLDq8YVgO52MEdeJ5VIb
q21s6Jvs24NwHyqYmRTtHpoRcCSRQPSPm+7WTYx6GhB5/c6BF2dnvK/QAtD16LqvE0BwH2geuO7H
ies2T4HAA1Df8P/Xj4G5Bul7vqYeApe7wPC9r0XobrAK1K4txVZaUoCmo7gGNM6A/hwwdEPRrn4B
4+JfsQplbmRzdHJlYW0KZW5kb2JqCgoyIDAgb2JqCjw8CiAgL0xlbmd0aCAyNjYKICAvTiAxCiAg
L1JhbmdlIFswIDFdCiAgL0ZpbHRlciAvRmxhdGVEZWNvZGUKPj4Kc3RyZWFtCnicfY9BSwJRFIXP
NJUWVotcGgwRrQqifkCEkG3aqEFTq9cbbaSZYXpvQupXRP+gFrZtF+Smlu0EwZVuxK0bBTcizzvq
RkHv43C+xbmPcwHNdrgrlw3A9QKRSp+Z1+aNEWlCRxxr2MQO49K/zJxnQSNZUfJAOJiaXg1a6NVD
m3lW+ecuWi59bf2/FL7vS+0/LJ4VKyc5+S9pj/siIG+RdouBT6xFiePcZhZxgvjgIZtOEl8QG67z
xCf/hA1iOe8qQx7uJCCRgsDznMzqKJOkdwSEN8/eIvMnx+Ot2CnVbCjV3Qcir8DgTan+u1KDD0Cv
U/VHnwk2yuqkpXwB6HwCGyawXQHWb4fYHknsCmVuZHN0cmVhbQplbmRvYmoKCjM3IDAgb2JqCjw8
CiAgL1BhcmVudCAzNiAwIFIKICAvVGl0bGUgKFtidWddIExpYndhY29tIGJyb2tlbiB1c2VyIHNw
YWNlKQogIC9EZXN0IFszIDAgUiAvWFlaIDkwIDc1MC41NTEyIDBdCj4+CmVuZG9iagoKMzYgMCBv
YmoKPDwKICAvVHlwZSAvT3V0bGluZXMKICAvRmlyc3QgMzcgMCBSCiAgL0xhc3QgMzcgMCBSCiAg
L0NvdW50IDEKPj4KZW5kb2JqCgozOCAwIG9iago8PAogIC9UeXBlIC9QYWdlTGFiZWwKICAvUyAv
RAogIC9TdCAxCj4+CmVuZG9iagoKMzkgMCBvYmoKPDwKICAvQ3JlYXRvciAoVHlwc3QgMC4xMy4x
KQogIC9DcmVhdGlvbkRhdGUgKEQ6MjAyNTEwMjgxNzEyNDYrMDMnMDApCiAgL01vZERhdGUgKEQ6
MjAyNTEwMjgxNzEyNDYrMDMnMDApCj4+CmVuZG9iagoKNDAgMCBvYmoKPDwKICAvTGVuZ3RoIDk5
NgogIC9UeXBlIC9NZXRhZGF0YQogIC9TdWJ0eXBlIC9YTUwKPj4Kc3RyZWFtCjw/eHBhY2tldCBi
ZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+PHg6eG1wbWV0YSB4bWxu
czp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0ieG1wLXdyaXRlciI+PHJkZjpSREYgeG1sbnM6
cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj48cmRmOkRl
c2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1l
bnRzLzEuMS8iICB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iICB4bWxu
czp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgIHhtbG5zOnhtcFRQZz0i
aHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3QvcGcvIiAgeG1sbnM6cGRmPSJodHRwOi8vbnMu
YWRvYmUuY29tL3BkZi8xLjMvIiA+PHhtcDpDcmVhdG9yVG9vbD5UeXBzdCAwLjEzLjE8L3htcDpD
cmVhdG9yVG9vbD48eG1wTU06RG9jdW1lbnRJRD5LNFRYdld5SEF1Ulk5QWlKMHVVQWtRPT08L3ht
cE1NOkRvY3VtZW50SUQ+PHhtcE1NOkluc3RhbmNlSUQ+SzRUWHZXeUhBdVJZOUFpSjB1VUFrUT09
PC94bXBNTTpJbnN0YW5jZUlEPjxkYzpmb3JtYXQ+YXBwbGljYXRpb24vcGRmPC9kYzpmb3JtYXQ+
PHBkZjpQREZWZXJzaW9uPjEuNzwvcGRmOlBERlZlcnNpb24+PGRjOmxhbmd1YWdlPjxyZGY6QmFn
PjxyZGY6bGk+ZW48L3JkZjpsaT48L3JkZjpCYWc+PC9kYzpsYW5ndWFnZT48eG1wVFBnOk5QYWdl
cz40PC94bXBUUGc6TlBhZ2VzPjx4bXBNTTpSZW5kaXRpb25DbGFzcz5wcm9vZjwveG1wTU06UmVu
ZGl0aW9uQ2xhc3M+PHhtcDpDcmVhdGVEYXRlPjIwMjUtMTAtMjhUMTc6MTI6NDYrMDM6MDA8L3ht
cDpDcmVhdGVEYXRlPjx4bXA6TW9kaWZ5RGF0ZT4yMDI1LTEwLTI4VDE3OjEyOjQ2KzAzOjAwPC94
bXA6TW9kaWZ5RGF0ZT48L3JkZjpEZXNjcmlwdGlvbj48L3JkZjpSREY+PC94OnhtcG1ldGE+PD94
cGFja2V0IGVuZD0iciI/PgplbmRzdHJlYW0KZW5kb2JqCgo0MSAwIG9iago8PAogIC9UeXBlIC9D
YXRhbG9nCiAgL1BhZ2VzIDI0IDAgUgogIC9WaWV3ZXJQcmVmZXJlbmNlcyA8PAogICAgL0RpcmVj
dGlvbiAvTDJSCiAgPj4KICAvTWV0YWRhdGEgNDAgMCBSCiAgL05hbWVzIDw8CiAgICAvRGVzdHMg
PDwKICAgICAgL05hbWVzIFsoYnVnLWxpYndhY29tLWJyb2tlbi11c2VyLXNwYWNlKSA4IDAgUl0K
ICAgID4+CiAgPj4KICAvUGFnZUxhYmVscyA8PAogICAgL051bXMgWzAgMzggMCBSXQogID4+CiAg
L091dGxpbmVzIDM2IDAgUgogIC9MYW5nIChlbikKPj4KZW5kb2JqCgp4cmVmCjAgNDIKMDAwMDAw
MDAwMCA2NTUzNSBmDQowMDAwMDM0NDgwIDAwMDAwIG4NCjAwMDAwMzQ5MDcgMDAwMDAgbg0KMDAw
MDAyNTA4MSAwMDAwMCBuDQowMDAwMDI4MDY4IDAwMDAwIG4NCjAwMDAwMjk2MDkgMDAwMDAgbg0K
MDAwMDAzMjAwNiAwMDAwMCBuDQowMDAwMDM0MjQzIDAwMDAwIG4NCjAwMDAwMDAwMTYgMDAwMDAg
bg0KMDAwMDAwMDA1OSAwMDAwMCBuDQowMDAwMDAwMjM3IDAwMDAwIG4NCjAwMDAwMDM3MDAgMDAw
MDAgbg0KMDAwMDAwMDY1NiAwMDAwMCBuDQowMDAwMDAxMTg4IDAwMDAwIG4NCjAwMDAwMDM5NDQg
MDAwMDAgbg0KMDAwMDAwNDEyNiAwMDAwMCBuDQowMDAwMDEyODkwIDAwMDAwIG4NCjAwMDAwMDQ5
MzggMDAwMDAgbg0KMDAwMDAwNTY4MSAwMDAwMCBuDQowMDAwMDEzMTMwIDAwMDAwIG4NCjAwMDAw
MTMyOTIgMDAwMDAgbg0KMDAwMDAyNDYwMiAwMDAwMCBuDQowMDAwMDEzNTU4IDAwMDAwIG4NCjAw
MDAwMTQzMzIgMDAwMDAgbg0KMDAwMDAzNDA5NCAwMDAwMCBuDQowMDAwMDI1MjI3IDAwMDAwIG4N
CjAwMDAwMjQ4NjggMDAwMDAgbg0KMDAwMDAyODIwOCAwMDAwMCBuDQowMDAwMDI5NzQ5IDAwMDAw
IG4NCjAwMDAwMzIxNTkgMDAwMDAgbg0KMDAwMDAzMTU0MCAwMDAwMCBuDQowMDAwMDMxNzcyIDAw
MDAwIG4NCjAwMDAwMzQxNzcgMDAwMDAgbg0KMDAwMDAzNDE5OSAwMDAwMCBuDQowMDAwMDM0MjIx
IDAwMDAwIG4NCjAwMDAwMzQ0MDIgMDAwMDAgbg0KMDAwMDAzNTM5MSAwMDAwMCBuDQowMDAwMDM1
MjcyIDAwMDAwIG4NCjAwMDAwMzU0NzQgMDAwMDAgbg0KMDAwMDAzNTUzMiAwMDAwMCBuDQowMDAw
MDM1NjU4IDAwMDAwIG4NCjAwMDAwMzY3NDMgMDAwMDAgbg0KdHJhaWxlcgo8PAogIC9TaXplIDQy
CiAgL1Jvb3QgNDEgMCBSCiAgL0luZm8gMzkgMCBSCiAgL0lEIFsoSzRUWHZXeUhBdVJZOUFpSjB1
VUFrUT09KSAoSzRUWHZXeUhBdVJZOUFpSjB1VUFrUT09KV0KPj4Kc3RhcnR4cmVmCjM3MDM0CiUl
RU9G
--00000000000018a85a0642389ffc
Content-Type: text/markdown; charset="US-ASCII"; name="libwacom broken user space.md"
Content-Disposition: attachment; filename="libwacom broken user space.md"
Content-Transfer-Encoding: base64
Content-ID: <f_mhancaxz1>
X-Attachment-Id: f_mhancaxz1

IyBbYnVnXSBMaWJ3YWNvbSBicm9rZW4gdXNlciBzcGFjZQpbbGlid2Fjb21dKGh0dHBzOi8vZ2l0
aHViLmNvbS9saW51eHdhY29tL2xpYndhY29tKSAgaXMgYSBsaWJyYXJ5IHRvIGlkZW50aWZ5IGdy
YXBoaWNzIHRhYmxldHMgYW5kIHRoZWlyIG1vZGVsLXNwZWNpZmljIGZlYXR1cmVzLiBJdCBwcm92
aWRlcyBlYXN5IGFjY2VzcyB0byBpbmZvcm1hdGlvbiBzdWNoIGFzICJpcyB0aGlzIGEgYnVpbHQt
aW4tc2NyZWVuIHRhYmxldCIsICJ3aGF0IGlzIHRoZSBzaXplIG9mIHRoaXMgbW9kZWwiLCBldGMu
IGxpYndhY29tIGlzIGN1cnJlbnRseSB1c2VkIGJ5IEdVSSB0b29sa2l0cyAoR05PTUUsIEtERSwg
b3RoZXJzPykgdG8gbWFwIGJ1aWx0LWluIHRhYmxldHMgdG8gdGhlIGNvcnJlY3Qgc2NyZWVuIGFu
ZCBieSBsaWJpbnB1dCB0byBkZXRlcm1pbmUgY29uZmlndXJhdGlvbiBvcHRpb25zIHN1Y2ggYXMg
dGhlIGxlZnQtaGFuZGVkIHNldHRpbmdzLiBTVkcgbGF5b3V0IGZpbGVzIGFyZSB1c2VkIHRvIGRl
c2NyaWJlIHRoZSB0YWJsZXQgdmlzdWFsbHkuClVudGlsIHJlY2VudGx5LCB0aGlzIGxpYnJhcnkg
d29ya2VkIHBlcmZlY3RseSBmaW5lLiBJIGhhdmUgYSBHQU9NT04gUzYyMCBncmFwaGljcyB0YWJs
ZXQgdGhhdCB1c2VkIHRvIHdvcmsgY29ycmVjdGx5IHNvbWUgdGltZSBhZ28uIEkgZGVjaWRlZCB0
byB1c2UgaXQgbm93LCBhbmQgaXQgdHVybmVkIG91dCB0aGF0IEkgY2FuIG5vIGxvbmdlciB1c2Ug
dGhlIGJ1dHRvbnMgb24gaXQ7IHRoZXkgc2ltcGx5IGRvbid0IHdvcmsuIFRoaXMgZnVuY3Rpb25h
bGl0eSBpcyBoYW5kbGVkIHByZWNpc2VseSBieSB0aGUgbGlid2Fjb20gbGlicmFyeS4gVGhlIGNv
bmZpZ3VyYXRpb24gZm9yIGVhY2ggZGV2aWNlIGluIHRoaXMgbGlicmFyeSBpcyBzdG9yZWQgaW4g
YSBzdGF0aWMgLnRhYmxldCBmaWxlLiBTdWNoIGEgZmlsZSBleGlzdHMgZm9yIG15IHRhYmxldCBh
cyB3ZWxsIGFuZCBsb29rcyBsaWtlIHRoaXM6CgpgYGAKW0RldmljZV0KTmFtZT1HQU9NT04gUzYy
MApNb2RlbE5hbWU9CkRldmljZU1hdGNoPXVzYnwyNTZjfDAwNmR8R0FPTU9OIEdhb21vbiBUYWJs
ZXQgUGVuO3VzYnwyNTZjfDAwNmR8R0FPTU9OIEdhb21vbiBUYWJsZXQgUGFkO3VzYnwyNTZjfDAw
NmR8R0FPTU9OIEdhb21vbiBUYWJsZXQgUGVufE9FTTAyX1QxOGU7dXNifDI1NmN8MDA2ZHxHQU9N
T04gR2FvbW9uIFRhYmxldCBQYWR8T0VNMDJfVDE4ZTsKV2lkdGg9NgpIZWlnaHQ9NApMYXlvdXQ9
Z2FvbW9uLXM2MjAuc3ZnCkludGVncmF0ZWRJbj0KU3R5bGk9QGdlbmVyaWMtbm8tZXJhc2VyOwoK
W0ZlYXR1cmVzXQpTdHlsdXM9dHJ1ZQpSZXZlcnNpYmxlPXRydWUKCltCdXR0b25zXQpMZWZ0PUE7
QjtDO0QKRXZkZXZDb2Rlcz1CVE5fMDtCVE5fMTtCVE5fMjtCVE5fMwpgYGAKCkJ1dCBmb3Igc29t
ZSByZWFzb24sIHRoZSBsaWJyYXJ5IG5vIGxvbmdlciByZWNvZ25pemVzIGl0LgpgbGlid2Fjb20t
bGlzdC1sb2NhbC1kZXZpY2VzYCBvdXRwdXQ6CmBgYAovZGV2L2lucHV0L2V2ZW50OCAodXNiOjI1
NmM6MDA2ZCAtICJHQU9NT04gR2FvbW9uIFRhYmxldCBEaWFsIikgaXMgYSB0YWJsZXQgYnV0IG5v
dCBzdXBwb3J0ZWQgYnkgbGlid2Fjb20KL2Rldi9pbnB1dC9ldmVudDcgKHVzYjoyNTZjOjAwNmQg
LSAiR0FPTU9OIEdhb21vbiBUYWJsZXQgVG91Y2ggU3RyaXAiKSBpcyBhIHRhYmxldCBidXQgbm90
IHN1cHBvcnRlZCBieSBsaWJ3YWNvbQovZGV2L2lucHV0L2V2ZW50NiAodXNiOjI1NmM6MDA2ZCAt
ICJHQU9NT04gR2FvbW9uIFRhYmxldCIpIGlzIGEgdGFibGV0IGJ1dCBub3Qgc3VwcG9ydGVkIGJ5
IGxpYndhY29tCi9kZXYvaW5wdXQvZXZlbnQ1ICh1c2I6MjU2YzowMDZkIC0gIkdBT01PTiBHYW9t
b24gVGFibGV0IikgaXMgYSB0YWJsZXQgYnV0IG5vdCBzdXBwb3J0ZWQgYnkgbGlid2Fjb20KRmFp
bGVkIHRvIGZpbmQgYW55IGRldmljZXMga25vd24gdG8gbGlid2Fjb20uCmBgYAoKVGhlIGxpYnJh
cnkgcmV0cmlldmVzIGRldmljZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSBgL3Byb2MvYnVzL2lucHV0
L2RldmljZXNgIGZpbGUuIEkgdGVzdGVkIHRoZSB0YWJsZXQncyBmdW5jdGlvbmFsaXR5IG9uIHZh
cmlvdXMga2VybmVsIHZlcnNpb25zIGFuZCBvYnRhaW5lZCB0aGUgZm9sbG93aW5nIHJlc3VsdHM6
CgotIDYuMTcuNCBwcm9ibGVtIG9jY3VycwotIDYuMTYuMTIgcHJvYmxlbSBvY2N1cnMKLSA2LjE1
LjEwIHByb2JsZW0gb2NjdXJzCi0gNi4xNC4xMSBwcm9ibGVtIG9jY3VycwotIDYuMTQuOCBwcm9i
bGVtIG9jY3VycwotIDYuMTQuNyBtYXJrZWQgYXMgIm9ic29sZXRlIiBpbiBmZWRvcmEga29qaSwg
dW5hYmxlIHRvIGluc3RhbGwKLSA2LjE0LjYgcHJvYmxlbSBkbyBub3Qgb2NjdXJzCgpgY2F0IC9w
cm9jL2J1cy9pbnB1dC9kZXZpY2VzYCBvdXRwdXQgd2hlbiB0YWJsZXQgaXMgYnJva2VuOgoKYGBg
Ckk6IEJ1cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJzaW9uPTAxMTEKTjogTmFt
ZT0iR0FPTU9OIEdhb21vbiBUYWJsZXQiClA6IFBoeXM9dXNiLTAwMDA6MDA6MWQuMC0xLjUvaW5w
dXQwClM6IFN5c2ZzPS9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDoxZC4wL3VzYjIvMi0xLzIt
MS41LzItMS41OjEuMC8wMDAzOjI1NkM6MDA2RC4wMDAyL2lucHV0L2lucHV0OApVOiBVbmlxPU9F
TTAyX1QxOGVfMjAwOTE5Ckg6IEhhbmRsZXJzPW1vdXNlMiBldmVudDUKQjogUFJPUD0xCkI6IEVW
PTFiCkI6IEtFWT0xYzAxIDAgMCAwIDAgMApCOiBBQlM9ZDAwMDAwMwpCOiBNU0M9MTAKCgpJOiBC
dXM9MDAwMyBWZW5kb3I9MjU2YyBQcm9kdWN0PTAwNmQgVmVyc2lvbj0wMTExCk46IE5hbWU9IkdB
T01PTiBHYW9tb24gVGFibGV0IgpQOiBQaHlzPXVzYi0wMDAwOjAwOjFkLjAtMS41L2lucHV0MApT
OiBTeXNmcz0vZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMC91c2IyLzItMS8yLTEuNS8y
LTEuNToxLjAvMDAwMzoyNTZDOjAwNkQuMDAwMi9pbnB1dC9pbnB1dDkKVTogVW5pcT1PRU0wMl9U
MThlXzIwMDkxOQpIOiBIYW5kbGVycz1ldmVudDYganMwCkI6IFBST1A9MApCOiBFVj0xYgpCOiBL
RVk9ODAwIDIwMWZmIDAgMCAwIDAKQjogQUJTPTMKQjogTVNDPTEwCgpJOiBCdXM9MDAwMyBWZW5k
b3I9MjU2YyBQcm9kdWN0PTAwNmQgVmVyc2lvbj0wMTExCk46IE5hbWU9IkdBT01PTiBHYW9tb24g
VGFibGV0IFRvdWNoIFN0cmlwIgpQOiBQaHlzPXVzYi0wMDAwOjAwOjFkLjAtMS41L2lucHV0MApT
OiBTeXNmcz0vZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMC91c2IyLzItMS8yLTEuNS8y
LTEuNToxLjAvMDAwMzoyNTZDOjAwNkQuMDAwMi9pbnB1dC9pbnB1dDEwClU6IFVuaXE9T0VNMDJf
VDE4ZV8yMDA5MTkKSDogSGFuZGxlcnM9ZXZlbnQ3IGpzMQpCOiBQUk9QPTAKQjogRVY9YgpCOiBL
RVk9MSAwIDAgMCAwCkI6IEFCUz0xMDAwMDAwMDAxYgoKSTogQnVzPTAwMDMgVmVuZG9yPTI1NmMg
UHJvZHVjdD0wMDZkIFZlcnNpb249MDExMQpOOiBOYW1lPSJHQU9NT04gR2FvbW9uIFRhYmxldCBE
aWFsIgpQOiBQaHlzPXVzYi0wMDAwOjAwOjFkLjAtMS41L2lucHV0MApTOiBTeXNmcz0vZGV2aWNl
cy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMC91c2IyLzItMS8yLTEuNS8yLTEuNToxLjAvMDAwMzoy
NTZDOjAwNkQuMDAwMi9pbnB1dC9pbnB1dDExClU6IFVuaXE9T0VNMDJfVDE4ZV8yMDA5MTkKSDog
SGFuZGxlcnM9bW91c2UzIGV2ZW50OCBqczIKQjogUFJPUD0wCkI6IEVWPTFmCkI6IEtFWT0xIDAg
MCAwIDAKQjogUkVMPTkwMApCOiBBQlM9MTAwMDAwMDAwMDMKQjogTVNDPTEwCmBgYAoKYGNhdCAv
cHJvYy9idXMvaW5wdXQvZGV2aWNlc2Agb3V0cHV0IHdoZW4gdGFibGV0IHdvcmtzIGZpbmU6CmBg
YApJOiBCdXM9MDAwMyBWZW5kb3I9MjU2YyBQcm9kdWN0PTAwNmQgVmVyc2lvbj0wMTExCk46IE5h
bWU9IkdBT01PTiBHYW9tb24gVGFibGV0IFBlbiIKUDogUGh5cz11c2ItMDAwMDowMDoxZC4wLTEu
NS9pbnB1dDAKUzogU3lzZnM9L2RldmljZXMvcGNpMDAwMDowMC8wMDAwOjAwOjFkLjAvdXNiMi8y
LTEvMi0xLjUvMi0xLjU6MS4wLzAwMDM6MjU2QzowMDZELjAwMDQvaW5wdXQvaW5wdXQxMQpVOiBV
bmlxPU9FTTAyX1QxOGVfMjAwOTE5Ckg6IEhhbmRsZXJzPW1vdXNlMiBldmVudDgKQjogUFJPUD0x
CkI6IEVWPTFiCkI6IEtFWT0xYzAxIDAgMCAwIDAgMApCOiBBQlM9ZDAwMDAwMwpCOiBNU0M9MTAK
Ckk6IEJ1cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJzaW9uPTAxMTEKTjogTmFt
ZT0iR0FPTU9OIEdhb21vbiBUYWJsZXQgUGFkIgpQOiBQaHlzPXVzYi0wMDAwOjAwOjFkLjAtMS41
L2lucHV0MApTOiBTeXNmcz0vZGV2aWNlcy9wY2kwMDAwOjAwLzAwMDA6MDA6MWQuMC91c2IyLzIt
MS8yLTEuNS8yLTEuNToxLjAvMDAwMzoyNTZDOjAwNkQuMDAwNC9pbnB1dC9pbnB1dDEyClU6IFVu
aXE9T0VNMDJfVDE4ZV8yMDA5MTkKSDogSGFuZGxlcnM9ZXZlbnQ5IGpzMApCOiBQUk9QPTAKQjog
RVY9MWIKQjogS0VZPTgwMCAzZmYwMDAwMDAwMDAzZmYgMCAwIDAgMApCOiBBQlM9MwpCOiBNU0M9
MTAKCkk6IEJ1cz0wMDAzIFZlbmRvcj0yNTZjIFByb2R1Y3Q9MDA2ZCBWZXJzaW9uPTAxMTEKTjog
TmFtZT0iR0FPTU9OIEdhb21vbiBUYWJsZXQgVG91Y2ggU3RyaXAiClA6IFBoeXM9dXNiLTAwMDA6
MDA6MWQuMC0xLjUvaW5wdXQwClM6IFN5c2ZzPS9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDox
ZC4wL3VzYjIvMi0xLzItMS41LzItMS41OjEuMC8wMDAzOjI1NkM6MDA2RC4wMDA0L2lucHV0L2lu
cHV0MTMKVTogVW5pcT1PRU0wMl9UMThlXzIwMDkxOQpIOiBIYW5kbGVycz1ldmVudDEwIGpzMQpC
OiBQUk9QPTAKQjogRVY9YgpCOiBLRVk9MSAwIDAgMCAwCkI6IEFCUz0xMDAwMDAwMDAxYgoKYGBg
CgpJdCB0dXJucyBvdXQgdGhhdCBmb3Igc29tZSByZWFzb24sIHRoZSBwZW4gYW5kIHBhZCBwYXJh
bWV0ZXJzIG5lY2Vzc2FyeSBmb3IgaWRlbnRpZnlpbmcgdGhlIGRldmljZSBhcmUgbm93IG1pc3Np
bmcgZnJvbSB0aGlzIGZpbGUuIFNpbXBseSByZXBsYWNpbmcgdGhlIG9sZCBuYW1lcyBgR0FPTU9O
IEdhb21vbiBUYWJsZXQgUGVuYCBhbmQgYEdBT01PTiBHYW9tb24gVGFibGV0IFBhZGAgd2l0aCB0
aGUgbmV3IGBHQU9NT04gR2FvbW9uIFRhYmxldGAgaW4gdGhlIGNvbmZpZ3VyYXRpb24gZGlkbid0
IHNvbHZlIHRoZSBwcm9ibGVtLiBJdCBsZWFkcyB0byB0aGUgcmVjb2duaXRpb24gb2YgdGhlIHRh
YmxldApgYGAKZGV2aWNlczoKICAtIG5hbWU6ICdHQU9NT04gUzYyMCcKICAgIGJ1czogJ3VzYicK
ICAgIHZpZDogMHgyNTZjCiAgICBwaWQ6IDB4MDA2ZAogICAgbm9kZXM6CiAgICAgIC0gL2Rldi9p
bnB1dC9ldmVudDExOiAnR0FPTU9OIEdhb21vbiBUYWJsZXQgRGlhbCcKICAgIHN0eWxpOgogICAg
ICAtIGlkOiAweGZmZmZkCiAgICAgICAgdmlkOiAweDAwMDAKICAgICAgICBuYW1lOiAnR2VuZXJh
bCBQZW4gd2l0aCBubyBFcmFzZXInCiAgICAgICAgdHlwZTogJ2dlbmVyYWwnCiAgICAgICAgYXhl
czogWyd4JywgJ3knICwgJ3ByZXNzdXJlJ10KICAgICAgICBidXR0b25zOiAyCiAgICAgICAgZXJh
c2VyczogW10KICAtIG5hbWU6ICdHQU9NT04gUzYyMCcKICAgIGJ1czogJ3VzYicKICAgIHZpZDog
MHgyNTZjCiAgICBwaWQ6IDB4MDA2ZAogICAgbm9kZXM6CiAgICAgIC0gL2Rldi9pbnB1dC9ldmVu
dDEwOiAnR0FPTU9OIEdhb21vbiBUYWJsZXQgVG91Y2ggU3RyaXAnCiAgICBzdHlsaToKICAgICAg
LSBpZDogMHhmZmZmZAogICAgICAgIHZpZDogMHgwMDAwCiAgICAgICAgbmFtZTogJ0dlbmVyYWwg
UGVuIHdpdGggbm8gRXJhc2VyJwogICAgICAgIHR5cGU6ICdnZW5lcmFsJwogICAgICAgIGF4ZXM6
IFsneCcsICd5JyAsICdwcmVzc3VyZSddCiAgICAgICAgYnV0dG9uczogMgogICAgICAgIGVyYXNl
cnM6IFtdCiAgLSBuYW1lOiAnR0FPTU9OIFM2MjAnCiAgICBidXM6ICd1c2InCiAgICB2aWQ6IDB4
MjU2YwogICAgcGlkOiAweDAwNmQKICAgIG5vZGVzOgogICAgICAtIC9kZXYvaW5wdXQvZXZlbnQ5
OiAnR0FPTU9OIEdhb21vbiBUYWJsZXQnCiAgICAgIC0gL2Rldi9pbnB1dC9ldmVudDg6ICdHQU9N
T04gR2FvbW9uIFRhYmxldCcKICAgIHN0eWxpOgogICAgICAtIGlkOiAweGZmZmZkCiAgICAgICAg
dmlkOiAweDAwMDAKICAgICAgICBuYW1lOiAnR2VuZXJhbCBQZW4gd2l0aCBubyBFcmFzZXInCiAg
ICAgICAgdHlwZTogJ2dlbmVyYWwnCiAgICAgICAgYXhlczogWyd4JywgJ3knICwgJ3ByZXNzdXJl
J10KICAgICAgICBidXR0b25zOiAyCiAgICAgICAgZXJhc2VyczogW10KCmBgYApBbHRob3VnaCBh
biBvcHRpb24gdG8gYXNzaWduIGtleSBjb21iaW5hdGlvbnMgZm9yIHRoZSB0YWJsZXQgYnV0dG9u
cyBub3cgYXBwZWFycywgdGhlIHBoeXNpY2FsIGJ1dHRvbnMgdGhlbXNlbHZlcyBhcmUgbm90IGRl
dGVjdGVkIGFuZCBkbyBub3QgcmVhY3Qgd2hlbiBwcmVzc2VkLgoKRm9yIHNvbWUgcmVhc29uLCBz
dGFydGluZyBhZnRlciB2ZXJzaW9uIDYuMTQuNiwgdGhlIHBlbiBhbmQgcGFkIHBvaW50ZXJzIGRp
c2FwcGVhciBkdXJpbmcgZGV2aWNlIGluaXRpYWxpemF0aW9uLiBUaGVyZSBpcyBhbHNvIGF0IGxl
YXN0IG9uZSBvdGhlciBrbm93biBjYXNlIG9mIHRoZSBbc2FtZSBpc3N1ZV0oaHR0cHM6Ly9naXRo
dWIuY29tL2xpbnV4d2Fjb20vbGlid2Fjb20vaXNzdWVzLzkxNCkuIFVubGlrZSBtZSwgdGhlIHVz
ZXIncyBwcm9ibGVtIG5vIGxvbmdlciBvY2N1cnMgYWZ0ZXIgcmVuYW1pbmcgRGV2aWNlTWF0Y2gu
IEkgaGF2ZSBhbHNvIG9wZW5lZCBhbiBbaXNzdWVdKGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eHdh
Y29tL2xpYndhY29tL2lzc3Vlcy85MjgpIG9uIGxpYndhY29tJ3MgR2l0SHViLgoKSSdtIG5vdCBh
IHByb2dyYW1tZXIsIGp1c3QgYW4gZW5kIHVzZXIsIEkgZG8gbm90IGtub3cgaG93IHRvIHdyaXRl
IGNvZGUgb3Igc29sdmUgcHJvYmxlbXMgb2Ygc3VjaCB0eXBlLiBTbyBJIHdvdWxkIGJlIGdyYXRl
ZnVsIGZvciB5b3VyIGhlbHA=
--00000000000018a85a0642389ffc--

