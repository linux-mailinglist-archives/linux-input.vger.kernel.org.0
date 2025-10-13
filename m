Return-Path: <linux-input+bounces-15379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE67BD2EE9
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 14:15:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 459904EB0F6
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 12:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81C926056A;
	Mon, 13 Oct 2025 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxk2ZaG8"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF60B258ED6;
	Mon, 13 Oct 2025 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357743; cv=none; b=j8YaNw47qqn9GzG9wm4zXxzVN4Dei0//trcUTTdlFVXdLRvg8EUYv4oJqxGKgbghtglDhi0ihW2yWue+MujE7xWYFTWwvZuAJV8S8yQSF2uc0ijgNjlg6b/wm6vSc3HERS2FM4A76jgQ+VYvdAet80dVveEmrtE/9HE+ynIDyps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357743; c=relaxed/simple;
	bh=iXi+SOSCdj/BgtHSROFqH1pkYKMHUy/W7q7tz980We4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkYra/FjYQahJEmUEPLdVTfro4AcpESxu3BZNTNOBlsZtIYzghf1CeHcdYke61VQgf2NL0hZUcwDeLxteQkaHmpJyTKvHIsFVbqNCfrxf0J38LxkObUNCi5H3YafcgeDtsSGux+DAwDXmQvpT4NvSPLappGHeSe1mWrHiJlYDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxk2ZaG8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6898C4CEE7;
	Mon, 13 Oct 2025 12:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760357743;
	bh=iXi+SOSCdj/BgtHSROFqH1pkYKMHUy/W7q7tz980We4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hxk2ZaG8nVpG6Gft1lq4ZtgnLvkLLunWwODL2QVrr92zaLzCtNHu8FXI5lMcTludM
	 9yZkZkBdVrtNnTcIdRuU+8WODPuUYHzn4Z8yvfR1Dn5C7AgAwsjNGRPnLtMN2R9uUV
	 DAMwvnY9OcU6nocQnQ8ngWmXhSe8GDHMbSY8vnaxikXzsCXtiXOmM01YHdP52rf6FA
	 gD2YALP/cYhSGe2ayGAf6IC3KQEw0U9VhJqTcbbQB3RDrTbYzVp1JVYXmBAybY25CH
	 HHEIBUHbRY44vHflJrh+sgARxl/Uc9GPSvAOpwBR/PTDpbhlXcvL+WHAqoBvnF0aef
	 od3Be0s4cV5Yg==
Message-ID: <5de424b7-deff-4d8d-a1fe-4459194e9f58@kernel.org>
Date: Mon, 13 Oct 2025 14:15:38 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen
 Driver
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Weikang Guo <guoweikang.kernel@gmail.com>,
 Bastien Nocera <hadess@hadess.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, Raphael La Greca <raphael.la.greca@gmail.com>
References: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
 <8c7b5560-27d0-42bc-8f25-0797500fb889@redhat.com>
 <CAOm6qnmYSQz_YVaWw1c-fMm3NCVV9MoQhLQ0XGzK9o2RybLHmw@mail.gmail.com>
 <72619870-bf83-47f9-9b66-6678e245364c@redhat.com>
 <aOyleKvZe336pSSx@eldamar.lan>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aOyleKvZe336pSSx@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Oct-25 9:08 AM, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Sat, Mar 01, 2025 at 12:36:40PM +0100, Hans de Goede wrote:
>> Hi WeiKang,
>>
>> On 27-Feb-25 12:36 PM, Weikang Guo wrote:
>>> Hi, Hans
>>>
>>> On Tue, 25 Feb 2025 at 20:09, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Hi WeiKang,
>>>>
>>>> On 25-Feb-25 3:04 AM, Weikang Guo wrote:
>>>>> Hi Bastien, Hans, Dmitry,
>>>>>
>>>>> I am currently working on the Ayaneo Flip DS device, which I installed Kali
>>>>> Linux with kernel version 6.8.11-amd. This device has two touchscreens,
>>>>> but only one is functional. After investigating, I found that the second
>>>>> touchscreen has the device ID GDIX1003(confirmed by exporting the results
>>>>> through acpidump), and upon comparing with the current driver, I noticed
>>>>> that only GDIX1001, GDIX1002, and GDX9110 are supported.
>>>>>
>>>>> I have also reviewed the ACPI description and can provide the details if
>>>>> needed. Any guidance or updates on this would be greatly appreciated.
>>>>
>>>> I think this might just work with the existing goodix driver, just
>>>> add the new GDIX1003 HID to the goodix_acpi_match table:
>>>>
>>>> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
>>>> index a3e8a51c9144..4b497540ed2d 100644
>>>> --- a/drivers/input/touchscreen/goodix.c
>>>> +++ b/drivers/input/touchscreen/goodix.c
>>>> @@ -1519,6 +1519,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
>>>>  static const struct acpi_device_id goodix_acpi_match[] = {
>>>>         { "GDIX1001", 0 },
>>>>         { "GDIX1002", 0 },
>>>> +       { "GDIX1003", 0 },
>>>>         { "GDX9110", 0 },
>>>>         { }
>>>>  };
>>>>
>>>> Note I'm not sure this will work, but is worth a try.
>>>>
>>>
>>> It works, thank you very much.
>>
>> Thank you for testing.
>>
>> I've submitted a patch upstream to add this new hardware-ID
>> to the kernel:
>>
>> https://lore.kernel.org/linux-input/20250301113525.6997-1-hdegoede@redhat.com/
> 
> Raphael La Greca has reported this issue as well in Debian at
> https://lists.debian.org/debian-kernel/2025/10/msg00013.html an
> confirmed the change to work.
> 
> Any chance this can be applied as proposed? Did the patch submission
> felt trought the cracks?

It indeed looks like the patch fell through the cracks. I've just resend it.

Regards,

Hans



