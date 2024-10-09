Return-Path: <linux-input+bounces-7202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A90969966E5
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 12:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5201F2824A4
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 10:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA41E158DB1;
	Wed,  9 Oct 2024 10:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="HA5fHCxB"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D018DF9B;
	Wed,  9 Oct 2024 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728469217; cv=none; b=KRx8mKsvpxiV1Qwej4YvtnAF/ecSOa0UEdAX505juTeCGBkUcNw5ixPZ772Y44EBQrjxeruEec99Xvktp7jVIe0WWKVGNuLug9P5pzXdzcygRJ/5rMDFvSP6DOJLdU65gmY9xiJ0xHAbP4/4XTltAWXShIC2y9mpB9kjGpRIPbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728469217; c=relaxed/simple;
	bh=fnSY8yUR1/+0redmo87zk2e6rzF1Cea5WcBHEfUdDeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3jVyJkNkQ5za6Y3mN7i+4dRKXfTHnjqigC69SdCiltlAgNM9kBaRj9HSxE7J566dfw73h8ASIMinOSqQ3cOIJPB5ajrbN739r0c/KqeoDVOXZBGdzYjjhCreMXrBb9rRXhZYOypb+60X3xfgMLxEdK2SeEwCWgDLxGxzuCTqQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=HA5fHCxB; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=DBspcfTyrWSXCCBxMi+w7Y38bUwjwyXyjMGKReqD6lc=;
	t=1728469215; x=1728901215; b=HA5fHCxBYHAch9VzpZb1G8AIOsurnEi7fulEGNgEx9wrzZ3
	gxGRKqw5NbjteAscR58ewB/FKSAuY00GCyw021GM3GaCoOXCLMMD7xykDFPswG52LS6CW8Hy4GGJL
	nmNXz7i2soabS93dc6EuyI1jRw1eKYzz5juBo2821TZ41vCkV1B6jIWMfRch8mV7PQHbffGIc/+kD
	eeNbt5tIUOkzlixGEtbuZ1TXkABr2xLXZycxybZRlb2x2KjdkrQwZR61o2zY8cjeKaMKuVLoyjilI
	l4SjR/Dt8gpvm+wf2tFFrslY4z0CuVGrhpfxc5h1hhQiJM/kdnR6Si7qtIidKEog==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1syTnh-0004Hi-Hv; Wed, 09 Oct 2024 12:20:13 +0200
Message-ID: <79320190-8461-4a92-bde2-29a3988a6782@leemhuis.info>
Date: Wed, 9 Oct 2024 12:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org,
 Chris Hixon <linux-kernel-bugs@hixontech.com>, Skyler <skpu@pm.me>,
 Richard <hobbes1069@gmail.com>, Benjamin Tissoires <bentiss@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
 <a3fb27a2-5167-4880-9102-eaf0f47df398@leemhuis.info>
 <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <uupvw2jw6j5wkwtfwljipmpx4kynv6k3wqgy6sg3crw5r27rtm@mudhwifihmtw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728469215;f948152a;
X-HE-SMSGID: 1syTnh-0004Hi-Hv

On 04.10.24 11:12, Benjamin Tissoires wrote:
> On Oct 04 2024, Linux regression tracking (Thorsten Leemhuis) wrote:
>
> so cleanup is doing:
> cleanup:
> 	amd_sfh_hid_client_deinit(privdata);
> 	for (i = 0; i < cl_data->num_hid_devices; i++) {
> 		devm_kfree(dev, cl_data->feature_report[i]);
> 		devm_kfree(dev, in_data->input_report[i]);
> 		devm_kfree(dev, cl_data->report_descr[i]);
> 	}
> 	return rc;
> 
> Would that means that the memory corruption appears during
> amd_sfh_hid_client_deinit(), or...
> 
>>>  	}
>>>  
>>>  	for (i = 0; i < cl_data->num_hid_devices; i++) {
>>> diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>> index 0c28ca349bcd..1300f122b524 100644
>>> --- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>> +++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
>>> @@ -351,7 +351,9 @@ static void sfh_init_work(struct work_struct *work)
>>>  
>>>  	rc = amd_sfh_hid_client_init(mp2);
>>>  	if (rc) {
>>> -		amd_sfh_clear_intr(mp2);
>>> +		if (rc != -EOPNOTSUPP)
>>> +			amd_sfh_clear_intr(mp2);
> 
> ... or during amd_sfh_clear_intr()?
> 
> This very much looks like a band-aid (I know it is because you can not
> reproduce, not blaming anyone), but I'd like to know a little bit more
> if the bug is not appearing anywhere else in the normal processing of
> the driver itself.
> 
> Also a comment explaining why this is the only case where
> amd_sfh_clear_intr() should not be called would be appreciated.
> 
> So all in all, I have a feeling one of these 2 functions is not making a
> proper check and I would rather fix the root cause, not the symptoms.
> 
> Cheers,
> Benjamin
> 
> PS: sorry, I know this is a long standing issue, but I'd rather not
> paper over a bigger issue :/

Yeah, me to!

There was a new patch in bugzilla and people tested it (see
https://bugzilla.kernel.org/show_bug.cgi?id=219331 for details) , but
nothing has happened now for 48 hours, so please allow me to ask:

Basavaraj Natikar, is there any hope that a proper fix will emerge soon?

Sorry, normally I would wait a lot longer before asking things like
this, but given the severeness of the problem I thought a inquiry for a
quick status update was in order.

Ciao, Thorsten

