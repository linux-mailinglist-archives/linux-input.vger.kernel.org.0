Return-Path: <linux-input+bounces-15459-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DBFBD86B2
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4347D189F141
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CDB2E62AF;
	Tue, 14 Oct 2025 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQW0d/3+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878822E7BC0
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433778; cv=none; b=HCpdYsQRJ44eG45S/C+trB3nXXaoTI4qOQnup/HNb+JS2yKlLHMKf1YMEpQxFQp1PIjuqIbCQpps/ZMIJzNJ2F/W7fYAeMCROVF6MRv0Edxu7cfS71NLUkabQ5EdUHyxJ25SdQ6+YDlt2BQZm7WBuuHbhcpOyPTFuyHLkFL7KQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433778; c=relaxed/simple;
	bh=4kdH9JwWn5BUz8jMj6r/TaxLP/NSVJU/tJpy1sBaGwk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/U94b9RKyFnP+CirKWYMrCNJAAPn3G+kaqZwoHebLR9JzMGY2Ju9dras+Cq+r3SPMOLmmk0xlErrVD1Gp9YPT7cZnBpha/YwvdoSTwW0132g7183JB8JZpT8TJnImF5wLLMkGqJB6/AVFLlBzljI3RiEf5hPHlZYjI+pbk/sew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQW0d/3+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87L44008659
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=; b=QQW0d/3+8jWCiqK9
	aXFu4NReDnyno1hQnDd9X1Jx11vJXCyQNNBumCgDiKLY0VZq6lJdEpMTmqI6cQRM
	uU/vTq3EwIHSOWzJj//TDDADPs5EtVlvLL7uyRRYkmvRv9hDI4qf2QyanIPc+S3p
	PP+n9huZ3z6atcPsfZS7gpelklaTApv4fjkZf4OKKEyE9j5k8GsSndCw0R9fcPOG
	Lgdam1Fl81MDIF3bSFYnnJIjdk5b4Oux7IVOvSEhUnjcSgZNygKhi0jhyGokAsxW
	Re/i48Izy0xnUje6crVmv+HE5mSiJdwZqZFpTD+WpOR06Q7qOmS8bm9kgr0xsER/
	ZSUiCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrt4qhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:22:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85e23ce41bdso291744785a.3
        for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 02:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760433773; x=1761038573;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBRR5H2TkKxKF7H4pKihb9Oc+NcrIbt0tfqa5n/nEGc=;
        b=Aylw/as8WpwP27pixL0opIoGoj/5cuXjj4/5mCsZEMd8GdrS1h58WVOF9dDqX+XUg9
         vFtEDeMKIm8I+QmfpHQbTi9aeddfjlSm3e2MqbZVLAKAcczhU6vuZOhnVcY3o7QaDkNH
         Ub5UNJ1zbsqNTtKyQyvHTPCUCAVNTkmDgeLbkXNn7Ea8bPCeA1vKU9koJhVgTE9p2af4
         Nw4fNhiEVQ8kBuVWWCx5yE7CTuGUWdfDhBabnYZ7qOJoGNijCq7NMxTXEO8zL7dbiAE/
         /McEiTM9lPotIGr7IvGhELnro2qawHFiBEcbjfybMLUeIyh9HzCWTQbNtUtht5BXp+i9
         +fUg==
X-Gm-Message-State: AOJu0YzQSfUB8xHWFd2Kmu3AovzElHYzZde41ZqxBvptBNPjIRE7xfkB
	aBq/bmpkFPgbF74BWP/r7OAs1AJ6PSJEE0T3UF0+cQMeQGVetQGNPBdLAfcvQLwc5k0lNLiEsm6
	N+d8jA5IqiWcZOZR2wUDgLFXmJCcf2zpcIoqdj4otVAbLa5YgVS+mxfuNEprERDX2aQ==
X-Gm-Gg: ASbGncuXVBydj4mKfv92AQaqFE06FgJiFrS1uov+sdgOcaTH6cSo2XydXb2qEBD9YPG
	8OH8942VbWZJznjDJlTZ0MP3CzsLHKdom704xtYi/K5zMCObrK6NJjl5heNbLheNDuJR7HO4DkZ
	ipvZG6WTw9dyAJXwDEEWLqa/37dB2KFO2UHaSa+QC0QKQjgc6V3Uwbbt0Lyst+znoZx5jahpkbt
	AuF16seN5j1T0S7l7FrsfXJQsLUOoRPpnXFboVtdT+5kM+lJ6GtLWia5e4cLAAkgCZkCctTAj2I
	XKVYrD97OzDBJwRRwu9LKgsKEpVlZ7hErh0gZu3JFUahp7c2OMTvI525TdoJn4vQ4IeJYL7wKeO
	756atqEmRq0keK7YIXhgRsg==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066569885a.5.1760433773525;
        Tue, 14 Oct 2025 02:22:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6lBPtCjgj5B0ks8xM4dqV/qBR4R1q23vBYNJs1dE8aUXN8FmTT9yYWz5xoRUNmm6qC74jzw==
X-Received: by 2002:a05:620a:bca:b0:862:dc6c:e7f3 with SMTP id af79cd13be357-88352e8e8eamr2066565785a.5.1760433772666;
        Tue, 14 Oct 2025 02:22:52 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm1127034066b.23.2025.10.14.02.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:22:51 -0700 (PDT)
Message-ID: <87650853-3b4e-4a05-b3f3-4fcb8820ea9f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:22:48 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: sdm845-oneplus: Correct gpio
 used for slider
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        Gergo Koteles <soyer@irl.hu>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
 <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251014-op6-tri-state-v7-2-938a6367197b@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hYGAYHVdfOiUgzHduFNtJC1nR_Grc4Nj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXxnRUIkAzi7cS
 omXlF0JS5JXZWSYgxLuSkS9aoJLNPrk1mrX5VtJtQj6So0uWhWII5LYV7EWui3vsZVucM2z9BjX
 ZF1WUxYo9MJVJr6v9aSUQ+FDwmeIEvDgki82jP2+0FFpnGW8TOW71ew7El+btZjS7GfNFq+pmO2
 CpfsSBZcTTi74qtyxTiaxLvsTmlx5BGDCkuWVcF1xK426JTVIT6yPf4vRfOIGZCc0NY5p6xhlyu
 8MS38tCXCXzH5ZgsiI8KJ8fOMtDTXdXFbcIcJ0gFG82Ts59IUvMWAnlGkL7Jb5pMw5SRsibDYnv
 +3mphWaDCQSIK0VVrCaZZOeLss5GVbMi8o/XN0386W588UEthAnUYt46T/na99flv4fitkFpN0O
 bcFaqVR8tjkaeCGMepA/L7A1gVsVPA==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68ee166e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=b_3gLtI3ev4ASzC4froA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hYGAYHVdfOiUgzHduFNtJC1nR_Grc4Nj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/14/25 11:20 AM, David Heidelberg via B4 Relay wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> The previous GPIO numbers were wrong. Update them to the correct
> ones and fix the label.
> 
> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

