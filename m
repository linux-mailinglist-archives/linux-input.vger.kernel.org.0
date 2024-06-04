Return-Path: <linux-input+bounces-4076-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C2E8FB4D7
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 16:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5203F1C21DAF
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 14:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 828C61A28D;
	Tue,  4 Jun 2024 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIaqDY9D"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4453D7A;
	Tue,  4 Jun 2024 14:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717510279; cv=none; b=Do99tp2pjXXgvHC7fH92wLEx78k9108P9rTgCn2IDMJOmoAExEiIGHy4QHkZ98dp4f8s5F/myB8bWNIWryRERJCxndOzTngff5ZO7bFRfAlwH7LMJYyAcYiop4khb0fSpd/jxlZkGa/TCXuoet6Spf1mBHOQ0KQSKNDboLBCqKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717510279; c=relaxed/simple;
	bh=a422lWeYbLkuVt42f1eunIjlz5HNbG8GdHLSokVgowk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=fTsmFnE82rmH0R6VdDqHi6VyMC607El6FbZ+ZUy1tGdmzTp1L17zTRsW+7OJ/ED1evah3QVCKh0iNLsOuHmdjZVEn9L3fx2pvZ2Fe/YaxyJA+EcFyif+MDL/xDfw6Vi+Cft/ugaYJEAZaht9Yzn6oSuXp601m/c8x9vxm55SQm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIaqDY9D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D63C32786;
	Tue,  4 Jun 2024 14:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717510278;
	bh=a422lWeYbLkuVt42f1eunIjlz5HNbG8GdHLSokVgowk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=EIaqDY9DQWoKlGJColkb3JL3yHyWBnZJFQ00ENnHxDRHFxAHMK11gYxW6oyisydBV
	 mtXbKdRy/dS/LVwe7eZbXevDRoNNEqvhxB6IQAFcBSZmyjamivYrBHzkAfd3QDJiQ+
	 Dx3dYI+1x7g7J2v1uhA3hNGZpjGFQqFfkPiNTJRiFTt2/jhaatyzjW4REgtBpSpFKG
	 1meWhd1AOnNF66SXee5XmwV3e2E0+/OmAADlVQRLPwKsilD5WNnkFv+irlsdJoJiii
	 QE8B1RPEqOxFhZxmgA78HaYrOn87EsawWxpZKK5FazlGT0K4G4debq7AMSxJREfUUE
	 B+KGhhQsOx6+A==
Date: Tue, 04 Jun 2024 07:11:16 -0700
From: Kees Cook <kees@kernel.org>
To: Jiri Kosina <jikos@kernel.org>,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>
CC: Benjamin Tissoires <bentiss@kernel.org>, Kees Cook <keescook@chromium.org>,
 linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com,
 linux-hardening@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_HID=3A_usbhid=3A_fix_recurren?=
 =?US-ASCII?Q?t_out-of-bounds_bug_in_usbhid=5Fparse=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru> <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
Message-ID: <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On June 4, 2024 1:15:35 AM PDT, Jiri Kosina <jikos@kernel=2Eorg> wrote:
>On Fri, 24 May 2024, Nikita Zhandarovich wrote:
>
>> Syzbot reports [1] a reemerging out-of-bounds bug regarding hid
>> descriptors possibly having incorrect bNumDescriptors values in
>> usbhid_parse()=2E
>>=20
>> Build on the previous fix in "HID: usbhid: fix out-of-bounds bug"
>> and run a sanity-check ensuring that number of descriptors doesn't
>> exceed the size of desc[] in struct hid_descriptor=2E
>>=20
>> [1] Syzbot report:
>> Link: https://syzkaller=2Eappspot=2Ecom/bug?extid=3Dc52569baf0c843f3549=
5
>>=20
>> UBSAN: array-index-out-of-bounds in drivers/hid/usbhid/hid-core=2Ec:102=
4:7
>> index 1 is out of range for type 'struct hid_class_descriptor[1]'
>> CPU: 0 PID: 8 Comm: kworker/0:1 Not tainted 6=2E9=2E0-rc6-syzkaller-002=
90-gb9158815de52 #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 03/27/2024
>> Workqueue: usb_hub_wq hub_event
>> Call Trace:
>>  <TASK>
>>  __dump_stack lib/dump_stack=2Ec:88 [inline]
>>  dump_stack_lvl+0x241/0x360 lib/dump_stack=2Ec:114
>>  ubsan_epilogue lib/ubsan=2Ec:231 [inline]
>>  __ubsan_handle_out_of_bounds+0x121/0x150 lib/ubsan=2Ec:429
>>  usbhid_parse+0x5a7/0xc80 drivers/hid/usbhid/hid-core=2Ec:1024
>>  hid_add_device+0x132/0x520 drivers/hid/hid-core=2Ec:2790
>>  usbhid_probe+0xb38/0xea0 drivers/hid/usbhid/hid-core=2Ec:1429
>>  usb_probe_interface+0x645/0xbb0 drivers/usb/core/driver=2Ec:399
>>  really_probe+0x2b8/0xad0 drivers/base/dd=2Ec:656
>>  __driver_probe_device+0x1a2/0x390 drivers/base/dd=2Ec:798
>>  driver_probe_device+0x50/0x430 drivers/base/dd=2Ec:828
>>  __device_attach_driver+0x2d6/0x530 drivers/base/dd=2Ec:956
>>  bus_for_each_drv+0x24e/0x2e0 drivers/base/bus=2Ec:457
>>  __device_attach+0x333/0x520 drivers/base/dd=2Ec:1028
>>  bus_probe_device+0x189/0x260 drivers/base/bus=2Ec:532
>>  device_add+0x8ff/0xca0 drivers/base/core=2Ec:3720
>>  usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message=2Ec:2210
>>  usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic=2Ec:254
>>  usb_probe_device+0x1b8/0x380 drivers/usb/core/driver=2Ec:294
>>=20
>> Reported-and-tested-by: syzbot+c52569baf0c843f35495@syzkaller=2Eappspot=
mail=2Ecom
>> Fixes: f043bfc98c19 ("HID: usbhid: fix out-of-bounds bug")
>> Signed-off-by: Nikita Zhandarovich <n=2Ezhandarovich@fintech=2Eru>
>
>Applied, thanks=2E

This isn't the right solution=2E The problem is that hid_class_descriptor =
is a flexible array but was sized as a single element fake flexible array:=
=20

struct hid_descriptor {
	   __u8  bLength;
	   __u8  bDescriptorType;
	   __le16 bcdHID;
	   __u8  bCountryCode;
	   __u8  bNumDescriptors;

	   struct hid_class_descriptor desc[1];
} __attribute__ ((packed));

This likely needs to be:=20

struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);

And then check for any sizeof() uses of the struct that might have changed=
=2E



--=20
Kees Cook

