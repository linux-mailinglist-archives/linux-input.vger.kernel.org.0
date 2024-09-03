Return-Path: <linux-input+bounces-6112-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C09996AA77
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 23:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54045282964
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 21:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0121922C7;
	Tue,  3 Sep 2024 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EuvPBfsF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565551EC013;
	Tue,  3 Sep 2024 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399735; cv=none; b=IivTvX59vAqG0QuLd1+7TuDKOInRgyWeURscSOmjKsm7B6cDlKCs6MGu9/MxaSBVVkFNB3k2/5aNihRYjUjkHZCKXnW+CHUnfONx1jjDv0Y1m/C3CQfjXamw/nv68BQcsGSIrqzZU+PpBBsYh3/zlqQTxCPYjNcKDiPEyzVotUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399735; c=relaxed/simple;
	bh=uoNkzLOA4+bEXXauGFDuvi535BjiyR9hC+LwDmtgCi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=lksBI3+TzLExD2JcnuCMHgzE+YFJcZpl89qLN7oM2KPFkzy35EbXZxwpZccTLIS2MaNwKQxPm1PNwQoTPlE0cagqh7veV20GQIrzArI2wK4UQ5AqmlHXbGcR+ZMiWPy+7lvKtmtTRAoZbOqWRsZ+ibLhksDZC6jR4qtY5l54QGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EuvPBfsF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483K9d8N001873;
	Tue, 3 Sep 2024 21:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4kb4yVx+3sH1ZmXJNcJnqmzTK7YhWN2/t9HdImh6b0=; b=EuvPBfsFHXRwOXwL
	qOi16J/OHKzUTy/gG+tMz4HUXwHK2KaaGSH/Pokkl9Mqe+XSWTnMknoPGnU4CSP2
	dmlpbGjhY2gxbIDzBwk8yIx1k/8X9D6L6t00YqQ4UzP2JC3Ee2R7TqflVnO5whHR
	6xBRAzu4tuQgGS/P008pSf6KcsP/6CUY2MwrmRkH9qeSRcNh9Cr0dA03LfeB1/wp
	fcowbu0YUSQKz/eUq1P708Z2jmkr8/6WkUPNBQ0/VXdtZMbDNJDaYjoN5Jfu3gOL
	oQE5DBRAyK18qfhGPMZG5VQNdEqwMAM93YcjXf743I6I5o0vzGdu+oT7+ecJ+oYW
	p6P9Mg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy226se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 21:41:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483LfspF010185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 21:41:54 GMT
Received: from [10.71.114.155] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 3 Sep 2024
 14:41:53 -0700
Message-ID: <abc9713f-3230-4a5d-98fd-f1cb293bc26a@quicinc.com>
Date: Tue, 3 Sep 2024 14:41:53 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 22/33] ASoC: qcom: qdsp6: Add headphone jack for
 offload connection status
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
 <20240829194105.1504814-23-quic_wcheng@quicinc.com>
 <39e1e90e-116c-4f13-b223-84e6991c8a32@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <39e1e90e-116c-4f13-b223-84e6991c8a32@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GItmiVfHicGlp-DsAfCqnyYQEbqHxlPh
X-Proofpoint-ORIG-GUID: GItmiVfHicGlp-DsAfCqnyYQEbqHxlPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_09,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=837 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409030174

Hi Pierre,

On 8/30/2024 2:27 AM, Pierre-Louis Bossart wrote:
>
>>  		/* Selects the latest USB headset plugged in for offloading */
>> +		if (data->hs_jack && list_empty(&data->devices))
>> +			snd_jack_report(data->hs_jack->jack, SND_JACK_USB);
>> +
> with the list_empty check, this looks like only the first connected
> headset will be handled, not the last?

Sorry, the comment is misplaced.  It should be meant to explain:

/* Selects the latest USB headset plugged in for offloading */
list_add_tail(&sdev->list, &data->devices);

The above IF check is to say that we'll only notify the USB jack if there is an available USB audio device (capable of offloading) connected.  I guess it might make sense to notify the snd jack on every USB audio device connection.  Currently, it will notify on the first device identified (present) and the last device removed (not present).

Thanks

Wesley Cheng

>>  		list_add_tail(&sdev->list, &data->devices);
>>  	} else {
>>  		list_del(&sdev->list);
>> +
>> +		if (data->hs_jack && list_empty(&data->devices))
>> +			snd_jack_report(data->hs_jack->jack, 0);
>>  	}
>>  	mutex_unlock(&data->mutex);
>>  
>>  	return 0;
>>  }

