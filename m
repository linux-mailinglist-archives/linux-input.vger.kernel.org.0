Return-Path: <linux-input+bounces-4192-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3688FFB40
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 07:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F0E281DA2
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 05:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4EA418EBF;
	Fri,  7 Jun 2024 05:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IlY3FdFt"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC1F33EE;
	Fri,  7 Jun 2024 05:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717737178; cv=none; b=NpoQXKAj64IsxIGrT/6mnwi1DhlsxfO4UsrjejOxJpzzJyc0D5Tilu4w0QwlSMYfRhKPAkKBaF7+QTETxBU8XBR9LFXsQsk5mUWZihrDOSBGX9UQJ9NxuNp6/8Zo1sE9UobTOyrgrYXVV+yqt8DOVyyOM2+k8VEa9onE24TaWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717737178; c=relaxed/simple;
	bh=RkotelhWjTD2k2lsgxVcHTqdGY836x20N5IvObQvdEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=hpfLcefD4q75HBYtjky2Jw26/LAHz/hlAsqhz2KMxs5BlzfXaygQSvqkfW585hIAVIopVSHw8n5SQdT3ugJjJaf0cuXs60bwrdED55iBWs/3q0w7s6vt0GSYiNrKPyJi2V0zvddO6zgnxhnWo0DyKYzD2E73DgsIaKC53vzrV2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IlY3FdFt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 456MDmV4010577;
	Fri, 7 Jun 2024 05:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfjvvW3xmrzZdZyB9B+jdVwpmtCN2vmJZx/p+yFKNEU=; b=IlY3FdFteKZhyP1b
	vfFg0TY9jy0hwyWoKf+k4AlcPRZ0utxYL7Dw/kqk5bD16x8q0Cu138yDB5isT9uz
	J5eQaPY1oGE+KA17msAFQmslspiezorCIKN97Rowm6VxJ2pz5Ef4BSinExV+AaRc
	aXQqDopBl6BbKcdV1zopjGF8Efa58WMXDF/FHUVuo+yBN3ookrCReUK4NdOOViUj
	enGVdri1stbjIA0BVPSQLOo2PbOzr8HhZIrjkxNebuQVPKFonCIybRd1n+XrZ5AQ
	LbPFX2ZdKdDNzxMNdDDmO83oyYn7QpI2Wd+zqKBeqnuL9m0FI8YUW26k3/an0Wrz
	fKzILg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjh3tw8rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 05:12:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4575Cpjt028358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 05:12:51 GMT
Received: from [10.48.242.185] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Jun 2024
 22:12:51 -0700
Message-ID: <c777aad9-3b0a-43d3-9e6b-1e1807df61a8@quicinc.com>
Date: Thu, 6 Jun 2024 22:12:50 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240606-md-drivers-hid-v1-1-d6a5120b94cb@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240606-md-drivers-hid-v1-1-d6a5120b94cb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DzToce_MFXPLrL-Ro0Ysk3tpcAHOVoaC
X-Proofpoint-ORIG-GUID: DzToce_MFXPLrL-Ro0Ysk3tpcAHOVoaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=798
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406070035

On 6/6/2024 10:09 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-winwing.o
> 
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/hid/hid-holtek-mouse.c | 1 +
>  drivers/hid/hid-ite.c          | 1 +
>  drivers/hid/hid-kensington.c   | 1 +
>  drivers/hid/hid-keytouch.c     | 1 +
>  drivers/hid/hid-kye.c          | 1 +
>  drivers/hid/hid-lcpower.c      | 1 +
>  drivers/hid/hid-lenovo.c       | 1 +
>  drivers/hid/hid-winwing.c      | 1 +
>  8 files changed, 8 insertions(+)

please ignore this patch -- this is a duplicate


