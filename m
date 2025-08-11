Return-Path: <linux-input+bounces-13903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A552B20809
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 13:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8394F18842A9
	for <lists+linux-input@lfdr.de>; Mon, 11 Aug 2025 11:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BC62D3220;
	Mon, 11 Aug 2025 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGBZsmHz"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD5B2D29C8
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912429; cv=none; b=G6UVtZFG5shwr6I1GdaVeckD0eb37wKxizMqZjhuIUeu9PRO804WAuudNHGOtKJv8xH1isOfsrchKEpJTUEwh5GpJKmH/Q4qzDUtUzioCzXCesNrRYJOffKBt8BoSFuBRG0gNhXrfSfr53mCDyXDGqh17Uj52xgeQ/o00JVgPzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912429; c=relaxed/simple;
	bh=6lFao+Zb7QpPd8YuHQG/nU2Wug6imx5UBEuBoNzE88s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPWZls/oahJMC3rMq9NR8HijkFMWKD7UA1/GPPCnvOw5OsctD/8gyIH7S5zikquzfb+DzQRLKHGMaQTRObAeomDXiMYnCUick8qoIiGn/K765OLhvzduUYO0mHoW9U91Pdh/81tN1G4EEfsP/DO4/392RTKVNDYkE6yg4SH9/lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGBZsmHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BBJXJk008413
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 11:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MI7eOWlhA8wMryLN7DmMCKNMSC+NaTn6BOa2zl+P8EU=; b=cGBZsmHzqQa3K8cg
	aNlqzxrGZNzagDvgTVYlPOUIVixavEVjuA+9qXI7IODtbXS4GIDclPvYIK788uOg
	dBr24Bb++1teD74Qpf6QJU/hiWfKHfDm+aT489OpTw+ykU6oMca+AvDKFpsHGP2q
	n41FnnRow9Cfn4x3BTaAzArfoNDhaHj1rTgkCsu3AkzE+JnknjUgJeMeBKk02QL6
	tr8surAZ6TRk9/DG2eJFK2dgp5VsRdlFQqqD3Dbl4/WXM3ZqTyVD/2il67Oo+UZO
	HcbtQ2aisCxfr/Pl3HQ4cqu4qFTMrwAEX3Y/aLrzWQOhs3c/sXm+r2zqxYVXqgTY
	0YHOZA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjg1ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 11:40:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b07de45deaso2335491cf.3
        for <linux-input@vger.kernel.org>; Mon, 11 Aug 2025 04:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754912426; x=1755517226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MI7eOWlhA8wMryLN7DmMCKNMSC+NaTn6BOa2zl+P8EU=;
        b=OmjW2UyzOWzdJJIXmRpBIvEUP/+jgzdSRYTo/ruoopN0z7fgO3I6qvS4eFcQvvdWz2
         S68qqE87ro0jjVhS07c2PzamoTc7nTBEwT78WatJJ3R9/c2CBVqYO31vYBWUtW8QGN04
         R5klXvIYdg34hWSwsBc/LX22crKmKaHIxE0nUJrhuA3l6ttq8pSlQ3YfO1OLdwbF9zqm
         Kb8o0f1ME9oONIsif1tZn4lvyHtMg36qw/tgEGxHvxUXz5rrk1AAwIpKyzbncnnY8+i5
         uI/K2UcQV58n4ppaN3q8XbT5G9+hoiVRq7+uYa5yMDikD/zE557x5Pb/jrH2f/3pB+Dt
         6FYw==
X-Gm-Message-State: AOJu0YwbFuSyAD6yiDe7r9FSX/5f1VGk+MBIm7bE0+EsP8jGIJbxN/oH
	h7DPIAILZVpW8hOT4mAtnA60nJIhvUh4HrJeXolk5JX8Z2V48Tpg1mKZtOvolVulEGDAFEAOX2X
	YuHYHNTwbrlvIMALrSn6qIdkh5hoi5Dmy8GtUj7QluJOU9QpiB8ZARU2otuEX/+oJkw==
X-Gm-Gg: ASbGncvnGVf0w1Ai7jPnCxNIClPzV3v4gVSMzRACdphYJuw4B4mW2rsU+zDBx2Elx4i
	E2Izv3+xbIYMOWnOVN558JKvIlzTHa6AEKkeSQgKcWsR0Dlkv9O3CTaODnCwFdcqeiGhs9xKqBq
	Pl47EpBNlFe/6aLcI7lWS5qf1hVojXm0j5gByV59fkAQUoHZ9sLciitGLnDi0oc7UiO6czSsDQW
	XB7j0tTFuStDe/lfdQMPhczhVKPotkzA1KOwSWMepk5tcNgYoBThTlF2rAQ4z+tdHc7bY/mT7fw
	vI1+OymRMsJPyJkty/OXtgQVzkUA1lOiF2evcWi7M3k8x+ve+6zdeM2BYFLqpp0PvnwYFlEzIoU
	xrriXksxxg46V81Ne9A==
X-Received: by 2002:ac8:5a8a:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4b0bebf823bmr63470021cf.2.1754912426061;
        Mon, 11 Aug 2025 04:40:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIIAf6uSUuU4xC43V1tuCSDMHeT1D1YgDQ6raFA0BynMKaAicqiW+cWh3QOPFeReGv9rWEcg==
X-Received: by 2002:ac8:5a8a:0:b0:48a:80e5:72be with SMTP id d75a77b69052e-4b0bebf823bmr63469761cf.2.1754912425547;
        Mon, 11 Aug 2025 04:40:25 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f00252sm18323144a12.8.2025.08.11.04.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:40:24 -0700 (PDT)
Message-ID: <d7058c31-8591-4e7b-9580-218888c13738@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:40:23 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 vibrator support
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
References: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
 <20250811-aw86927-v2-3-64be8f3da560@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250811-aw86927-v2-3-64be8f3da560@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX7F/r8nS4/8Om
 a7U7GKPbClm+hX/TQkBMJF/wlNUjaqx2aOywfd/QGeWetNiypHgWzmr1pIme3FTFUZmnKiiqbY4
 I90YK1QU5Iawbk8WuWjJ0Rviuztigb3qYOBM67re9R9IBOXboRfbjScg8XnZxW3hBbqYCbGHD+D
 HR1w/GxPzt7SKJ9YoS5X6XFpaoej8z0L2q/MhsrMyHaE7a8M8iDuhmUt31NKs5nFsVyK4QZ6E1X
 3PSpyvdafiv4dOG6BuFC6AVkgmpxixJck8zozx+XIE7/l3SN9JW5+AH7kK7oz2cuFkbPU3yRdBv
 qTykeBjq6nZImDfJKN6nuNhRYa+bME46CB/pWyhCnCghEphlcoiZAHHrxS1Dbbgc1vtB4juFxwj
 hRCK3B/M
X-Proofpoint-GUID: f-J0hyoE8BeXQOHEcfPQmwliqwvBqP-R
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=6899d6ab cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=wGZfWhOSCpwZsoq7SDQA:9 a=QEXdDO2ut3YA:10 a=a0DIy2mVpJAA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: f-J0hyoE8BeXQOHEcfPQmwliqwvBqP-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

On 8/11/25 1:12 PM, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86927).
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---

I'll hit enter harder this time! ;)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

