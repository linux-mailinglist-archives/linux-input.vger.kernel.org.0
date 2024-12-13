Return-Path: <linux-input+bounces-8537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BEC9F0CA0
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 13:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2056C2812CD
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 12:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A2131DFDAF;
	Fri, 13 Dec 2024 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="niipu787"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF171DFD9E
	for <linux-input@vger.kernel.org>; Fri, 13 Dec 2024 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093908; cv=none; b=KvyfaFSI03SRKszmVv9KwZ2LHcOnwugxUwDwNbHvqoU+h52tuT1PXSAX9xzhrjb27Qf6ppNsIA9nFZGCEVsKg1nmXVVGGMsNTXqRpbsDM5CZbUq4z01fCli6XZRV9M737NXtFueIsxMDSl9z3ZCj7C+/PCVhyiq8LiE+vaVR1Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093908; c=relaxed/simple;
	bh=JYpFD2JTyAPHJh0LcGmkihjMxrYJLIJGHzffjuy4Oh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M/vNm6Tf2NSduO9GahAQcca7+G+LRslaHv9U7era50QIEI98hINEboYpppg8raIOzL9Qcw0Sfs59XFHSmnTdkYjX4w5692H3/quBzz7BHYYggjHFcjhrh/6lpHE57gk9QyAMc2Xf848zCzUTyFxwbwcGnXkadj/PmluxEOrMO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=niipu787; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD9p2bB018175
	for <linux-input@vger.kernel.org>; Fri, 13 Dec 2024 12:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+py4yuAWBmdgeW1jPtgIlP3H1NVXLVQsrI1tZ7iOqmo=; b=niipu787Rs0b8dCX
	0NQOz72fcxoh6msFFF4aZASD9R/vn6eKHtZU9OmNgmgH53G/UoLz2BfjNGuHZ5Cq
	PL2c8YOumVhZ31YOCMIxeUsDrEAf+ny/8rf30IatXI/oijdsQT8Nlw7bX6WTTHpc
	z+Kfds7klzn+OSscqid69ObgI4nylWOYkmkSlgTv0SZ6LLJAKzo8uBgqG+VexCOn
	dcWFUvJWBBcCK516Md7HACL/ePoU7Q6u+orZw7YJ8EG7CHSRBUVQTOhq5gUT6gWE
	jo/+dhxCsqRCMrpnnm0gl/7oy2as+TyZ1MWTm0c5LRpClYkudCnkv4LhbaqkU7L+
	/3ygMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gjnb0ge7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Fri, 13 Dec 2024 12:45:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-467975f1b53so4501351cf.3
        for <linux-input@vger.kernel.org>; Fri, 13 Dec 2024 04:45:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734093905; x=1734698705;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+py4yuAWBmdgeW1jPtgIlP3H1NVXLVQsrI1tZ7iOqmo=;
        b=K5iYtjGteRii3UbU7zpy+5jq2icDM/g+HgMQhtBlU11Dfh5rcXhbwZ3ub7sAAJ/A1V
         is4bYo+2+VLdtPvhHcVWRv8p82Mb3UCGuUW9gAUi3A5ULfp3b1MxixGj3fo/IHrt873i
         4Tu1tUCNrR3g2ky0k7ySLCLta5jmpjt53KdrIcKpYvAI4HRr6YtcclvhH1f1RUCf90XT
         asrLW7I0JhzL3LbYkJpsL9PJngD9p05luk19iMn2aas8/XjEK/lOqfUo62ksVqNDkuq3
         V8Mu+J5D4YBQMF3AAVAbAfGLPlBCLaQHUPCkzOfzO7r5R5uvv/d3sez1lXJ5gNB0nQZ8
         W3pw==
X-Forwarded-Encrypted: i=1; AJvYcCWXzzzAKFqTS3eOP6mCDdzM+64RMHHsoieDSfShMcuMoZ1ZnCWewMzjHAHkoDN2TRl7l2+M6r+Wj0J49w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG1aYZ9m01zI47oMIFTt7/ZRUM38UY5iXblTzyaydSsxqsGNT0
	g9exb5qHEvBtlbHSt3X7YvDz0znrOMEriE7XxAEzsou9XNfvnGK/QLXvDBu2kSZ5evYkgA5krxx
	ddsGrkioA0kNxIL9YD3GEn47goVidW6C4UGXe3mCdTtxzRNUEBuiFBSMc70JZeQ==
X-Gm-Gg: ASbGnct3DKQ3uOxrklHKFnB06dKwVid+8QB7RlIwE1lu4sUckCzRXhKUxNIdrhfLlyx
	GvyVhVve/jFZoeYZoyF4faxxfEZIQYZUuMXOWqsVZXcRQi/fXI+wGXgTGn6FVnHUJ2+jkrMvf6a
	Ai+86qXrQFIc+YlmRhLeJrZ6BKw5cvgLF2a2P3XQbVWKD3olE6l8x/RX2eRRXnjozL6iO2kERA0
	QUBkCJpJN+GUFIKMzZijyONqYwDJMDrGdEdlmz3QPXOWibNV5EJvRFFmef1mrvx6jScqv+4S2r7
	Jiirb4mHHbY/HFwi5csjkx3US6C2S035/SsK
X-Received: by 2002:ac8:5dd4:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-467a580084dmr15700751cf.10.1734093904787;
        Fri, 13 Dec 2024 04:45:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWpBo8jDKAUGFcsAt5h3utlrt4X9Lyu++J7Nctz8IrQCa+saJdAY2YnvB6PCnanR2c4n+x3Q==
X-Received: by 2002:ac8:5dd4:0:b0:464:af83:ba34 with SMTP id d75a77b69052e-467a580084dmr15700481cf.10.1734093904269;
        Fri, 13 Dec 2024 04:45:04 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa699487854sm592175166b.13.2024.12.13.04.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:45:03 -0800 (PST)
Message-ID: <3d54859a-0f10-4e67-a05d-be5546a949f0@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 13:45:02 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sdm845-xiaomi-beryllium-common:
 add touchscreen related nodes
To: Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Joel Selvaraj <foss@joelselvaraj.com>
References: <20241208-pocof1-touchscreen-support-v2-0-5a6e7739ef45@joelselvaraj.com>
 <20241208-pocof1-touchscreen-support-v2-2-5a6e7739ef45@joelselvaraj.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241208-pocof1-touchscreen-support-v2-2-5a6e7739ef45@joelselvaraj.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iAf7qNiwThu1Wsm0urNx4BNq8JorKMmh
X-Proofpoint-GUID: iAf7qNiwThu1Wsm0urNx4BNq8JorKMmh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=772 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412130089

On 8.12.2024 4:23 PM, Joel Selvaraj wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
> touchscreen. Also add pinctrl configurations needed for touchscreen.
> These are common for both the tianma and ebbg touchscreen variant.
> In the subsequent patches, we will enable support for the Novatek NT36672a
> touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
> Tianma and EBBG panel variant respectively. This is done in preparation
> for that.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

