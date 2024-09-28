Return-Path: <linux-input+bounces-6839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D08988E28
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 09:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEFBA1F21D89
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02B417ADF0;
	Sat, 28 Sep 2024 07:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="WNHj/og4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C9D1859;
	Sat, 28 Sep 2024 07:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727508683; cv=none; b=AhcZtrD7PIVMfZsW6B6F8UN2h7flTCbXS9uRG7C+dipx7dGXQfDmpAMsZA6N+JuLhLKvr6EyyUocNNAiS7iQxYilaBeK2p8EAbJ1hWdQhZGGu/1z1J+mY2T5pa+iMyG4QPYEmRdC8VIMnK/0Wm2BmLw3L9ObhJxkj6FobwatYAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727508683; c=relaxed/simple;
	bh=GIc2Oili+W+gtTJP//Bv27Dhg1xJ/bLv3h6VjSgCjto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTwNW6HYa/sNelb2IIVWXgEi0Erj6/OiIsUeL1W2Hhp8jlFsVZWl1/O6vh4qAOc6DHeSLtwlVHUI8fvWw8MTBI56UncQhPsqtAruhLqbPLNBF+SS8mJpEmSBM93o06IUVwVL+R7TplNmj54ji+hvbyySdWo0IlpCQ4sb6HE68T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=WNHj/og4; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.27] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 76C822FC004A;
	Sat, 28 Sep 2024 09:31:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727508672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OT807BBF0il0fPgmaVRfrZUiwIwjZYQKB3pG4DM9zeE=;
	b=WNHj/og4rZkStztT+XQqWeayO9pcvIPz6IklMEAuPxibT46hllaDCAl7wqp0k/MCmeQZMu
	yL/qEMTh+X2n5FN89WemBLWvcBj8620kIBtVnawqW06077g0srT5os/61NGRFw0V77emfc
	3i0em0mr4CMvCFi5YiToNKkhUnWq5EY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <e78428cd-c0db-456a-887f-bd8cbb229a5c@tuxedocomputers.com>
Date: Sat, 28 Sep 2024 09:31:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: dri-devel@lists.freedesktop.org, hdegoede@redhat.com, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <et3cv7i2lhsjoq26toweh4uv72yo34u3wqrj3q2urfnx2bhiq3@fdtkag4bcekh>
Content-Language: de-DE
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <et3cv7i2lhsjoq26toweh4uv72yo34u3wqrj3q2urfnx2bhiq3@fdtkag4bcekh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Benjamin,

Am 27.09.24 um 18:08 schrieb Benjamin Tissoires:
> On Sep 26 2024, Werner Sembach wrote:
>> Hi,
>> took some time but now a first working draft of the suggested new way of
>> handling per-key RGB keyboard backlights is finished. See:
>> https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
>> First time for me sending a whole new driver to the LKML, so please excuse
>> mistakes I might have made.
>>
>> Known bugs:
>> - The device has a lightbar which is currently not implemented and
>>    therefore stuck to blue once the first backlight control command is send.
>>
>> What is still missing:
>> - The leds fallback
>> - Lightbar control
>>
>> Some general noob questions:
>>
>> Initially I though it would be nice to have 2 modules, one jsut being the
>> wmi initialization and utility stuff and one just being the backlight logic
>> stuff, being loaded automatically via module_alias, but that would still
>> require me to create the virtual hid device during the wmi_ab probe, and
>> that already needs the ll_driver, so i guess I have to do it statically
>> like i did now?
>> Or in other words: I would have liked to have a module dependency graph
>> like this:
>>      tuxedo_nb04_lamp_array depends on tuxedo_nb04_platform (combining *_wmi_init and *_wmi_utility)
>> but if i currently split it into modules i would get this:
>>      tuxedo_nb04_wmi_ab_init dpends on tuxedo_nb04_wmi_ab_lamp_array depends on tuxedo_nb04_wmi_utility
> On more general question to you: how much confident are you about your
> LampArray implementation?
>
> If you still need to add/fix stuff in it, I would advise you to have a
> simple HID device, with bare minimum functionality, and then add the
> LampArray functionality on top through HID-BPF. This way you can fix
> LampArray out of band with the kernel, while having a more stable kernel
> module. This should be possible with v6.11+.
>
> Another solution is to still have your wmi-to-hid module, and then a
> HID kernel module in drivers/hid that supports LampArray.
>
> But I would strongly suggest while you are figuring out the userspace
> part to stick to HID-BPF, and then once you are happy we can move to a
> full kernel module.

I don't expect this patch to get merged right away, but like i wrote, 
wanted to collect some feedback on it to already start refining it.

With this driver now functional I have something to build and test 
userspace against while waiting on the feedback and the undoubtly 
following discussion of details to get it right ^^.

Until now I only tested with a very simple, self built command line 
binary, looping some patterns. My next step is to try the work in 
progress implementetion for LampArray in OpenRGB: 
https://gitlab.com/CalcProgrammer1/OpenRGB/-/merge_requests/2348

Regards,

Werner

>
> Cheers,
> Benjamin
>
>> Currently after creating the virtual hdev in the wmi init probe function I
>> have to keep track of it and manually destroy it during the wmi init
>> remove. Can this be automated devm_kzalloc-style?
>>
>> Kind regards,
>> Werner Sembach
>>
>>

