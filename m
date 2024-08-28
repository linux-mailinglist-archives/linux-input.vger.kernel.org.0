Return-Path: <linux-input+bounces-5935-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C6696308E
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 20:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B41D2282578
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2024 18:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12F7A1AB51E;
	Wed, 28 Aug 2024 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="O0Xmz5bf"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7071C1A76B2;
	Wed, 28 Aug 2024 18:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724871575; cv=none; b=uqPBi4JLNietbW8rQd6hpl7MGWBFEkILr0QjPsjj7JWPjBwDMg4/Y5qYk00X+WmMyiOSiMzwhXMxsHGVJ8YI6tDT8PW1f2kuBoLOQ4NqL1fOUDMruSnXWZmwdFEPEKXb/m9KKbNfOSb8koOrv/bS+EhS2kW9eDMlq5EqsDvc5G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724871575; c=relaxed/simple;
	bh=2oNMMsYsI+j+ejHVU5D5R1OZsviLXTfVtcjUTwfydlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Jn+L7pLrQxr1p2TO3auViaZxf3bvq4byxodjve8czn7xQ2k1kYMxyMoHSTxT3qDT3DLYLT/cuNeH9at0WJQN+TSB8DGofY1VLn0R7uflNaMmCZ3YS1aIKnH7V4WHQ4yvmjE6R04FExu84/UXZ34017dFT9hCruB4WN+wVhmkCnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=O0Xmz5bf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SAiFvp020336;
	Wed, 28 Aug 2024 18:59:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+bp9nEmFMTVmWQTMXToBGklbro1PYiI6dvNZl24hjw=; b=O0Xmz5bf0/grb8CI
	bmXJR3TuhNpmeW4y21GNl1aEjQWl4aC+Zw12rl2gx9sHLwPb7UzoUi+A1JeaIMLb
	rJ6isSaBm9Rl5FQdWhMYTdDmDF/n1f2uzeX/WySv7ubqzQXaZakKtu+xG28hZAya
	qZubyj/54hHBgPJkUMf5boHQwa++N1WfMKVJzk9DFGVCTbvx8m+uhz0pWzYKXFPc
	CXtqn48VSVLt1A+pBcpA/Gcelit/+bFyltIEJpusDE4/9/tHlGo7c5XfaMWNL2Ze
	CUqHbpZ500s9jmP/u/1KKejrfapEoiLd7x84f/1mkz2Qm9YYtasGJavo6hOse+wN
	uGNWIw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puttu87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 18:59:15 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SIxEYk019455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 18:59:14 GMT
Received: from [10.110.100.101] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 11:59:13 -0700
Message-ID: <d44634b7-1285-4771-b7e0-4e852224d13f@quicinc.com>
Date: Wed, 28 Aug 2024 11:59:13 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 31/33] ALSA: usb-audio: Add USB offload route kcontrol
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
        <corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <tiwai@suse.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
        <bgoswami@quicinc.com>, <robh@kernel.org>,
        <gregkh@linuxfoundation.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <alsa-devel@alsa-project.org>
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-32-quic_wcheng@quicinc.com>
 <4149884a-7c60-40d8-848b-8876f16d6d7f@linux.intel.com>
Content-Language: en-US
From: Wesley Cheng <quic_wcheng@quicinc.com>
In-Reply-To: <4149884a-7c60-40d8-848b-8876f16d6d7f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: X3n_XKtTrJz3EB77-0EvdjKlg6OlyTSW
X-Proofpoint-GUID: X3n_XKtTrJz3EB77-0EvdjKlg6OlyTSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=544 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280138

Hi Pierre,

On 8/26/2024 2:09 AM, Pierre-Louis Bossart wrote:
>
>> +config SND_USB_OFFLOAD_MIXER
>> +	tristate "Qualcomm USB Audio Offload mixer control"
>> +	help
>> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
>> +	 This exposes an USB offload capable kcontrol to signal to
>> +	 applications about which platform sound card can support USB
>> +	 audio offload.  This can potentially be used to fetch further
>> +	 information about the offloading status from the platform sound
>> +	 card.
> I would remove reference to Qualcomm for this Kconfig, all the code
> seems generic to me? Probably a left-over from the previous version.

Ah, yes will remove any vendor stuff.

Thanks

Wesley Cheng


