Return-Path: <linux-input+bounces-6117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC23896ACF8
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 01:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94E0286C4D
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E2791D79AF;
	Tue,  3 Sep 2024 23:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gEK8Vr58"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55F51D7983;
	Tue,  3 Sep 2024 23:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725406890; cv=none; b=gzcBeaIm/BCX4Jsf0HMbIkt/O0Pkh7KMlqsQYWebI6eD+9qpOE70ZsXX9oGMJcZBXGuzZnmlgv3DVZAcKcrYqVDz+PRq2b88HoKeaKWpSjMYE0yXc6AzLYkzkK/AEy0UPEfGYmY9HysWiCBcX5v6ztW3ODpmjwMEYf2wGEGWUhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725406890; c=relaxed/simple;
	bh=eLMorv5ImHjzmX/53xeY71LHYT219pKZ5TOhfbMwm4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vBRywXcgzG4IajJVfNy+DvvBRlp4N9E9lPA9O3dv9jTi2ur5WXcCWasgrByUyLxM1vZ0i3JLppnreMaCYqhsLdxH0MEKinSrbbSazEnqB2OBS3SPxn+HqqZyfOtUKjh+rXg0KirsRFfcV0EWAAtX+c/H4kkperbyWQ5egdWqTN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gEK8Vr58; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LNZ3X020641;
	Tue, 3 Sep 2024 23:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D4m1WSIMEa2HxAAYRfG6VTEh6N8eEtGqZqmhFNeM8To=; b=gEK8Vr58B35gGfVS
	ShZnFo53Ats+CZ9tpiKaLSvyWWXPuLjSYlLT2ys2XU3pXvWg7vCaqa711KhbG23A
	auWVZnQefGrvXTHZTKeB50aeEI6nOfexkgCVFeJ/h1YDkNEXiB/wrI/ZZdWuXzSj
	7r/yLsm+Az5kK8j1+AYH85omnHtPOmFzYm5Ms4fszobXTwaygzH7qO3FAOLhgzPc
	F1SKaq0CwBCLvPTkw4jWCfmUHF89plIcJu2t88FpgL63/cf0uVtWAmqenlK3L1AR
	If8fbDZNf714sqCPXn6qwXSWm2fMJIHTaX/TdW0MXNDlzEZaj7Opst9ytW8LmcUb
	zJ4m3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41buxf8uaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 23:41:11 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483NfBEP010670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 23:41:11 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 16:41:10 -0700
Message-ID: <8a5be3be-7097-4258-a5a4-7ab440823968@quicinc.com>
Date: Tue, 3 Sep 2024 16:41:10 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 28/33] ALSA: usb-audio: qcom: Introduce QC USB SND
 offloading support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-29-quic_wcheng@quicinc.com>
 <e7955dd7-95b1-4999-a2a1-519e8d7297a6@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <e7955dd7-95b1-4999-a2a1-519e8d7297a6@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oziW5Qz2pRWDwRJPq6WwrkL2uGdOS1DB
X-Proofpoint-ORIG-GUID: oziW5Qz2pRWDwRJPq6WwrkL2uGdOS1DB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_11,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxlogscore=968 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030189

Hi Pierre,

On 8/30/2024 2:52 AM, Pierre-Louis Bossart wrote:
>> +/* Stream disable request timeout during USB device disconnect */
>> +#define DEV_RELEASE_WAIT_TIMEOUT 10000 /* in ms */
> 10s really? That seems rather large for a stream disable timeout...

Hmm, yes that is overkill, will adjust it accordingly.


>> +static struct snd_usb_platform_ops offload_ops = {
>> +	.connect_cb = qc_usb_audio_offload_probe,
>> +	.disconnect_cb = qc_usb_audio_offload_disconnect,
>> +	.suspend_cb = qc_usb_audio_offload_suspend,
>> +};
> You probably want to explain why there's no .resume_cb?
>
> The comments mention also that the suspend_cb has to stop playback, but
> then who resumes playback :-)
>
I can add a comment.  Ideally, the suspend_cb is only used for the case of PM suspend/system suspend.  If usb autosuspend is enabled, then the QC offload driver will handle the voting based on the audio stream being active or not.  Is there a use case where the ASoC layer re-opens any previously active audio streams so that userspace doesn't have to?  Currently, I was under the assumption that the audio stream would have to be re-opened by the application.

Thanks

Wesley Cheng


