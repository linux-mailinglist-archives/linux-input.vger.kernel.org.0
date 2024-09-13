Return-Path: <linux-input+bounces-6543-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8045C978B47
	for <lists+linux-input@lfdr.de>; Sat, 14 Sep 2024 00:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43FCB28223D
	for <lists+linux-input@lfdr.de>; Fri, 13 Sep 2024 22:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541071714AA;
	Fri, 13 Sep 2024 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZG6TdZe"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907101465BD;
	Fri, 13 Sep 2024 22:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726265666; cv=none; b=TcRpqRpJ9G1V2gJqrJo03MRdtYHwbOyTBH2SgoxxESKq6+FwDQkVBU4HL5OTYXNR8Ag136KKHJRdA31TeidrktMg3uof2svRrJuA/y2p/SQWsAWarZeiWemokU8qjFnZzE/DAq5nItMQg6vnQHg+20v4AW/JxIEtEY2z6NT404o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726265666; c=relaxed/simple;
	bh=T9DzavKcLabQzYB5iHOUE1B4T8eJcT1KtWWq6NbNHbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PKSJBzGb5jeQ4bEmowRK/q0MeqDcy3N957W+b3ImBu5uPL9tSL3NGD31AZYudaOB5J5RdlnNiTOA/IDdeqpPvnSEsZXSxAlwoBzRnsYJDMncj2u7ExP+h6PF065eHUurliDV0vFgFUB8TzRMQZ9QRcpYDgEh2saLMgHSRmN0xkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZG6TdZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DAslFN003394;
	Fri, 13 Sep 2024 22:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYznQ95DJKtpP23L3CyjW0yB9e5K+e0VQ0yg2e7udL4=; b=fZG6TdZeibjZMWYK
	4Mt/59sDFfv10g+Db8d9cdogdKEVpypoqkZtb7P/n5k9khLdFne5/VJWZTIRGMJ/
	9s3GtW5PrrSJrBsD3XErYs5B6p8FnCksHW3MRrBjtAOI8ltcv4XF9zzf+oqrcYz6
	aIPlvPiJoUntoqtiUkRrqJiCWghTukFk1qjf0gQ9nfNvaE12j1Bemy7kgU/KAXGX
	vbiEYMh/+LJSGlvKq3glDDMn1lOD4AMtaYAOyai4WTG8xv0EP/B8Ot5fPD0sXjem
	ZspgBYRJapjUa022af8m/KZVV38YY57G2LAUvqTWFvLsLik7FVqOoi+Yi3r2dQMF
	CtDwnQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gybq1xjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 22:14:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48DME1BI022104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 22:14:01 GMT
Received: from [10.71.114.155] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 13 Sep
 2024 15:14:01 -0700
Message-ID: <a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
Date: Fri, 13 Sep 2024 15:14:00 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait for
 completion
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
        <mathias.nyman@linux.intel.com>
CC: <Thinh.Nguyen@synopsys.com>, <alsa-devel@alsa-project.org>,
        <bgoswami@quicinc.com>, <broonie@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>, <gregkh@linuxfoundation.org>,
        <krzk+dt@kernel.org>, <lgirdwood@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <mathias.nyman@intel.com>, <perex@perex.cz>,
        <pierre-louis.bossart@linux.intel.com>, <robh@kernel.org>,
        <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <20240913103237.2f5dc796@foxbook>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240913103237.2f5dc796@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ea9Dy7IqYhLusQtkdmuC5WmSVcZRbLXp
X-Proofpoint-GUID: Ea9Dy7IqYhLusQtkdmuC5WmSVcZRbLXp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130157

Hi Michal,

On 9/13/2024 1:32 AM, Michał Pecio wrote:
> Hi,
>
>> Expose xhci_stop_endpoint_sync() which is a synchronous variant of
>> xhci_queue_stop_endpoint().  This is useful for client drivers that are
>> using the secondary interrupters, and need to stop/clean up the current
>> session.  The stop endpoint command handler will also take care of
>> cleaning up the ring.
> I'm not entirely sure what you meant by "cleaning up the ring" (maybe a
> comment would be in order?), but I see nothing being done here after the
> command completes and FYI xhci-ring.c will not run the default handler if
> the command is queued with a completion, like here.
>
> At least that's the case for certain command types and there is probably
> a story behind each of them. I know that xhci_stop_device() queues a
> Stop EP with completion (and also a few without(?)). Maybe it's a bug...

Maybe the last sentence is not needed.  When we are using the secondary interrupters, at least in the offload use case that I've verified with, the XHCI is completely unaware of what TDs have been queued, etc...  So technically, even if we did call the default handler (ie xhci_handle_cmd_stop_ep), most of the routines to invalidate TDs are going to be no-ops.

Thanks

Wesley Cheng


