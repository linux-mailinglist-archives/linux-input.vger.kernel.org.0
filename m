Return-Path: <linux-input+bounces-38-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7017E9BE2
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 13:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5471C208CE
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 12:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0C61D555;
	Mon, 13 Nov 2023 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JnYdsKpB"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30771D548
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 12:08:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17350D70
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699877336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ohw0dNj6PCrL3aWdJIEiEA1CQN4bo8sSlQoIBw+ynDc=;
	b=JnYdsKpBKqXhRbBehzPx8lrIaqa7y61zxVvmW2W+qbsICDB2HRRzC8Ss0czQ+6+oFSmTvx
	muTwu8prFfMwyFkjE/VOuSEppjUTY8gU0hL7TscRV879gOJbbqvZ2Aj+OMA1F64T+p9ds5
	9NIeQxA8VZ0faLFIqwm4cGtUFJI6s/k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-XhFTPMtSMK-5EWz3x6cGxg-1; Mon, 13 Nov 2023 07:08:54 -0500
X-MC-Unique: XhFTPMtSMK-5EWz3x6cGxg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9ae686dafedso315639466b.3
        for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 04:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699877333; x=1700482133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ohw0dNj6PCrL3aWdJIEiEA1CQN4bo8sSlQoIBw+ynDc=;
        b=wAdtaYAtWpzh8VGqjk+HIMspXxvhEnSKk/SiLls8Ru9KUmLNMzWfRS2U8BXIQ5uJ4T
         8U3xl+n52D++9PRCsAOa/PR67kHInM1ZBGsTuqey5l4O1NA8V7WtrS5XFUQWq429UMT1
         JrOHqNXELJNN5jjwNcLrjg1icNmyqeglq8347V2P/Sd6l7zhYB7qMW7g3smWW6vD2D5g
         oQBW82GjtCtWhI3knUVPKlyKKDznijwp81ZXRF+4YAapxu6v2JQYVDkh8TVJTJaHqkH3
         JXQ1bC5XWuwSag39/ZZ8th+hKVXtCRFSHxD4HKHr+vB3K4C3YkHdQgLztevcio5DJKtt
         XACg==
X-Gm-Message-State: AOJu0Yx/5a29H3QbW0KEU99Si0GQi9LwH4z5Dzfo/ZxO/NWUi9aNmS6b
	b3Pz3m4D/pYTngWG4UCX3fnCIQFIJGCJyc7nDBqrkWfRCeDTyKatgXcgW4D5oO7yKr7323mBBgJ
	PAp0WzmwTXUMBquv7nzjvRhQ=
X-Received: by 2002:a17:906:dc9:b0:9d4:84b6:8709 with SMTP id p9-20020a1709060dc900b009d484b68709mr4252551eji.58.1699877333673;
        Mon, 13 Nov 2023 04:08:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3egoYPAwiwEOdQbDTv96sIgFFxm2nFF27TxPoFfRaZ9FGk/T4LK14lnbapAjuh2EC7ACJWQ==
X-Received: by 2002:a17:906:dc9:b0:9d4:84b6:8709 with SMTP id p9-20020a1709060dc900b009d484b68709mr4252541eji.58.1699877333318;
        Mon, 13 Nov 2023 04:08:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id xo15-20020a170907bb8f00b009ade1a4f795sm3924808ejc.168.2023.11.13.04.08.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:08:52 -0800 (PST)
Message-ID: <99dcbb8d-06a8-4c32-ab03-94bc3bf5658f@redhat.com>
Date: Mon, 13 Nov 2023 13:08:52 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to disable the touchscreen so it does not draw power?
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <978f5891-5167-4a07-884a-4ba464af30f3@molgen.mpg.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <978f5891-5167-4a07-884a-4ba464af30f3@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/13/23 09:39, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On a Dell XPS 13 9360 with a touchscreen, when it’s connect to an external monitor, that is set up as the only display, the touchscreen – although the internal monitor is disabled (in GNOME) – is still active and draws power according to PowerTOP:
> 
>     $ uname -a
>     Linux abreu 6.5.0-4-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.10-1 (2023-11-03) x86_64 GNU/Linux
>     $ lsusb  | grep Touchscreen
>     Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. Touchscreen
>     $ sudo LANG= powertop
>     Power est.              Usage       Events/s    Category Description
>       9.39 W    100.0%                      Device         USB device: DELL DA300 (Bizlink)
>       1.39 W    100.0%                      Device         USB device: Touchscreen (ELAN)
> 
> Is there a way to disable the touchscreen, so it does not draw power?
> 
> `sudo modprobe -r hid-multitouch` also affects the touchpad, which is not wanted.

Ideally userspace would close the /dev/input/event node belonging to the touchscreen when the internal panel is off. Please file an issue for that against libinput (to add the plumbing for this to libinput, ultimately the wayland-compositor, e.g. mutter, then needs to use that plumbing).

For now you can manually detach the driver by doing (as root):

cd /sys/bus/usb/drivers/usbhid/
ls

The ls will show a bunch of usb devices, e.g. :

1-5.1.1:1.0
1-5.1.1:1.1
1-5.4.1:1.0
1-5.4.1:1.1

You can then unbind the driver from a specific usb device by doing, e.g.:

echo '1-5.1.1:1.0' > unbind
echo '1-5.1.1:1.1' > unbind

to find out which usb device is which look at:

lsusb

and

lsusb -t


The first one gives you the bus + dev info, which you can then match up with the lsusb -t output to get the bus-port.port.port (in my example) address you need by following the tree.

E.g. for the 1-5.1.1 device (with 2 HID interfaces in my case):

lsusb:
Bus 001 Device 007: ID 046d:c534 Logitech, Inc. Unifying Receiver

lsusb -t:
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 480M
    |__ Port 005: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
        |__ Port 001: Dev 004, If 0, Class=Hub, Driver=hub/2p, 480M
            |__ Port 001: Dev 007, If 0, Class=Human Interface Device, Driver=usbhid, 12M
            |__ Port 001: Dev 007, If 1, Class=Human Interface Device, Driver=usbhid, 12M

Notice Bus 001 and Dev(ice) 007 match up in both outputs and the ports going from the USB root hub to the unifying receiver are: 005 001 001 leading to: 1-5.1.1 as usb device address.

You also need to enable autosuspend on the USB device for it to suspend when no driver is attached:

cd /sys/bus/usb/devices/1-5.1.1
echo auto > power/control

Regards,

Hans


