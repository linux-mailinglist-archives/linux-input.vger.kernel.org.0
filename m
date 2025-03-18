Return-Path: <linux-input+bounces-10909-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D52EA672E2
	for <lists+linux-input@lfdr.de>; Tue, 18 Mar 2025 12:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBC2E3A2857
	for <lists+linux-input@lfdr.de>; Tue, 18 Mar 2025 11:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9A920B1E1;
	Tue, 18 Mar 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QuA5FaJP"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D11620AF7E
	for <linux-input@vger.kernel.org>; Tue, 18 Mar 2025 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742298056; cv=none; b=JgtNEDtHoMihqmKKhgdnTlCnKQaxx2HwGqlfIt1xkHrAGkxtFjF3+G9FgA9QyPZMl2GSmAKIZiudgvkxlxU8oM8vIidZK3ioDNiwc3RoI3fgtNSH3ce3UAXpzeOi6qp+lC5LvVy7sot+sDMVtQOeS2QZREoiFtvN5RhGgpqekgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742298056; c=relaxed/simple;
	bh=EHTWdEsu2VAZXPgfx53VJ8jzeIr6Wd8/B/+23DA+j7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Y0hggWoT6jzSP2p9i3ALsMvCN9yDfMPcP09WCZ6s6kAklAdBH+9s2beLl5qPRzQMlceCeQt6isq8zESanElup2HL5gf7UfT4RDEHcNgzCnLthSgOidE3yY65LYQjb+2fgnmPPyFf2kq1LcJ5Dle1un9zovX6z1MJME88YyU77JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QuA5FaJP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742298050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uMGVs2CXM5I3qQNxU7Zt0g18et6fVjjthdEJnxcqNSM=;
	b=QuA5FaJPlBvx93U/T8fd7pFVFF+v6m+9T0qUxAXyitfUaQQp2PYmmpQlsTuQIdtkEm5m2X
	rCAAz17PF5hjhkI/fDb2Z3SfIQY/0V0qqLm4v8drKmV1nMQUmKRlTK8BKLCsixkT7JNK7Q
	uuy9U14tY5v71NQ1siOcb6aRQo7eAGI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-O2upahueOJ2Zgs3-qrxorg-1; Tue, 18 Mar 2025 07:40:49 -0400
X-MC-Unique: O2upahueOJ2Zgs3-qrxorg-1
X-Mimecast-MFC-AGG-ID: O2upahueOJ2Zgs3-qrxorg_1742298048
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ab39f65dc10so617335666b.1
        for <linux-input@vger.kernel.org>; Tue, 18 Mar 2025 04:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742298048; x=1742902848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uMGVs2CXM5I3qQNxU7Zt0g18et6fVjjthdEJnxcqNSM=;
        b=f/L8E9suao8RPQFsc5OM2cLApI3jvX4K9Z/Fo8XeVXXtgc8k2WfK268Woxy6WJw+Bj
         30Je0aXlBA3fzD8W01l+mdNFgGbvaQ1i/pV0fUptVmviNA1ovmPhhmzqx6iQMsGFudjk
         GcxyxEPU8pM2q1dk0V+oOmi62Ntbn47k6+poyY+LbkXEUmF3qYyMKlQrP0gpFx0nVxoz
         XgbDfhZxLRQWM2fJ4U4t/uza7eGIjMx7COydoRppp/LtGn0MlrQKR2T0gS4CQLnQRj+E
         b/eOicLaP/cViLtNBrxALsPumk5VMVxdabmrgBNMYi0MrICCdza/7/1o6sJMLTK+3ZRs
         UBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeSqlEtcD/uXAnBuOeZp+24Mfw9qdqXyQjEMHdG+dS4eLBybClzQK5bZHdWqTUln3/EfGLHHq4j+Vegw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7wHzz7OZLJ5F53Lt7W4xIxBTSW/qOL2Xy0Iv6YEmuXxioVtc6
	3gSzoz/bTFRDHj4W5bOWxqo/EQFdBzQe8EPXafTnXO4VdL3NxYLsX2lDz7Zh7tyOt8BtpqNoz1E
	ohGy3hK25Ye53b5A3q7nyy3CzxGb1W4kdKiowbjopRPO2jm6EYOfPvTutD4CX
X-Gm-Gg: ASbGncuy+47/+dB4lI6Owg8ROASUmDUChOSXgX+uXqBcRUBsgO0XdKs5uIXvDS9KGDf
	ry3HYZR3UFXYfY/Bnb29ho6V+EBv42g3Xrl2fb5zBqSgS+xci8KdYtq50FM0opvH4Ks2RazhHQd
	wO6HYnAX5r/yNAPiJQFA8Of7DKP3Z5TUjSJhGei53ozbvCR4bFgLuLNk8lkw2SJTgX9VJzuKaTi
	EcIwsWaD3MYSUBYWq9D3e1gJ4UThFbHYrrvvFs0uQwE2LrIXH7I2EeeUuknjRkLuGUSt20P0L6X
	MA19/tMymmdfsOy+zeZx1sQJM39LWpZG8laNkl03A4pVV0mDz2QR0uqHZZAY4bBfMWuzpgXGwRZ
	LMC7vt9PC1I0Q6WC4LMHZMPw8RY6NbQVM+H9ngF9EaILEvwQDQwsqyKsN0JBwppCmOQ==
X-Received: by 2002:a17:906:4795:b0:abf:fb7b:8d09 with SMTP id a640c23a62f3a-ac33041c7a6mr1518079066b.51.1742298048058;
        Tue, 18 Mar 2025 04:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnAkNOwq9cWKj0MJ1yBnhA35rdpxU2VfqyIntcELBoeNXUcYnxc6YUL9nNJ9THVbwX1hRLOg==
X-Received: by 2002:a17:906:4795:b0:abf:fb7b:8d09 with SMTP id a640c23a62f3a-ac33041c7a6mr1518076766b.51.1742298047609;
        Tue, 18 Mar 2025 04:40:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147f0bd3sm836081466b.67.2025.03.18.04.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 04:40:47 -0700 (PDT)
Message-ID: <a458616b-3f3d-4f1d-9339-3ebdab6a2fdc@redhat.com>
Date: Tue, 18 Mar 2025 12:40:46 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Henry Isaac <henry_isaac@live.com>, linux-input@vger.kernel.org
References: <AM9PR03MB7712D6F6F359E3147B35B415EDDF2@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <AM9PR03MB7712D6F6F359E3147B35B415EDDF2@AM9PR03MB7712.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Henry,

On 17-Mar-25 5:40 PM, Henry Isaac wrote:
> 
> Hello!
> 
> I recent spoke to Hans after contacting the wrong email who kindly pointed me here.
> 
> I am having issues with a tablet PC I brought where the touch device is not recognised. The tablet is a GeoPad 220 using a Goodix GXTP7386 touch pannel.
> 
> Everything works except the touch screen, I have attached the dmesg.txt and acpidump.txt
> 
> Also here are the command line prompts I was advised to run.
> 
> [henry@Geopad220 ~]$ sudo dmesg > dmesg.txt
> [sudo] password for henry: 
> [henry@Geopad220 ~]$ sudo acpidump -o acpidump.txt
> [henry@Geopad220 ~]$ ls /sys/bus/i2c/devices
> i2c-0  i2c-10  i2c-12  i2c-2  i2c-4  i2c-6  i2c-8  i2c-GXTP7386:00
> i2c-1  i2c-11  i2c-13  i2c-3  i2c-5  i2c-7  i2c-9  i2c-MXC6655:00
> [henry@Geopad220 ~]$ cat /sys/bus/i2c/devices/i2c-GXTP7386:00/modalias
> acpi:GXTP7386:PNP0C50:
> 
> If you need anymore info please reach out I am happy to help where I can in case others have this issue too!

Ok, so this appears to be a i2c-hid touchscreen, but for some
reason I'm not seeing any i2c-hid related messages in your dmesg.

Please add the following to your kernel commandline:

i2c_hid.dyndbg

See the Arch documentation for how to add something to the kernel
commandline.

After this reboot with the new kernel commandline and do:

cat /proc/cmdline

and make sure that i2c_hid.dyndbg is there.

Then do:

sudo dmesg > dmesg.txt

check dmesg.txt this should now contain some i2c_hid xxxx messages,
if not then it looks like the driver is not loading for some reason.

In this case try manually modprobing it:

sudo modprobe i2c_hid_acpi

and then run:

sudo dmesg > dmesg.txt

and see if some new i2c_hid messages have shown up now.

Either way please attach the new dmesg.txt to your next email and
then we'll see from there.

Regards,

Hans








> 
> Many thanks
> Henry


