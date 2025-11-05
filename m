Return-Path: <linux-input+bounces-15885-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D20D7C340D0
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 07:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C8818C0FF6
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 06:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8064A2C028C;
	Wed,  5 Nov 2025 06:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7asJN9j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7zkCbQM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05572BEC34
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762324121; cv=none; b=jp3OEB6L46biohZBBiDhb8V8babOxnkkNqkPDkF6ZYTv5nCwYtBuJy793QiOHFpUc9fqJmElFBJapy0qfRBdZm7LLmj09SAHRMHWxRj0Vml07ASr+go+cfuqmqU3cNmQXiqZ7FQw1aSmYoh6iRKWkYjWW5HmEPPRTrKJLsRmivw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762324121; c=relaxed/simple;
	bh=cXMGcgMeIt0i4bxPv0vOWVNF4ZfCzQOPebJqmBRiI/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p7zLt5liMTiv8WlanckcC7BPUA7Yg5SoFljmZkzY0ZX5YnwIJlahHvhWjbcPYE31d1EceEFv6LIIs6bRm6f3NnUHoQrHc5r3ou2T2WS1lAjRdm4KDUCPbWcZYNYW18OLLcyIGVoKjOSokZgWNRJO4tzdU6orrosQQWQVdskmcmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7asJN9j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7zkCbQM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A53sIxD3913970
	for <linux-input@vger.kernel.org>; Wed, 5 Nov 2025 06:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WgIzaXhUFyRA3Hn/FagvzSC9vo2naZyMdOTEmwHHh/4=; b=p7asJN9jrPUEsJ84
	W8huS/UTWOj6XsmdoSAaxeBPvhzYhLfqODL+RLDUn9pRwKIBxTWeXYrmbJcmsVGF
	t88gQ+ZrbEOqhMYEZjw5jzjGddVoIgw0tNEfBpTTGdAtDzo6D8xhz2qlcQOmDcU7
	PfJdTcV8P2uUic4BQhz5pg979QqY1L6O9vxSVA8q/RlYiKTGuWk2Dtr/UHcSTLrA
	4ZsKW6cUtxuD/FVUPcvEOK/i5EAwyOiH69pBVYc3EngOhUzSC/VskHbWECzJrV/6
	QOrMeC1AroU5EPT2s2axtihAQUikZ+zSz/sTOOHuYKA4dqgUwxkXYuhOiPNjdDae
	2aVjWg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y378ab2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 06:28:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso4811030a91.1
        for <linux-input@vger.kernel.org>; Tue, 04 Nov 2025 22:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762324118; x=1762928918; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WgIzaXhUFyRA3Hn/FagvzSC9vo2naZyMdOTEmwHHh/4=;
        b=C7zkCbQMCvgG2k42pLKJBIP7XKkEeh3p1I923T0IX3aGdMqZ6wHWRJGmLTVShVtwYc
         A1GCqVw4NF3MahYRrSiswt/IhMyOlGwgHE05rpbdtXaGexdqGYSdVVRTh0BBWyFiCL6t
         TpBoZzjMYLLVxeIv03We9+Vs26JmbeSSzABxBSHRbtyp5lrMrc75rgpeMrTBSRp3fdHW
         1jjXWQmumIPi1PFgI1ncYybr+rInA65FXtwaT5YaKbUE8+SvPwIS9ba0zAgYFIa7NHCs
         O9aPpFOWeBgEtQcWtP1aqgaP6QaGH34tFZKPy60Xg1O/t9f5G1w9IuBJHNiwq797wLyY
         bJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762324118; x=1762928918;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgIzaXhUFyRA3Hn/FagvzSC9vo2naZyMdOTEmwHHh/4=;
        b=KoRmardmuYdYeloFpWCyj1vhqk0zLO3akTvfTGucajHCC0qozpyIAhVjLd83x2GhBZ
         bzGl0V6ehur3nuFjvdDfrQ5pCMF4TpzzH/evoI7nybIvquza/M0ye/hJDUX7FpJSdOzK
         l27WU0aQU7YDwECFW6QVM/QUfk1s063nX27kXMfykJeUrcYp85aly1BifrSQVvOfqClE
         y+VFdton8r6dklbldAIJmkQfE1ZAYKOQ+QaMJjYdeGsSyn9uF9CTDBlP6xoBhls4kBcA
         Ot5nQESgr+JrLkapUNRdGJ25ZdYe7mRTChuTNMfiY13BbGw2L5JTRim8QYRx+9eGvXMm
         S1Lw==
X-Forwarded-Encrypted: i=1; AJvYcCU0/pEo4gtWFTBQrXgWLeFXFAo2f9+L2d+O0HyfkP8eF9ua/6VC4qYM7Pr8YHhYiCEMVOz/I1SwhEddYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBNqHfCd7RSYaIuCo3qZr4YmUYIt+ZrtPDqmjm9f/4fAnnZkMH
	jWZiLyOQCYtG238DV2sCplx4px6hK8JG5X3mf23JUVbeb/0vtLEl3d/9y7QR0zbQyiLJJhNOFZ2
	41x1SxlROxV5iGR+gg1teXhYewJtT7Ix1TYpkhorw5Ui5xXmwb5QcnaVKMlJq78r04Q==
X-Gm-Gg: ASbGncuUKO8eg3l/8v9Q4S0xcgB/y2MtkLDTKjtofh9ce6KiATbW6lLb6JAsQIszCMP
	yIbz0FjCZ0SCE/gUdEAdmmGgBGC1QFhaVBNrjwLNLho4B9KSZnWbd+td4M/TV5vVnrqoxAh50kw
	xXlaD3TI7HPmLiAQ97Ux6g3MAOartmFa77/Sl5QtJuk82ZRTHptlQprLQLpPwj6Bwn4iA4cLzf6
	buF/oS5nPlPP1JLANJaFsVN+ChJzbPwaYabKDu/7GxnVnpNLa56gDdfKxE5EfPO1k9TZhvvHf1w
	sXF9eP8f1d9Ett0ABqzwkEfcySw68QAfnnAKl9E9SoZAFa3hbHt7aySVxCg+nOKNnr/U2m6iXYl
	rJYg9T2miF0YbQlB4WgsIQVFWntaqohEi97XF/mE/K3ew1FWxFltvLJ+GzE0ODaAYRKs06sg=
X-Received: by 2002:a17:90b:1d82:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-341a6dc10e8mr2253718a91.22.1762324117561;
        Tue, 04 Nov 2025 22:28:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IERgXbWss6GmB9ldrGk5vHp5OoEgMnBOclsBo5D/x2bAo2tr7rgtjLt8vU3nljGWRrtuXtsDg==
X-Received: by 2002:a17:90b:1d82:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-341a6dc10e8mr2253686a91.22.1762324117007;
        Tue, 04 Nov 2025 22:28:37 -0800 (PST)
Received: from [10.133.33.121] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a696dfe9sm1677976a91.10.2025.11.04.22.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 22:28:36 -0800 (PST)
Message-ID: <186a650b-50a7-4b29-8c00-5e0b1d9d2ecc@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 14:28:32 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] input: elan_i2c: Add newline to sysfs attribute outputs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: krzk@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhongqiu.han@oss.qualcomm.com
References: <20251030123458.1760524-1-zhongqiu.han@oss.qualcomm.com>
 <swn2pwumb7ffpcyer6n5nn6zbdjvxtwxprddymhxzdjzx4lbr5@hkwusbsr5uks>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <swn2pwumb7ffpcyer6n5nn6zbdjvxtwxprddymhxzdjzx4lbr5@hkwusbsr5uks>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zXkhzZY1St_cNa_FFx1sYAcO21MFhM02
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA0NCBTYWx0ZWRfX9QWOEjy3QaIb
 z+qX68ODJ2E2spulJg+WPcjm0KFw6o4dRBAHy2NbVwJ/rtQZ9NjVxm0axuC5maLRxo7vUUXcaf5
 c+QVwf7OvkfXdZx9TH4C1kZGty/NMJFb9cEnOOuxji1Nx5M4ebLCqnB8pZkZwNJFCxOKkNy6IeQ
 qUm56QqDdnPKpLDD8MH4zm4kv2HUSKjOuySOG6A0PWFpRepzhQ5pdhXkhh23sIJ3F8pN7NPs/MB
 7vBSHEgTA9PBPioN8cAu4UvZdUcagsc0qvlR0Wi8ZMAzE4Ot6sKlldoI0H8B1pt8vKmalTQe1gK
 T+SggyBW/MvpJT+ZSFKsMAyj31FzbThToS7qNBFlNgFjVNA1XH/MgdsSVL1dBT5/q33IesBw3BT
 AzF/lccnCwVGWHJIfu+StwM8U8LmdA==
X-Proofpoint-ORIG-GUID: zXkhzZY1St_cNa_FFx1sYAcO21MFhM02
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690aee96 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0orITSUJZSout5TAGxEA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050044

On 11/5/2025 12:55 PM, Dmitry Torokhov wrote:
> Hi Zhongqiu,
> 
> On Thu, Oct 30, 2025 at 08:34:58PM +0800, Zhongqiu Han wrote:
>> Append newline characters to sysfs_emit() outputs in func min_show() and
>> max_show(). This aligns with common kernel conventions and improves
>> readability for userspace tools that expect newline-terminated values.
> 
> This format for this driver was in use for 11 years, and there might be
> tools that do not expect newlines. I would rather leave it as is.
> 
> Thanks.
> 

Hi Dmitry,

Thanks for your review~

Sure, I agree that we should avoid breaking unknown userspace tools.


-- 
Thx and BRs,
Zhongqiu Han

