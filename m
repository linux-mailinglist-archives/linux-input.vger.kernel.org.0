Return-Path: <linux-input+bounces-17092-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D3729D1DA01
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 10:41:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F25253004F7F
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5501D389451;
	Wed, 14 Jan 2026 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VEpK/GIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiIy/KYz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5013876BF
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383389; cv=none; b=Bhq38TRNslmElmSNq9gcbNJOn7iAbKwlm9HpT0zN65Tx1uwwegGDgCzhwJzZkp8O3xFFGQqmHipm4GCtFI438uxZBIRjU/1i+tY1U8a9kBdzRE/BZpmwVFQzrZxpe8+or9zYqalUudKZUipdNmibqa7fw7NFPqY0wCGf6sfhRno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383389; c=relaxed/simple;
	bh=q0WhT6HRS/VMZmcCjjc8Yg3O7QuyurWWEHqI6zFnSYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4B5C1L7/sX1qXw1fh+JlTWf+VFPL7CoBbQNmFqRcUNNgfyQHCojW4k36r53xxllG8PrVcQp4VfHnN41b7bukawDWG9LyaU+1G94UZUO16/pONSiSCpIzMA1Mo6cVU852fLHAhpG0qYdO45QskJSNUKDA2mQupjsyr+3JUD4FEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VEpK/GIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiIy/KYz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7jGrg147882
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 09:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmaFGOoD7baFSuGmX7ITKTn09/ZYYuUhWqvV3wVVdu0=; b=VEpK/GIZI/COZcJ/
	/OQGiXyac9S27J8DcytjR5lmUMLBBYlKTmz9lU6N8sH4x8mu/3pWE8iqhuLONIkB
	eaNDSsbOadFWjh2Y9sZGSJOE6jx+rkgud9IAm0EPfc1OxZgP2r72dh1AWP3mucUS
	ybZUzxkuEAEmdQhIpjl9tcETPvxXJ0cUOn/MT8MKoKEYXOIq1AdexlOvXccg0Cta
	4z6kXSrcWJxvu1tHcS4cFsC9fcApq8Ar7EwZ/S5o2NWa8khXKH7BboF0eYHw0ABL
	foqhyWJJWSpAOAr9HqfvoOg8wc2+IMIU3ES3msxf5j78+7vhL+IdV5OXHRvBqg0o
	F0bKMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp6ragf7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 09:36:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b9fb4c55f0so175337785a.3
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 01:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768383386; x=1768988186; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fmaFGOoD7baFSuGmX7ITKTn09/ZYYuUhWqvV3wVVdu0=;
        b=OiIy/KYzK1emuJUZdFl65ZICu2BZEel4xfLWUHJqDTTuUsDQlJ+4qcZwEz2Jj0GYyL
         ZoLSMkg2Z+pv6lijLDe1nD5XzzSS0oHy8pfXQ8nsJkpyrzCHRiH14uCSwaXvJBWNYCgc
         ZPBDFFuWMVTUAqwXyra7wJ3RpKTpn1NgmXs4PokqT+cxhiNvY8LSVOtjStxqulJh9I+K
         /Qutm8j1PnolR7PqLs42wVzAIsv7ibaAFrjFBDW+s4KskfDD1BelX2UsoJqDjbxomi0+
         5vTl5vbwsHop0B+LEBuwjmpIR4gL1M75Xd4maWM3Rg1G1Iw9plylYZCSa0U6zozXiflc
         pfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768383386; x=1768988186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fmaFGOoD7baFSuGmX7ITKTn09/ZYYuUhWqvV3wVVdu0=;
        b=jKH3Mn9cTpEejBPND6GKvMQVxyWYdwGL8+7SZG0/CoATIBNYJrbfY0AsZBeTv0+W7r
         EXNVPt3VrwsdCl3ZirKASb6leUzvbMBuw/XbDfGt1+X7xnbkEQO/CyAKXHpK37gI62U0
         X/3KO/OI7saoYkaqAGCrh2IxBCQNO+RWzFFYFniBF1gbFEHgzeAjTqj5LUw017/o6bNo
         fyLb5BmHyWpfuvoN7jF2yYIcD3DCrT6S8QhAjMFHe84+To1lrnywtT1zZINJERY8SygG
         TmuLWVUvm7BdlIgDL77kxd/XC3bRsNSqO+yuAwei9br4qyIMpFZISO72TEsNdXdwwltr
         2Zqg==
X-Gm-Message-State: AOJu0YzykQHJpiMDl5nhlH45oKtLMKBgCpjaa64GQBoNKrysS1cbnydR
	cFT2EdZ8sFonFOqFtFGG9yXdCzbO2lB+8WPpbQzc6ZiU6eJHRwWquzkoMylDAr6In6gQQ9Nda/T
	5b3Glq19dfhloM83zbafYm8obM39eGKzPSXBZ7hjpA6rIfm/EM2QGeJHLInY0Lejvmg==
X-Gm-Gg: AY/fxX7MPORJ4Qgvq9hpOZELD7D/soJEHiCq8rEgDFAq72luF6xaWE5VXVv2KHTCn4K
	+2AXw4+79figeXaMfPRV+Ts72kD/6rWWNctxDfh4WuZqmj4LawfLglXuJjsAVtueiji3Fa2bExJ
	08SqhnRNmFyAZtGPYwOYCPINs6npg3sZA8dAQfk7HoYe9cnj+gsZZTt/QfwcWgCLtkXKNH2ZT5/
	WtOEG/Hoh2KGEVKbUv7PAIZDviegOZlodajdvgluSi6aR+L8n0DQsrirxJpYX8DMfC/oBhfJ9Ya
	HWqvIUlQyjk+fyCliuz5M+8+yfuDi1tYbxLNaNl3BV0W3C07VjbLsAZqEZynqkhvrCd3g5Umv6p
	TOyoWFi3v9scLbk6MxHvvPHhwJZEQk39rdYf/EjL36eQi99jd9H4dR1nMatvCXCzNNvc=
X-Received: by 2002:a05:620a:2209:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c5305eededmr132016085a.8.1768383386145;
        Wed, 14 Jan 2026 01:36:26 -0800 (PST)
X-Received: by 2002:a05:620a:2209:b0:8c5:305e:ea16 with SMTP id af79cd13be357-8c5305eededmr132014885a.8.1768383385566;
        Wed, 14 Jan 2026 01:36:25 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b876838f431sm114064166b.9.2026.01.14.01.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:36:25 -0800 (PST)
Message-ID: <f11cb37f-5a84-4fcc-a4fe-6502a86fc28a@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 10:36:23 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add
 Focaltech FT3518 touchscreen
To: yedaya.ka@gmail.com, SzczurekYT <szczurek@szczurek.yt>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        =?UTF-8?Q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
 <20260114-touchscreen-patches-v2-3-4215f94c8aba@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260114-touchscreen-patches-v2-3-4215f94c8aba@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3OCBTYWx0ZWRfX8TTPWwNx2VHr
 Bh6JJcgbqHpax0uPLQU6KKdIpK2BiPbM1SO8UhxJZcqc3CQMrDV+oH7keIE47S4gWRgi9rJUoNH
 7Vs/cjhBTsBlxOOndwF8oP7nPZYeQDeoxY5VTSSBWd1utkIInh6nwBbrG0Qj52F8gA9tM4j+yqA
 Dirhw2KDcOdIF/5KUnHu+MT/usFQaOMD5NA8nE4yRmDFiWulZahXCU4qhS2XourTNyPhS5wBy7s
 dXuhca5q3bGvjK2dnmH9IwGk1bxrQUyoxUSlBb1sI2dUMH7tEJdRF0b8NudT+8WSQFAyxkPNSzr
 vyYarfdqscVGCehkVbJcsFoxfEWkQTeiK9Fydkav1J8B1AH50zGx0b8LqS4K1ad03TBq2y565VN
 OHumQscpAyB0vHXHyXzfSfQBoFtOS8HxgUfTIlsJG/hsg7a1lsE7WZ6AzvBkjVVjNdbEfDS6b80
 0rJHJAjYA2r2PY8djZA==
X-Proofpoint-GUID: l-UeAIaORHQBhYL2tfRS4UwpwZ5OBkjj
X-Proofpoint-ORIG-GUID: l-UeAIaORHQBhYL2tfRS4UwpwZ5OBkjj
X-Authority-Analysis: v=2.4 cv=L/EQguT8 c=1 sm=1 tr=0 ts=6967639b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8
 a=x19rvWGDhA2VQTMAA-sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140078

On 1/14/26 10:31 AM, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> Add device tree node for the Focaltech FT3518 touchscreen on
> Xiaomi Mi A3 (laurel-sprout).
> 
> Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> index 994fb0412fcbdf5466f87a325c48b697a37b514b..97feed708d3b6483eab72cfb0ae39be6f5ae3a11 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> @@ -119,6 +119,18 @@ active-config0 {
>  			};
>  		};
>  	};
> +
> +	ts_vdd_supply: ts-vdd-supply {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_vdd_supply";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 83 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		startup-delay-us = <70000>;
> +	};
>  };
>  
>  &hsusb_phy1 {
> @@ -411,3 +423,25 @@ &usb3 {
>  &usb3_dwc3 {
>  	extcon = <&extcon_usb>;
>  };
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&i2c2 {

Please sort the label references alphabetically

> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "focaltech,ft3518";
> +		reg = <0x38>;
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <88 IRQ_TYPE_EDGE_FALLING>;

interrupts-extended = <&tlmm 88 IRQ_TYPE_EDGE_FALLING>;
> +
> +		vcc-supply = <&ts_vdd_supply>;
> +
> +		reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;

You reference gpio83 (vdd en), 88 (interrupt) and 87 (reset), please add
a configuration for them under the TLMM node to ensure they're always in
a predictable state

You can probably find it in the downstream kernel, otherwise boot up a
downstream build and check /sys/kernel/debug/gpios

Konrad

