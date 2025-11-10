Return-Path: <linux-input+bounces-15971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683CC45086
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 06:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C69FC4E785B
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 05:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72674295DAC;
	Mon, 10 Nov 2025 05:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyJj4jtZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7333D2E6CCB
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762753256; cv=none; b=iVok0DmcgbrRg952Q5w6jIURguSdnMjzt8H2pI0cgVAFRwSzCP2hzrdyq/XIDE2uW9fL1s6PYLHPxykfZo4bxYrnPzjnWezFpLYjJr59YjmO7bBuoNkQzmN8ZDTlfn7O+1Zd1zD3FVOx0WXH4h3aAJQr+7kmLA13wrWujcYuwqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762753256; c=relaxed/simple;
	bh=wT6X6+SHL6nrzCXR+VudakmZqYt9SK+PnGgsYv15eIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s9PYdZlYf+gW0DtundxNZeIZ3LUdqYzLm0SnKQ7n4Pfip9UTSv9mOWDk48b3UpqSEdwoqUVvi/urhXg57LwrA3fuirvIPVo7aelY404IAnmgQhppXSUXwtgPjKNTxHHCf9Uu8CFCZ3CoVyzniaVcZ6GENfjtjLbLLG6kfEDPudc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyJj4jtZ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-429c4c65485so1859444f8f.0
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 21:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762753250; x=1763358050; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gj7oSSmznpLECGYL2q9/XBix2xya+xxdaQZ8b66Qjsw=;
        b=NyJj4jtZ4JR7NbOeBjhaIkMavCTViaxa9Sc8kdN4tQV/ojbdykRj0JQ27eETuFJ5Do
         xLmN9QTvwzWfET9/O2fY0FX/v5waHDtiMyfJe+21MHQIP+NmeL0Tm+5uRv3sbJxa6TSS
         SpXVqx6kJ+P+8vNIgFeMSMfAlc7dHyKl3E40cg/D/s6Jqb0Bjjd5+tAiTCzk+ks2yFIU
         HDH0rGBnY3pToHeqP441y30VVeqsEIjFENUcpaMq17iEk1Bqb1nHJfVfj5unscDo5lMt
         8FhXNCNQx7wJS5z60bKnkMypWhpsapuWGoDuhkL/Rb8IipJ398h3YngKhScDe96twm7v
         BS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762753250; x=1763358050;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gj7oSSmznpLECGYL2q9/XBix2xya+xxdaQZ8b66Qjsw=;
        b=GXuZjqMjZX/t2V9AyCZKvn0k/7xmQEURuoaiHfao71V/zFf5u7ZgudMOfBddVnwI/a
         G8bfXfdZpDVk+SmlxJ8AvAAX+LfGsvu2cDXUkiuIh9bFdjsUXc6YN4tdZb2Yh5XazGbo
         5w/mv4vD6mYhEqsgCR5K2H6bHyrCEZyrfQRB6FhNuruvNKdsdQlkJmycoSbeBPAhdC4x
         SW6EJT53dHUR6ajDEzGLAev1LfK09nc5V0xJTm6uWTrsp0H9u/0Pb362/Ed5BaaESzNF
         UQ4vmndD6TeTJJCL6Td+EY4asLWonMSqLOy71iAPFbatIPWlehxHQnbPRowbnlhBrdDd
         ssfA==
X-Forwarded-Encrypted: i=1; AJvYcCXVj97pt/6FT1hVIRnblU16xiqV68kLpYKYraoxiuHGrM88pbfIsNo7XXEmj4CvB7S+KwixRYUVMc+9mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaQ2M0k9AywOujSUh0chyv/u4vZAvcYDsPDokMpFqsJqCuzJGV
	GTFvz7RZC9uRFDfSBeiPl/851y2R3hLsxDQdNG2lpO4XfiLxZyzv69wPX3/C6ozU711zR7xgu5V
	4tALaob76ouCheh5xRUtsjLzF8P+KFjg=
X-Gm-Gg: ASbGncvt7A2d5RS92irYVW1mi7Jj2QsVWtQa1PG0Lp+nWVmLK4fzaEK21NQjXdyjxgw
	1oRSPX+cWlrsIbwTtym7MJOzwqERIFK9NMd9jzj84BUvZpU5+pXFwdXybblnv70jfa+xJHDU1Xv
	BrWu2pHpxVN6Bfb9gIROImuxJ0WWeGhPybIrHpMN3ygWPHLSBhatrz9aGq8TZorZPr+WSemwZ64
	Da+KPJbxfPXg6DwK3vNtr64psr05n2mO5MrUj4LxtGO9BpM4du0cqTLE5c9o5B7NVpG8/gJzM1f
	dlcsG/e/uNXsJbixUfIgsaqPGS+xtUDEzTX3z8Xjat0oGhyM1V99i0QePy47Ux4nPyw84110cyk
	=
X-Google-Smtp-Source: AGHT+IEFeDPm1Eya4Gyr0mSp728TJPzB/5H4KCkYefrmbvqWQP8NlaR0Y9WRSV+oCDYYp3T5aYfU0USmb5kTCapa/fY=
X-Received: by 2002:a05:6000:459d:b0:42b:3131:5436 with SMTP id
 ffacd0b85a97d-42b31315be0mr3403465f8f.16.1762753248928; Sun, 09 Nov 2025
 21:40:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com> <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu> <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
In-Reply-To: <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
From: The-Luga <lugathe2@gmail.com>
Date: Mon, 10 Nov 2025 02:40:36 -0300
X-Gm-Features: AWmQ_bmbR5lfn7n7EcuktEkS9YtpcfRS2JIcPPCSDcEs_AwV5S5t3WV4U030eog
Message-ID: <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, 
	Terry Junge <linuxhid@cosmicgizmosystems.com>, Michal Pecio <michal.pecio@gmail.com>, 
	Terry Junge <linuxsound@cosmicgizmosystems.com>, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org, 
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Content-Type: text/plain; charset="UTF-8"

I got the data from the hidraw of the play/pause button. The rest was
silent until I triggered the reboot.

```
>sudo  hid-recorder
Available devices:
/dev/hidraw0:   Jieli Technology EDIFIER Hal0 2.0 SE
/dev/hidraw1:   Jieli Technology EDIFIER Hal0 2.0 SE
/dev/hidraw2:   Logitech USB Receiver
/dev/hidraw3:   Logitech USB Receiver
/dev/hidraw4:   Logitech USB Receiver
/dev/hidraw5:   Logitech USB Receiver
/dev/hidraw6:   Logitech USB Headset Logitech USB Headset
/dev/hidraw7:   Logitech G815 RGB MECHANICAL GAMING KEYBOARD
/dev/hidraw8:   Logitech G815 RGB MECHANICAL GAMING KEYBOARD
/dev/hidraw9:   ITE Tech. Inc. ITE Device(8176)
/dev/hidraw10:  ELAN0001:00 04F3:31AD
Select the device event number [0-10]: 0
# Jieli Technology EDIFIER Hal0 2.0 SE
# 0x05, 0x0c,                    // Usage Page (Consumer Devices)       0
# 0x09, 0x01,                    // Usage (Consumer Control)            2
# 0xa1, 0x01,                    // Collection (Application)            4
# 0x15, 0x00,                    //  Logical Minimum (0)                6
# 0x25, 0x01,                    //  Logical Maximum (1)                8
# 0x09, 0xe9,                    //  Usage (Volume Up)                  10
# 0x09, 0xea,                    //  Usage (Volume Down)                12
# 0x09, 0xe2,                    //  Usage (Mute)                       14
# 0x09, 0xcd,                    //  Usage (Play/Pause)                 16
# 0x09, 0xb5,                    //  Usage (Scan Next Track)            18
# 0x09, 0xb6,                    //  Usage (Scan Previous Track)        20
# 0x09, 0xb3,                    //  Usage (Fast Forward)               22
# 0x09, 0xb7,                    //  Usage (Stop)                       24
# 0x75, 0x01,                    //  Report Size (1)                    26
# 0x95, 0x08,                    //  Report Count (8)                   28
# 0x81, 0x42,                    //  Input (Data,Var,Abs,Null)          30
# 0xc0,                          // End Collection                      32
#
R: 33 05 0c 09 01 a1 01 15 00 25 01 09 e9 09 ea 09 e2 09 cd 09 b5 09
b6 09 b3 09 b7 75 01 95 08 81 42 c0
N: Jieli Technology EDIFIER Hal0 2.0 SE
I: 3 2d99 a101
#  Volume Up: 0 | Volume Down: 0 | Mute: 0 | Play/Pause: 1 | Scan Next
Track: 0 | Scan Previous Track: 0 | Fast Forward: 0 | Stop: 0
E: 000000.000000 1 08
#  Volume Up: 0 | Volume Down: 0 | Mute: 0 | Play/Pause: 0 | Scan Next
Track: 0 | Scan Previous Track: 0 | Fast Forward: 0 | Stop: 0
E: 000000.013010 1 00
[Errno 5] Input/output error
```

Now with the second hidraw. I am super happy and excited. I could see
all the events of volume, profile and YES! The speaker *DID NOT*
reboot I successfully changed brightness on Linux for the *first time*
(Not through VM) without triggering a reboot.

Here is the data:

1. usbmon of the bus.
2. hid-recorder
3.Change volume and brightness (without reboot).
4. Stop usbmon and hid-recorder.
5. Rotating the knob triggers the reboot, It only works when reading
it's hidraw.

```
>sudo cat /sys/kernel/debug/usb/usbmon/3u
ffff8bbca5f48e40 1213779304 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1213833946 C Ii:3:007:4 -2:1 0
ffff8bbca5f48e40 1220856727 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1232766100 C Ii:3:007:4 0:1 64 = 2fbbec66 00021001
20000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1232766122 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1233304061 C Ii:3:007:4 0:1 64 = 2fbbec66 00021002
21000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1233304076 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1233774028 C Ii:3:007:4 0:1 64 = 2fbbec66 00021003
22000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1233774043 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1234070014 C Ii:3:007:4 0:1 64 = 2fbbec66 00021004
23000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1234070039 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1234822966 C Ii:3:007:4 0:1 64 = 2fbbec66 00021005
24000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1234822981 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1235124946 C Ii:3:007:4 0:1 64 = 2fbbec66 00021006
25000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1235124959 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1235347936 C Ii:3:007:4 0:1 64 = 2fbbec66 00021007
26000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1235347955 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1235613921 C Ii:3:007:4 0:1 64 = 2fbbec66 00021008
27000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1235613941 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1235842907 C Ii:3:007:4 0:1 64 = 2fbbec66 00021009
28000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1235842922 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1236087891 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100a
29000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1236087911 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1236380874 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100b
2a000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1236380891 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1236943844 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100c
2b000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1236943860 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1237046837 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100d
2c000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1237046853 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1237314821 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100e
2d000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1237314833 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1237496813 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100f
2e000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1237496832 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1237719800 C Ii:3:007:4 0:1 64 = 2fbbec66 00021010
2f000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1237719817 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1240826632 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100f
2e000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1240826647 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1241099619 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100e
2d000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1241099635 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1241248610 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100d
2c000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1241248625 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1241396600 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100c
2b000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1241396611 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1241604595 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100b
2a000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1241604613 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1241757584 C Ii:3:007:4 0:1 64 = 2fbbec66 0002100a
29000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1241757600 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1241886577 C Ii:3:007:4 0:1 64 = 2fbbec66 00021009
28000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1241886594 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1242068568 C Ii:3:007:4 0:1 64 = 2fbbec66 00021008
27000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1242068586 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1242265558 C Ii:3:007:4 0:1 64 = 2fbbec66 00021007
26000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1242265573 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1242499545 C Ii:3:007:4 0:1 64 = 2fbbec66 00021006
25000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1242499557 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1242707535 C Ii:3:007:4 0:1 64 = 2fbbec66 00021005
24000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1242707547 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1243454499 C Ii:3:007:4 0:1 64 = 2fbbec66 00021004
23000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1243454517 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1243758481 C Ii:3:007:4 0:1 64 = 2fbbec66 00021003
22000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1243758497 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1244027471 C Ii:3:007:4 0:1 64 = 2fbbec66 00021002
21000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1244027493 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1244258462 C Ii:3:007:4 0:1 64 = 2fbbec66 00021001
20000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1244258481 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1244496449 C Ii:3:007:4 0:1 64 = 2fbbec66 00021000
1f000000 00000000 00000000 00000000 00000000 00000000
ffff8bbca5f48e40 1244496468 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1247106334 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1247106355 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1247107328 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1247107344 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1247670307 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1247670326 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1247671297 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1247671311 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1248428269 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1248428285 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1248429268 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1248429278 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1249107244 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1249107259 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1249108241 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1249108251 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1249729221 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00005a03 02000000 5aff0302 00005aff 04e200ff
ffff8bbca5f48e40 1249729247 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1249730216 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00005aff 08ff2f15 5aff09ff ffff5aff 0a32ff82
ffff8bbca5f48e40 1249730228 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1249951210 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00005003 02000000 50ff0302 000050ff 04e200ff
ffff8bbca5f48e40 1249951227 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1249952204 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000050ff 08ff2f15 50ff09ff ffff50ff 0a32ff82
ffff8bbca5f48e40 1249952216 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250225198 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00004603 02000000 46ff0302 000046ff 04e200ff
ffff8bbca5f48e40 1250225213 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250226195 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000046ff 08ff2f15 46ff09ff ffff46ff 0a32ff82
ffff8bbca5f48e40 1250226204 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250478190 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00003c03 02000000 3cff0302 00003cff 04e200ff
ffff8bbca5f48e40 1250478205 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250479185 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00003cff 08ff2f15 3cff09ff ffff3cff 0a32ff82
ffff8bbca5f48e40 1250479196 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250690174 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00003203 02000000 32ff0302 000032ff 04e200ff
ffff8bbca5f48e40 1250690205 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250691178 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000032ff 08ff2f15 32ff09ff ffff32ff 0a32ff82
ffff8bbca5f48e40 1250691193 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250925171 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00002803 02000000 28ff0302 000028ff 04e200ff
ffff8bbca5f48e40 1250925187 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1250926167 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000028ff 08ff2f15 28ff09ff ffff28ff 0a32ff82
ffff8bbca5f48e40 1250926175 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251181161 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00001e03 02000000 1eff0302 00001eff 04e200ff
ffff8bbca5f48e40 1251181177 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251182154 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00001eff 08ff2f15 1eff09ff ffff1eff 0a32ff82
ffff8bbca5f48e40 1251182165 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251626145 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00001403 02000000 14ff0302 000014ff 04e200ff
ffff8bbca5f48e40 1251626161 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251627140 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000014ff 08ff2f15 14ff09ff ffff14ff 0a32ff82
ffff8bbca5f48e40 1251627151 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251782139 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000a03 02000000 0aff0302 00000aff 04e200ff
ffff8bbca5f48e40 1251782153 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251783134 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00000aff 08ff2f15 0aff09ff ffff0aff 0a32ff82
ffff8bbca5f48e40 1251783145 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251970131 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000003 02000000 00ff0302 000000ff 04e200ff
ffff8bbca5f48e40 1251970147 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1251971128 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000000ff 08ff2f15 00ff09ff ffff00ff 0a32ff82
ffff8bbca5f48e40 1251971139 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252149125 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000003 02000000 00ff0302 000000ff 04e200ff
ffff8bbca5f48e40 1252149143 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252150121 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000000ff 08ff2f15 00ff09ff ffff00ff 0a32ff82
ffff8bbca5f48e40 1252150134 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252507126 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000003 02000000 00ff0302 000000ff 04e200ff
ffff8bbca5f48e40 1252507151 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252508106 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000000ff 08ff2f15 00ff09ff ffff00ff 0a32ff82
ffff8bbca5f48e40 1252508117 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252743102 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000003 02000000 00ff0302 000000ff 04e200ff
ffff8bbca5f48e40 1252743118 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252744099 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000000ff 08ff2f15 00ff09ff ffff00ff 0a32ff82
ffff8bbca5f48e40 1252744110 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252827100 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000003 02000000 00ff0302 000000ff 04e200ff
ffff8bbca5f48e40 1252827114 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1252828095 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000000ff 08ff2f15 00ff09ff ffff00ff 0a32ff82
ffff8bbca5f48e40 1252828106 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1253286080 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00000a03 02000000 0aff0302 00000aff 04e200ff
ffff8bbca5f48e40 1253286095 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1253287078 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00000aff 08ff2f15 0aff09ff ffff0aff 0a32ff82
ffff8bbca5f48e40 1253287090 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1253603071 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00001403 02000000 14ff0302 000014ff 04e200ff
ffff8bbca5f48e40 1253603089 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1253604068 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000014ff 08ff2f15 14ff09ff ffff14ff 0a32ff82
ffff8bbca5f48e40 1253604082 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1253829058 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00001e03 02000000 1eff0302 00001eff 04e200ff
ffff8bbca5f48e40 1253829076 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1253830059 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00001eff 08ff2f15 1eff09ff ffff1eff 0a32ff82
ffff8bbca5f48e40 1253830073 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1254088050 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00002803 02000000 28ff0302 000028ff 04e200ff
ffff8bbca5f48e40 1254088066 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1254089048 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000028ff 08ff2f15 28ff09ff ffff28ff 0a32ff82
ffff8bbca5f48e40 1254089075 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1254298043 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00003203 02000000 32ff0302 000032ff 04e200ff
ffff8bbca5f48e40 1254298057 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1254299039 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000032ff 08ff2f15 32ff09ff ffff32ff 0a32ff82
ffff8bbca5f48e40 1254299047 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1254503032 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00003c03 02000000 3cff0302 00003cff 04e200ff
ffff8bbca5f48e40 1254503045 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1254504029 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00003cff 08ff2f15 3cff09ff ffff3cff 0a32ff82
ffff8bbca5f48e40 1254504038 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255047016 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00004603 02000000 46ff0302 000046ff 04e200ff
ffff8bbca5f48e40 1255047033 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255048014 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000046ff 08ff2f15 46ff09ff ffff46ff 0a32ff82
ffff8bbca5f48e40 1255048025 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255138019 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00005003 02000000 50ff0302 000050ff 04e200ff
ffff8bbca5f48e40 1255138038 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255139009 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000050ff 08ff2f15 50ff09ff ffff50ff 0a32ff82
ffff8bbca5f48e40 1255139024 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255374012 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00005a03 02000000 5aff0302 00005aff 04e200ff
ffff8bbca5f48e40 1255374031 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255375006 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00005aff 08ff2f15 5aff09ff ffff5aff 0a32ff82
ffff8bbca5f48e40 1255375022 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255492031 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1255492047 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255493000 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1255493017 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255680996 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1255681014 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255681993 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1255682006 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255842992 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1255843013 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1255843986 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1255843995 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256318977 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1256318995 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256319973 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1256319983 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256441972 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1256441987 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256442967 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1256442978 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256574968 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1256574986 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256575964 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1256575979 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256840958 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00006403 02000000 64ff0302 000064ff 04e200ff
ffff8bbca5f48e40 1256840970 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1256841955 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 000064ff 08ff2f15 64ff09ff ffff64ff 0a32ff82
ffff8bbca5f48e40 1256841962 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1257380941 C Ii:3:007:4 0:1 64 = 2fbbece3 00280201
0d0b0102 00005a03 02000000 5aff0302 00005aff 04e200ff
ffff8bbca5f48e40 1257380955 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1257381937 C Ii:3:007:4 0:1 64 = 2fbbece3 00280202
0d0b0700 00005aff 08ff2f15 5aff09ff ffff5aff 0a32ff82
ffff8bbca5f48e40 1257381947 S Ii:3:007:4 -115:1 64 <
ffff8bbca5f48e40 1266709322 C Ii:3:007:4 -2:1 0


>sudo  hid-recorder
Available devices:
/dev/hidraw0:   Jieli Technology EDIFIER Hal0 2.0 SE
/dev/hidraw1:   Jieli Technology EDIFIER Hal0 2.0 SE
/dev/hidraw2:   Logitech USB Receiver
/dev/hidraw3:   Logitech USB Receiver
/dev/hidraw4:   Logitech USB Receiver
/dev/hidraw5:   Logitech USB Receiver
/dev/hidraw6:   Logitech USB Headset Logitech USB Headset
/dev/hidraw7:   Logitech G815 RGB MECHANICAL GAMING KEYBOARD
/dev/hidraw8:   Logitech G815 RGB MECHANICAL GAMING KEYBOARD
/dev/hidraw9:   ITE Tech. Inc. ITE Device(8176)
/dev/hidraw10:  ELAN0001:00 04F3:31AD
Select the device event number [0-10]: 1
# Jieli Technology EDIFIER Hal0 2.0 SE
# 0x06, 0x13, 0xff,              // Usage Page (Vendor Usage Page 0xff13) 0
# 0x09, 0x01,                    // Usage (Vendor Usage 0x01)           3
# 0xa1, 0x01,                    // Collection (Application)            5
# 0x15, 0x00,                    //  Logical Minimum (0)                7
# 0x26, 0xff, 0x00,              //  Logical Maximum (255)              9
# 0x85, 0x06,                    //  Report ID (6)                      12
# 0x09, 0x00,                    //  Usage (Vendor Usage 0x00)          14
# 0x75, 0x08,                    //  Report Size (8)                    16
# 0x95, 0x3d,                    //  Report Count (61)                  18
# 0x91, 0x02,                    //  Output (Data,Var,Abs)              20
# 0x85, 0x07,                    //  Report ID (7)                      22
# 0x09, 0x00,                    //  Usage (Vendor Usage 0x00)          24
# 0x75, 0x08,                    //  Report Size (8)                    26
# 0x95, 0x3d,                    //  Report Count (61)                  28
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               30
# 0xc0,                          // End Collection                      32
# 0x06, 0x14, 0xff,              // Usage Page (Vendor Usage Page 0xff14) 33
# 0x09, 0x01,                    // Usage (Vendor Usage 0x01)           36
# 0xa1, 0x01,                    // Collection (Application)            38
# 0x15, 0x00,                    //  Logical Minimum (0)                40
# 0x26, 0xff, 0x00,              //  Logical Maximum (255)              42
# 0x85, 0x2e,                    //  Report ID (46)                     45
# 0x09, 0x00,                    //  Usage (Vendor Usage 0x00)          47
# 0x75, 0x08,                    //  Report Size (8)                    49
# 0x95, 0x3f,                    //  Report Count (63)                  51
# 0x91, 0x02,                    //  Output (Data,Var,Abs)              53
# 0x85, 0x2f,                    //  Report ID (47)                     55
# 0x09, 0x00,                    //  Usage (Vendor Usage 0x00)          57
# 0x75, 0x08,                    //  Report Size (8)                    59
# 0x95, 0x3f,                    //  Report Count (63)                  61
# 0x81, 0x02,                    //  Input (Data,Var,Abs)               63
# 0xc0,                          // End Collection                      65
#
R: 66 06 13 ff 09 01 a1 01 15 00 26 ff 00 85 06 09 00 75 08 95 3d 91
02 85 07 09 00 75 08 95 3d 81 02 c0 06 14 ff 09 01 a1 01 15 00 26 ff
00 85 2e 09 00 75 08 95 3f 91 02 85 2f 09 00 75 08
95 3f 81 02 c0
N: Jieli Technology EDIFIER Hal0 2.0 SE
I: 3 2d99 a101
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   1 ,   32 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000000.000000 64 2f bb ec 66 00 02 10 01 20 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   2 ,   33 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000000.537939 64 2f bb ec 66 00 02 10 02 21 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   3 ,   34 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000001.007886 64 2f bb ec 66 00 02 10 03 22 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   4 ,   35 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000001.303902 64 2f bb ec 66 00 02 10 04 23 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   5 ,   36 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000002.056845 64 2f bb ec 66 00 02 10 05 24 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   6 ,   37 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000002.358839 64 2f bb ec 66 00 02 10 06 25 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   7 ,   38 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000002.581797 64 2f bb ec 66 00 02 10 07 26 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   8 ,   39 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000002.847786 64 2f bb ec 66 00 02 10 08 27 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   9 ,   40 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000003.076777 64 2f bb ec 66 00 02 10 09 28 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  10 ,   41 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000003.321743 64 2f bb ec 66 00 02 10 0a 29 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  11 ,   42 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000003.614743 64 2f bb ec 66 00 02 10 0b 2a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  12 ,   43 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000004.177718 64 2f bb ec 66 00 02 10 0c 2b 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  13 ,   44 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000004.280709 64 2f bb ec 66 00 02 10 0d 2c 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  14 ,   45 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000004.548674 64 2f bb ec 66 00 02 10 0e 2d 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  15 ,   46 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000004.730686 64 2f bb ec 66 00 02 10 0f 2e 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  16 ,   47 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000004.953653 64 2f bb ec 66 00 02 10 10 2f 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  15 ,   46 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000008.060483 64 2f bb ec 66 00 02 10 0f 2e 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  14 ,   45 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000008.333469 64 2f bb ec 66 00 02 10 0e 2d 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  13 ,   44 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000008.482456 64 2f bb ec 66 00 02 10 0d 2c 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  12 ,   43 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000008.630442 64 2f bb ec 66 00 02 10 0c 2b 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  11 ,   42 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000008.838456 64 2f bb ec 66 00 02 10 0b 2a 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
  10 ,   41 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000008.991430 64 2f bb ec 66 00 02 10 0a 29 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   9 ,   40 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000009.120428 64 2f bb ec 66 00 02 10 09 28 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   8 ,   39 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000009.302424 64 2f bb ec 66 00 02 10 08 27 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   7 ,   38 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000009.499406 64 2f bb ec 66 00 02 10 07 26 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   6 ,   37 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000009.733391 64 2f bb ec 66 00 02 10 06 25 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   5 ,   36 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000009.941379 64 2f bb ec 66 00 02 10 05 24 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   4 ,   35 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000010.688352 64 2f bb ec 66 00 02 10 04 23 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   3 ,   34 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000010.992337 64 2f bb ec 66 00 02 10 03 22 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   2 ,   33 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000011.261357 64 2f bb ec 66 00 02 10 02 21 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   1 ,   32 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000011.492320 64 2f bb ec 66 00 02 10 01 20 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  102 ,    0 ,    2 ,   16 ,
   0 ,   31 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
 0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000011.730324 64 2f bb ec 66 00 02 10 00 1f 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000014.340198 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000014.341166 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000014.904171 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000014.905136 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000015.662124 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000015.663098 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000016.341098 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000016.342066 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   90 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   90 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   90 ,  255 ,    4 ,  226 ,    0 ,  255 ,   90 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   90 ,  255 ,    6 ,  180 ,  118 ,  255 ,
90 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000016.963095 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 5a 03 02
00 00 00 5a ff 03 02 00 00 5a ff 04 e2 00 ff 5a ff 05 ff ff ff 5a ff
06 b4 76 ff 5a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   90 ,  255 ,    8 ,
255 ,   47 ,   21 ,   90 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   90 ,  255 ,   10 ,   50 ,  255 ,  130 ,   90 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   90 ,  255 ,   12 ,    0 ,    0 ,    0 ,
90 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000016.964045 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 5a ff 08
ff 2f 15 5a ff 09 ff ff ff 5a ff 0a 32 ff 82 5a 06 0b 02 00 00 5a ff
0c 00 00 00 5a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   80 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   80 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   80 ,  255 ,    4 ,  226 ,    0 ,  255 ,   80 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   80 ,  255 ,    6 ,  180 ,  118 ,  255 ,
80 ,  255 ,  136 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.185065 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 50 03 02
00 00 00 50 ff 03 02 00 00 50 ff 04 e2 00 ff 50 ff 05 ff ff ff 50 ff
06 b4 76 ff 50 ff 88 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   80 ,  255 ,    8 ,
255 ,   47 ,   21 ,   80 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   80 ,  255 ,   10 ,   50 ,  255 ,  130 ,   80 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   80 ,  255 ,   12 ,    0 ,    0 ,    0 ,
80 ,  255 ,  136 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.186032 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 50 ff 08
ff 2f 15 50 ff 09 ff ff ff 50 ff 0a 32 ff 82 50 06 0b 02 00 00 50 ff
0c 00 00 00 50 ff 88 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   70 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   70 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   70 ,  255 ,    4 ,  226 ,    0 ,  255 ,   70 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   70 ,  255 ,    6 ,  180 ,  118 ,  255 ,
70 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.459063 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 46 03 02
00 00 00 46 ff 03 02 00 00 46 ff 04 e2 00 ff 46 ff 05 ff ff ff 46 ff
06 b4 76 ff 46 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   70 ,  255 ,    8 ,
255 ,   47 ,   21 ,   70 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   70 ,  255 ,   10 ,   50 ,  255 ,  130 ,   70 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   70 ,  255 ,   12 ,    0 ,    0 ,    0 ,
70 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.460035 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 46 ff 08
ff 2f 15 46 ff 09 ff ff ff 46 ff 0a 32 ff 82 46 06 0b 02 00 00 46 ff
0c 00 00 00 46 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   60 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   60 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   60 ,  255 ,    4 ,  226 ,    0 ,  255 ,   60 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   60 ,  255 ,    6 ,  180 ,  118 ,  255 ,
60 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.712039 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 3c 03 02
00 00 00 3c ff 03 02 00 00 3c ff 04 e2 00 ff 3c ff 05 ff ff ff 3c ff
06 b4 76 ff 3c ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   60 ,  255 ,    8 ,
255 ,   47 ,   21 ,   60 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   60 ,  255 ,   10 ,   50 ,  255 ,  130 ,   60 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   60 ,  255 ,   12 ,    0 ,    0 ,    0 ,
60 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.713007 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 3c ff 08
ff 2f 15 3c ff 09 ff ff ff 3c ff 0a 32 ff 82 3c 06 0b 02 00 00 3c ff
0c 00 00 00 3c ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   50 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   50 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   50 ,  255 ,    4 ,  226 ,    0 ,  255 ,   50 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   50 ,  255 ,    6 ,  180 ,  118 ,  255 ,
50 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.924051 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 32 03 02
00 00 00 32 ff 03 02 00 00 32 ff 04 e2 00 ff 32 ff 05 ff ff ff 32 ff
06 b4 76 ff 32 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   50 ,  255 ,    8 ,
255 ,   47 ,   21 ,   50 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   50 ,  255 ,   10 ,   50 ,  255 ,  130 ,   50 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   50 ,  255 ,   12 ,    0 ,    0 ,    0 ,
50 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000017.925005 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 32 ff 08
ff 2f 15 32 ff 09 ff ff ff 32 ff 0a 32 ff 82 32 06 0b 02 00 00 32 ff
0c 00 00 00 32 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   40 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   40 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   40 ,  255 ,    4 ,  226 ,    0 ,  255 ,   40 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   40 ,  255 ,    6 ,  180 ,  118 ,  255 ,
40 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000018.159017 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 28 03 02
00 00 00 28 ff 03 02 00 00 28 ff 04 e2 00 ff 28 ff 05 ff ff ff 28 ff
06 b4 76 ff 28 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   40 ,  255 ,    8 ,
255 ,   47 ,   21 ,   40 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   40 ,  255 ,   10 ,   50 ,  255 ,  130 ,   40 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   40 ,  255 ,   12 ,    0 ,    0 ,    0 ,
40 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000018.159981 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 28 ff 08
ff 2f 15 28 ff 09 ff ff ff 28 ff 0a 32 ff 82 28 06 0b 02 00 00 28 ff
0c 00 00 00 28 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   30 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   30 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   30 ,  255 ,    4 ,  226 ,    0 ,  255 ,   30 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   30 ,  255 ,    6 ,  180 ,  118 ,  255 ,
30 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000018.415016 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 1e 03 02
00 00 00 1e ff 03 02 00 00 1e ff 04 e2 00 ff 1e ff 05 ff ff ff 1e ff
06 b4 76 ff 1e ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   30 ,  255 ,    8 ,
255 ,   47 ,   21 ,   30 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   30 ,  255 ,   10 ,   50 ,  255 ,  130 ,   30 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   30 ,  255 ,   12 ,    0 ,    0 ,    0 ,
30 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000018.415982 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 1e ff 08
ff 2f 15 1e ff 09 ff ff ff 1e ff 0a 32 ff 82 1e 06 0b 02 00 00 1e ff
0c 00 00 00 1e ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   20 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   20 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   20 ,  255 ,    4 ,  226 ,    0 ,  255 ,   20 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   20 ,  255 ,    6 ,  180 ,  118 ,  255 ,
20 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000018.860014 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 14 03 02
00 00 00 14 ff 03 02 00 00 14 ff 04 e2 00 ff 14 ff 05 ff ff ff 14 ff
06 b4 76 ff 14 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   20 ,  255 ,    8 ,
255 ,   47 ,   21 ,   20 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   20 ,  255 ,   10 ,   50 ,  255 ,  130 ,   20 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   20 ,  255 ,   12 ,    0 ,    0 ,    0 ,
20 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000018.860961 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 14 ff 08
ff 2f 15 14 ff 09 ff ff ff 14 ff 0a 32 ff 82 14 06 0b 02 00 00 14 ff
0c 00 00 00 14 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   10 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   10 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   10 ,  255 ,    4 ,  226 ,    0 ,  255 ,   10 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   10 ,  255 ,    6 ,  180 ,  118 ,  255 ,
10 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.015999 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 0a 03 02
00 00 00 0a ff 03 02 00 00 0a ff 04 e2 00 ff 0a ff 05 ff ff ff 0a ff
06 b4 76 ff 0a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   10 ,  255 ,    8 ,
255 ,   47 ,   21 ,   10 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   10 ,  255 ,   10 ,   50 ,  255 ,  130 ,   10 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   10 ,  255 ,   12 ,    0 ,    0 ,    0 ,
10 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.016954 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 0a ff 08
ff 2f 15 0a ff 09 ff ff ff 0a ff 0a 32 ff 82 0a 06 0b 02 00 00 0a ff
0c 00 00 00 0a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,    0 ,    3 ,    2 ,
  0 ,    0 ,    0 ,    0 ,  255 ,    3 ,    2 ,
   0 ,    0 ,    0 ,  255 ,    4 ,  226 ,    0 ,  255 ,    0 ,  255 ,
  5 ,  255 ,  255 ,  255 ,    0 ,  255 ,    6 ,  180 ,  118 ,  255 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.204001 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 00 03 02
00 00 00 00 ff 03 02 00 00 00 ff 04 e2 00 ff 00 ff 05 ff ff ff 00 ff
06 b4 76 ff 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,    0 ,  255 ,    8 ,
255 ,   47 ,   21 ,    0 ,  255 ,    9 ,  255 ,
 255 ,  255 ,    0 ,  255 ,   10 ,   50 ,  255 ,  130 ,    0 ,    6 ,
 11 ,    2 ,    0 ,    0 ,    0 ,  255 ,   12 ,    0 ,    0 ,    0 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.204953 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 00 ff 08
ff 2f 15 00 ff 09 ff ff ff 00 ff 0a 32 ff 82 00 06 0b 02 00 00 00 ff
0c 00 00 00 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,    0 ,    3 ,    2 ,
  0 ,    0 ,    0 ,    0 ,  255 ,    3 ,    2 ,
   0 ,    0 ,    0 ,  255 ,    4 ,  226 ,    0 ,  255 ,    0 ,  255 ,
  5 ,  255 ,  255 ,  255 ,    0 ,  255 ,    6 ,  180 ,  118 ,  255 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.382979 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 00 03 02
00 00 00 00 ff 03 02 00 00 00 ff 04 e2 00 ff 00 ff 05 ff ff ff 00 ff
06 b4 76 ff 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,    0 ,  255 ,    8 ,
255 ,   47 ,   21 ,    0 ,  255 ,    9 ,  255 ,
 255 ,  255 ,    0 ,  255 ,   10 ,   50 ,  255 ,  130 ,    0 ,    6 ,
 11 ,    2 ,    0 ,    0 ,    0 ,  255 ,   12 ,    0 ,    0 ,    0 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.383944 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 00 ff 08
ff 2f 15 00 ff 09 ff ff ff 00 ff 0a 32 ff 82 00 06 0b 02 00 00 00 ff
0c 00 00 00 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,    0 ,    3 ,    2 ,
  0 ,    0 ,    0 ,    0 ,  255 ,    3 ,    2 ,
   0 ,    0 ,    0 ,  255 ,    4 ,  226 ,    0 ,  255 ,    0 ,  255 ,
  5 ,  255 ,  255 ,  255 ,    0 ,  255 ,    6 ,  180 ,  118 ,  255 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.740999 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 00 03 02
00 00 00 00 ff 03 02 00 00 00 ff 04 e2 00 ff 00 ff 05 ff ff ff 00 ff
06 b4 76 ff 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,    0 ,  255 ,    8 ,
255 ,   47 ,   21 ,    0 ,  255 ,    9 ,  255 ,
 255 ,  255 ,    0 ,  255 ,   10 ,   50 ,  255 ,  130 ,    0 ,    6 ,
 11 ,    2 ,    0 ,    0 ,    0 ,  255 ,   12 ,    0 ,    0 ,    0 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.741926 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 00 ff 08
ff 2f 15 00 ff 09 ff ff ff 00 ff 0a 32 ff 82 00 06 0b 02 00 00 00 ff
0c 00 00 00 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,    0 ,    3 ,    2 ,
  0 ,    0 ,    0 ,    0 ,  255 ,    3 ,    2 ,
   0 ,    0 ,    0 ,  255 ,    4 ,  226 ,    0 ,  255 ,    0 ,  255 ,
  5 ,  255 ,  255 ,  255 ,    0 ,  255 ,    6 ,  180 ,  118 ,  255 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.976953 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 00 03 02
00 00 00 00 ff 03 02 00 00 00 ff 04 e2 00 ff 00 ff 05 ff ff ff 00 ff
06 b4 76 ff 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,    0 ,  255 ,    8 ,
255 ,   47 ,   21 ,    0 ,  255 ,    9 ,  255 ,
 255 ,  255 ,    0 ,  255 ,   10 ,   50 ,  255 ,  130 ,    0 ,    6 ,
 11 ,    2 ,    0 ,    0 ,    0 ,  255 ,   12 ,    0 ,    0 ,    0 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000019.977919 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 00 ff 08
ff 2f 15 00 ff 09 ff ff ff 00 ff 0a 32 ff 82 00 06 0b 02 00 00 00 ff
0c 00 00 00 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,    0 ,    3 ,    2 ,
  0 ,    0 ,    0 ,    0 ,  255 ,    3 ,    2 ,
   0 ,    0 ,    0 ,  255 ,    4 ,  226 ,    0 ,  255 ,    0 ,  255 ,
  5 ,  255 ,  255 ,  255 ,    0 ,  255 ,    6 ,  180 ,  118 ,  255 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000020.060943 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 00 03 02
00 00 00 00 ff 03 02 00 00 00 ff 04 e2 00 ff 00 ff 05 ff ff ff 00 ff
06 b4 76 ff 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,    0 ,  255 ,    8 ,
255 ,   47 ,   21 ,    0 ,  255 ,    9 ,  255 ,
 255 ,  255 ,    0 ,  255 ,   10 ,   50 ,  255 ,  130 ,    0 ,    6 ,
 11 ,    2 ,    0 ,    0 ,    0 ,  255 ,   12 ,    0 ,    0 ,    0 ,
 0 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000020.061915 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 00 ff 08
ff 2f 15 00 ff 09 ff ff ff 00 ff 0a 32 ff 82 00 06 0b 02 00 00 00 ff
0c 00 00 00 00 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   10 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   10 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   10 ,  255 ,    4 ,  226 ,    0 ,  255 ,   10 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   10 ,  255 ,    6 ,  180 ,  118 ,  255 ,
10 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000020.519925 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 0a 03 02
00 00 00 0a ff 03 02 00 00 0a ff 04 e2 00 ff 0a ff 05 ff ff ff 0a ff
06 b4 76 ff 0a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   10 ,  255 ,    8 ,
255 ,   47 ,   21 ,   10 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   10 ,  255 ,   10 ,   50 ,  255 ,  130 ,   10 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   10 ,  255 ,   12 ,    0 ,    0 ,    0 ,
10 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000020.520903 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 0a ff 08
ff 2f 15 0a ff 09 ff ff ff 0a ff 0a 32 ff 82 0a 06 0b 02 00 00 0a ff
0c 00 00 00 0a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   20 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   20 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   20 ,  255 ,    4 ,  226 ,    0 ,  255 ,   20 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   20 ,  255 ,    6 ,  180 ,  118 ,  255 ,
20 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000020.836925 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 14 03 02
00 00 00 14 ff 03 02 00 00 14 ff 04 e2 00 ff 14 ff 05 ff ff ff 14 ff
06 b4 76 ff 14 ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   20 ,  255 ,    8 ,
255 ,   47 ,   21 ,   20 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   20 ,  255 ,   10 ,   50 ,  255 ,  130 ,   20 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   20 ,  255 ,   12 ,    0 ,    0 ,    0 ,
20 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000020.837891 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 14 ff 08
ff 2f 15 14 ff 09 ff ff ff 14 ff 0a 32 ff 82 14 06 0b 02 00 00 14 ff
0c 00 00 00 14 ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   30 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   30 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   30 ,  255 ,    4 ,  226 ,    0 ,  255 ,   30 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   30 ,  255 ,    6 ,  180 ,  118 ,  255 ,
30 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.062910 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 1e 03 02
00 00 00 1e ff 03 02 00 00 1e ff 04 e2 00 ff 1e ff 05 ff ff ff 1e ff
06 b4 76 ff 1e ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   30 ,  255 ,    8 ,
255 ,   47 ,   21 ,   30 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   30 ,  255 ,   10 ,   50 ,  255 ,  130 ,   30 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   30 ,  255 ,   12 ,    0 ,    0 ,    0 ,
30 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.063889 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 1e ff 08
ff 2f 15 1e ff 09 ff ff ff 1e ff 0a 32 ff 82 1e 06 0b 02 00 00 1e ff
0c 00 00 00 1e ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   40 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   40 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   40 ,  255 ,    4 ,  226 ,    0 ,  255 ,   40 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   40 ,  255 ,    6 ,  180 ,  118 ,  255 ,
40 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.321900 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 28 03 02
00 00 00 28 ff 03 02 00 00 28 ff 04 e2 00 ff 28 ff 05 ff ff ff 28 ff
06 b4 76 ff 28 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   40 ,  255 ,    8 ,
255 ,   47 ,   21 ,   40 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   40 ,  255 ,   10 ,   50 ,  255 ,  130 ,   40 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   40 ,  255 ,   12 ,    0 ,    0 ,    0 ,
40 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.322884 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 28 ff 08
ff 2f 15 28 ff 09 ff ff ff 28 ff 0a 32 ff 82 28 06 0b 02 00 00 28 ff
0c 00 00 00 28 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   50 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   50 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   50 ,  255 ,    4 ,  226 ,    0 ,  255 ,   50 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   50 ,  255 ,    6 ,  180 ,  118 ,  255 ,
50 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.531888 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 32 03 02
00 00 00 32 ff 03 02 00 00 32 ff 04 e2 00 ff 32 ff 05 ff ff ff 32 ff
06 b4 76 ff 32 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   50 ,  255 ,    8 ,
255 ,   47 ,   21 ,   50 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   50 ,  255 ,   10 ,   50 ,  255 ,  130 ,   50 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   50 ,  255 ,   12 ,    0 ,    0 ,    0 ,
50 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.532859 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 32 ff 08
ff 2f 15 32 ff 09 ff ff ff 32 ff 0a 32 ff 82 32 06 0b 02 00 00 32 ff
0c 00 00 00 32 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   60 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   60 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   60 ,  255 ,    4 ,  226 ,    0 ,  255 ,   60 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   60 ,  255 ,    6 ,  180 ,  118 ,  255 ,
60 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.736894 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 3c 03 02
00 00 00 3c ff 03 02 00 00 3c ff 04 e2 00 ff 3c ff 05 ff ff ff 3c ff
06 b4 76 ff 3c ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   60 ,  255 ,    8 ,
255 ,   47 ,   21 ,   60 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   60 ,  255 ,   10 ,   50 ,  255 ,  130 ,   60 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   60 ,  255 ,   12 ,    0 ,    0 ,    0 ,
60 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000021.737855 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 3c ff 08
ff 2f 15 3c ff 09 ff ff ff 3c ff 0a 32 ff 82 3c 06 0b 02 00 00 3c ff
0c 00 00 00 3c ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   70 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   70 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   70 ,  255 ,    4 ,  226 ,    0 ,  255 ,   70 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   70 ,  255 ,    6 ,  180 ,  118 ,  255 ,
70 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.280869 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 46 03 02
00 00 00 46 ff 03 02 00 00 46 ff 04 e2 00 ff 46 ff 05 ff ff ff 46 ff
06 b4 76 ff 46 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   70 ,  255 ,    8 ,
255 ,   47 ,   21 ,   70 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   70 ,  255 ,   10 ,   50 ,  255 ,  130 ,   70 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   70 ,  255 ,   12 ,    0 ,    0 ,    0 ,
70 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.281839 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 46 ff 08
ff 2f 15 46 ff 09 ff ff ff 46 ff 0a 32 ff 82 46 06 0b 02 00 00 46 ff
0c 00 00 00 46 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   80 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   80 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   80 ,  255 ,    4 ,  226 ,    0 ,  255 ,   80 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   80 ,  255 ,    6 ,  180 ,  118 ,  255 ,
80 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.371881 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 50 03 02
00 00 00 50 ff 03 02 00 00 50 ff 04 e2 00 ff 50 ff 05 ff ff ff 50 ff
06 b4 76 ff 50 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   80 ,  255 ,    8 ,
255 ,   47 ,   21 ,   80 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   80 ,  255 ,   10 ,   50 ,  255 ,  130 ,   80 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   80 ,  255 ,   12 ,    0 ,    0 ,    0 ,
80 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.372884 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 50 ff 08
ff 2f 15 50 ff 09 ff ff ff 50 ff 0a 32 ff 82 50 06 0b 02 00 00 50 ff
0c 00 00 00 50 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   90 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   90 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   90 ,  255 ,    4 ,  226 ,    0 ,  255 ,   90 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   90 ,  255 ,    6 ,  180 ,  118 ,  255 ,
90 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.607879 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 5a 03 02
00 00 00 5a ff 03 02 00 00 5a ff 04 e2 00 ff 5a ff 05 ff ff ff 5a ff
06 b4 76 ff 5a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   90 ,  255 ,    8 ,
255 ,   47 ,   21 ,   90 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   90 ,  255 ,   10 ,   50 ,  255 ,  130 ,   90 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   90 ,  255 ,   12 ,    0 ,    0 ,    0 ,
90 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.608909 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 5a ff 08
ff 2f 15 5a ff 09 ff ff ff 5a ff 0a 32 ff 82 5a 06 0b 02 00 00 5a ff
0c 00 00 00 5a ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.725901 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.726851 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.914847 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000022.915816 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.076836 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.077816 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.552843 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.553794 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.675848 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.676881 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.808821 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,   37 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000023.809787 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 25 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,  100 ,    3 ,    2 ,
  0 ,    0 ,    0 ,  100 ,  255 ,    3 ,    2 ,
   0 ,    0 ,  100 ,  255 ,    4 ,  226 ,    0 ,  255 ,  100 ,  255 ,
  5 ,  255 ,  255 ,  255 ,  100 ,  255 ,    6 ,  180 ,  118 ,  255 ,
100 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000024.074813 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 64 03 02
00 00 00 64 ff 03 02 00 00 64 ff 04 e2 00 ff 64 ff 05 ff ff ff 64 ff
06 b4 76 ff 64 ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,  100 ,  255 ,    8 ,
255 ,   47 ,   21 ,  100 ,  255 ,    9 ,  255 ,
 255 ,  255 ,  100 ,  255 ,   10 ,   50 ,  255 ,  130 ,  100 ,    6 ,
 11 ,    2 ,    0 ,    0 ,  100 ,  255 ,   12 ,    0 ,    0 ,    0 ,
100 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000024.075769 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 64 ff 08
ff 2f 15 64 ff 09 ff ff ff 64 ff 0a 32 ff 82 64 06 0b 02 00 00 64 ff
0c 00 00 00 64 ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   1 ,   13 ,   11 ,    1 ,    2 ,    0 ,    0 ,   90 ,    3 ,    2 ,
  0 ,    0 ,    0 ,   90 ,  255 ,    3 ,    2 ,
   0 ,    0 ,   90 ,  255 ,    4 ,  226 ,    0 ,  255 ,   90 ,  255 ,
  5 ,  255 ,  255 ,  255 ,   90 ,  255 ,    6 ,  180 ,  118 ,  255 ,
90 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000024.614783 64 2f bb ec e3 00 28 02 01 0d 0b 01 02 00 00 5a 03 02
00 00 00 5a ff 03 02 00 00 5a ff 04 e2 00 ff 5a ff 05 ff ff ff 5a ff
06 b4 76 ff 5a ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
# ReportID: 47 / 0xff140000:  187 ,  236 ,  227 ,    0 ,   40 ,    2 ,
   2 ,   13 ,   11 ,    7 ,    0 ,    0 ,    0 ,   90 ,  255 ,    8 ,
255 ,   47 ,   21 ,   90 ,  255 ,    9 ,  255 ,
 255 ,  255 ,   90 ,  255 ,   10 ,   50 ,  255 ,  130 ,   90 ,    6 ,
 11 ,    2 ,    0 ,    0 ,   90 ,  255 ,   12 ,    0 ,    0 ,    0 ,
90 ,  255 ,    0 ,    0 ,    0 ,    0 ,    0 ,
   0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,    0 ,
  0 ,    0 ,    0
E: 000024.615756 64 2f bb ec e3 00 28 02 02 0d 0b 07 00 00 00 5a ff 08
ff 2f 15 5a ff 09 ff ff ff 5a ff 0a 32 ff 82 5a 06 0b 02 00 00 5a ff
0c 00 00 00 5a ff 00 00 00 00 00 00 00 00 00 00 0
0 00 00 00 00 00 00 00
^C%
```

