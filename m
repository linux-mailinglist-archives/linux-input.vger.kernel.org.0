Return-Path: <linux-input+bounces-16463-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16BCA3DBA
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 14:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6B5B301A35E
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D090342C99;
	Thu,  4 Dec 2025 13:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="daWQPVHG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UeJ0peyG"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72AA343D8A
	for <linux-input@vger.kernel.org>; Thu,  4 Dec 2025 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764855280; cv=none; b=Ri8oGmaK8Qdvq6ZOcIXT5oN1PDfqkegi6QaUrEE6j5A3/JMCEGx6jBM5G6whD8fnDjpHlMp+rRWBrwUGE6tfJ5sr1E0zcG4HKG0vDRswfjHykwLx5OtbKrRh1twBsFr78aP8CHpalK+qhHURJADne3mhxHtn6inCivx0oOzJOiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764855280; c=relaxed/simple;
	bh=Q2jvwnjGApk/ez8BkscDTm8TnqH3uXBkQS0E7jDf1M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k0mS+1lql6kzzLZ7DcKZzSrwlcNL53wMlLY8jr3zOgwB5jb/Z4GTjafJZCjuOhr260o2e07mRiyDrX1sHKDnFgoTFBXemDe8jRk1tGEMdbnoMJDBzXY3Dd0f9cnjVJAqEThkchHt22V4zkb6rTVDby+kGx+eoOrHvB6RqzOps2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=daWQPVHG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UeJ0peyG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4B0utt614190
	for <linux-input@vger.kernel.org>; Thu, 4 Dec 2025 13:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xCCJoAcemcOQIYIqAm5SIGE/QGpHdFGfYCUD4a1Bnug=; b=daWQPVHGlda3mdX4
	iJ3dbT3v4eiAjQprBJCyOzHNQTNxOKFqaeHxj03O0OwqWmTruXQ07GFako8NyqZ5
	5omjtjwWgXKfAnlpf2ks+3EGXCE+Tk2Q7r1JzI0NMo/xiXbT9RzkQoRTa7Bdapk/
	gQPbhuWeuTu+QCvrLkeehGTqYf7LmcsRUA/rlDByKsWijov9X5FCfjMS9ZD2gPMB
	enWqcHK7bUaijDr1cwNUCPWMuBj1STJNLRm5adwsDVPkMcwaVNuRQ7UaOXa+/S50
	7gllFjbxutBtooU3NWjZM+KxNPE3rxvrTJkoL2RLW2csxsNlVZT3hNVKbsvtLqxy
	6e7gQw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au9298d22-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Thu, 04 Dec 2025 13:34:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b5ff26d6a9so23609285a.0
        for <linux-input@vger.kernel.org>; Thu, 04 Dec 2025 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764855275; x=1765460075; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCCJoAcemcOQIYIqAm5SIGE/QGpHdFGfYCUD4a1Bnug=;
        b=UeJ0peyG+W5eMnnyeQgguMlai7EPnNmqXwjfNjGD6kYB4MJDoXnoWUyZ3L0AAoEo3b
         YLuCsKL8zyBG1rcIUT2fcThv9XXoHupT2CD1Zf9FN5TS7+FJGGQyb889HpLYk4dW+dQN
         tXEbxwuYRNJPfgNPHUZlP3IyHj4Q798J1xLV6WTn1oVno/gA8pYVeZpqXhyLyG0Rafg5
         mmTMKaiJP08tfxMVv5DLJtKc0APIXTr+XODeF/JIIaWUDDV5NjHhKhRqKpcFrRC+wIf+
         7SkoaV5+LhnFlzVbhRjdffTte6k/2KXuwoMgy+EMX7z1gjrTNgHeQz0hKWiyNuBoJej7
         AiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764855275; x=1765460075;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xCCJoAcemcOQIYIqAm5SIGE/QGpHdFGfYCUD4a1Bnug=;
        b=GdDDtkR1pGJXTg1sLguB+BaX+SLnn/VKknXBBWb7UnBiHXp8YhBxrjYsSz97Rt2OO5
         9lZ0wRtigtV1iAYzz52oCEfF61BTY6ask2qiXRwHnBcu+YiU7F4bSDvzHfaFRGkFwkkc
         B8kahSHyuw4ZFtMMvr3lMD+b4jxB5+x4nHiatPKVH2yn/hooi0HKpC1MoAeKmfy22sA2
         SUpOq656CBnvGrdP5L55SRJihEtF9VFeGsLTxfoUM349W7I3KGeL1unMcyccNhBPDkB3
         vzwziDtWYQDqfepWih85HYgxhP7665nRm+pIGOm25TKm0Gg2Q/J9rqkpeRy64rH01kv9
         4E7g==
X-Gm-Message-State: AOJu0YyzTjNjpM9gIWU1N4gyGlrkBv7GW20gg2v72gcBZoRjfmOK6fvk
	nlN+ZIAcMepvd/3xcuhfOj2mlCW8uLIgxzDzQI2eHfCo8fD0pdwR2HreFBwH1zEpVVdyeVgk1gI
	lj2rT36SkuflDKUoKxfpnTO8iimHPT8LAL9RZb/sZcVMNVw4VnuKeAV2xZ1/fpZoSrA==
X-Gm-Gg: ASbGncvLvEwWat6QWLiFKJahH3CdSgrr5culJl8YgBDc75gZGuXrAfvJy0jV2oBgP4c
	bFqwoPsVWdx/ZFdIKj1qx2A+r1P7fMF1qz0hgSWfxlc+qYPbI5zunyL2OmwfsMq9g06TM87vehD
	24gbL7Pc+CRjg8LnJ4YKpdkrwplV86yFIjYkvt38C9JdZzW3gq6W6y8jgG226jGNh9Tz4RMlWfj
	RrUjPopwmJvv6TK2VMGHfQiSjlxirNU3hv2Ydg1Fz5Eha1iWMWdRalU1WPferBUIljmFSdsRJ4B
	+NI5HabCBZUw22804NbpzY/DpuFsrz1O36jrHSHZT0FJ89FVB0fEQpNoZAD3AnNGDuCOZODZ8sj
	nGpaXCJoEh0jatOwsrx9ZHwKP2Tfd+V5rzoSvTm5RheoALjuWYnt/v1Tdh0lzxRcxdg==
X-Received: by 2002:a05:620a:4688:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8b5f9507b99mr567901285a.8.1764855274679;
        Thu, 04 Dec 2025 05:34:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWjMuRv8TnQVdBKFwGRc+UzlpNCLY6fm6IIDqIWP3X/6LSuHl/kT+6n0xNsqpZSClOaJAU0g==
X-Received: by 2002:a05:620a:4688:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8b5f9507b99mr567896485a.8.1764855274118;
        Thu, 04 Dec 2025 05:34:34 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f4975c56sm127125466b.33.2025.12.04.05.34.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:34:33 -0800 (PST)
Message-ID: <bc89b3ac-242f-4890-9996-060c4a0f2b67@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add vibrator
 support
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
References: <20251204-aw86938-driver-v1-0-ebd71868df3a@fairphone.com>
 <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-aw86938-driver-v1-3-ebd71868df3a@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t6CwAdjN5pdCA_YE8Sn4cjgL-5Kj86n7
X-Proofpoint-GUID: t6CwAdjN5pdCA_YE8Sn4cjgL-5Kj86n7
X-Authority-Analysis: v=2.4 cv=UddciaSN c=1 sm=1 tr=0 ts=69318deb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=nkaG5teaT87xZXm8SjwA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDExMCBTYWx0ZWRfX+n5Dbc6yqYGB
 S9xepva8FN0xv8A0jX617RTQgjVmJ4yHkmgD++mys/BncjlevN2DHhr/NWcWljOLJjSwfiHHwlU
 2k9DO3yKzpuiunM/HRcWg64bxxq8DppEIV6c/56+YGpCsEx1bSICYpBHBPGSdwtd7lt4YDhL3wW
 f2Pet6l906QjZbPN6GbCSMOtSI6idgWa5GLoi5+dfyCKXLnU08cjrHmHAnt579ETKzMcOBG9+p7
 ycf8VIt4FdfZCH29Mkd20FoQQnJqVMIstGkcDaWkA4y5Z6KZQeXdPsSlGGoNqnUKsmg8iQqkn7t
 k9ditupQaosI4tT5t21vhWN7g9v+FL2aq3KToECTQqkFCuEFty3Uydkl6Um7IYapYm2hz+0tGhn
 8CEAVpxVGIuhdALM6phcfsuQVmOMtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040110

On 12/4/25 1:29 PM, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86938)
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 17 +++++++++++++++++

The DTS is unfortunately still not merged :/

Please arrange with Luca and either squash this into the resubmission
(depending on how the driver changes go for the vibrator) or resend it
afterwards

>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 0a758fb7f4d413a84cdae695c38616fc6075db67..8c43bc9c1d8312f22ad0aeed84b23d52910e0ca6 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -717,6 +717,16 @@ vreg_l7p: ldo7 {
>  
>  	/* VL53L3 ToF @ 0x29 */
>  	/* AW86938FCR vibrator @ 0x5a */

You can remove this comment now

The remainder of the patch lgtm

Konrad

