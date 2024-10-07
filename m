Return-Path: <linux-input+bounces-7113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 524509930FE
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 17:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 934B7B27D19
	for <lists+linux-input@lfdr.de>; Mon,  7 Oct 2024 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77EB01D86D5;
	Mon,  7 Oct 2024 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="d89FzbBb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1E01D7E3D;
	Mon,  7 Oct 2024 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728314548; cv=none; b=uc2q7t+jhXgw6GeGY7jHu9zXO6MNa8Vv1FLjuYyNaDvsJX7KyWV7dOUaRSaXkiyXBfyhXfuNI6KecMt3BYDjMPYccpqVRaG7uQ16lL2/Zx/b/R6ujzVbdU5muT8Z7ows5gwlT+n+dN9TaBmwGx6hE9fmWNpLBhi/9+4Nb2WFx5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728314548; c=relaxed/simple;
	bh=w9esKvick1sXqivIeHi8vwVXTGtU9/c7XGFvYxLd1b8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUCDOUjLm8WXOLn0g/2foRd3xq+jdR3Xw4F11MqpLm5bUIzmcZjiuubXGrJCQrwP+XeruliB0KXCDm/uJmfP2WZBbwiKuPf8liVc0qXqUVUbTNrQ7StC7u4IgeslGAZ+wMwUe58879/araUjL/vvvPTr3d4keK+alVvYZ6i99aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=d89FzbBb; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 5F48A2FC0055;
	Mon,  7 Oct 2024 17:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1728314160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RiPkAJvBhWX0YTmJpruugly5PxL9Y5Uh4+q/2ANr8Xc=;
	b=d89FzbBbvgeVCOT/2CGXsE5Jevi8jCLK17KB0tRE13LXXmIrpy+P4jrRUtaLFRqwyThY2H
	VwVuDZJOXYRCTISIaeYrBY3u2McZ+cF37ILhg5AmLKD89pkLJE/jSVuOIZ5Rw29nBP6Er1
	GYPK6dwClvN2n47RFsTQ2OYiHD9MWiQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <86936252-f3b6-46c2-9244-ce0cfebf3c42@tuxedocomputers.com>
Date: Mon, 7 Oct 2024 17:15:59 +0200
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
 <8874c084-20b2-44d8-9a0d-67aedad4b456@tuxedocomputers.com>
 <20241007125813.GA17897@google.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20241007125813.GA17897@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 07.10.24 um 14:58 schrieb Lee Jones:
> On Fri, 04 Oct 2024, Werner Sembach wrote:
>
>> Am 03.10.24 um 09:59 schrieb Lee Jones:
>>> On Wed, 02 Oct 2024, Werner Sembach wrote:
>>>
>>>> Hi,
>>>>
>>>> Am 02.10.24 um 14:52 schrieb Lee Jones:
>>>>> On Fri, 27 Sep 2024, Werner Sembach wrote:
>>>>>
>>>>>> Hi,
>>>>>> first revision integrating Armins feedback.
>>>>>>
>>>>>> Stuff I did not yet change and did not comment on previously:
>>>>>> - Still have to ask Christoffer why the mutex is required
>>>>>> - Still using acpi_size instad of size_t in the util functions, because the value is put directly into a struct using acpi_size
>>>>>> - Error messages for __wmi_method_acpi_object_out still in that method because they reference method internal variables
>>>>>>
>>>>>> Let me know if my reasoning is flawed
>>>>> Use `git format-patch`'s --annotate and --compose next time please.
>>>>>
>>>> I did but --compose does not automatically insert the subject line, that's
>>>> why i copied it but forgot to change it to 0/1
>>>>
>>>> Sorry for the flawed subject line
>>> And the missing diff-stat?
>>>
>> Also not automatically created by git send-email --compose. is there a flag
>> I'm not aware of?
> As above.  I use "--annotate --compose".  See if that works.
>
nope, the cover letter has no change summary with these options

