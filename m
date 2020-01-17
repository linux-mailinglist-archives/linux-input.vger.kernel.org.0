Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FE3140C51
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2020 15:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgAQOUc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jan 2020 09:20:32 -0500
Received: from li825-139.members.linode.com ([104.237.157.139]:34078 "EHLO
        mail.factglobal.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgAQOUc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jan 2020 09:20:32 -0500
Received: from [192.168.0.187] (modemcable184.72-21-96.mc.videotron.ca [96.21.72.184])
        by mail.factglobal.ca (Postfix) with ESMTPSA id EF27378B4C;
        Fri, 17 Jan 2020 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kryma.net; s=mail;
        t=1579270831; bh=MsXZ2RGH0f9akAwtcRx6Ca8plW0eUo3una4l4j5Ivyw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PKs4PSKK1dQEzh2X/fPd6/MjflbeDgvKK/xdlaAM/RUcm6MxKOCER5YwrqACcQvAz
         ww/X/+uXFkC1pCuWz79aClVXNeQF38xA7ougJX4HK20KlSweDn54sVRTMgcC0yNalb
         SkJzbw/LVAfDqqqSvFylHXqzLo17pvcH6kavkYqE=
Subject: Re: Hotkey activation of a HID function
To:     Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org
References: <a6de4f52-414e-2ffb-26f9-5b7211c55a91@kryma.net>
 <nycvar.YFH.7.76.2001171412420.31058@cbobk.fhfr.pm>
From:   Pavel Balan <admin@kryma.net>
Message-ID: <fe3c992f-89e6-be03-6542-de9b75170e51@kryma.net>
Date:   Fri, 17 Jan 2020 09:20:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <nycvar.YFH.7.76.2001171412420.31058@cbobk.fhfr.pm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

You understand it exactly right.

 From what I have gathered, the keyboard (using Consumer page - as on 
page 75 of the HID usage table) sends the usage 0x50, currently marked 
as reserved. Other than possible overhead for looking the right HID up 
every time the key is pressed, I don't believe it will cause any major 
conflicts.

All the best,

On 2020-01-17 8:15 a.m., Jiri Kosina wrote:
> On Mon, 30 Dec 2019, Pavel Balan wrote:
>
>> I am currently in the process of writing a driver for a laptop backlight
>> peripheral. It takes a HID feature request to activate - and according to the
>> way it works in Windows (thanks to pre-installed software packages), the
>> driver activates it on receiving a hot-key combination.
>>
>> Is there a paved, proper way to implement that functionality - provided the
>> built-in keyboard and the backlight are two separate devices?
> Hi Pavel,
>
> just to make sure I understand your question correctly -- you would like
> to know how to cleanly implement this scenario: once some special hotkey
> is pressed (is that a HID device? What usage / code mapping does the
> hotkey press produce?), create a HID report and send it to the device.
>
> Correct?
>
> It really depends whether that hotkey is something standard, or something
> vendor-specific.
>
> Thanks,
>
