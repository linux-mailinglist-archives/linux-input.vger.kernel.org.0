Return-Path: <linux-input+bounces-1669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F48492EC
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 05:26:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FD641F21A1C
	for <lists+linux-input@lfdr.de>; Mon,  5 Feb 2024 04:26:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DD6945A;
	Mon,  5 Feb 2024 04:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F/i9Uc0X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A2E8F51
	for <linux-input@vger.kernel.org>; Mon,  5 Feb 2024 04:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707107209; cv=none; b=KHmD38t+XXW+2dDHoAw2nAaw09XgN5hlO/p+Mx0ySnV01XmADkhTjqgch/P/pff9+P7f0jd/DDkeC6Ha6tSVV1hFG7g4eKOPmcJWOJXVq4DQW66JLdDHTzKdh5haRBe6bS/zB6fuhIELNlmBY8vuir71JEdi6whL8PCGrS9W8ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707107209; c=relaxed/simple;
	bh=b29vFX0Q+M5XP4Gq30R//NP8N2mCmIahOap4nU8oW3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KkJEMxZkp2gi+P9GHfmuyOFryHQiyRcv+UTgYW9AMe+ruLK/TfSWTmcPJ+tW9FS+le/ooswsJkySt8WaiPgnp3ohK0TwFo8mAbfXe0xhXW0Q/3EbWrq1k9bok4Y7blx1HhZgXgSp7YQbkzdimtihrzsI2Mw1fzUFS8datcHkfg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F/i9Uc0X; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-511344235c6so4378489e87.0
        for <linux-input@vger.kernel.org>; Sun, 04 Feb 2024 20:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707107205; x=1707712005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrRc0wHn/gPeSIowmJR+2ufmgrLP98CeinXWCVzh8g4=;
        b=F/i9Uc0X2+CWqKlsOjB7gwekX/1SzpTjrlI7czjRSSxsvq1+XEak5XklJFEYhqhj3v
         //4dlwYLt7sX8FzWcxha0W5ZLYTp6L99BhULLjVKZDnJ4fw48HGx4zC0hsgF+c5qPNnJ
         vvDw8i7SrO4dZvmuuSPI1vWDkTeQb73zudxEZBUVaz3LhlWvZqXY65lazgYiiVntZJd/
         WWworXCTTuCNcn/HbU1RFsNEPQ2fHx0+j98/gNeouiKf1iita2sI6fB2bqN/JZzKUG1U
         pWHQumnHOautl/pRlPhozhr1LzTqMMgRVVvZLGDqHmjky/qyPvDO6CQVyLNCsnIu/L7Q
         +YcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707107205; x=1707712005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrRc0wHn/gPeSIowmJR+2ufmgrLP98CeinXWCVzh8g4=;
        b=dHDbk1W29LNk3lmc7Ym9BPxsJt/wm9a3RbFtqIgg40J77qSzd6IgLRwqwLooc/Eii1
         3jv3n2s0JHYrTNUDjPXOxJHHPn+coh0xqDpdcoCYR+rcpsLF96fELVBenZXWq5SApdS2
         W7GBqySRxQOKGwozLv3jD6BtWeE65ocaAbFSmW6OYtg2aA/13j+GUMcm8lPfG/CeAaFL
         uJdtJAsPS+6RMz3+U7dXwFOFVcXk8/seNTL/EA58FmkKjuQdHC3pA5qbvlQ7rB/HfmzE
         O1ofYYW2+veoQ+qfvXelOwpn+T6/mJyXhtABcxw/6nV6BxmfH5pll0ghYGyBTFbAH1s9
         mSMw==
X-Forwarded-Encrypted: i=0; AJvYcCWBRTz3Goo2XVSJ8ePbGiqPUVg+Gl3lERzvHRyuQ0P1VyW/XdO68scGiaW4ZiCQVXBxfeEbAGdpq+diXaNko/r4VPNmqqTFqIkWdB4=
X-Gm-Message-State: AOJu0YxVCIja679aeQldLVrw5q5GRam8sDSy60Yx//EX9fodQFkSPKRu
	sI3zmyztJaG9yKwk84EYZdJZ7ODCCHM+bXN82mh81siLNyNH5Aj7YKKLk6DRqvzvMNhSROLVC6U
	iYGn7XJO43dSEH196p0aAuRPNh6x9H8Og3pI=
X-Google-Smtp-Source: AGHT+IGUXFZ0S0IjxZQuFDz8r2ghoj2IK5hA/B+lWw6APkbDqHJMQmqMkGLoBoKyik+MyAYrgxufOqJDrUjNzCpr2sk=
X-Received: by 2002:a05:6512:3b08:b0:510:293e:83b with SMTP id
 f8-20020a0565123b0800b00510293e083bmr6264244lfv.18.1707107204377; Sun, 04 Feb
 2024 20:26:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAEQPD4S1zyUMUyJbOb8i5a+URsLCrGMKPKD47es8OgCoKKwRQg@mail.gmail.com>
 <CAEQPD4T+C_RaP_z96XRXj1teGiDMZu1MsPn8hAQ5FhSoaajZaA@mail.gmail.com>
 <CAEQPD4RSFJN5TvU2vwHL=w1TkMzxD+v1=jxyyNzZDMyPane=BQ@mail.gmail.com>
 <CAO-hwJ+OFxRqoL4RYaKMR_PfmpBJuyWUGcDXRrp7jWuYfT=CyQ@mail.gmail.com> <CAEQPD4TNkGn-xjLqNiNb5c2Hc9P-4Hpeq-92tBSPJiJ=4-dsZw@mail.gmail.com>
In-Reply-To: <CAEQPD4TNkGn-xjLqNiNb5c2Hc9P-4Hpeq-92tBSPJiJ=4-dsZw@mail.gmail.com>
From: Taco Jerkface <tacodog311@gmail.com>
Date: Sun, 4 Feb 2024 21:26:40 -0700
Message-ID: <CAEQPD4TBPsh0At4Eqmox++AiGes3q16O5qva6KNQMwzmRPySOQ@mail.gmail.com>
Subject: Re: Suspected bug in hid-microsoft.c
To: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Siarhei Vishniakou <svv@google.com>, linux-input@vger.kernel.org, jikos@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FYI,

I believe your hunch was correct, and the controller is using hidraw
with root and evdev without root.

The program evemu-record does read output without root permissions.I
recorded the output to here:

https://pastebin.com/uTMSLkfw

It looks like Event code 240 (KEY_UNKNOWN) is used for all of the
paddles, reporting 1,2,4,8 for each paddle.  It reports 0 when a
paddle is released, and the sum when multiple are pressed
simultaneously.

I'm not experienced enough to know the next steps in debugging the
driver, but let me know if there's anything else I can try.

Cheers

On Wed, Jan 31, 2024 at 12:27=E2=80=AFPM Taco Jerkface <tacodog311@gmail.co=
m> wrote:
>
> Thanks for the response!
> I put some diagnostic info below, but please let me know if I can do
> anything else to help.
> Thank you.
>
> hid-recorder does not see the controller when connected with USB.
>
> sudo hid-recorder
> Available devices:
> /dev/hidraw0:   DLL07D1:01 044E:120B
> Select the device event number [0-0]:
>
>
> When connected with Bluetooth, hid-recorder sees the device as "Xbox
> Wireless Controler" and the dump is below:
>
> sudo hid-recorder
> Available devices:
> /dev/hidraw0:   DLL07D1:01 044E:120B
> /dev/hidraw1:   Xbox Wireless Controller
> Select the device event number [0-1]: 1
> # Xbox Wireless Controller
> # 0x05, 0x01,                    // Usage Page (Generic Desktop)        0
> # 0x09, 0x05,                    // Usage (Game Pad)                    2
> # 0xa1, 0x01,                    // Collection (Application)            4
> # 0x85, 0x01,                    //  Report ID (1)                      6
> # 0x09, 0x01,                    //  Usage (Pointer)                    8
> # 0xa1, 0x00,                    //  Collection (Physical)              1=
0
> # 0x09, 0x30,                    //   Usage (X)                         1=
2
> # 0x09, 0x31,                    //   Usage (Y)                         1=
4
> # 0x15, 0x00,                    //   Logical Minimum (0)               1=
6
> # 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)           1=
8
> # 0x95, 0x02,                    //   Report Count (2)                  2=
3
> # 0x75, 0x10,                    //   Report Size (16)                  2=
5
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              2=
7
> # 0xc0,                          //  End Collection                     2=
9
> # 0x09, 0x01,                    //  Usage (Pointer)                    3=
0
> # 0xa1, 0x00,                    //  Collection (Physical)              3=
2
> # 0x09, 0x32,                    //   Usage (Z)                         3=
4
> # 0x09, 0x35,                    //   Usage (Rz)                        3=
6
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
8
> # 0x27, 0xff, 0xff, 0x00, 0x00,  //   Logical Maximum (65535)           4=
0
> # 0x95, 0x02,                    //   Report Count (2)                  4=
5
> # 0x75, 0x10,                    //   Report Size (16)                  4=
7
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              4=
9
> # 0xc0,                          //  End Collection                     5=
1
> # 0x05, 0x02,                    //  Usage Page (Simulation Controls)   5=
2
> # 0x09, 0xc5,                    //  Usage (Brake)                      5=
4
> # 0x15, 0x00,                    //  Logical Minimum (0)                5=
6
> # 0x26, 0xff, 0x03,              //  Logical Maximum (1023)             5=
8
> # 0x95, 0x01,                    //  Report Count (1)                   6=
1
> # 0x75, 0x0a,                    //  Report Size (10)                   6=
3
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               6=
5
> # 0x15, 0x00,                    //  Logical Minimum (0)                6=
7
> # 0x25, 0x00,                    //  Logical Maximum (0)                6=
9
> # 0x75, 0x06,                    //  Report Size (6)                    7=
1
> # 0x95, 0x01,                    //  Report Count (1)                   7=
3
> # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               7=
5
> # 0x05, 0x02,                    //  Usage Page (Simulation Controls)   7=
7
> # 0x09, 0xc4,                    //  Usage (Accelerator)                7=
9
> # 0x15, 0x00,                    //  Logical Minimum (0)                8=
1
> # 0x26, 0xff, 0x03,              //  Logical Maximum (1023)             8=
3
> # 0x95, 0x01,                    //  Report Count (1)                   8=
6
> # 0x75, 0x0a,                    //  Report Size (10)                   8=
8
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               9=
0
> # 0x15, 0x00,                    //  Logical Minimum (0)                9=
2
> # 0x25, 0x00,                    //  Logical Maximum (0)                9=
4
> # 0x75, 0x06,                    //  Report Size (6)                    9=
6
> # 0x95, 0x01,                    //  Report Count (1)                   9=
8
> # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               1=
00
> # 0x05, 0x01,                    //  Usage Page (Generic Desktop)       1=
02
> # 0x09, 0x39,                    //  Usage (Hat switch)                 1=
04
> # 0x15, 0x01,                    //  Logical Minimum (1)                1=
06
> # 0x25, 0x08,                    //  Logical Maximum (8)                1=
08
> # 0x35, 0x00,                    //  Physical Minimum (0)               1=
10
> # 0x46, 0x3b, 0x01,              //  Physical Maximum (315)             1=
12
> # 0x66, 0x14, 0x00,              //  Unit (EnglishRotation: deg)        1=
15
> # 0x75, 0x04,                    //  Report Size (4)                    1=
18
> # 0x95, 0x01,                    //  Report Count (1)                   1=
20
> # 0x81, 0x42,                    //  Input (Data,Var,Abs,Null)          1=
22
> # 0x75, 0x04,                    //  Report Size (4)                    1=
24
> # 0x95, 0x01,                    //  Report Count (1)                   1=
26
> # 0x15, 0x00,                    //  Logical Minimum (0)                1=
28
> # 0x25, 0x00,                    //  Logical Maximum (0)                1=
30
> # 0x35, 0x00,                    //  Physical Minimum (0)               1=
32
> # 0x45, 0x00,                    //  Physical Maximum (0)               1=
34
> # 0x65, 0x00,                    //  Unit (None)                        1=
36
> # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               1=
38
> # 0x05, 0x09,                    //  Usage Page (Button)                1=
40
> # 0x19, 0x01,                    //  Usage Minimum (1)                  1=
42
> # 0x29, 0x0f,                    //  Usage Maximum (15)                 1=
44
> # 0x15, 0x00,                    //  Logical Minimum (0)                1=
46
> # 0x25, 0x01,                    //  Logical Maximum (1)                1=
48
> # 0x75, 0x01,                    //  Report Size (1)                    1=
50
> # 0x95, 0x0f,                    //  Report Count (15)                  1=
52
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               1=
54
> # 0x15, 0x00,                    //  Logical Minimum (0)                1=
56
> # 0x25, 0x00,                    //  Logical Maximum (0)                1=
58
> # 0x75, 0x01,                    //  Report Size (1)                    1=
60
> # 0x95, 0x01,                    //  Report Count (1)                   1=
62
> # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               1=
64
> # 0x05, 0x0c,                    //  Usage Page (Consumer Devices)      1=
66
> # 0x0a, 0xb2, 0x00,              //  Usage (Record)                     1=
68
> # 0x15, 0x00,                    //  Logical Minimum (0)                1=
71
> # 0x25, 0x01,                    //  Logical Maximum (1)                1=
73
> # 0x95, 0x01,                    //  Report Count (1)                   1=
75
> # 0x75, 0x01,                    //  Report Size (1)                    1=
77
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               1=
79
> # 0x15, 0x00,                    //  Logical Minimum (0)                1=
81
> # 0x25, 0x00,                    //  Logical Maximum (0)                1=
83
> # 0x75, 0x07,                    //  Report Size (7)                    1=
85
> # 0x95, 0x01,                    //  Report Count (1)                   1=
87
> # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               1=
89
> # 0x05, 0x0c,                    //  Usage Page (Consumer Devices)      1=
91
> # 0x09, 0x01,                    //  Usage (Consumer Control)           1=
93
> # 0xa1, 0x01,                    //  Collection (Application)           1=
95
> # 0x0a, 0x85, 0x00,              //   Usage (Order Movie)               1=
97
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
00
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             2=
02
> # 0x95, 0x01,                    //   Report Count (1)                  2=
05
> # 0x75, 0x08,                    //   Report Size (8)                   2=
07
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              2=
09
> # 0x0a, 0x99, 0x00,              //   Usage (Media Select Security)     2=
11
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
14
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             2=
16
> # 0x95, 0x01,                    //   Report Count (1)                  2=
19
> # 0x75, 0x04,                    //   Report Size (4)                   2=
21
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              2=
23
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
25
> # 0x25, 0x00,                    //   Logical Maximum (0)               2=
27
> # 0x95, 0x01,                    //   Report Count (1)                  2=
29
> # 0x75, 0x04,                    //   Report Size (4)                   2=
31
> # 0x81, 0x03,                    //   Input (Cnst,Var,Abs)              2=
33
> # 0x0a, 0x81, 0x00,              //   Usage (Assign Selection)          2=
35
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
38
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             2=
40
> # 0x95, 0x01,                    //   Report Count (1)                  2=
43
> # 0x75, 0x04,                    //   Report Size (4)                   2=
45
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              2=
47
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
49
> # 0x25, 0x00,                    //   Logical Maximum (0)               2=
51
> # 0x95, 0x01,                    //   Report Count (1)                  2=
53
> # 0x75, 0x04,                    //   Report Size (4)                   2=
55
> # 0x81, 0x03,                    //   Input (Cnst,Var,Abs)              2=
57
> # 0xc0,                          //  End Collection                     2=
59
> # 0x05, 0x0f,                    //  Usage Page (Vendor Usage Page 0x0f) =
260
> # 0x09, 0x21,                    //  Usage (Vendor Usage 0x21)          2=
62
> # 0x85, 0x03,                    //  Report ID (3)                      2=
64
> # 0xa1, 0x02,                    //  Collection (Logical)               2=
66
> # 0x09, 0x97,                    //   Usage (Vendor Usage 0x97)         2=
68
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
70
> # 0x25, 0x01,                    //   Logical Maximum (1)               2=
72
> # 0x75, 0x04,                    //   Report Size (4)                   2=
74
> # 0x95, 0x01,                    //   Report Count (1)                  2=
76
> # 0x91, 0x02,                    //   Output (Data,Var,Abs)             2=
78
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
80
> # 0x25, 0x00,                    //   Logical Maximum (0)               2=
82
> # 0x75, 0x04,                    //   Report Size (4)                   2=
84
> # 0x95, 0x01,                    //   Report Count (1)                  2=
86
> # 0x91, 0x03,                    //   Output (Cnst,Var,Abs)             2=
88
> # 0x09, 0x70,                    //   Usage (Vendor Usage 0x70)         2=
90
> # 0x15, 0x00,                    //   Logical Minimum (0)               2=
92
> # 0x25, 0x64,                    //   Logical Maximum (100)             2=
94
> # 0x75, 0x08,                    //   Report Size (8)                   2=
96
> # 0x95, 0x04,                    //   Report Count (4)                  2=
98
> # 0x91, 0x02,                    //   Output (Data,Var,Abs)             3=
00
> # 0x09, 0x50,                    //   Usage (Vendor Usage 0x50)         3=
02
> # 0x66, 0x01, 0x10,              //   Unit (SILinear: s)                3=
04
> # 0x55, 0x0e,                    //   Unit Exponent (-2)                3=
07
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
09
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             3=
11
> # 0x75, 0x08,                    //   Report Size (8)                   3=
14
> # 0x95, 0x01,                    //   Report Count (1)                  3=
16
> # 0x91, 0x02,                    //   Output (Data,Var,Abs)             3=
18
> # 0x09, 0xa7,                    //   Usage (Vendor Usage 0xa7)         3=
20
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
22
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             3=
24
> # 0x75, 0x08,                    //   Report Size (8)                   3=
27
> # 0x95, 0x01,                    //   Report Count (1)                  3=
29
> # 0x91, 0x02,                    //   Output (Data,Var,Abs)             3=
31
> # 0x65, 0x00,                    //   Unit (None)                       3=
33
> # 0x55, 0x00,                    //   Unit Exponent (0)                 3=
35
> # 0x09, 0x7c,                    //   Usage (Vendor Usage 0x7c)         3=
37
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
39
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             3=
41
> # 0x75, 0x08,                    //   Report Size (8)                   3=
44
> # 0x95, 0x01,                    //   Report Count (1)                  3=
46
> # 0x91, 0x02,                    //   Output (Data,Var,Abs)             3=
48
> # 0xc0,                          //  End Collection                     3=
50
> # 0x05, 0x0c,                    //  Usage Page (Consumer Devices)      3=
51
> # 0x09, 0x01,                    //  Usage (Consumer Control)           3=
53
> # 0x85, 0x0c,                    //  Report ID (12)                     3=
55
> # 0xa1, 0x01,                    //  Collection (Application)           3=
57
> # 0x0a, 0x9e, 0x00,              //   Usage (Media Select SAP)          3=
59
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
62
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             3=
64
> # 0x95, 0x01,                    //   Report Count (1)                  3=
67
> # 0x75, 0x08,                    //   Report Size (8)                   3=
69
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              3=
71
> # 0x0a, 0xa1, 0x00,              //   Usage (Once)                      3=
73
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
76
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             3=
78
> # 0x95, 0x01,                    //   Report Count (1)                  3=
81
> # 0x75, 0x08,                    //   Report Size (8)                   3=
83
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              3=
85
> # 0x0a, 0xa2, 0x00,              //   Usage (Daily)                     3=
87
> # 0x15, 0x00,                    //   Logical Minimum (0)               3=
90
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             3=
92
> # 0x95, 0x01,                    //   Report Count (1)                  3=
95
> # 0x75, 0x08,                    //   Report Size (8)                   3=
97
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              3=
99
> # 0x0a, 0xa3, 0x00,              //   Usage (Weekly)                    4=
01
> # 0x15, 0x00,                    //   Logical Minimum (0)               4=
04
> # 0x26, 0xff, 0x00,              //   Logical Maximum (255)             4=
06
> # 0x95, 0x01,                    //   Report Count (1)                  4=
09
> # 0x75, 0x08,                    //   Report Size (8)                   4=
11
> # 0x81, 0x02,                    //   Input (Data,Var,Abs)              4=
13
> # 0xc0,                          //  End Collection                     4=
15
> # 0xc0,                          // End Collection                      4=
16
> # 0x05, 0x01,                    // Usage Page (Generic Desktop)        4=
17
> # 0x09, 0x06,                    // Usage (Keyboard)                    4=
19
> # 0xa1, 0x01,                    // Collection (Application)            4=
21
> # 0x85, 0x05,                    //  Report ID (5)                      4=
23
> # 0x05, 0x07,                    //  Usage Page (Keyboard)              4=
25
> # 0x19, 0xe0,                    //  Usage Minimum (224)                4=
27
> # 0x29, 0xe7,                    //  Usage Maximum (231)                4=
29
> # 0x15, 0x00,                    //  Logical Minimum (0)                4=
31
> # 0x25, 0x01,                    //  Logical Maximum (1)                4=
33
> # 0x75, 0x01,                    //  Report Size (1)                    4=
35
> # 0x95, 0x08,                    //  Report Count (8)                   4=
37
> # 0x81, 0x02,                    //  Input (Data,Var,Abs)               4=
39
> # 0x95, 0x01,                    //  Report Count (1)                   4=
41
> # 0x75, 0x08,                    //  Report Size (8)                    4=
43
> # 0x81, 0x03,                    //  Input (Cnst,Var,Abs)               4=
45
> # 0x95, 0x06,                    //  Report Count (6)                   4=
47
> # 0x75, 0x08,                    //  Report Size (8)                    4=
49
> # 0x15, 0x00,                    //  Logical Minimum (0)                4=
51
> # 0x25, 0x65,                    //  Logical Maximum (101)              4=
53
> # 0x05, 0x07,                    //  Usage Page (Keyboard)              4=
55
> # 0x19, 0x00,                    //  Usage Minimum (0)                  4=
57
> # 0x29, 0x65,                    //  Usage Maximum (101)                4=
59
> # 0x81, 0x00,                    //  Input (Data,Arr,Abs)               4=
61
> # 0xc0,                          // End Collection                      4=
63
> #
> R: 464 05 01 09 05 a1 01 85 01 09 01 a1 00 09 30 09 31 15 00 27 ff ff
> 00 00 95 02 75 10 81 02 c0 09 01 a1 00 09 32 09 35 15 00 27 ff ff 00
> 00 95 02 75 10 81 02 c0 05 02 09 c5 15 00 26 ff 03 95 01 75 0a
> 81 02 15 00 25 00 75 06 95 01 81 03 05 02 09 c4 15 00 26 ff 03 95 01
> 75 0a 81 02 15 00 25 00 75 06 95 01 81 03 05 01 09 39 15 01 25 08 35
> 00 46 3b 01 66 14 00 75 04 95 01 81 42 75 04 95 01 15 00 25 00
> 35 00 45 00 65 00 81 03 05 09 19 01 29 0f 15 00 25 01 75 01 95 0f 81
> 02 15 00 25 00 75 01 95 01 81 03 05 0c 0a b2 00 15 00 25 01 95 01 75
> 01 81 02 15 00 25 00 75 07 95 01 81 03 05 0c 09 01 a1 01 0a 85
> 00 15 00 26 ff 00 95 01 75 08 81 02 0a 99 00 15 00 26 ff 00 95 01 75
> 04 81 02 15 00 25 00 95 01 75 04 81 03 0a 81 00 15 00 26 ff 00 95 01
> 75 04 81 02 15 00 25 00 95 01 75 04 81 03 c0 05 0f 09 21 85 03
> a1 02 09 97 15 00 25 01 75 04 95 01 91 02 15 00 25 00 75 04 95 01 91
> 03 09 70 15 00 25 64 75 08 95 04 91 02 09 50 66 01 10 55 0e 15 00 26
> ff 00 75 08 95 01 91 02 09 a7 15 00 26 ff 00 75 08 95 01 91 02
> 65 00 55 00 09 7c 15 00 26 ff 00 75 08 95 01 91 02 c0 05 0c 09 01 85
> 0c a1 01 0a 9e 00 15 00 26 ff 00 95 01 75 08 81 02 0a a1 00 15 00 26
> ff 00 95 01 75 08 81 02 0a a2 00 15 00 26 ff 00 95 01 75 08 81
> 02 0a a3 00 15 00 26 ff 00 95 01 75 08 81 02 c0 c0 05 01 09 06 a1 01
> 85 05 05 07 19 e0 29 e7 15 00 25 01 75 01 95 08 81 02 95 01 75 08 81
> 03 95 06 75 08 15 00 25 65 05 07 19 00 29 65 81 00 c0
> N: Xbox Wireless Controller
> I: 5 045e 0b22
>
> On Wed, Jan 31, 2024 at 2:57=E2=80=AFAM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi,
> >
> > [Adding Siarhei who added support for those controllers in the kernel]
> >
> > On Wed, Jan 31, 2024 at 7:27=E2=80=AFAM Taco Jerkface <tacodog311@gmail=
.com> wrote:
> > >
> > > Resending without HTML:
> > >
> > > Hi,
> > >
> > > I hope this is the correct contact for this report, I found you as th=
e
> > > maintainer in the hid-microsoft.c.
> > >
> > > I believe there is a bug in the microsoft bluetooth driver for the
> > > Xbox Elite Series 2 controller.  I have been experiencing issues with
> > > it that I initially thought were SDL related.  However the SDL team
> > > seems to think this is driver related. My SDL bug report information
> > > is here:
> > >
> > > https://github.com/libsdl-org/SDL/issues/8907
> >
> > Hard to say anything with that bug report because we don't know what
> > those tools are supposed to do, and how they access the device (hidraw
> > or evdev).
> >
> > Note that the bluetooth version is using uhid because it's a BLE contro=
ller.
> > Basically when there is a BLE controller, bluez handles the transport
> > layer from userspace, and injects the events through uhid so that it's
> > handled as a normal kernel device.
> >
> > So there is no "uhid userspace driver", bluez just blindly forwards
> > the events/reports/commands as it is told.
> >
> > >
> > > Basically, SDL reads the controller correctly when connected by USB,
> > > and if I run "controllermap" with root permission, but with user
> > > permissions it misreads
> >
> > Using root or not shouldn't change the way your program sees the
> > device: if you are capable of opening it, then you should get the same
> > output.
> >
> > However, the immediate explanation that would come to my mind is that
> > you are not using the "same" controller in both cases:
> > - maybe that when you use it with root you are talking to the device
> > through hidraw
> > - maybe when you are not root you are talking to the device through evd=
ev
> >
> > Again, not knowing the tools doesn't help me here :(
> >
> > >  the number of buttons as 122, the first paddle
> > > button on the back seems to act like the "screenshot" button from the
> > > 1914 controller, and the other paddle buttons are not read.  All
> > > buttons read fine with evites, but the paddle buttons "KEY_UNKNOWN"
> > >
> > > type 1 (EV_KEY), code 240 (KEY_UNKNOWN), value 0
> > >
> > > Please let me know if there is a better contact for this, or if there
> > > is anything I can do to help identify the problem.
> > >
> >
> > Ideally I'd like Siarhei to answer here. But in the meantime, we could
> > fetch some logs from the device itself which would allow me to better
> > understand the issue:
> > please use hid-recorder from hid-tools[1] to get the logs, and attach
> > the whole output, with a recording of the events that are problematic:
> > $> pip3 install hid-tools
> > $> sudo hid-recorder
> >
> > Please dump 2 hid-recorder outputs, one with USB, and one with
> > Bluetooth, with the same event sequence if possible so we can compare
> > between the 2.
> >
> > Cheers,
> > Benjamin
> >
> > [1] https://gitlab.freedesktop.org/libevdev/hid-tools
> >

