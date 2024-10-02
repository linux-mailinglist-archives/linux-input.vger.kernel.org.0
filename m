Return-Path: <linux-input+bounces-7018-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CCB98D59E
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 15:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15D331F2093F
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 13:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35E81D0782;
	Wed,  2 Oct 2024 13:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="AKdh1Wtt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 526AF1D0B90;
	Wed,  2 Oct 2024 13:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875910; cv=none; b=nN1oRZswNPBibWkWtwVVp9sev3JpV0tKaCrv489E+hA3StWzZLMOr5R0Fwr0rRj2LqUaxHmtQOq9+VlaqIhbu31z+CNp4lbhPDGXZ6nHUKiUiI12XINGVhSQhMI2QY9fxT/pOJA8q+n94ZAT61RxlWkDLfnklNIoI9rhozjpWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875910; c=relaxed/simple;
	bh=Py1xnOdYVYVi/h2btIwfR6K+nqxqbcW6dIlTXx6prnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fy0r6dG/QSITzGGERAD3/vL/ROB3SESPICJnfIU9ja7URSYWMouJmPdxztzmGUI1sQcuV0lK6ffjRYSEyqHM45WHAd+gUL6/ZHSdQ0dFT/U48ljOlTWBIykXqwjpzhCdMqy/9ff/EGIcpSSk4AN0lTtW4w87XpAKNGX6HPYXfAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=AKdh1Wtt; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de [217.229.157.161])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 57BDA2FC0050;
	Wed,  2 Oct 2024 15:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1727875904;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGOtZtXVPpdQdwtaMm7mq8l+rXyCb8gEF+WRDFxJKYo=;
	b=AKdh1WttXohJ3kmStfUJlq+YBFG0nVVUnH6gJFFlkO8LXBTQ7i67AAKMa7Uxgojxe11DIp
	9AhqnU/+v8p4FwfkK8fs51GtUsn7waSWGeag7UMc39r6cbMDH4m76TrYCEmcPZL7xuNO+D
	1kN11fRwGQqVAzXFaIdgmU1Vid2iy7U=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
Date: Wed, 2 Oct 2024 15:31:44 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO
To: Lee Jones <lee@kernel.org>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 jelle@vdwaa.nl, jikos@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, cs@tuxedo.de
References: <20240927124152.139099-1-wse@tuxedocomputers.com>
 <20241002125243.GC7504@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20241002125243.GC7504@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 02.10.24 um 14:52 schrieb Lee Jones:
> On Fri, 27 Sep 2024, Werner Sembach wrote:
>
>> Hi,
>> first revision integrating Armins feedback.
>>
>> Stuff I did not yet change and did not comment on previously:
>> - Still have to ask Christoffer why the mutex is required
>> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
>> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
>>
>> Let me know if my reasoning is flawed
> Use `git format-patch`'s --annotate and --compose next time please.
>
I did but --compose does not automatically insert the subject line, that's why i 
copied it but forgot to change it to 0/1

Sorry for the flawed subject line

Best Regards,

Werner


