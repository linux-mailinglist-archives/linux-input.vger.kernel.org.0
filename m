Return-Path: <linux-input+bounces-15103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC86B9F30B
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 14:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3044C387E48
	for <lists+linux-input@lfdr.de>; Thu, 25 Sep 2025 12:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBAA3054D3;
	Thu, 25 Sep 2025 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxmr+xaw"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3501F305078
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 12:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802549; cv=none; b=uZewexlKFmxqwQtnC6y0855W8hKAgT8TapdJ3nuh6x/OGp12+dnG/c/uvGwnoL/EIW9e6Rf2JN53LTOO3VuySeoZOeNoJ1SAJXr/8AoDHWWaPwY52lUq0jA5zqUC0gZh/o8MWNOiPiBZmVSEUjhHsLrUdkqsPeEVptF/vVFxoKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802549; c=relaxed/simple;
	bh=HQloABzlnB8r/NiJ4QOXbc7ZT8TEzRbdNF3WianAing=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSqKKHNwiRkc5CHZfyyIuXbOW01wEQYYAEuC5rDRKLsmpzxb/ZldIdin025sObhRVx7xceVRYgTk27rVHJMRhheNlg6FWRkXuvYJlDIW7xV/gXYqNxUFu+v5chzbuQuLE0WiOKVQfWwJpcSOcC+jVHedXF4sY5mM+l61OD5xqT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cxmr+xaw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9tCrq018069
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 12:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ouVUk6EkYRj6EqW6mxcCGA12lGdj8Q5EsB1YmAFNCoY=; b=cxmr+xawu7/OiGto
	hKBFSxw1GOr7BwHSqh1fj6Wquo3GiKjmyDRK/yl1HXNPJD0jUKkKzqWMgH0CvLhX
	krW8IHyL/ZDiyfzMasbn/tY1z/bp2JWwyzMOZ+SyyHAGQNXTUxO70LCU3R+iOrp3
	PNGrN6HvL4o4+gdzd52P+WHgHlIQgDG2QJ6opnagCputPwiQVGJO6XqVVXwfUXgu
	iCPELS33nVpciqC8CmeLbXdRiD96Fwp3oXdGJslWFYza7C92A/HnR+l23HbAbXBx
	vRYM632IUoUHa4mQGfnS8TubLqshbozzT1UCkl5jW8JCL1C0JCT8iex4To2ozDJY
	kHvJ1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kkbyv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 12:15:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-82b15c1dca8so35235785a.1
        for <linux-input@vger.kernel.org>; Thu, 25 Sep 2025 05:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758802546; x=1759407346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouVUk6EkYRj6EqW6mxcCGA12lGdj8Q5EsB1YmAFNCoY=;
        b=qKwAR2Zukp4YOQtDSe6fIDfKNiU5B7KTaND5/eYH5jYwCQlFCRvQTKyuRV/9H8zcbV
         Bw7wnTOKZWZ7w7ihYPdX1PV6BjT2701RgbleZPL0EfBZXo3eS2nxnOjjiHtSJDvLhv+P
         GI6yyPMlwFf7S16KKC7sgA8V69PAZu3Cg5p8E9svpZXQJEyBU0XO5YTVauqOe1SPxAQB
         3CAzOYKYdMs7VcMfeRAGYgk2jme/Dyq2XWF0ogBxrq6ZprV8HOKdhkW2DBp5FLbdPr+y
         +slWL55Us2MdXzWODdedSESwVbQ7N0zxfl6P87EJNKdkre8ONrZRTEBttKbSIBrzkaG+
         oYFQ==
X-Gm-Message-State: AOJu0YzEGsJRIec5o0uY72kXLRFPq/Zy36s9F5Gv3XgqAazludRwEsn6
	jQaEvfEwTRwhjpNeVJdsFnEGuV7mE4aOXvLz0kkLApzQkPcb5tsBw9+wUA1LSgZdZFp/NhJySav
	+6CAvfc1+ziqPw3KwioewbQcufiuPwKTcE06Vd3V5rZEWuND0D4C51VXmmRhP2WjVbDZfZ48gXA
	==
X-Gm-Gg: ASbGnctcPHC7aX3VLd/EMe7EIjl8C0fXBKBDuoS08x1sVy0hPprjsD7pyriP9ZNbsp4
	22m1MVfYTD3+IgsN0BtT8hb7qp17kxgEa0bmCyNfZQDFEsF2L8P0LCMZTJD+92G4R/C4JwfE4fR
	NrL+WdwC7FkCDg8mohLAzqI1yncWnABCkUH+ou2axzqGKSO1BOWcxNErWz3CESArU9DG1HoZRPV
	+Wu6ZFYPGl8ZYf6cwHl3Vdz6/ZwlR8ju+iHvPhenR/ANrbNbd19wTYwEM62+fYer562k50Hhihj
	a22E+KQz64Vs1qrrmXg5H9nNFuRzJ4KoBl+4Jh5s8FJ1K1J1T/ZPac0M424shmAj1BoCF8FLETI
	Iy2DCwQBPniRmOLLieqNEeQ==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr25219101cf.8.1758802545965;
        Thu, 25 Sep 2025 05:15:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKDTicP+At3tb6zBRvj+8JVoPm7W3lOGpEI+urWVr96LG5JzmbSw4XR7btbmuKOwHogSvf9A==
X-Received: by 2002:ac8:5d92:0:b0:4b7:a9cf:91f with SMTP id d75a77b69052e-4da4b0490f1mr25218681cf.8.1758802545476;
        Thu, 25 Sep 2025 05:15:45 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545899fc9sm153299966b.91.2025.09.25.05.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 05:15:44 -0700 (PDT)
Message-ID: <81822df8-1978-4f22-93e7-87b79e1fc9f3@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 14:15:42 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 2/3] Input: aw86927 - add driver for Awinic
 AW86927
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: q_Q1pQBJIJN4NfU6DU1Uwnhn8qkMolaJ
X-Proofpoint-ORIG-GUID: q_Q1pQBJIJN4NfU6DU1Uwnhn8qkMolaJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX84WD/gVtUiRq
 mG7atYYKZ737zjv23qX8iDBXMGZOHWTa9z0dZbYYnehvoKn1e6Ch7FQ2c0FUwhd6lVgR3mYfcHJ
 rD2KNXtByDZLN8aYkipUVwN3NLBlGyFJSJOCM4s2Qf2JEZYUSvJGb0XZy2yMS7xFeIT/vabHUOZ
 qL4F58HhbcJLuyC/vOA68lsh5pgKIoA+jOgp3Fd21Lt9Foiv1Q1NAAHEnMkiuwpdRTVIxuFciAf
 XEJE1gzoIYJXNNZyfgpzju7g8nXSBZX+k4BMfRnfeGEOv6g+p+lyjMix7TegNpbkVE3v1m0SbfX
 Z9pT0F2IJ9C0/26YfDhNGyXwLDDv8rwHrk9tHbNX7GM1fQIdVM/rxmOrF+bMHYR+iJtmJVgsxgP
 vFkCoA/Q
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d53273 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=6H0WHjuAAAAA:8 a=pLNEalJQesa3U4KxjPAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

On 9/25/25 12:07 PM, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86927 LRA haptic driver.
> 
> This driver includes a hardcoded sine waveform to be uploaded to the
> AW86927's SRAM for haptic playback.
> This driver does not currently support all the capabilities of the
> AW86927, such as F0 calibration, RTP mode, and CONT mode.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

I'll give you a couple of cosmetic comments, feel free to ignore

uint8_t is abbreviated as u8 in the kernel

[...]

> +#define AW86927_PLAYCFG1_BST_MODE_MASK		GENMASK(7, 7)

GENMASK(n, n) is BIT(n)

[...]

> +static int aw86927_wait_enter_standby(struct aw86927_data *haptics)
> +{
> +	unsigned int reg_val;
> +	int err;

"ret" is more common (for "return value")

[...]

> +	switch (play_mode) {
> +	case AW86927_STANDBY_MODE:
> +		/* Briefly toggle standby, then toggle back to standby off */
> +		err = regmap_update_bits(haptics->regmap,
> +				AW86927_SYSCTRL3_REG,
> +				AW86927_SYSCTRL3_STANDBY_MASK,
> +				FIELD_PREP(AW86927_SYSCTRL3_STANDBY_MASK,
> +					   AW86927_SYSCTRL3_STANDBY_ON));

this is regmap_set_bits(regmap, register, field), you can consider
dropping the _MASK suffix too

> +		if (err)
> +			return err;
> +
> +		err = regmap_update_bits(haptics->regmap,
> +				AW86927_SYSCTRL3_REG,
> +				AW86927_SYSCTRL3_STANDBY_MASK,
> +				FIELD_PREP(AW86927_SYSCTRL3_STANDBY_MASK,
> +					   AW86927_SYSCTRL3_STANDBY_OFF));

regmap_clear_bits()

(also regmap_assign_bits() which is a conditional version of the two
is a nice piece of syntax sugar)

Konrad

