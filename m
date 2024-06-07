Return-Path: <linux-input+bounces-4202-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0679005A2
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 15:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02B3029120F
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 13:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271E9194C62;
	Fri,  7 Jun 2024 13:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hYqi5qr1"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB031946A9;
	Fri,  7 Jun 2024 13:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717768360; cv=none; b=qyK+N/cVCUTp2Q0bZfL5KYxD0YBhRw81QC74Bc6V0KIhjGLsu/zKn9HFYlJ/xZndNIgFHxhh7bWGgcTo6It13Kuimmc4H3VanphvRyl2BlisGlHflIEbMaxVqNIU0LtCR2ILyMJbsb7DJVoL6mEXySlYM0eitRCCbY9a8Nuy2tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717768360; c=relaxed/simple;
	bh=YdbiWQLFSfZ4aefGBrSfOpGfYhdSOQbMyq5GE+HoCbM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=UiYmjpNNKLHYZdrdX3Xo5eIeien2fvNpu9OSHh0n1L5bLWDJxyf4Ya7NRe3NtF/y2iVI9b+hH11q3/VzUCG2ptHQCcmeiQa/X5E+3N09i9sryN4pj+tnj1vKMP6PycpSMzpaeUnH7T25dFHmJOyVEK0t5rtCrV9fgpWeLpWsyoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hYqi5qr1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457Bl6qT032112;
	Fri, 7 Jun 2024 13:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8kYjMNDIxkguLCClYGmhHljB0VMgZSPFP4RO5gTBld8=; b=hYqi5qr18XKB/wWG
	NFvc2BXe/wststjmSnRlB0RPbhvSAqtF2CP32BrNOXyfeIITV4hHNltVqtwQrAst
	TrcsSW02lXzE2Bn7WQ9PaeCl/vzpdRPzeQLvkE12dnCF/cwCsCRkMxDfszevuA4W
	JWuLS+vXokUHC8YgU2lFtaR0MfIErlK1z3R4UFMmJzOQgeHaf0Ye5DiKCV9t1UgO
	mR8PcI7T6OfUCKOfUVrdJXktWfDzIKMIcgvVS3exhCX8og9c/lgzyo8TF7GZt5G4
	ZKL/VTk30L3BQOu6Tb3r+zQLsT9wTOg97a3sLkwsKx6D8dDfMX/Y4Vs6Mct0DmZt
	b7QdwA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjk89emd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 13:52:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457DqXQ1020793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 13:52:33 GMT
Received: from [10.48.242.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 06:52:32 -0700
Message-ID: <50c97718-b304-4eb5-9bb0-53ff32ccf185@quicinc.com>
Date: Fri, 7 Jun 2024 06:52:32 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240606-md-drivers-hid-v1-1-d6a5120b94cb@quicinc.com>
 <c777aad9-3b0a-43d3-9e6b-1e1807df61a8@quicinc.com>
In-Reply-To: <c777aad9-3b0a-43d3-9e6b-1e1807df61a8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Hu2AWRbB0Of7gW69UmBGkCAgAwy-dpXF
X-Proofpoint-ORIG-GUID: Hu2AWRbB0Of7gW69UmBGkCAgAwy-dpXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_07,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 mlxlogscore=965 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406070100

On 6/6/2024 10:12 PM, Jeff Johnson wrote:
> On 6/6/2024 10:09 PM, Jeff Johnson wrote:
>> make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o
>>
>> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>  drivers/hid/hid-holtek-mouse.c | 1 +
>>  drivers/hid/hid-ite.c          | 1 +
>>  drivers/hid/hid-kensington.c   | 1 +
>>  drivers/hid/hid-keytouch.c     | 1 +
>>  drivers/hid/hid-kye.c          | 1 +
>>  drivers/hid/hid-lcpower.c      | 1 +
>>  drivers/hid/hid-lenovo.c       | 1 +
>>  drivers/hid/hid-winwing.c      | 1 +
>>  8 files changed, 8 insertions(+)
> 
> please ignore this patch -- this is a duplicate
> 
Well, according to my spreadsheet these were duplicates since they were
supposed to have been in:
https://lore.kernel.org/all/20240604-md-hid-misc-v1-1-4f9560796f3c@quicinc.com/

But I somehow forgot to add them to that patch, so this is a valid patch after
all.  Please pick it up.

/jeff

