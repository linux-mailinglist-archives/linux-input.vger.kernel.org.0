Return-Path: <linux-input+bounces-11811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DFEA90C40
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 21:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF300460779
	for <lists+linux-input@lfdr.de>; Wed, 16 Apr 2025 19:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB54224250;
	Wed, 16 Apr 2025 19:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="P6oP3OUN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AD917A304;
	Wed, 16 Apr 2025 19:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744831547; cv=none; b=OQ3JUEoHBGkA2T4/GCf26LAw28rIRAb69zLdV4KEWs+nbSdfa62fF18uelAxNe8WjWQ8Ajd9BygMxEyks7kMLnoQJb+9Huu6NvSA3/2EexQHvq4kXYKTMFcULX081kJjl4huNRQTZeoHndpWKH7ysj74uy6ywPEslqgSNz//61k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744831547; c=relaxed/simple;
	bh=Bs45nEODho+pI/T1U6UUY0QVDRpNhgGMGKekJK77+kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2ABPWQ6FyQ7lc9/cZ2SBH+2J/6s10kQc2oB7CBcr4Tv9lVycjljag7gdTD3KemgAwOwBN8WfdNc29xo8jleANmkXZRKhziqcCuh3/Zl17VaYsJ4HvIQ/7wMPursEZrdEnQRJvbLRuoes2reRUXsp3Ra9PS4/RtOfHQdyfFKsz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=P6oP3OUN; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [10.6.0.9] (host-88-217-226-44.customer.m-online.net [88.217.226.44])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E227E2FC0083;
	Wed, 16 Apr 2025 21:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1744831541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07vSjkZ3A/mQ6sdXkiMc76J/P/Ko3PLURA5O6XlVMn8=;
	b=P6oP3OUNycvvHHfATuucK23rf+RGNy83Z18TyrXbFgYvVbBoG4AKPkfBTQazjzDFHPUBW4
	o3Yr0t2YtAGrEyDia/ZJBgFNUi55g4WxQ2KZ0yq7FFpGf0KQEjZNRfU2EAcqF1yMqoYk0Q
	UTk/tl9yxzaIYAa8jnw8xgcsyWJwHPc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <21a33381-5bb1-456e-b03f-90cfbf1abee9@tuxedocomputers.com>
Date: Wed, 16 Apr 2025 21:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250416171809.557674-1-wse@tuxedocomputers.com>
 <20250416171809.557674-2-wse@tuxedocomputers.com>
 <a03efee0-3470-4d7f-9a63-3ec9f1ae4f3a@oracle.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <a03efee0-3470-4d7f-9a63-3ec9f1ae4f3a@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 16.04.25 um 21:13 schrieb ALOK TIWARI:
>
>
> On 16-04-2025 22:41, Werner Sembach wrote:
>> +    for (unsigned int i = 0; i < rep->lamp_count; ++i) {
>> +        if (rep->lamp_id[i] > driver_data->lamp_count) {
>> +            hid_dbg(hdev, "Out of bounds lamp_id in 
>> lamp_multi_update_report. Skippng whole report!\n");
>> +            return sizeof(*rep);
>> +        }
>
> typo -Skippng
thx for spotting
>
>> +
>> +        for (unsigned int j = i + 1; j < rep->lamp_count; ++j) {
>> +            if (rep->lamp_id[i] == rep->lamp_id[j]) {
>> +                hid_dbg(hdev, "Duplicate lamp_id in 
>> lamp_multi_update_report. Skippng whole report!\n");
>> +                return sizeof(*rep);
>> +            }
>> +        }
>> +    }
>
>
> Thanks,
> Alok

