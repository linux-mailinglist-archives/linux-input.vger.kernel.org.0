Return-Path: <linux-input+bounces-10219-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1705FA3FF09
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2025 19:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5305C18986F7
	for <lists+linux-input@lfdr.de>; Fri, 21 Feb 2025 18:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1661F3D58;
	Fri, 21 Feb 2025 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ig/u5IIP"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AA71D7E50;
	Fri, 21 Feb 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740163608; cv=none; b=FtN3755AWkDwG85wH2XWrKkwJmDuD80YG+l7RIdbRX38zdkEevqgV9rzn8TyDcjidtvJpEh693JkFii8GEymt8kg1yejDw02i1uGrTPbi6snkGF++z4qOjOE7L5uyUCYZ/hqAmvd+b8FUoF0CqLaX1fnED80TqfF7JP+r1jtvo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740163608; c=relaxed/simple;
	bh=BpkZGQd7vCN4FATcjtLxwnt+wPpZHIIXvEiSaLa9lxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Hvwk9prH4e7udFXugvyaSfRRuDN6zy0XQk9906FJlL7CiDMq9Dhz8RfSG52vPlCWPrn3IUrWsqpfK3F2aXzGicyb2Zvh3R1JJLTiIluSvVtlMzc2mU66Oc7cgqefy3pIRXBE4ur72Jl6tJ1xV6JrOrc/nP9B++zCNK27c8xjtYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ig/u5IIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LApag5002691;
	Fri, 21 Feb 2025 18:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaI15yMrcwWdfdssLAcI1d++ZX2eyBAo0yxcU7T9bfQ=; b=Ig/u5IIPGzBSGJm1
	NZRYANpHuhwZq5by8pK0kX2HpZpuWhXeBoCUVS8aZLbvkR2LUxruLuCDXBcvOY9t
	ORWmsffTd8SQe1k22yyhv7P9TCIdNYnG6IQFOOvK5PIEElC//cnpbshbjBeY/vcu
	o4Z69+UW4bEdf4AqabyIlccEzoKZa2L9lXNuYhsWBGPl9Z8HvmjbX+2nghuHV+tL
	jV7l9uTYkYECUSJvxhgNYGrqCZdg+dBwoqtp4T5D1yw3VS0wom7AKZHIPKsqWsG9
	5T/8I+KWokavm/EyiEFiBjsjpRgYyPDsTQ7Frfvcoh+Bfrj4iwy9VktDskxTprUQ
	qTm58A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2jx2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 18:46:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51LIkeKt028113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 18:46:40 GMT
Received: from [10.47.206.1] (10.49.16.6) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Feb
 2025 10:46:40 -0800
Message-ID: <96ee882b-ecfc-4845-ad82-dde82d3d51e6@quicinc.com>
Date: Fri, 21 Feb 2025 10:46:39 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: pm8941-pwrkey: fix dev_dbg() output in
 pm8941_pwrkey_irq()
To: Dmitry Antipov <dmantipov@yandex.ru>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-input@vger.kernel.org>
References: <20250216170336.861025-1-dmantipov@yandex.ru>
Content-Language: en-US
From: David Collins <quic_collinsd@quicinc.com>
In-Reply-To: <20250216170336.861025-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VTYgEALzrfXIeUEtwTiOMr8Ce29_0r1K
X-Proofpoint-GUID: VTYgEALzrfXIeUEtwTiOMr8Ce29_0r1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210129

On 2/16/25 09:03, Dmitry Antipov wrote:
> Since 'sw_debounce_end_time' of 'struct pm8941_pwrkey' is of type
> 'ktime_t', use 'ktime_to_us()' to print the value in microseconds
> as it is announced in a call to 'dev_dbg()'. Compile tested only.
> 
> Fixes: 0b65118e6ba3 ("Input: pm8941-pwrkey - add software key press debouncing support")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

Reviewed-by: David Collins <quic_collinsd@quicinc.com>

Thanks for making this fix.

Take care,
David Collins

> ---
>  drivers/input/misc/pm8941-pwrkey.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
> index d0c46665e527..d952c16f2458 100644
> --- a/drivers/input/misc/pm8941-pwrkey.c
> +++ b/drivers/input/misc/pm8941-pwrkey.c
> @@ -154,8 +154,8 @@ static irqreturn_t pm8941_pwrkey_irq(int irq, void *_data)
>  	if (pwrkey->sw_debounce_time_us) {
>  		if (ktime_before(ktime_get(), pwrkey->sw_debounce_end_time)) {
>  			dev_dbg(pwrkey->dev,
> -				"ignoring key event received before debounce end %llu us\n",
> -				pwrkey->sw_debounce_end_time);
> +				"ignoring key event received before debounce end %lld us\n",
> +				ktime_to_us(pwrkey->sw_debounce_end_time));
>  			return IRQ_HANDLED;
>  		}
>  	}


