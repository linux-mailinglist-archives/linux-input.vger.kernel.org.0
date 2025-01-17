Return-Path: <linux-input+bounces-9358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA686A157A6
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 19:54:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF78D160C52
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C58419E7D1;
	Fri, 17 Jan 2025 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="k4mozUpA"
X-Original-To: linux-input@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0225A63C;
	Fri, 17 Jan 2025 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737140059; cv=none; b=G4G0dkEtW6gvwkgtWkyVnmdYX030tRB0Scr+tfbyyf2Lr5vnktu4eVzvLvCqWxOxVIXCAWSnnnIAN/cW96wjMKERltqgsRwv2ZJbkoZ8ATg+Aip0SfTHDmAQ2ylIGz9Zt/zzq+JEYXiuprQPHzhYQ9e2MWGSfleR6cUQDb2meS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737140059; c=relaxed/simple;
	bh=u7diQXQXeLXOnzJcFmZURQ2FAqnK1dOLhMNq/TXD7RI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hqE35KjktK3jn9WaH1BaKExqcWazStOian/JPS3zL1luqpDqHf6JQ234rv4wCorUaGRD006gc7S9MAcPraSy5erunGnCPGLoLLXQ4aL/WI/2shtsSoN2Nla2kHi5wRFhhh1v+wc9pAaJ0545A6M7CC3jmEp0x8S9qXj6DBVT1oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=k4mozUpA; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50HIrxbt238560
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 12:53:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737140039;
	bh=cEZqydSL37Ey1MT7bgYhu1lDA7hhpqF0jdqNAV25I8U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=k4mozUpApxmKyRVmBVtF52L02CNyjeMAuJ4hJBi83sbmihc8Wo9MV8zL5VNh9kd7d
	 X1ZQA9MVntG8M13Fd9SaE+lH2jCVusVX3cO5FrKCmE1pF0aeLl13do531/l2cvNdx2
	 LG9uBjLZC1akGkMvxabwFWtaprx15G8WdqgEqiRQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50HIrxZ9060827
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Jan 2025 12:53:59 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 17
 Jan 2025 12:53:59 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 17 Jan 2025 12:53:59 -0600
Received: from [128.247.29.11] (dmz007xyy.dhcp.ti.com [128.247.29.11])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50HIrwD1011405;
	Fri, 17 Jan 2025 12:53:59 -0600
Message-ID: <ed233ba4-1bc0-4a0a-b457-530ff4d344a6@ti.com>
Date: Fri, 17 Jan 2025 12:53:58 -0600
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] input: tps65214: Add support for TI TPS65214 PMIC
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <u.kleine-koenig@baylibre.com>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250116224009.430622-1-s-ramamoorthy@ti.com>
 <20250116224009.430622-2-s-ramamoorthy@ti.com>
 <a14f5f69-02b5-4398-8639-389626644b8f@kernel.org>
 <Z4qWpRNvn22XRV1E@google.com>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <Z4qWpRNvn22XRV1E@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/17/25 11:43 AM, Dmitry Torokhov wrote:
> On Fri, Jan 17, 2025 at 10:23:58AM +0100, Krzysztof Kozlowski wrote:
>> On 16/01/2025 23:40, Shree Ramamoorthy wrote:
>>> Update descriptions to reflect this input driver  applies to TPS65214,
>>> TPS65215, and TPS65219.
>>>
>>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>>> ---
>> That's just churn...
> Yes, when something is being reused we typically do not go back and list
> all the new users unless there are other adjustments needed.
>
> Thanks.

Thank you both for reviewing and the explanation.
I will drop this input series for the next version submitted.


-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


