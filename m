Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2091C2D1B53
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 21:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgLGUw5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 15:52:57 -0500
Received: from mx3.molgen.mpg.de ([141.14.17.11]:34481 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726074AbgLGUw5 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 7 Dec 2020 15:52:57 -0500
Received: from [192.168.0.3] (ip5f5af430.dynamic.kabel-deutschland.de [95.90.244.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id A152520647B75;
        Mon,  7 Dec 2020 21:52:14 +0100 (CET)
Subject: Re: Dell XPS 13 9310 2-in-1: psmouse serio1: synaptics: Unable to
 query device: -5
To:     Mario Limonciello <Mario.Limonciello@dell.com>
Cc:     linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <a075a4f7-21f6-54cf-8d97-af7f55ff4b91@molgen.mpg.de>
 <DM6PR19MB2636B859754CFACE88F5652BFACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <1fe43de4-61e1-82ac-2a17-fe2adfea252a@molgen.mpg.de>
Date:   Mon, 7 Dec 2020 21:52:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636B859754CFACE88F5652BFACE0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Mario,


As always thank you for your quick reply.

Am 07.12.20 um 18:40 schrieb Limonciello, Mario:
>> -----Original Message-----

>> Sent: Monday, December 7, 2020 11:32

>> On the Dell XPS 13 9310 2-in-1/02P55J, BIOS 1.0.3 10/05/2020 with Debian
>> sid/unstable Linux 5.9.11 reports the error below (first line).
>>
>>       [    5.835078] psmouse serio1: synaptics: Unable to query device: -5
>>       [   11.331176] input: PS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input2
>>
>> Please find the full log attached.
>>
>> It looks like some timeout. Maybe related to the embedded controller (EC)?

[…]

> The messages you're seeing are harmless in this laptop.
> 
> The laptop input is supported using the hid-multitouch and i2c-hid drivers as
> noted in your messages.
> 
> [  393.280115] input: DLL09FF:01 06CB:CE39 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL09FF:01/0018:06CB:CE39.0002/input/input21
> [  393.280221] hid-multitouch 0018:06CB:CE39.0002: input,hidraw1: I2C HID v1.00 Mouse [DLL09FF:01 06CB:CE39] on i2c-DLL09FF:01

Where is

     input: PS/2 Synaptics TouchPad as 
/devices/platform/i8042/serio1/input/input2

coming from then, and what touchpad is that supposed to be?

If it’s harmless, should the log level be decreased from error to debug?


Kind regards,

Paul
