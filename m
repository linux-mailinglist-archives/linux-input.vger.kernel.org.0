Return-Path: <linux-input+bounces-15277-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B65BC0D26
	for <lists+linux-input@lfdr.de>; Tue, 07 Oct 2025 11:10:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 587C14E282A
	for <lists+linux-input@lfdr.de>; Tue,  7 Oct 2025 09:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC20CA4B;
	Tue,  7 Oct 2025 09:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BydjqtRd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABEF2571BD
	for <linux-input@vger.kernel.org>; Tue,  7 Oct 2025 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759828252; cv=none; b=jkW0Et8UXjr+Ue1rAu4Rwqy7WE1sBQSYKwmD7C5wQ/EK4/8MnGaSL3GuNaQ9fHIJEbqZzUWRhXmzR9WUboAyBex78c5gvuwiNOCWsP2adx7neOQAsh3i7oenIvqzp2VmBtIneDhzP1sQ8xjgC6HewqEIYgN1zmttzfkSvLo5zco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759828252; c=relaxed/simple;
	bh=X2G+yz30BV0KqMy4jf4jxFGkgt2PGaGMFBUjk8ax8vg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KiDMyafCP6bPhv29vXeZHEz8Pbw7nTuxrpuJWqVl5/qNXPr9ckXpym6fC+0ecQw3hYRRj7upHxw+6xxEekf/0fxrijVhUplHI4VN/V8SOyN1jk1D8G3wtv8ngWiqU0XrEW6+sB95rTAz+fQTLzRWAIndR9ol1Pv3zq4q3sBfJcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BydjqtRd; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7ea50f94045so72277426d6.1
        for <linux-input@vger.kernel.org>; Tue, 07 Oct 2025 02:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828247; x=1760433047; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhPQkIXeuwe2/Fa3TkI7JvEAad3Qz30z6ASHa7lY+Wo=;
        b=BydjqtRdjg/CLW9M6zZcFyQXQGNZi2vPJd1Krfh7rQ/Ql0jPcxaLqsMt/NlLXGX9SQ
         V8Ufs5kvaT0Hqy2pxyBGrfAwJ/W9Aw9UeLyYS+xFJFGQyYyRiCaj2o1pXQjbwhjdk7hd
         sqKI/xZHwFVsidYcq5bbIQYCSxNjHm7pMfIKFa3nTIaX4HjITuVqWN73tPT+qbE4G5vu
         Ucmo1PzGuikk89pPEY1GBTTS8Ep4JKH56ODE5pXZ3QxEFpmcrmwzhXknC0Mo42MWPSMP
         u+XRuPtvBDvqjnbthlSdNCvUmJddRIQU9kvFZ8YzmkxOAf+UZu4NyoQJcGINxRBAHIqG
         bLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828247; x=1760433047;
        h=content-transfer-encoding:subject:references:in-reply-to:message-id
         :cc:to:from:date:mime-version:feedback-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhPQkIXeuwe2/Fa3TkI7JvEAad3Qz30z6ASHa7lY+Wo=;
        b=IigcmgrvEBPv0NTcqT2X/qBBPZTrURHt+sShF93tcHl/O+LFjUqMOMiRVnYI4v9YQx
         nrirX36maBWj9weUkvY51ED/03xGMTR4jTFlunrVjRhCvdoGvzsCCrZku/Xrm2lE+n1d
         soIPZQQT4vEtBshZBx27TZtYxe8icXdz5DGDVBaGl1+zbfwfaMp4aIEUhYfsIGHtos+i
         11A5eChFykSPFblUwhz8RscpGHSq7FDpCSIHmRCKQgIMYX5JyFF/5n0AmaxixvduKiet
         oiwaG/yGlW/GG3sX3ap6nMLECdes+csAuh9rFMIR86B2zuwx3VgnLCbIhvB9E+ruDXYJ
         ayEg==
X-Forwarded-Encrypted: i=1; AJvYcCU55gf6r/tcijwhxlLhDFHW73jOg/DQXEHSFSaKD0wNZM7/2JnyLwXlrjs5IoecE/+8RwShtSVvdeWOOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6bsW6amidFBR00YBdaXRxWfa3aJHWQ+8mZ81L2mib6zb7UHXd
	+Xyp1FpbgayyYwdOMLD+oDS5tE3xR04dHuMQnkbJchThO4pE+QFoeYZo
X-Gm-Gg: ASbGncuoJNb8vlmFqwf6hEaYWddViLRosDXYDKi/ApdDmxASG67IC9MlvN/rqrx7ffQ
	whzMqLt9Ssoy+hToPlwPSPZWjGiKb4UhUoyGzr1GBE1b7Jw3iROcF106I0tfBh+Tn/O8f0cZpQf
	g38ZJv4VaYVubxq30ktjTpBpjtMIevqdGuX3/dz3LP6F/ZoZepvYsVxRluH9d4E0e3dL1CUOUuq
	9kEIftEkNiK31JjG/1oHx9jhNuVrMA4Cff7ks1TjiqOz1oi1fP3NLg0Okp1WapuVhPRcLbbHLWF
	6ALRjTksIZ/AS4gt0zxvEaqmuPcYI3KkMC0MqiZBaAa6tYZYaog1uORuqsODliWHDFtIbDxKwtU
	iy9KkUJlPkrZZh9cSIlFlgTshsHxxeRyXL/Lz/zZerMJOL5iXxG3UBRzrci8jhbu8BwuHpbkxbL
	9bWbnx02SYOXr9uj2S8xXVE14S6PPh302fQ2i63+kvQ34Z2L0=
X-Google-Smtp-Source: AGHT+IEhOhK6nPMX6dL6gj1Sx0niWtUJJYST9T37s6pk1MJusDvdgyk848Qv0AlEPIfoLNfZO1HDmg==
X-Received: by 2002:a05:622a:4a05:b0:4e4:d72d:69b2 with SMTP id d75a77b69052e-4e6de87d231mr33143221cf.24.1759828247033;
        Tue, 07 Oct 2025 02:10:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55d6b237esm151168761cf.43.2025.10.07.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:10:46 -0700 (PDT)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id A2ADFF4006A;
	Tue,  7 Oct 2025 05:10:45 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-01.internal (MEProxy); Tue, 07 Oct 2025 05:10:45 -0400
X-ME-Sender: <xms:FdnkaPvZbAQHafn54f2AJjjH2o36k8XrTrDVKFLLg7seOaAWmnRUvQ>
    <xme:FdnkaLQlIyf2ayFr4c0dEw1r5H0e8B6-TAa3VgnjVKHlUyjETBwgZI6NgojE7pxAE
    -RsCuOQw0o0WyH1dnW56GU33WVMBztIRFvtXpuhGA-_eEHPsnTBUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddutddttddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedfuegvnhhj
    rghmihhnucfvihhsshhoihhrvghsfdcuoegsvghnjhgrmhhinhdrthhishhsohhirhgvsh
    esghhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepgffggeektdfgffevueehleej
    ueejieeftedvieeukeejieevvddvtdeujeejgfehnecuffhomhgrihhnpehfrhgvvgguvg
    hskhhtohhprdhorhhgpdgtrhgtrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepsggvnhhjrghmihhnodhmvghsmhhtphgruhhthh
    hpvghrshhonhgrlhhithihqddufeejfedttdefiedtqddvleektdejjeekgedqsggvnhhj
    rghmihhnrdhtihhsshhoihhrvghspeepghhmrghilhdrtghomhessggrnhhquhhishgvrd
    gvuhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    nhgvthifihiisegtrhgtrdhiugdrrghupdhrtghpthhtoheptghhrghtthihsegvnhgrtg
    drfhhrpdhrtghpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:FdnkaN2c247zWnSXmB-ttMamaQ7sv33Uu7q3GZT114f_KqhKsZtpBQ>
    <xmx:FdnkaPilwrLtyvBaz-qUfsT4dj0WWWfr-6qqaFRtopqW3u-qQG187Q>
    <xmx:FdnkaBaOiJab7TUDUUbS7jAu6lmKq5zCYS_ldX8sogrk5XTXs-ezWQ>
    <xmx:FdnkaPQpQfNTqbC-SsPX-OA8P8m_R6-dgWu4sTPVLILr5AEzQiqO8g>
    <xmx:FdnkaMSncgZDiB_H0BZqUQrM0vf2-yPngII_SMEL-b4uh1mCuHCuGG32>
Feedback-ID: i3c514981:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72484C40054; Tue,  7 Oct 2025 05:10:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AuksZPTF120c
Date: Tue, 07 Oct 2025 11:10:09 +0200
From: "Benjamin Tissoires" <benjamin.tissoires@gmail.com>
To: "Steven Haigh" <netwiz@crc.id.au>
Cc: =?UTF-8?Q?St=C3=A9phane_Chatty?= <chatty@enac.fr>,
 "Peter Hutterer" <peter.hutterer@who-t.net>, linux-input@vger.kernel.org
Message-Id: <8720ac11-2b1d-4b42-84c8-52407dbda7e7@app.fastmail.com>
In-Reply-To: <fd7e0577-a992-4761-823b-b5fe41a7ee74@crc.id.au>
References: <2a878c8a-0289-4378-9c32-6eaf57e7dbfc@crc.id.au>
 <d058871a-a2c6-4197-a77c-08edb0ce70b4@app.fastmail.com>
 <fd7e0577-a992-4761-823b-b5fe41a7ee74@crc.id.au>
Subject: Re: hid_multitouch - random non-responsive, multitouch, scrolling and zooming
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Tue, Oct 7, 2025, at 3:42 AM, Steven Haigh wrote:
> On 6/10/25 19:30, Benjamin Tissoires wrote:
>> Hi Steven,
>>=20
>> On Sat, Oct 4, 2025, at 12:23 PM, Steven Haigh wrote:
>>> Hi guys,
>>>
>>> Firstly, I apologise for contacting you directly - I couldn't find a=
 bug
>>> reporting / method to try to debug this issue.
>>=20
>> No worries. Though usually it's best to Cc the LKML with linux-input@=
vger.kernel.org. So unless you prefer not to, I'd like to include this i=
n feature emails so that other will benefit from the same.
>
> Thanks, I've added that address to this reply.
>>>
>>> I have a Dell Inspiron 5515 which has a touchpad that seems to be
>>> controled via hid_multitouch.
>>>
>>> While using it in Fedora (Currently the F43 beta with kernel 6.17), I
>>> have random times where the keypad stops responding, or gets locked =
into
>>> zoom mode, or scroll mode.
>>>
>>> When it gets like this, I can't move the cursor and basically smoosh=
ing
>>> the touchpad with clicks or other input seems to be the only way I've
>>> found it to recover.
>>=20
>> This remembers me about https://gitlab.freedesktop.org/libinput/libin=
put/-/issues/1194
>>=20
>> TL;DR is that there is a bug in the hid-multitouch driver that doesn'=
t entirely mimic the Windows driver, and some touches might get stuck be=
cause the firmware forgets to send the releases. I have a better kernel =
fix for that but because we are in the middle of the v6.18 kernel merge =
window, I can not post and merge it yet.
>
>  From the description of this, it sounds very much like the problem.=20
> It's been driving me nuts for quite a long time - to the point where I=20
> just close the laptop and go use a desktop sometimes. I figured I'd=20
> finally try to get a fix instead - because if it affects me, it will=20
> affect others at some point.
>
> Logically, yes, it does make sense that the trackpad is thinking there=20
> are touches that just don't exist. I also thought that because I have=20
> bigger hands than average, that maybe its also detecting a single touc=
h=20
> as double sometimes - but your description seems to be more fitting to=20
> the situation.

great, now we "just" need to test the fixes.

>
>> Meanwhile, for people having the DLL0945 I've opened a temporary stop=
 gap through https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merg=
e_requests/204
>>=20
>> There is a high chance this works for you too (I've tested this on 3 =
different laptops with different DLL* numbers), but to be sure it's not =
messing with your system, can you send me the full output of `sudo libin=
put record` with the touchpad node?
>
> I've followed the "installing from CI" instructions with the artifacts=20
> from that Merge Request and run the install.sh.
>
> I can see the firmware files in /usr/local/lib/firmware/hid/bpf
>
> I rebooted, but I don't see anything in /sys/fs/bpf/hid
>
> I thought that maybe they need to be in the initramfs, so ran `dracut=20
> --regenerate-all -f` and rebooted again - but still nothing in=20
> /sys/fs/bpf/hid.
>
> Do I need to do something else here?

Yes, that's normal. Each HID-BPF file is supposed to only register to a =
certain vendor ID and product ID, and in your case, the touchpad doesn't=
 match.

But there is also a slight difference with your touchpad. If you looks a=
t your C translation of the input report[0], we get:

```
  struct touch_report {
        __u8 report_id;         /* Report ID 4 */

        struct {
                __u8 confidence:1;
                __u8 tip_switch:1;
                __u8 padding1:2;
                __u8 contact_id:4;
  		__u16 x;	/* Logical max: 1919 */
  		__u16 y;	/* Logical max: 1079 */
  	} __attribute__((packed)) fingers[5];

  	__u16 scan_time;
  	__u8 contact_count;
  	__u8 button:1;
  	__u8 padding2:7;
  } __attribute__((packed));
```

While the one the HID-BPF expects is:
```
  struct touch_report {
  	__u8 report_id;		/* Report ID 3 */

  	struct {
  		__u8 confidence:1;
  		__u8 tip_switch:1;
  		__u8 contact_id:3;
  		__u8 padding:3;
  		__u16 x;	/* Logical max: 1296 */
  		__u16 y;	/* Logical max: 752 */
  	} __attribute__((packed)) fingers[5];

  	__u16 scan_time;
  	__u8 contact_count;
  	__u8 button:1;
  	__u8 padding:7;
  } __attribute__((packed));
```

So a couple of diffs:
- report ID is 4 in your case, when it's 3 in the other touchpad case
- the position and number of bits of the contact_id field is not the sam=
e (4 bits in yours, 3 in the other).

That means that I need to either edit that HID-BPF to account for those =
2 variants, or just copy/paste it into a new file. But that also means w=
e probably need more logs to be able to ensure we are fixing the issue.

The third option consist in getting the hid-multitouch more generic fix =
upstream (in v6.18-rc1 or -rc2) and get it backported in all stable and =
for you to just wait. (which should hopefully happen anyway).

>
> I ran `libinput record -o recording.yml /dev/event/input6` and have=20
> attached the compressed output. Annoyingly, it seems like the touchpad=20
> is working fine at the moment - so it may confirm the hardware=20
> information, but not a recording of the problem right now.

Yeah, same on one of the Dell laptops I have here. I know it has the bug=
, but whenever I try to reproduce it it never shows meaning I was never =
able to pin point the issue :(

Cheers,
Benjamin

>
>>>
>>> This seems to be worse if the kernel clock is not synced via NTP - I
>>> have no idea why.
>>>
>>> Are you able to give me some hints / pointers in how I could start to
>>> debug this?
>>=20
>> Hopefully this is the exact same bug, and we already have a fix (and =
a temporary band aid).
>>=20
>> Cheers,
>> Benjamin
>>=20
>>>
>>> evtest shows the devices as:
>>> /dev/input/event5:      DELL0A78:00 27C6:0D42 Mouse
>>> /dev/input/event6:      DELL0A78:00 27C6:0D42 Touchpad
> --=20
> Steven Haigh
>
> =F0=9F=93=A7 netwiz@crc.id.au
> =F0=9F=92=BB https://crc.id.au
>
> Attachments:
> * recording.yml.xz

[0] that was obtained by running hid-decode on your yaml file to get the=
 hid-recorder file format, and then we can read the report descriptor.

