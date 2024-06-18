Return-Path: <linux-input+bounces-4403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F9490C63C
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 12:17:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B63E1C2121C
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3DDC13A250;
	Tue, 18 Jun 2024 07:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="3i17D+4H"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF417EF04;
	Tue, 18 Jun 2024 07:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718696661; cv=none; b=Up0j2M+5mdwYaINd5tuH6Rr8z9nvRGOwQaPAfMQxr9v6eZnKw2DIO9z8Q2cl3O4nF3Xcxlh4MWtutJ31m+bj0Y/S5dIKGNJMV+JKm/KChICoh8mEcvn1LCwY11rA++2eiBr8OfpCZKPc4ieYzYGfnIduwgSc8c1RS8TsGDFIeKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718696661; c=relaxed/simple;
	bh=quE7CbA+hJK4Q3E7v2W+XYSGoUEBpSjGu7J/FkZiGn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=uNSIM1JeXfwkKcav23glnZZYMYdcuMAYtoigIzkPp0PO4meKFqtqzGP/7HzOzESRI+7rCuhE/HN8UrLP/Nm3BCkAIwq0gJojqLC/mek7zUKIotuME53IWWvQMUXQHCYQ2nR69fSdZyqCGVAC7+mKm5J+eO4X+Avmui/DLT2NaeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=3i17D+4H; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=Nw4bJ4tSdfxhTXYp9MZQqf/Uh23gcXIcn+IQdoRdAUc=;
	t=1718696659; x=1719128659; b=3i17D+4H0L6Wa/T9TPZ2mrGBxSyqEtmwZ2onp+i6sIKNwI4
	56Cigv/Iy4B7JCnSp3NjYUFQBQ1gcgIwxomNhmKTwIynWVjsbbSS8k+X/UMnLiaXf+fNuNZiAf3aH
	JJs1wmIzHmVfKn0mXCXMt1TRcLvpvkKv8c5yMyvw979PTjbEOicY+Ics5XvELZDzd4+khJ7qe5NUg
	K0vAQEhlxh6naV/QgA86G9NwFRtx7iDeHSNqi2BosXPUF71XHboeOZVdtIrEFL7XWgyxVPka5AzkU
	bP5cb1pDTdiUs3kf7f2dtTEKsivDGMERnhI1DvAlLOwTNZLUD6qJzbeDqDA11CxQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sJTVm-00028g-Pc; Tue, 18 Jun 2024 09:44:14 +0200
Message-ID: <3eae9fcc-14fa-4292-945e-3339011825b9@leemhuis.info>
Date: Tue, 18 Jun 2024 09:44:14 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xinput Controllers No Longer Working
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <CABRw72orHLEqpAS=cW1ThGkVUW0juqc7Y_-N2=o-k0rSqgpLxA@mail.gmail.com>
 <bb96d22d-250f-4d5d-9c21-c2568d37b27b@leemhuis.info>
 <CABRw72rifuVjs+LU5bB-2va11h=COyPpeBzWYkEMP+dW_h6MQQ@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Cc: Edward Wawrzynski <ewawrzynski16@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CABRw72rifuVjs+LU5bB-2va11h=COyPpeBzWYkEMP+dW_h6MQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718696659;31951e46;
X-HE-SMSGID: 1sJTVm-00028g-Pc

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Dmitry, Edward seems to have some regression with Xinput Controllers no
Longer Working since v6.8..v6.9 and still not working with mainline. The
thread starts here:
https://lore.kernel.org/all/CABRw72orHLEqpAS%3DcW1ThGkVUW0juqc7Y_-N2%3Do-k0rSqgpLxA@mail.gmail.com/

Dmesg files are attached to the parent of this mail. I briefly looked
into them but no obvious problem jumped out to me untrained eyes.

Edward, with a bit of luck Dmitry might have an idea what's wrong here.
But if not you might need to perform a git bisection to find the change
that broke things:
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

That process would also rule out that some config change on the Fedora
side causes this.

Ciao, Thorsten

On 18.06.24 02:03, Edward Wawrzynski wrote:
> Hi Thorsten - I've removed the stable mailing list.
> 
> Sorry I took so long to respond. I just got the information you
> requested. To add onto the previous report, the kernel I booted into
> this time is 6.8.12, and the Xinput controllers still work perfectly.
> 
> I've attached two separate files I've generated, one on 6.9.4 (the
> broken one) and one on 6.8.12 (the working one). Please let me know if
> I can be of any further assistance.
> 
> On Mon, Jun 17, 2024 at 12:14 PM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> [to anyone that replies to this: please drop the stable mailing list
>> from CC, as this sounds like a mainline regressin]
>>
>> Hi Edward! Thx for your report
>>
>> On 17.06.24 17:37, Edward Wawrzynski wrote:
>>>
>>> I was reaching out to report that there's been a regression in the
>>> latest stable 6.9.4 kernel. I'm using Fedora 40 and 6.9.4 just got
>>> pushed to the repos recently. Upon updating, my wired USB Xinput
>>> controllers no longer get detected.
>>>
>>> I've tried two 8BitDo controllers, the one being the 8BitDo Pro 2
>>> Bluetooth (with a USB cable) and the other being the 8BitDo Pro 2
>>> Wired Controller for Xbox. Neither of them are being detected on
>>> Kernel 6.9.4, despite previously working throughout the lifetime of
>>> Fedora 40's 6.8.x kernel versions, the latest being 6.8.11. I've also
>>> tried the vanilla kernel, as well as the latest vanilla mainline
>>> kernel from Fedora's COPR: 6.10.0-0.rc4.337.vanilla.fc40.x86_64.
>>>
>>> To reproduce, simply load Kernel 6.9.4+
>>
>> That sounds a lot like it is a mainline regression that was introduced
>> between 6.8.y and 6.9;
>>
>>> and plug a USB controller in
>>> with XInput (either an Xbox controller or something else that emulates
>>> one). It won't be detected. I plugged in a PS5 controller and it
>>> worked, but when I plugged in an Xbox Series S controller, it didn't
>>> work. The 8BitDo Pro 2 Bluetooth controller has four different
>>> settings (Switch, Android, DirectInput, Xinput), and it was detected
>>> and worked on every setting except for the Xinput setting. Reverting
>>> to version 6.8.11 fixes the issues immediately.
>>
>> Could you please share the output of "journalctl --dmesg --output=short"
>> for both a working and a broken kernel?

--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

P.S.: let me add this to the tracking:

#regzbot report /
#regzbot introduced v6.8..v6.9
#regzbot title input: Xinput Controllers No Longer Working
#regzbot ignore-activity

