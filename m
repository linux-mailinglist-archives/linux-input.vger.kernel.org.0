Return-Path: <linux-input+bounces-6658-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A1C984D04
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 23:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BB5F1F242DC
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2024 21:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB98313E043;
	Tue, 24 Sep 2024 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gyb5F3Yu"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACF582488;
	Tue, 24 Sep 2024 21:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727214518; cv=none; b=GCY8APxdG8wuRYMjI7ZhLyAYN0z548hyIeqpCd+96btyXuSXFFgmRTDuQVnGW7FRcSzGebBlsFRej/quCTAshKPc8DuboPW+hDvbzhVPuEH2pZR/SPwqDwBDGqsTaeGA8wxVgw3VrZuOhpPPLJ9YzoNRFU/8SV7oX0QJnFhfTrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727214518; c=relaxed/simple;
	bh=ch1B+nC2XYty/18UmhZn1YTMQF1mkQxUCTtY9tk2Hzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LHnmfE/DYkOan5yoef4UsUuWFS9nNIFAmMUZFA3lHrTRCyrXo+jI4gINsI+BpAT5lkFphw0PwqruJJvQW88gaEaUzPfZmb8tFYtKO/jbxpufAtfaNfXvtAF3NvBuEXEKLGUEa8Tn8XHxE8gGeqQP5DqAQMvR0Th4mfzC1u7XUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gyb5F3Yu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OHWcXS013004;
	Tue, 24 Sep 2024 21:47:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ch1B+nC2XYty/18UmhZn1YTMQF1mkQxUCTtY9tk2Hzs=; b=Gyb5F3YugcXOHjzE
	m5DpE3ezd3wXVDLsSZXbNge3FGmMWXVPXPwHeb9tBmVUZXr5K8d8hJMjLCRs9dM4
	RR42dn8TIZu5NwOZOKEon7CroYMKhx7LvkprC9vdQT5I2NJTgYXexcJUBizRxMBT
	J5AqWbgo8DCL6Zfiic8I5tp9FGB0Ysa9k4Ysp8c7BZMu/EC3RZAnrLn3/4s5pKlO
	aUEqW5Qoawu7ZDqYv2iAaV2A+HSIOpsBHfQaZnG1tTLmzd2ApJaOLwUm3xZ5zgXx
	xMucpwKhtKCrWdTeYoRBpzqBDGC2NgIQfn65ieuliTC7cbJ3681+pT1AgDqHPrV/
	7TI+Hg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41sqakhpa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 21:47:57 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OLluZR006391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 21:47:56 GMT
Received: from [10.110.20.217] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Sep
 2024 14:47:55 -0700
Message-ID: <dec459d3-fa0d-4ed0-ad6b-4a976b0f9e49@quicinc.com>
Date: Tue, 24 Sep 2024 14:47:54 -0700
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
 <182938da-da86-49a4-800a-446954cc6c60@quicinc.com>
 <20240923012328.1e4d0bc6@foxbook>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <20240923012328.1e4d0bc6@foxbook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qiPxEtCjhcoNN42tT5PhLvaywjB-iOC8
X-Proofpoint-GUID: qiPxEtCjhcoNN42tT5PhLvaywjB-iOC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240151

Hi Michal

On 9/22/2024 4:23 PM, Michał Pecio wrote:
> Hi,
>
>> So what I ended up doing was to split off the context error handling
>> into a separate helper API, which can be also called for the sync ep
>> stop API.  From there, based on say....the helper re queuing the stop
>> EP command, it would return a specific value to signify that it has
>> done so.  The sync based API will then re-wait for the completion of
>> the subsequent stop endpoint command that was queued.
> AFAIK retries are only necessary on buggy hardware. I don't see them on
> my controllers except for two old ones, both with the same buggy chip.
>
>>  In all other context error cases, it'd return the error to the caller,
>> and its up to them to handle it accordingly.
> For the record, all existing callers end up ignoring this return value.
>
> Honestly, I don't know if improving this function is worth your effort
> if it's working for you as-is. There are no users except xhci-sideband
> and probably shouldn't be - besides failing to fix stalled endpoints,
> this function also does nothing to prevent automatic restart of the EP
> when new URBs are submitted through xhci_hcd, so it is mainly relevant
> for sideband users who never submit URBs the usual way.
>
> My issue with this function is that it is simply poorly documented what
> it is or isn't expected to achieve (both here and in the calling code
> in xhci-sideband.c), and the changelog message is wrong to suggest that
> the default completion handler will run (unless somewhere there are
> patches to make it happen), making it look like this code can do things
> that it really cannot do. And this is apparently a public, exported API.

Thanks for the clarifications.  Yes, unfortunately, I can't really test any scenarios where this would be exercised in the current path, so I will leave the code out for now, and just add some comments and updates to the commit message.  Can revisit when there is some other users for utilizing secondary interrupters.

Thanks

Wesley Cheng


