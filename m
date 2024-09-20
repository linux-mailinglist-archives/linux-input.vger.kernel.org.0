Return-Path: <linux-input+bounces-6628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B08D97DAE9
	for <lists+linux-input@lfdr.de>; Sat, 21 Sep 2024 01:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7091C22646
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2024 23:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98ED18DF66;
	Fri, 20 Sep 2024 23:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oJUhsjfE"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7FA5D915;
	Fri, 20 Sep 2024 23:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726876228; cv=none; b=sesN2RUx03i+iJAIcQRTj3Taaxpsgj/+5EY0GoEAEF2I+XQoIsxQXD/ZFdXrtIBa/G9ocKmD6AlL3ogZQlUgfiIA3mXSSGGXBG5tsYHPLu1f+D2BqIQkNcxA7JG/34A6uC8hoAuYmi1i7xEuZece+iz0zwXtD1j5ReelO9JdLPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726876228; c=relaxed/simple;
	bh=ipjxMYTJoUHV3BA3NQmOYPF7baYuN9ZnKpWZo3rOiu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=k5hJOOKoIEd89oIChSlAG6W+ipKsRoKQUhbb1RfNtHMnn9NOLvVMgPrx9V6UCWuwXXapn0rj/b76dr5KkXANlCQvPffKthsacTnzttYwjHfQGrDyk8+tlfFrXD3BY9nyngkW6hhekiSKTmnKnXB6AKqvj0soKh6t17ElK224JDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oJUhsjfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48KKfbDf018634;
	Fri, 20 Sep 2024 23:49:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ipjxMYTJoUHV3BA3NQmOYPF7baYuN9ZnKpWZo3rOiu4=; b=oJUhsjfEtGDyM+Xk
	sT9Exk6FnRk/K6LyxiHaCDBqhVQbTf9oAsbilKHcPnCirdSxQW7Zu1BgW5oSfbOl
	fZi+/Dg5P+46YauPnUtI1ShsqpNNTsKIxnWvPiRVF0Hl3tNcbs/mMeNeVPfGGI5W
	WA71H3X71j6loxOa4Uop19VSgmmhYkd2pjOPqFrgcR+youl3vZYOR085mQ5eaqAp
	MT/5pUUcu/2hkaGobdhEskM14ziOgL75PBULCWpJURYdIszjjkZ1vdUB9UoFMl0Z
	8dq1uAhO9+I14V7FSfXVJ8axATi9KnrF/xg0onTL2vXjzp4MtEVigsfIOxkYHy7d
	ANgOUw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4hftsu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 23:49:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KNnwf2011994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 23:49:58 GMT
Received: from [10.71.112.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Sep
 2024 16:49:57 -0700
Message-ID: <182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
Date: Fri, 20 Sep 2024 16:49:57 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v27 01/32] xhci: add helper to stop endpoint and wait for
 completion
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
CC: <mathias.nyman@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
        <alsa-devel@alsa-project.org>, <bgoswami@quicinc.com>,
        <broonie@kernel.org>, <conor+dt@kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <dmitry.torokhov@gmail.com>,
        <gregkh@linuxfoundation.org>, <krzk+dt@kernel.org>,
        <lgirdwood@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <pierre-louis.bossart@linux.intel.com>,
        <robh@kernel.org>, <srinivas.kandagatla@linaro.org>, <tiwai@suse.com>
References: <20240913103237.2f5dc796@foxbook>
 <a9dcaa5a-4f5d-451a-93aa-7457798fc243@quicinc.com>
 <20240915095514.6b01fefb@foxbook>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240915095514.6b01fefb@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iytzgxK0RhtlpMsGzW7stpvgCpcQAXKb
X-Proofpoint-ORIG-GUID: iytzgxK0RhtlpMsGzW7stpvgCpcQAXKb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200174

Hi Michal,

On 9/15/2024 12:55 AM, Michał Pecio wrote:
> Hi,
>
>> Maybe the last sentence is not needed.  When we are using the
>> secondary interrupters, at least in the offload use case that I've
>> verified with, the XHCI is completely unaware of what TDs have been
>> queued, etc...  So technically, even if we did call the default
>> handler (ie xhci_handle_cmd_stop_ep), most of the routines to
>> invalidate TDs are going to be no-ops.
> Yes, the cancellation machinery will return immediately if there are
> no TDs queued by xhci_hcd itself.
>
> But xhci_handle_cmd_stop_ep() does a few more things for you - it
> checks if the command has actually succeeded, clears any halt condition
> which may be preventing stopping the endpoint, and it sometimes retries
> the command (only on "bad" chips, AFAIK).
>
> This new code does none of the above, so in the general case it can't
> even guarantee that the endpoint is stopped when it returns zero. This
> should ideally be documented in some way, or fixed, before somebody is
> tempted to call it with unrealistically high expectations ;)
>
> As far as I see, it only works for you because isochronous never halts
> and Qualcomm HW is (hopefully) free of those stop-after-restart bugs.
> There will be problems if the SB tries to use any other endpoint type.

So what I ended up doing was to split off the context error handling into a separate helper API, which can be also called for the sync ep stop API.  From there, based on say....the helper re queuing the stop EP command, it would return a specific value to signify that it has done so.  The sync based API will then re-wait for the completion of the subsequent stop endpoint command that was queued.  In all other context error cases, it'd return the error to the caller, and its up to them to handle it accordingly.

Thanks

Wesley Cheng


