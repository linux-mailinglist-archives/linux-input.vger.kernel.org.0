Return-Path: <linux-input+bounces-7085-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E302599063C
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 16:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0491C20E41
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 14:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12E92178E8;
	Fri,  4 Oct 2024 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="SDc7TUOv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3B158214;
	Fri,  4 Oct 2024 14:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728052601; cv=none; b=fcewXy0ZNf6sNZ0JqD2aR4DAhd96zWGTEaOlHXSzu8kOXiBve8mVwYNE2986uc46h36g9bhuL/KbyskXq6EOVZFQTmdj4cNjI8QCMFBxZgJ5tFCQaUvxMYKo5uwCJjjWLfiD1jnxhLMpM6sf/EHNC2jHXIC7eHHeyT8tBNfvCWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728052601; c=relaxed/simple;
	bh=RJKBM5wE8Sg1Sz/kWp0mcf7pouATIatiWngJXJEPGZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8/r/CJPVjOjQc7n2ZvxnB6hzJKBrmCJqHJ0XKFkXGD4BegtS/+rVrbZfz0AyiV4bK7tG6G5J0hzuSkcweUDqlHbfp+0pgRfPbsMr9SWMIgH7KuYkNpb4/Z7cyiW58xw4WFwd3kZwFboC29pf4jCyr6NKJahfjD+UakNyDxdDqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=SDc7TUOv; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 415F52FC0050;
	Fri,  4 Oct 2024 16:36:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1728052596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vP3PFpRd2ZOwvuuhtver3jyV6yAM41O3MdWKWJJcVYY=;
	b=SDc7TUOvYNDRmv+uX4S5nk1hUVTvVtCzA6Kf3EmorrP51VL1iS3un4f9YtTHNYjBKh7nk5
	Otp8VS3kbGEy7SgpFbpQK/eZiP1BbOu6LJdCuZKHfflt5Se1booSIohW0Y2GRhBCHwPmc7
	OkQq1vo+NLEm1BKSapn8rJmO5XC8Bwc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
Date: Fri, 4 Oct 2024 16:36:36 +0200
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
 <4bfc188c-0873-490f-bfef-119c7fa74be5@tuxedocomputers.com>
 <20241003075927.GI7504@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20241003075927.GI7504@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 03.10.24 um 09:59 schrieb Lee Jones:
> On Wed, 02 Oct 2024, Werner Sembach wrote:
>
>> Hi,
>>
>> Am 02.10.24 um 14:52 schrieb Lee Jones:
>>> On Fri, 27 Sep 2024, Werner Sembach wrote:
>>>
>>>> Hi,
>>>> first revision integrating Armins feedback.
>>>>
>>>> Stuff I did not yet change and did not comment on previously:
>>>> - Still have to ask Christoffer why the mutex is required
>>>> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
>>>> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
>>>>
>>>> Let me know if my reasoning is flawed
>>> Use `git format-patch`'s --annotate and --compose next time please.
>>>
>> I did but --compose does not automatically insert the subject line, that's
>> why i copied it but forgot to change it to 0/1
>>
>> Sorry for the flawed subject line
> And the missing diff-stat?
>
Also not automatically created by git send-email --compose. is there a flag I'm 
not aware of?

