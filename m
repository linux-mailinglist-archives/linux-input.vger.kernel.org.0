Return-Path: <linux-input+bounces-10898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE7A65913
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 17:53:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485F917C803
	for <lists+linux-input@lfdr.de>; Mon, 17 Mar 2025 16:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D097B1F180C;
	Mon, 17 Mar 2025 16:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YP8lt0KR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5981DE2AA;
	Mon, 17 Mar 2025 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742230060; cv=none; b=kohCGNRo2ITmggEXGXqxkr91kUyFfmwDbTHT7i7bNksAccwN5yrEfnejDDHIObgKCBa7SstZyzho49OVMU0hCwGEtBsipJcBqQ+eX3CzTqHH6POcIgc9w1Mr7elbDurekFix1Q0JHYj2A+JpPtgzwyqGn/mZ2zAVB/Vijv6TYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742230060; c=relaxed/simple;
	bh=XgPa90LY/PpieORERDS3+8kRabc2ceRRbQTEUppqSzI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NDdozgDxD5LOoCwiVxFko6co36x3QhABLbdL6wqv4TPvkAZSMvkqnIhgkwNU+EmC/44/ofOWAGGM8KzeuW1+1SWcvp/M3Dl3mPHmYxxqZmnpzKnsOrKPCOq7ZdAsUoaeCfcc9kuLklz44s0LKW3kZtaz6tF+olI08dGlTvd3jl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YP8lt0KR; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5b164989.dip0.t-ipconnect.de [91.22.73.137])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 503142FC0048;
	Mon, 17 Mar 2025 17:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1742230054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0+sqYxrzCaSfYTZoE/oMFfhzV583vx7qY1e1stV6xyk=;
	b=YP8lt0KRyh83Z3zCJFIFF4kdE65UuW2VlNNvCi+l3K2Sx0TIPWY2usYcnN10O1VhPDQ8QL
	FtqAt+78lxqQih39z581UtdF3g+k4JUEZzq7iXjcf7PqINu8MS96QJO7i9kAzqtYaogLbX
	8Hy4M1OBtVZlpwNp6NLrpqIwtjlbm08=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f742f82e-d533-431f-bf64-01cec4bead09@tuxedocomputers.com>
Date: Mon, 17 Mar 2025 17:47:34 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Correctly map F13 - F24
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311180643.1107430-1-wse@tuxedocomputers.com>
 <20250311180643.1107430-2-wse@tuxedocomputers.com>
 <83ea44f6-c0ad-4cb0-a16e-dd4fa17b63c7@tuxedocomputers.com>
 <45fff318-7925-4328-9dca-999c00e271d2@redhat.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <45fff318-7925-4328-9dca-999c00e271d2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi again,

Am 17.03.25 um 13:06 schrieb Hans de Goede:
> Hi,
>
> On 11-Mar-25 19:10, Werner Sembach wrote:
>> Hi Hans, Hi Dimitry,
>>
>> resending this too on the v2 to not cause confusion:
>>
>> Regarding remapping KEY_ZENKAKUHANKAKU to KEY_TOUCHPAD_TOGGLE:
>>
>> Am 11.03.25 um 19:06 schrieb Werner Sembach:
>>> Currently only F23 is correctly mapped for PS/2 keyboards.
>>>
>>> Following to this table:
>>> https://download.microsoft.com/download/1/6/1/161ba512-40e2-4cc9-843a-923143f3456c/translate.pdf
>>>
>>> - F24 and Zenkaku/Hankaku share the same scancode, but since in real world
>>> Zenkaku/Hankaku keys seem to just use the tilde scancode, this patch binds the
>>> scancode to F24. Note that on userspace side the KEY_ZENKAKUHANKAKU keycode is
>>> currently not bound in xkeyboard-config, so it is (mostly*) unused anyway.
>> I think what the firmware vendor actually wanted to do was to send ctrl+super+f24 upon touchpad toggle. This would somewhat fall in line with, for example, the copilot key being implemented as shift+super+f23.
> I agree that that seems to be the intent.
>
>> Following this, my suggestion is to do this remapping and handle the rest in xkeyboard-config
> xkeyboard config already contains mappings for F13 - F18 and F20-F23 in
> /usr/share/X11/xkb/symbols/inet
>
> So all that needs to happen there is map FK19 -> F19 and FK24 -> F24.
>
> And then teach KDE + GNOME that ctrl+super+f24 means touchpad-toggle.

Alternative suggestion, again following how the copilot key is implemented:

key <FK19>   {      [ F19 ]       };
[...]
key <FK23>   {      [ XF86TouchpadOff, XF86Assistant ], type[Group1] = 
"PC_SHIFT_SUPER_LEVEL2" };
key <FK24>   {      [ F24, XF86TouchpadToggle ], type[Group1] = 
"PC_CONTROL_SUPER_LEVEL2" };

Then only xkb has to be touched again, but not KDE and GNOME.

>
> We could maybe get away with also dropping the weird mappings for FK13 - FK18
> and map those straight to F13 - F18, but we need the special mappings
> for F20 - F23 to stay in place to not break stuff.

Good question

XF86Tools launches system settings on KDE.

XF86Launch5-9 do nothing by default afaict.

Looking at the links in the git log of xkeyboard-config (commit 
1e94d48801bf8cb75741aa308d4cdfb63b03c66c and 
01d742bc5cd22543d21edb2101fec6558d4075db) these seems to be device specific 
bindings that got accepted in the default config because the keys where unbound 
before.

Best regards,

Werner

>
> Regards,
>
> Hans
>
>

