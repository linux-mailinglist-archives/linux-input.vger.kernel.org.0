Return-Path: <linux-input+bounces-6808-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5A988342
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 13:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33E13B211F2
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 11:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B47B1898E6;
	Fri, 27 Sep 2024 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="tcY4Yqa0"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52E8165EF1;
	Fri, 27 Sep 2024 11:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727436268; cv=none; b=JOGMKCy6dkjbxjLurjNkg5P26gLnaBMcDF6+SUHwv0hmPSRNSQkdSLzPeATATce/r5w1vLWsn8+VLsTjEMotrUucDYhoxsdkbQW60IpEGNg24DHzSJs1qqARIdBNgOlQSj5MZknNYK7LzdhwiBDm4OHPDJgrQvRnRV6HZZ8qptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727436268; c=relaxed/simple;
	bh=9cR8jwboDXswjBaOLvuGNJJX2GprrqMcvu+x/L61nB0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jg/59SBngwYgN3+cyky113tJg/X3qThknxR9H45zPK6fQsdzmh9R6oFlaXrYY//JFWKiGX2Ff/T3FBPB1FWR4yCwZKdVK3RL+d/N1l/UnNgzBrPsI/naMMMIydDHXiBOngJnYAMPEKxBjrFnLvmAdLX7g8TKDV4vzvI5Ej1ypzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=tcY4Yqa0; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AA3E82FC0061;
	Fri, 27 Sep 2024 13:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727436262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9DAi+nOTb+bbbLQwPejLIuSdwe5JN3cnBuPh5p/YroY=;
	b=tcY4Yqa0NIh35E1D/4SVY+SOn6qchI9BV15XOfXVfeWEw+Sb8JCVPLYk01d98X3LshAF5z
	fuW+d1xvrdIu81KuKywgvyyCVStSObV0xdI+jp8xHvkGh7lSIgyizlSo2LJMuKb7vGFIZm
	wjAcRU9a90DJv/4/e4x3N5EjmvokDcE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <3e5630c0-2ab4-49fc-8b91-988b327bdcf8@tuxedocomputers.com>
Date: Fri, 27 Sep 2024 13:24:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ad01bc38-3834-44c9-a5e3-540a09a20643@gmx.de>
 <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

an additional question below

Am 27.09.24 um 08:59 schrieb Werner Sembach:
> Hi,
>
> Am 26.09.24 um 20:39 schrieb Armin Wolf:
>> Am 26.09.24 um 19:44 schrieb Werner Sembach:
>>
>>> [...]
>>> +// We don't know if the WMI API is stable and how unique the GUID is for 
>>> this ODM. To be on the safe
>>> +// side we therefore only run this driver on tested devices defined by this 
>>> list.
>>> +static const struct dmi_system_id tested_devices_dmi_table[] = {
>>> +    {
>>> +        // TUXEDO Sirius 16 Gen1
>>> +        .matches = {
>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
>>> +        },
>>> +    },
>>> +    {
>>> +        // TUXEDO Sirius 16 Gen2
>>> +        .matches = {
>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
>>> +        },
>>> +    },
>>> +    { }
>>> +};
>>> +
>>> +static int probe(struct wmi_device *wdev, const void __always_unused *context)
>>> +{
>>> +    struct tuxedo_nb04_wmi_driver_data_t *driver_data;
>>> +
>>> +    if (dmi_check_system(tested_devices_dmi_table))
>>> +        return -ENODEV;
>>
>> Hi,
>>
>> please do this DMI check during module initialization. This avoids having an 
>> useless WMI driver
>> on unsupported machines and allows for marking tested_devices_dmi_table as 
>> __initconst.
I wonder how to do it since I don't use module_init manually but 
module_wmi_driver to register the module.
>>
>> Besides that, maybe a "force" module parameter for overriding the DMI 
>> checking could be
>> useful?

Considering the bricking potential i somewhat want for people to look in the 
source first, so i would not implementen a force module parameter.

Kind regards,

Werner



