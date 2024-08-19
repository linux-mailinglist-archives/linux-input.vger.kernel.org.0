Return-Path: <linux-input+bounces-5691-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D03D957650
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 23:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F5F01C23AA5
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 21:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6BE158A1F;
	Mon, 19 Aug 2024 21:02:48 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D8B155352;
	Mon, 19 Aug 2024 21:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724101368; cv=none; b=u3L2gwzrL8S+/NzqH8U2ZH31uGFjtFU6O/Kd6IfBQlQgPv+oz19SuJY0fmoujdfAzeJsOWR/ENelhqzDm0DWOJwyFmSggbiGVsH1w5qmw/fhi3OiRqiszBuHC0ucwZwlFi2b50cB4hyxwh+TELGXD/5NhXbpbLeIbjrZEbVkplQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724101368; c=relaxed/simple;
	bh=Z+FlYo3dgi3jQ9aCzHLCeh+CmDhhdHrea6pIc6/nG0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7HNjcB2zii6YKfShdlWlaKF4F6UqszM2uQHPF/MsGfA18zv9cUfBo9lMrnVtWggFn+3qszz9vD7q3ZsNEPgEmM7P4/TdlZKhCoNV/YsikjKoirODus4PiZYREV6sOEvk8cDTFGOX3dVeW3JG/EObSaLBXjjnocSc4wdRC5bSjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id CC412FFA73;
	Mon, 19 Aug 2024 21:02:37 +0000 (UTC)
Message-ID: <224add74-501d-4db4-8e51-da6f30beffd1@enpas.org>
Date: Mon, 19 Aug 2024 23:02:34 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hid-playstation: DS4: Update rumble and lightbar
 together
To: Jiri Kosina <jikos@kernel.org>,
 Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 nathaniel.lewis@sony.com
References: <20240811130906.3682-1-max@enpas.org>
 <CAEc3jaBELzAnffyE4mzQeNAiH-F5AhQqMGvMKoL6yu4naHBo+w@mail.gmail.com>
 <nycvar.YFH.7.76.2408192033080.12664@cbobk.fhfr.pm>
 <CAEc3jaD7vnU_SZYqyAja6LD_Zqwy6cpi+yWOW94tPt3UH6vGqA@mail.gmail.com>
 <nycvar.YFH.7.76.2408192246220.12664@cbobk.fhfr.pm>
Content-Language: en-US
From: Max Staudt <max@enpas.org>
In-Reply-To: <nycvar.YFH.7.76.2408192246220.12664@cbobk.fhfr.pm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 22:46, Jiri Kosina wrote:
> On Mon, 19 Aug 2024, Roderick Colenbrander wrote:
> 
>>>> Hi Max,
>>>>
>>>> That looks like a reasonable workaround. I think it would be fine to
>>>> add. We will try to support that with Android as well.
>>>
>>> Roderick, can I take this as your Acked-by:?
>>
>> Consider it Acked-by.
> 
> Thanks. I was ->.<- this close to applying it, but apparently it's missing
> Max's signoff ...

Indeed it does, sorry.

I just got my hands on a few more controllers - let me send a PATCHv3 
with the new findings :)


Sorry again for the back and forth, and for not finding earlier that 
there may indeed be a pattern by which to tell controllers apart.

While most controllers copy the original HID descriptor exactly, the 
controllers that need this patch seem to have something unique. I just 
didn't think this would possibly be the case before.


Max


