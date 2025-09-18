Return-Path: <linux-input+bounces-14866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1363B86C92
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 21:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95DCA3AAB7B
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 19:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDA6304994;
	Thu, 18 Sep 2025 19:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="IDdu7ovv"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EDA2D77E2;
	Thu, 18 Sep 2025 19:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225413; cv=none; b=equMMsywfGGCYhKr/3/lUuOUs28ZporEX7t3QD9xCm475zWVu7gwUADcQskFiwQLmEubZ10gcqhbM+3oEW6kXSlByU5umUEtNOe916mme5UqLayTrhg9g77bg5WEGlkQsfplF+TOAn/xheOPDFT0m+hM47HDhFRndT0BMfGTuys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225413; c=relaxed/simple;
	bh=r7WAXRduQEHoix8J0gLBB9Wc6pQciyeE5NKHP7MstB4=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Jw/fhTZ1m3N/DurdGiHRcYfz7qplMCMB4Ejxu0YaT1i4d+e2s/NltldRk0VuUtPmEKtSJbepTcaKK1Rdq3LeC9M29hc1j8p5vUQKNEHaI6EBbICOXQA8h9vgZjB+giOJrLJ6rU4VI2wFCOXXB0NKJyZ5IIOsiW0q+D/5buhPRm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=IDdu7ovv; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pceG8WN/hVwIKwsmqxsfKdZEBJJDbsw7zIFKIJ+0JIY=; b=IDdu7ovvSe8Apv0r0tTzMJzUPo
	BL1inegAcsrsA2yj2XKF1FSj1CLdANPGhPjx1ytm8Wjc1UyBnEGzUGjNCNF+rfSW40rR0YqFyZOfJ
	vrrUnjwTu8CrPzLz2Rbk+Ehv00cCdaGf4xvDND0GeVzvoDS9hyGCVkKvg39+YBd4g0nlI6qFhWSju
	96vILA2vvEyAoUInfU5Rr1LpABqsiFcWrWEaAx1jue5gczTGTEv/ZEHrmX6AiUR2C1Rv2ubcfomYh
	/3WC6P3m9lzX+oLeu48yAwsKnSik1EnsvEnsbsQK+BSh0VHFfab3Ywq29YCDFrRZxCLISkp837WAj
	A7ibMTzA==;
Received: from [::1] (port=55482 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1uzKkF-0000000GIW5-1oZ6;
	Thu, 18 Sep 2025 21:56:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 18 Sep 2025 21:56:38 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, Salvatore Bonaccorso
 <carnil@debian.org>, Jiri Kosina <jkosina@suse.com>, Benjamin Tissoires
 <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
In-Reply-To: <54b4b55c-ef29-40ae-a576-0c0b35ea9625@kylinos.cn>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
 <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
 <94520aac-2a68-40d2-b188-80f9e361d6de@kylinos.cn>
 <735c20da-c052-4528-ad91-185a835ca40c@cosmicgizmosystems.com>
 <54b4b55c-ef29-40ae-a576-0c0b35ea9625@kylinos.cn>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <3c299b65351c489fea95ec8b93518b6b@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - sv9.manufrog.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oscillator.se
X-Get-Message-Sender-Via: sv9.manufrog.com: authenticated_id: staffan.melin@oscillator.se
X-Authenticated-Sender: sv9.manufrog.com: staffan.melin@oscillator.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Thank you for the patches!

Unfortunately I could not apply v3, I got an error message.

While I could apply patch v4 and compile and test it, same result as 
before -- no working touchscreen, and touchscreen not visible on xinput 
--list. This was on 6.16.7.

Best regards,

Staffan


On 2025-09-18 16:05, zhangheng wrote:
> It's interesting that I found another USB device with the same ID, but
> it's a USB headphone, device descriptors in headphone.txt
> 
> Microphone.txt is the device descriptor for SMARTLINKTechnology.
> 
> I was originally planning to differentiate according to bcdHID, but
> there is hdev ->version=0x100, therefore, I created the v3 patch.
> 
> The microphone device is normal, but I'm not sure if your touchscreen
> function is working properly.
> 
> [   67.417805] usb 1-3.4.2: new full-speed USB device number 11 using
> xhci_hcd
> [   67.566700] usb 1-3.4.2: New USB device found, idVendor=4c4a,
> idProduct=4155, bcdDevice= 1.00
> [   67.566707] usb 1-3.4.2: New USB device strings: Mfr=1, Product=2,
> SerialNumber=3
> [   67.566712] usb 1-3.4.2: Product: USB Composite Device
> [   67.566717] usb 1-3.4.2: Manufacturer: SmartlinkTechnology
> [   67.566721] usb 1-3.4.2: SerialNumber: 20201111000001
> [   67.568816] DEBUG: drivers/hid/hid-quirks.c 1227 hid_gets_squirk
> hdev->version = 0x100
> [   67.568827] DEBUG: drivers/hid/hid-quirks.c 1025 hid_ignore
> hdev->version = 0x100
> [   67.568832] DEBUG: drivers/hid/hid-quirks.c 1227 hid_gets_squirk
> hdev->version = 0x100
> [   67.569256] DEBUG: drivers/hid/hid-quirks.c 1227 hid_gets_squirk
> hdev->version = 0x201
> 
> [   39.692821] DEBUG: drivers/hid/usbhid/hid-core.c 985 usbhid_parse
> dev->serial = 20201111000001
> 
>  Later, I thought of using a serial number, Later, I thought of using
> a serial number, but the headphone serial number was NULL,
> 
> and printing it directly would trigger OOPs, at present, I can only
> consider distinguishing between manufacturers, this is v4 patch.
> 
> If there are better ideas or patches, they can also be provided. The
> microphone device will arrive in a few days, and I will verify it
> then.
> 
> 在 2025/9/16 7:06, Terry Junge 写道:
> 
>> On 9/15/25 1:37 AM, zhangheng wrote:
>> 
>>> Apply this new patch and test the kernel again. I don't have the
>>> original mic device in my hands, which means I have to wait for a
>>> response for testing now.
>>> 
>>> You can test it first, and the other mic device also needs to be
>>> retested
>> 
>> Your patch will not work as you expect for two reasons.
>> 
>> if (hid_match_id(hdev, hid_ignore_list) ||
>> (hid_match_id(hdev, hid_ignore_mic) && (hdev->version >
>> 1.1)))
>> quirks |= HID_QUIRK_IGNORE;
>> 
>> hdev->version is U32 not float. Version (bcdDevice) 1.00 would be
>> 0x0100. The value 1.1 is probably cast to 0x0001.
>> 
>> Second, both devices have identical VID, PID, bcdDevice, and Product
>> names.
>> 
>> [  563.104908] usb 1-1.4.1.2: New USB device found, idVendor=4c4a,
>> idProduct=4155, bcdDevice= 1.00
>> [  563.104910] usb 1-1.4.1.2: New USB device strings: Mfr=1,
>> Product=2, SerialNumber=3
>> [  563.104911] usb 1-1.4.1.2: Product: USB Composite Device
>> [  563.104912] usb 1-1.4.1.2: Manufacturer: SmartlinkTechnology
>> [  563.104913] usb 1-1.4.1.2: SerialNumber: 20201111000001
>> 
>> [   10.451534] usb 3-3: New USB device found, idVendor=4c4a,
>> idProduct=4155, bcdDevice= 1.00
>> [   10.451540] usb 3-3: New USB device strings: Mfr=1, Product=2,
>> SerialNumber=3
>> [   10.451543] usb 3-3: Product: USB Composite Device
>> [   10.451545] usb 3-3: Manufacturer: Jieli Technology
>> [   10.451546] usb 3-3: SerialNumber: FFFFFFFFFFFFFFFF
>> 
>> If you could get the descriptors for the microphone device, it would
>> be helpful.
>> 
>> Thanks,
>> Terry
>> 
>> 在 2025/9/13 21:11, Staffan Melin 写道:
>> 
>> Ah, thanks, I get it now :)
>> 
>> So I got 6.16.7, and the patch applied without problems.
>> 
>> But no luck, the same results as before: touchscreen not working,
>> xinput --list not showing the Jieli touchscreen. dmesg shows the
>> same as before, too.
>> 
>> Best regards,
>> 
>> Staffan
>> 
>> On 2025-09-13 10:55, Salvatore Bonaccorso wrote:
>> 
>> Hi Staffan,
>> 
>> chiming in hopefully it is of help.
>> 
>> Now really with the patch ...
>> 
>> On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
>> 
>> Thank you,
>> 
>> I tried to apply this patch to 6.12.39, the first problematic
>> kernel, as
>> well as 6.12.41, the first bad I tried, and on both I got an error
>> message:
>> 
>> Applying: HID: quirks: Add device descriptor for 4c4a:4155
>> error: patch failed: drivers/hid/hid-quirks.c:1068
>> error: drivers/hid/hid-quirks.c: patch does not apply
>> Patch failed at 0001 HID: quirks: Add device descriptor for
>> 4c4a:4155
>> 
>> To which kernel version should I apply the patch?
>> 
>> As the deveopment goes from mainline then down to stable series, the
>> fix needs to be developed first for mainline. So the patch is
>> targeted
>> there.
>> 
>> But please find attached an updated patch which hopefully should
>> work
>> which resolved the context changes on top of 6.12.47.
>> 
>> But ideally you can provide a Tested-by on zhangheng's mainline
>> patch
>> to get things rolling as needed.
>> 
>> Regards,
>> Salvatore

