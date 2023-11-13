Return-Path: <linux-input+bounces-39-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCD47E9BF2
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 13:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 292DAB20981
	for <lists+linux-input@lfdr.de>; Mon, 13 Nov 2023 12:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8A981D53C;
	Mon, 13 Nov 2023 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OPZygUpr"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9711D535
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 12:12:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D539D7A
	for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699877552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ezXY0LUnpnEQjeUC8eo3R5CFcrvOrbtX3Ta1hvjK0F8=;
	b=OPZygUprqBCQ4E0+vc7EDTds1A7Gi7J7l/vizINVLc928OXArMWZyaExhxpqcUpAwGxXj0
	SR8Ntq3ohiv5uHPZdE+5bnQbvODrBHljxVIP+Z/J66pfsg+b996EBhChUJShRZ2JzfWMta
	LshO27Q5uOzFW+nRaK842UM0hBBH21M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-ah2xA4a3PVOuWPFLeN0vKw-1; Mon, 13 Nov 2023 07:12:31 -0500
X-MC-Unique: ah2xA4a3PVOuWPFLeN0vKw-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9a62adedadbso303377666b.1
        for <linux-input@vger.kernel.org>; Mon, 13 Nov 2023 04:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699877550; x=1700482350;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ezXY0LUnpnEQjeUC8eo3R5CFcrvOrbtX3Ta1hvjK0F8=;
        b=MWe+jz8dWomrxRI7F7scE8RJyGcKLRi2dVkwFw1BYXiOrTQL5gXeofTjXE6s1F84be
         v9JdxcpK0C41A0pKT6xtLDH2NRKFEuosn0I1SwHHplcRDGTJQGrZu3yUCu8S3DwvdzDJ
         jPDj3NBNTRp7u1cuAwnEYP1kTdOID6igfmET/HkkQGvDZrBXE4QPLsgz1MsYk3eJTTFD
         EmdBzw5qtCzu2Gv9aWVwPu57mZlup9t3z7bR1igERGn2g81+lC0UFEyPQIXT3KYQFfmj
         8bY90l7Zuq31vNNW/oc0K8Mpz+1ytRbgrlHrtNPeTP+dfUaZ5T1p2+jIYhgK7D0Hndbr
         QnOQ==
X-Gm-Message-State: AOJu0Yw1lkvrkU7l7De8jNoNOFGdpv4SD5Ui3XkGBz/mXxEwjyOz0OT/
	S9W1KU0QZ7f+CIjqP5P0o7S/k1ynFwHghUZmNeCujRcrerRrXMDJ6IAjzaG7VlJReHu94so1kSn
	xIgxpa6tGdqbb4KoUtA6VdjE=
X-Received: by 2002:a17:906:3e50:b0:9dd:4811:7111 with SMTP id t16-20020a1709063e5000b009dd48117111mr4964625eji.4.1699877549945;
        Mon, 13 Nov 2023 04:12:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWVbJ5EvkaX0t7AGGMpLu5KOxTY0Pf36ceiphg0IZYeNDf4+GHYlSau1rRqvCyQWdYC9ofNQ==
X-Received: by 2002:a17:906:3e50:b0:9dd:4811:7111 with SMTP id t16-20020a1709063e5000b009dd48117111mr4964610eji.4.1699877549631;
        Mon, 13 Nov 2023 04:12:29 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o21-20020a170906601500b009e655c77a53sm3951267ejj.132.2023.11.13.04.12.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 04:12:29 -0800 (PST)
Message-ID: <f66bb201-e5ca-457f-adfa-73463dd9fb12@redhat.com>
Date: Mon, 13 Nov 2023 13:12:28 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to disable the touchscreen so it does not draw power?
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <978f5891-5167-4a07-884a-4ba464af30f3@molgen.mpg.de>
 <99dcbb8d-06a8-4c32-ab03-94bc3bf5658f@redhat.com>
In-Reply-To: <99dcbb8d-06a8-4c32-ab03-94bc3bf5658f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/13/23 13:08, Hans de Goede wrote:
> Hi,
> 
> On 11/13/23 09:39, Paul Menzel wrote:
>> Dear Linux folks,
>>
>>
>> On a Dell XPS 13 9360 with a touchscreen, when it’s connect to an external monitor, that is set up as the only display, the touchscreen – although the internal monitor is disabled (in GNOME) – is still active and draws power according to PowerTOP:
>>
>>     $ uname -a
>>     Linux abreu 6.5.0-4-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.10-1 (2023-11-03) x86_64 GNU/Linux
>>     $ lsusb  | grep Touchscreen
>>     Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. Touchscreen
>>     $ sudo LANG= powertop
>>     Power est.              Usage       Events/s    Category Description
>>       9.39 W    100.0%                      Device         USB device: DELL DA300 (Bizlink)
>>       1.39 W    100.0%                      Device         USB device: Touchscreen (ELAN)
>>
>> Is there a way to disable the touchscreen, so it does not draw power?
>>
>> `sudo modprobe -r hid-multitouch` also affects the touchpad, which is not wanted.
> 
> Ideally userspace would close the /dev/input/event node belonging to the touchscreen when the internal panel is off. Please file an issue for that against libinput (to add the plumbing for this to libinput, ultimately the wayland-compositor, e.g. mutter, then needs to use that plumbing).
> 
> For now you can manually detach the driver by doing (as root):
> 
> cd /sys/bus/usb/drivers/usbhid/
> ls
> 
> The ls will show a bunch of usb devices, e.g. :
> 
> 1-5.1.1:1.0
> 1-5.1.1:1.1
> 1-5.4.1:1.0
> 1-5.4.1:1.1
> 
> You can then unbind the driver from a specific usb device by doing, e.g.:
> 
> echo '1-5.1.1:1.0' > unbind
> echo '1-5.1.1:1.1' > unbind
> 
> to find out which usb device is which look at:
> 
> lsusb
> 
> and
> 
> lsusb -t
> 
> 
> The first one gives you the bus + dev info, which you can then match up with the lsusb -t output to get the bus-port.port.port (in my example) address you need by following the tree.
> 
> E.g. for the 1-5.1.1 device (with 2 HID interfaces in my case):
> 
> lsusb:
> Bus 001 Device 007: ID 046d:c534 Logitech, Inc. Unifying Receiver
> 
> lsusb -t:
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 480M
>     |__ Port 005: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
>         |__ Port 001: Dev 004, If 0, Class=Hub, Driver=hub/2p, 480M
>             |__ Port 001: Dev 007, If 0, Class=Human Interface Device, Driver=usbhid, 12M
>             |__ Port 001: Dev 007, If 1, Class=Human Interface Device, Driver=usbhid, 12M
> 
> Notice Bus 001 and Dev(ice) 007 match up in both outputs and the ports going from the USB root hub to the unifying receiver are: 005 001 001 leading to: 1-5.1.1 as usb device address.
> 
> You also need to enable autosuspend on the USB device for it to suspend when no driver is attached:
> 
> cd /sys/bus/usb/devices/1-5.1.1
> echo auto > power/control

Actually I think just doing this last step is enough to put the USB connection to sleep (assuming the touchscreen supports USB remote wake) even if the driver is still loaded and the USB connection is what uses the most power. Note you will see the biggest energy usage win if you enable autosuspend on all USB devices, so that the controller itself can go to sleep.

This might not work if you are using a USB kbd/mouse on the same controller though, enabling autosuspend / remote wakeup on those does not always work well (e.g. big delay in key-presses or key-presses getting lost)

Regards,

Hans




