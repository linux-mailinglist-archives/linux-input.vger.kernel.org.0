Return-Path: <linux-input+bounces-8177-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484219D43CE
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 23:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7921B224CF
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 22:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504A61BC9F7;
	Wed, 20 Nov 2024 22:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VBk01SS+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A51033998;
	Wed, 20 Nov 2024 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732140672; cv=none; b=fCPdOp1SscCgTGGP916l7v9wp/DoAY4b85YCpxH+aVke46KSXOJpYmRRnfgDAAf7DV4U77VRHWzUaSO7MDmZ8CkKgt6G31GS0ipq4NXXjigppbKMdk0aHcmlvPgObMtS4OmZpPjQiJJw6Z+ZLbbQNpieANHP7Rrsoj9bqPZp/Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732140672; c=relaxed/simple;
	bh=L5tP8KlSGwbEMKtPo0BIQ19ibNImt9zTesZ+r2Jqpkw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GuL0nd28sdR3q27OCx3Cpjean5meaYPATbarrttGgpzadyNy+4551xvpDpZgsx7JUj9Vs7M3mL2iFp1fEkLarfRykus+cGkQzdrKdFVw686xFSu/yUqt50knWpADYi9kKgpkcPigsgk54uLNg1feAm0wyx0fnQu4ZFS8geBQQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VBk01SS+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKK4oaU007627;
	Wed, 20 Nov 2024 22:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UQu7P2JYDEqUsF2aSxycP2rjhSh+gLySilOD0KF9FX8=; b=VBk01SS+ZmRV36Wv
	ymHBeTwhghONm9LSpX1A47aZ7dU4uw0bhu31uO5uXctQ2U1eAwLe2BbknP2lOBKq
	MISW4HAQhyw8RyHMiEuTS5eueoy3xADurSQTLE7Y4qQGK6BsMj+Re3shqhEqVoqt
	LJFPj9yF2iBHIV6Mm2qPjHwVgbrLjRQklBGJaG0qTOCJpFSNLAYxKANPBTtB44cn
	rts99amScaNlJm7Eo+EIL4Ayxy1/hp6ddUwGxkIkq9FC0in43jsPmmzb/ejKibgT
	E2W3FExfhwN8DK6YCbRCI7N7vQlC1/65m30TJXX3JXu+xIHLTb8NsaDY0ngkSkiB
	PT9B+g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvjgvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 22:10:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKMAaxt018284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 22:10:36 GMT
Received: from [10.110.30.192] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 14:10:35 -0800
Message-ID: <cd2dca5b-af57-43c7-b960-3908e1501f44@quicinc.com>
Date: Wed, 20 Nov 2024 14:10:35 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 26/30] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Takashi Iwai <tiwai@suse.de>
CC: <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <krzk+dt@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-27-quic_wcheng@quicinc.com>
 <87a5du3xu1.wl-tiwai@suse.de>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <87a5du3xu1.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -QF0dtBBuWLRgt7o-foW6ycNAeDLIeYV
X-Proofpoint-GUID: -QF0dtBBuWLRgt7o-foW6ycNAeDLIeYV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=737 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200157

Hi Takashi,

On 11/20/2024 4:15 AM, Takashi Iwai wrote:
> On Wed, 06 Nov 2024 20:34:09 +0100,
> Wesley Cheng wrote:
>> +config SND_USB_AUDIO_QMI
>> +	tristate "Qualcomm Audio Offload driver"
>> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SEC_INTR && SND_SOC_USB
>> +	select SND_PCM
> This select is superfluous as it already depends on
> CONFIG_SND_USB_AUDIO that does select it.
ACK.
>> diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
>> new file mode 100644
>> index 000000000000..a81c9b28d484
>> --- /dev/null
>> +++ b/sound/usb/qcom/Makefile
>> @@ -0,0 +1,2 @@
>> +snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> Use snd-usb-audio-qmi-y instead of *-objs.
>
Will change this.

Thanks

Wesley Cheng


