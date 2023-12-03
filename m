Return-Path: <linux-input+bounces-423-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A7C802604
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 18:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C48151F20F9E
	for <lists+linux-input@lfdr.de>; Sun,  3 Dec 2023 17:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C141156EB;
	Sun,  3 Dec 2023 17:41:40 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02940D3
	for <linux-input@vger.kernel.org>; Sun,  3 Dec 2023 09:41:31 -0800 (PST)
Received: from [192.168.0.2] (ip5f5af095.dynamic.kabel-deutschland.de [95.90.240.149])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6229961E5FE04;
	Sun,  3 Dec 2023 18:41:21 +0100 (CET)
Message-ID: <92a0e7d1-d83e-49df-a1bf-3941e25161d1@molgen.mpg.de>
Date: Sun, 3 Dec 2023 18:41:20 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to disable the touchscreen so it does not draw power?
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
References: <978f5891-5167-4a07-884a-4ba464af30f3@molgen.mpg.de>
 <99dcbb8d-06a8-4c32-ab03-94bc3bf5658f@redhat.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <99dcbb8d-06a8-4c32-ab03-94bc3bf5658f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Hans,


Thank you for taking the time to reply.


Am 13.11.23 um 13:08 schrieb Hans de Goede:

> On 11/13/23 09:39, Paul Menzel wrote:

>> On a Dell XPS 13 9360 with a touchscreen, when it’s connect to an
>> external monitor, that is set up as the only display, the
>> touchscreen – although the internal monitor is disabled (in GNOME)
>> – is still active and draws power according to PowerTOP: >>
>>      $ uname -a
>>      Linux abreu 6.5.0-4-amd64 #1 SMP PREEMPT_DYNAMIC Debian 6.5.10-1 (2023-11-03) x86_64 GNU/Linux
>>      $ lsusb  | grep Touchscreen
>>      Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. Touchscreen
>>      $ sudo LANG= powertop
>>      Power est.              Usage       Events/s    Category Description
>>        9.39 W    100.0%                      Device         USB device: DELL DA300 (Bizlink)
>>        1.39 W    100.0%                      Device         USB device: Touchscreen (ELAN)
>>
>> Is there a way to disable the touchscreen, so it does not draw power?
>>
>> `sudo modprobe -r hid-multitouch` also affects the touchpad, which is not wanted.
> 
> Ideally userspace would close the /dev/input/event node belonging to
> the touchscreen when the internal panel is off. Please file an issue
> for that against libinput (to add the plumbing for this to libinput,
> ultimately the wayland-compositor, e.g. mutter, then needs to use
> that plumbing).
I created issue *Disabling the panel of a touchscreen does not disable 
the input/touch part wasting energy* [1].

[…]


Kind regards,

Paul


[1]: https://gitlab.freedesktop.org/libinput/libinput/-/issues/956

