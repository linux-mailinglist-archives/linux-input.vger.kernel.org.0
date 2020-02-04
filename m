Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21068151ADC
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2020 13:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbgBDMzq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Feb 2020 07:55:46 -0500
Received: from mta-out1.inet.fi ([62.71.2.202]:33488 "EHLO julia1.inet.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727136AbgBDMzq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 4 Feb 2020 07:55:46 -0500
Received: from [192.168.1.134] (84.248.30.195) by julia1.inet.fi (9.0.019.26-1) (authenticated as laujak-3)
        id 5E37D3E2000557E1; Tue, 4 Feb 2020 14:55:43 +0200
Subject: Re: [PATCH v2] USB: HID: random timeout failures tackle try.
To:     Jiri Kosina <jikos@kernel.org>, Johan Hovold <johan@kernel.org>
Cc:     Lauri Jakku <lja@iki.fi>, oneukum@suse.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20200204110658.32454-1-lja@iki.fi>
 <20200204123508.GJ26725@localhost>
 <nycvar.YFH.7.76.2002041342460.26888@cbobk.fhfr.pm>
From:   Lauri Jakku <lauri.jakku@pp.inet.fi>
Message-ID: <3bb9f515-a5c6-3162-be5d-f9f984969882@pp.inet.fi>
Date:   Tue, 4 Feb 2020 14:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2002041342460.26888@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 4.2.2020 14.43, Jiri Kosina wrote:
> On Tue, 4 Feb 2020, Johan Hovold wrote:
>
>>> Why modify usb-hid-core: No need to modify driver by driver.
>> Because you cannot decide how every use should handle timeouts.
>>
>> Just fix up the driver that needs this.

I think that if the device is left to errorneus state without

re-trying, it shows up to user very annoying. For example:

My mouse now has the problem with buttons: if i click left

button -> nothing may happen, and it is not functioning until

right button is pressed once. I make adaption to divide the

timeout by 100, and keep the try-loop in core.


I dont have list all the drivers that needs this -> better fix at

one common place.


> I believe it will actually not be a particular driver, but perhaps a set 
> of devices with b0rked USB implementation, and we could just introduce 
> (another, oh well) per-device quirk list if needed.
>
> Do we have any idea / indication how many devices out there actually 
> require this?
Well i'd say quite many.
> Thanks,
>
-- 
Br,
Lauri J.

