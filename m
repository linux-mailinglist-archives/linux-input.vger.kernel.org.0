Return-Path: <linux-input+bounces-10893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D247A65697
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 16:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 939DB189C764
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 15:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47ACE155322;
	Mon, 17 Mar 2025 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="tIyE4DQH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EBC176FB0;
	Mon, 17 Mar 2025 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742226631; cv=none; b=FfceBY9RDzIsNAk1wJwQQufSpt3qCXOwrbTRKjyFbk9Zbw/0saNDaOmeMAl0GO+eQJX5TY1rBF15jdjeOzl/w0xSSNvuEWjluhBNMZeU+N/aq+0OupOnDyVr7KOn3+KE9sxvm0FXJWY82EY84H3oiUiwZHvgwi17GWCS0ffRFzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742226631; c=relaxed/simple;
	bh=CUAJUgXFRoz/F10qYSrcXjYPVLaJQj+7drzHz1Sn2qg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmPWXS3/OXMiPCSHnfd6pIqJ45KfxDud10iB3LsmmgLvMLt0PVnCn9LGuAdtfgtU+/M8ECz+jHtEoMOoxiNeUSKwz+Bjbz54kaqkxx9lvuNetlvHOAz8P+W3W9xzRBhJ1AX3OeHde6kJ0XZ80SmFzbantODEiYrGf8K9RZyZrv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=tIyE4DQH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5b164989.dip0.t-ipconnect.de [91.22.73.137])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 921AD2FC0048;
	Mon, 17 Mar 2025 16:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742226619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZXcsoGMlj8tsZB4SwvPHKOwuNRZW8eH31FMsoZOIFds=;
	b=tIyE4DQH3rm8FbVGClKio+Ctl4Yyedvhqo6jXugvDY5QttTv41qKGeFVPNXZDCtMK9JdA+
	D6q3LCRV8FWjwJ56g/D+o9jELaC2pfJaNUCdTYfdifEtbva2BZDCcbJr5ua6x+5FIhnvCR
	GFMRMl44WCYtDILJfUDTAahpkcBnNNo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b28ce8e7-2b3f-40bb-9d1f-dbeade67e3d6@tuxedocomputers.com>
Date: Mon, 17 Mar 2025 16:50:19 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: atkbd - Map FN-key for TongFang barebones
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <4e37c7b2-85bc-459e-b2ea-2e362c16e9aa@redhat.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <4e37c7b2-85bc-459e-b2ea-2e362c16e9aa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Hans,

Am 17.03.25 um 12:04 schrieb Hans de Goede:
> Hi Werner,
>
> Thank you for your patches / your work on this.
>
> On 11-Mar-25 19:06, Werner Sembach wrote:
>> TongFangs firmware sends scancode 0xe0 0x78 upon pressing the FN key.
>>
>> This patch maps this scancode to avoid a dmesg warning printed every FN-keypress
>> and to enable userspace to use they key in other shortcuts than the firmware
>> builtin ones.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> This laptop specific mapping really belongs in hwdb, 0xe0 0x78
> translates to KEYBOARD_KEY_f8 in hwdb and if you look for that in:
>
> /lib/udev/hwdb.d/60-keyboard.hwdb
>
> You already find several entries, e.g. :
>
> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pn*:*
> ...
>   KEYBOARD_KEY_f8=fn
>
> And e.g. also for some Clevo models:
>
>   KEYBOARD_KEY_f8=f21                                    # Touchpad Toggle
>
> and:
>
> # HP Elite x2 1013 G3
> evdev:atkbd:dmi:bvn*:bvr*:svnHP*:pnHPElitex21013G3:*
>   KEYBOARD_KEY_f8=unknown                               # rfkill is also reported by HP Wireless hotkeys
>
> these first couple of hits show that 0xf8 is not
> universally mapped to Fn, so putting this mapping in the kernel's
> default key table is wrong IMHO.

Sorry I was somehow mistaken that hwdb maps the keycodes and not the scancodes.

So yeah, this patch first can be ignored.

Best regards,

Werner

>
> Regards,
>
> Hans
>
>
>
>> ---
>>   drivers/input/keyboard/atkbd.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
>> index adf0f311996c9..3598a21d9d014 100644
>> --- a/drivers/input/keyboard/atkbd.c
>> +++ b/drivers/input/keyboard/atkbd.c
>> @@ -98,7 +98,7 @@ static const unsigned short atkbd_set2_keycode[ATKBD_KEYMAP_SIZE] = {
>>   	173,114,  0,113,  0,  0,  0,126,128,  0,  0,140,  0,  0,  0,127,
>>   	159,  0,115,  0,164,  0,  0,116,158,  0,172,166,  0,  0,  0,142,
>>   	157,  0,  0,  0,  0,  0,  0,  0,155,  0, 98,  0,  0,163,  0,  0,
>> -	226,  0,  0,  0,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
>> +	226,  0,  0,464,  0,  0,  0,  0,  0,255, 96,  0,  0,  0,143,  0,
>>   	  0,  0,  0,  0,  0,  0,  0,  0,  0,107,  0,105,102,  0,  0,112,
>>   	110,111,108,112,106,103,  0,119,  0,118,109,  0, 99,104,119,  0,
>>   

