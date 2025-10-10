Return-Path: <linux-input+bounces-15366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B564BCE4E2
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 20:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 474B13A2235
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 18:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BA62FC039;
	Fri, 10 Oct 2025 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GirWNMRb"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC32C08B2;
	Fri, 10 Oct 2025 18:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122520; cv=none; b=Y5AMTprWGi3I0e/2YIAS0kg+sSZyQJXH7n3do6knWSxO6GdXIJKls5RC9Zez1SJPo83q8anoe0g5h+RPtf7ym9dA8PgeTRi6LzItiGQRjsaCHL2rpRd/PEXjGQ+Pf+vARvrwpqIDDY/u+brmFWaOyrREQhmQU/4CyAY9UuF/WZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122520; c=relaxed/simple;
	bh=en9YFWnQpgZbRDUeAplwNqWZdpCubLq+g6tM2tWJ7PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GWFbDH0M55da+Ov4dYDlHCgTDNGAY0hihCDjwlemGLX2fkQP+0yer6xs283NC+hJWyPA86i6r9gQlbTyixa3hXFOxaxzwwrnlYGkKPZnNbrXLfsN60CzF1u9iazHJJZlxXCcnzI0URu80d6+/dfZlwOdGx3BCJWq3KJ/cPJYwIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GirWNMRb; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5jNCQYIvpduCc+VH5KL3Lm4MDphgs8rymPh/IGBtAvI=; b=GirWNMRbkJheAMGxdxBOFE/fDT
	V0FAMb9JVnSPXwToKcKVXBqquf361jZaB46Q2dhmwIl9Qn+/jFW9xlvhwzR1gJFXY6Zw12ZN3PdJu
	TIjXdr/q6Ws7axoVh14OQtasrZpiInwDAw8diKwzjlwLrHnMNt406gTeAIahsaJ2OKfA5jeEM7L3n
	GmMt5WspbbTtLmUCg3poe+hZELf7Z6/fhTWymPqoET8vT3iDTdru7IaPV6uo0pvMPbaDo3OHsAgJ4
	krNqYOwDzuLOO14otjJgxJExMzgyus4/bBpzLL+sYPgpUpT6mYwmsEKQwzmilZ2XF6B5uM6jg2PIU
	psFP7BAw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7IGm-00000009B8s-11Kg;
	Fri, 10 Oct 2025 18:55:12 +0000
Message-ID: <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
Date: Fri, 10 Oct 2025 11:55:11 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>,
 Sean O'Brien <seobrien@google.com>, Lucas GISSOT <lucas.gissot.pro@gmail.com>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
 <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I think I found it... see below.


On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> [Top-Posting for easier consumption]
> 
> Mainly writing this mail to bring Lucas GISSOT in here, who reported the
> same error yesterday here:
> https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> 
> Lucas there suggested:
> """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> Kconfig updated."""
> 
> And Randy: Thx for the closer investigation! It explains some of the
> "that feels odd, am I holding this wrong" feeling I had when reporting this.
> 
> Ciao, Thorsten
> 
> On 10/10/25 06:50, Randy Dunlap wrote:
>> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
>>> On 8/19/25 01:08, Jonathan Denose wrote:
>>>> From: Angela Czubak <aczubak@google.com>
>>>>
>>>> Define a new structure that contains simple haptic device configuration
>>>> as well as current state.
>>>> Add functions that recognize auto trigger and manual trigger reports
>>>> as well as save their addresses.Hi,
>>>> Verify that the pressure unit is either grams or newtons.
>>>> Mark the input device as a haptic touchpad if the unit is correct and
>>>> the reports are found.
>>>>  [...]
>>>> +config HID_HAPTIC
>>>> +	tristate "Haptic touchpad support"
>>>> +	default n
>>>> +	help
>>>> +	Support for touchpads with force sensors and haptic actuators instead of a
>>>> +	traditional button.
>>>> +	Adds extra parsing and FF device for the hid multitouch driver.
>>>> +	It can be used for Elan 2703 haptic touchpad.
>>>> +
>>>> +	If unsure, say N.
>>>> +
>>>>  menu "Special HID drivers"
>>>
>>> I suspect this change is related to a build error I ran into today:
>>>
>>>   MODPOST Module.symvers
>>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
>>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
>>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
>>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
>>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
>>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
>>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
>>>
>>> The config where this occurred had this:
>>>
>>> CONFIG_HID=y
>>> CONFIG_HID_MULTITOUCH=m
>>> CONFIG_HID_HAPTIC=m
>>>
>>> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.
>>
>> Sure, but that's just covering up the problem.
>>> First, I get this build error:
>>
>> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o
>>

ISTM that tristate is incompatible with this newly added Makefile
line:

+hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o

hid-* lists files that should be builtin, not loadable modules.
These should all be hid-y.  AFAIK, hid-m is not useful.
(A maintainer can correct me as needed.)

So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
hid-haptic.c and changing drivers/hid/Makefile to use
obj-$(CONFIG_HID_HAPTIC_	+= hid-haptic.o

fixes the build errors for me.

Angela, Jonathan D., is there any reason that
hid-haptic needs to be builtin instead of a loadable
module?  It's no problem for hid-multitouch.ko to call
into hid-haptic.ko (both as loadable modules) as long as
hid-haptic.ko is loaded first.

Thanks.

~Randy
---
---
 drivers/hid/hid-haptic.c |    3 +++
 1 file changed, 3 insertions(+)

--- linux.orig/drivers/hid/hid-haptic.c
+++ linux/drivers/hid/hid-haptic.c
@@ -10,6 +10,9 @@
 
 #include "hid-haptic.h"
 
+MODULE_DESCRIPTION("HID haptic touchpad support");
+MODULE_LICENSE("GPL");
+
 void hid_haptic_feature_mapping(struct hid_device *hdev,
 				struct hid_haptic_device *haptic,
 				struct hid_field *field, struct hid_usage *usage)
---
 drivers/hid/Makefile |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux.orig/drivers/hid/Makefile
+++ linux/drivers/hid/Makefile
@@ -4,7 +4,8 @@
 #
 hid-y			:= hid-core.o hid-input.o hid-quirks.o
 hid-$(CONFIG_DEBUG_FS)		+= hid-debug.o
-hid-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
+
+obj-$(CONFIG_HID_HAPTIC)	+= hid-haptic.o
 
 obj-$(CONFIG_HID_BPF)		+= bpf/
 


