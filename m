Return-Path: <linux-input+bounces-8706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C8C9F9939
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 19:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EBF719664BA
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 18:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2609921A447;
	Fri, 20 Dec 2024 17:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JT6T2u7q"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFE21B199
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717024; cv=none; b=aGnH104O7U85q+WeH0bUvTZQdHvKoxbV+7ULn7Y1Q0JXiUMABoyyMbazzxZN/m2WG8EWiVbLet7hu2MHulOTzxdbgj8Zdmu18pbI4ATuLejSrODSQiyg9VuhUUw58HaatRxd8Of32pCjrsbnJQ/rCVIsb2N/bbg6N+aQJTCMywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717024; c=relaxed/simple;
	bh=x4ZP+SXVkB7/WlqBC+0rtXWbWX8BnGSqPbAipoCLrTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=NBANsnRhbyO+nwmV22iIkBnyBQo1KEATQWzrdAo0+sL4g74yUT7iHiG2Tr5siXPdsoM+ZShp0EUtjvvvqJh8pcuhlNvXBzrlCIZBDdbI8pSPyB1Aic/ghFrU8dGUX0G8xz7cVxgY4IWEyyVvGbhKFZ5dDvX80xdbdL5go0ZIg0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JT6T2u7q; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241220175019euoutp01591bbdffd4a98e1b48542052f3f86c73~S8-AnTX_n1801118011euoutp017
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 17:50:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241220175019euoutp01591bbdffd4a98e1b48542052f3f86c73~S8-AnTX_n1801118011euoutp017
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734717019;
	bh=fyl2GT2brPACwhiSnyDu3E0HAYr4SO3zTWJRtI5l1SY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JT6T2u7qqq3A8RMnYrqG/ei4GTtsYgB0y2gGzrmvFmYLMhMbLUG4DOLQZFMreFsrd
	 NddbKNopMcZ1EfCc9FN+7gBKNUncrPrJz7lAxzA/50EIl0o7EHKtNFRCYpBVgsutCV
	 wBlg8xl5GHhiFXEf6F3fZwFV6srao/n9ysagw0gY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241220175018eucas1p1181fd6a0bb44df8cee905416ef68913f~S8_-_FJp71365513655eucas1p1N;
	Fri, 20 Dec 2024 17:50:18 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id 92.E4.20821.A5EA5676; Fri, 20
	Dec 2024 17:50:18 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241220175018eucas1p2b3a47620160891c48f65454b39606817~S8_-h1P602913929139eucas1p2m;
	Fri, 20 Dec 2024 17:50:18 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241220175018eusmtrp255c1680f287fd661fde80eae34efae02~S8_-hU_i32105321053eusmtrp25;
	Fri, 20 Dec 2024 17:50:18 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-72-6765ae5a978e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id F8.8D.19654.95EA5676; Fri, 20
	Dec 2024 17:50:17 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241220175017eusmtip163a7f31a6af9dbcc8ff655f655c17dc7~S8__w478s0423604236eusmtip1I;
	Fri, 20 Dec 2024 17:50:17 +0000 (GMT)
Message-ID: <7389eeb9-6948-438d-b747-d7a74180cd32@samsung.com>
Date: Fri, 20 Dec 2024 18:50:16 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] Input: ff-core - make use of __free() cleanup
 facility
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, 'Linux Samsung SOC'
	<linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Z2Wr6DuLCGR6gJhf@google.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRmVeSWpSXmKPExsWy7djP87pR61LTDTa2ylkc+ric3eLwoheM
	Fm+OT2eyuHW8ldHi5qdvrBaXd81hs5hxfh+TA7vHzll32T02repk83i/7yqbx+dNcgEsUVw2
	Kak5mWWpRfp2CVwZ8y73sRQ84K6Y+2kCWwPjRc4uRk4OCQETiVcTVjB2MXJxCAmsYJTY82AJ
	O4TzhVHizOsOKOczo8SkO7OYYVreXDrPApFYzijR9rAHyvkI1L/8OlgVr4CdxMZDy1hBbBYB
	VYkdLy+xQMQFJU7OfAJmiwrIS9y/NYMdxBYWCJS4dqEVrF5EQF9i++xfYEcxC7xilLgxfQ8b
	SIJZQFzi1pP5TCA2m4ChRNfbLrA4p4CWxJuNtxghauQltr+dwwzSLCFwhkNi0cfZUHe7SGy8
	vYQRwhaWeHV8CzuELSPxfyfIUJCGdkaJBb/vQzkTGCUant+C6rCWuHPuF9A6DqAVmhLrd+mD
	mBICjhKXV3tBmHwSN94KQtzAJzFp23RmiDCvREebEMQMNYlZx9fBbT144RLzBEalWUjBMgvJ
	l7OQfDMLYe0CRpZVjOKppcW56anFhnmp5XrFibnFpXnpesn5uZsYgcnn9L/jn3Ywzn31Ue8Q
	IxMH4yFGCQ5mJRFeHrnUdCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8qinyqUIC6YklqdmpqQWp
	RTBZJg5OqQYmhwavv2vMP+1pscirP5b2iblYXzAuP9JQV3KfvNi3FfPvvyxsvXPzyafLMxu+
	lzemvX9W9vS2Wc+yz3dWxBfJH/Mq47o74e/JsJaXC5g9xTtYk+PWVwSJMl7aeekO34yl5itW
	iIgpxWj58r45oNFopPEru2b7pQc5AZvdN659fdt/t9V77iU9xTOdPi9zD+bnOsoQ0R727Xai
	jPujFrV7xQmlQts6v/Ne2HB95dN/xovXXV884dfM02v/FZ6yjlXRWuyd+LeWyYQxQYJzlWHq
	v5x0GZ5vapOsmKaertd+bMLp2Tp3ZxTnn+IlweIyGQmJe1WNzh15lXS1jbPJrNn+i1ryuXTX
	y8t71z8rNZyhxFKckWioxVxUnAgAlj3Cba0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRmVeSWpSXmKPExsVy+t/xu7pR61LTDc67WBz6uJzd4vCiF4wW
	b45PZ7K4dbyV0eLmp2+sFpd3zWGzmHF+H5MDu8fOWXfZPTat6mTzeL/vKpvH501yASxRejZF
	+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnzLvexFDzg
	rpj7aQJbA+NFzi5GTg4JAROJN5fOs3QxcnEICSxllPi8agcjREJG4uS0BlYIW1jiz7UuNhBb
	SOA9o8TrfQogNq+AncTGQ8vAalgEVCV2vLzEAhEXlDg58wmYLSogL3H/1gx2EFtYIFDi2oVW
	sHoRAX2J7bN/ge1iFnjFKPHwAB/E/M9MEjsXS0HExSVuPZnPBGKzCRhKdL2FuIFTQEvizcZb
	UL1mEl1bu6BseYntb+cwT2AUmoXkjFlIRs1C0jILScsCRpZVjCKppcW56bnFRnrFibnFpXnp
	esn5uZsYgXG27djPLTsYV776qHeIkYmD8RCjBAezkggvj1xquhBvSmJlVWpRfnxRaU5q8SFG
	U2BYTGSWEk3OB0Z6Xkm8oZmBqaGJmaWBqaWZsZI4L9uV82lCAumJJanZqakFqUUwfUwcnFIN
	THu5pxYvP9z08KVYQtsM3oubX69uFv8VdDQo7XeZ1Q/9S8eex51vVc+SuKeq5CVxIvX45j1T
	Tk7rMGR76VywaW5DfVRJi39n14Utbz9YHrwnfGkmd+7j5TP5onZuar/qqpLo/7ZNecp67ZK5
	Kbw7o5jYm8oV1p5S2vswpibLSkitYp3DNZWSTLvmO3sNDl/7EM73LPXnj5c3nJYeXZy7YeXV
	AJ4pzBkhDz0+JisGFsR+3Cpc8kRnSkGV1AUXhd+z3ogZyx/IvT/n9c0f/b/Wqkqkrf6bFNA6
	Rbi15JcyU9IjQ/VH9+yXKJh3NRekOXCoL7w889/+zfc3FwR8XFnxem9xzqHwhiep5lIHXZsV
	W5RYijMSDbWYi4oTAcllUCc8AwAA
X-CMS-MailID: 20241220175018eucas1p2b3a47620160891c48f65454b39606817
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
	<20241107071538.195340-3-dmitry.torokhov@gmail.com>
	<CGME20241220123701eucas1p23125e0738985ffe35cbe9624dff08972@eucas1p2.samsung.com>
	<7d1e1c89-d4a6-4b3d-a674-5ef497c2c496@samsung.com>
	<Z2Wn2wTesz3nj-vO@google.com>
	<d9130467-7141-4a5a-a520-a0550031111f@samsung.com>
	<Z2Wr6DuLCGR6gJhf@google.com>

On 20.12.2024 18:39, Dmitry Torokhov wrote:
> On Fri, Dec 20, 2024 at 06:38:04PM +0100, Marek Szyprowski wrote:
>> On 20.12.2024 18:22, Dmitry Torokhov wrote:
>>> On Fri, Dec 20, 2024 at 01:36:59PM +0100, Marek Szyprowski wrote:
>>>> On 07.11.2024 08:15, Dmitry Torokhov wrote:
>>>>> Annotate allocated memory with __free(kfree) to simplify the code and
>>>>> make sure memory is released appropriately.
>>>>>
>>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>>> ---
>>>>>     drivers/input/ff-core.c | 19 ++++++-------------
>>>>>     1 file changed, 6 insertions(+), 13 deletions(-)
>>>> This patch landed in linux-next as commit 5203b3a18c1b ("Input: ff-core
>>>> - make use of __free() cleanup facility"). In my tests I found that it
>>>> causes the following kernel panic on some of my test boards. Reverting
>>>> it, together with fd5ba0501d38 ("Input: ff-memless - make use of
>>>> __free() cleanup facility") on top of next-20241220 fixes this panic
>>>> issue.
>>> Gah, I fixed this once and then undid it for some reason. I think the
>>> following should fix the problem:
>> Yep, this fixes the problem. Feel free to add:
>>
>> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Thank you for the report and testing. Do you mind if I fold these fixes
> into original patches?

Go ahead, no problem for me.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


