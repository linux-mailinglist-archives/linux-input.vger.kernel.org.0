Return-Path: <linux-input+bounces-17065-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B20D1B0BE
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 20:28:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 618CF3029EA5
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 19:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7A336C0D9;
	Tue, 13 Jan 2026 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXCh/ax4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H6pYtIhu"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF8335EDD1
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 19:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768332514; cv=none; b=sz7DQV8z3bAIlTHvbGhg07ozY2zIcLx+NK64vwG6eh/3/4DEOT4g25YSqUUs9MBzUKAneybISOoVF1GcL4r11H9ogOYkGm1kmglkoGKrtVDQ+TMRnTiD3FSisYdu6UzW4LoC/UWSZLjfn7o/0hbLZvVHurdUxlx09pevhj8rjG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768332514; c=relaxed/simple;
	bh=LY8dT/L1Ej3Dno7DAOoADrqel59JBPCp2Ms2bZM7la8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=At9c9a99j5uyxehZKt9KNAZLjaeXl+IeQNvnXSG+PzcyHTCIXzl6MRb5Qh85YdzxBEMJjPmJ6dZNQ6Cgd9BATJ5A4WODSK5D/99ikzrxU9kcjHOLhVsOuPTBOFnm0J1ITJUOqGJ8tyi+R2J6hpVXVZJmqAOvCZuSHipc310/LFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXCh/ax4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H6pYtIhu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DH7WDC1120627
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 19:28:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OfKjFtHX6I3K9cKNlKcgeUA6
	KnuB1sEGdEAkmGkuR+g=; b=GXCh/ax47mNvezWB/+J3WQUnUQo/MjNqM1i3UwI9
	dtr0QX0UKie3aRN0OuloHoTch0+HQPcTCBvGlbOsw3QW6ky/BervRxScNzyI6liI
	Cxg5pAB6wkZDIoKa+lGlZ89SxwxjQkmJCY5U7JN/6GRsfa8siMSk3rk/kZSy0GA7
	ebzFvlKcNlfBrk3RxE+BI4nY+AQkMYjg0Rvew1Jlzbn7lvxJbIfneMpT/z5j7lMS
	LohOGsFktdciYYbjfdyA1nR49eY4aOmQDOBVU7uxwKsH4i/kGFv1JwdRAoBukVHc
	P9aRKFJuAUcIhbLLnK3wBlsTLtkmLFkj1gIt8CKaCjcuFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnt63rg5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 19:28:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so2180165485a.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 11:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768332512; x=1768937312; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfKjFtHX6I3K9cKNlKcgeUA6KnuB1sEGdEAkmGkuR+g=;
        b=H6pYtIhugN7sJ4tc7ut6NKe71S/yaIaO7pr1spezrD2SAdcL/C8KoJIO3i1BjW4yQV
         VAZgtIruIkpEPwuEM8kaIFPlYX8EPBMCffwBhbLE+cJCNWMitlbXYkyut6Gju26efYyV
         Omy1iYwtmJYEekhwIAFzlkfZJpnfRx9EOw5RubKxT1flhdQY6LeaRCZqQpGrKuZMxSa8
         OIqCCNM4d4AXfVJrL2l6nyb/tUF0znapZU5MvCXjNJW+fCaa/A5hdwb48wi01ItxT46c
         Mi27FNJdNxID0vMYv6zQqS4E4gNKPjnfkvlWmw2GwXtF0hQVoEZqw9PT/4wU2UG3Srd4
         z/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768332512; x=1768937312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OfKjFtHX6I3K9cKNlKcgeUA6KnuB1sEGdEAkmGkuR+g=;
        b=t0bZpxP7EbH0jMHdgsSZrWUyr1e42xCjYSlvm7r2+Xg+QDKwjg11ApTdIjD6q/UUk+
         NKuBbOKivC+0KTVCCGkcKcZ6eZD6V6nMTcTubNIU/UsEkwmBMDLQ45yGEz4y3W0Yyxxp
         hSYeaCB3528TMQv8rnaZOHJ0i2PM6vXXcMbUoaNS8Eyl2dzVKx26a4ylBRvm8sPdJFDA
         8huO+Wyzih6E0XH9ZuLFHtHeSoibq816+/OXvMpZVVMpURJy/mb3SH5jg2lgM26kRU9o
         NAT1XqEdBJltiMbzzLo2E4K1tCGMzQlhgJ1df+yfQhT9KVP2XvM68mfRMmcDkyS5yVdx
         KzoA==
X-Forwarded-Encrypted: i=1; AJvYcCUhD2zaFRGuEC8RHsMLgxvIqnsLA3m3Adfar+/vukeNyYjXFOkFPheqz+tCI+k7BMy/L0HYnNLCCAihlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj57s8Sp3qF2EqP4GzldDCXiZX7+X2YOVOAZCTVaccHkaYa/ll
	LogzUGKfioUOAwWfU52vbfAFutsJbD9lUdSk0zToDa5mQjO9kUw/HTPcFxeNOv2qbYtoDy7XIu6
	u4X7KZOqxZ24DjE8/4aH4X8KB4sIgEt3lWPhmQ56X90nLUbXh5APhsjsES7qMmJgUfw==
X-Gm-Gg: AY/fxX62hrTMxeNOOLWKmNQ6KPAB++LWgYotZ9GJf6RFF4GJPWQDaiSceznGC/nMLU+
	bpnOvhVSgkqPZOK+LIl4QHQ3urEDOy8EH7ZSUcyBDHD3h1bVo72TNrBvMxUV4W3Txg2NEFD62vu
	zzLVFR9CiwFMSGQYAbWcfgpMuoGjcxLKXnROiV0qdPJfYBshswVIGX/v5j4+EGhOvM8PeXmVkax
	2LrO4LdVEZhgmAYfh3lQsi+f6Chv6K3FzqUHAztDfGi4ApwiUyT+ZXJXgZeSDkoFtU2HIhaJq2L
	2sMJ40Y5gxMCBt5lO67pMLvm6kc/AB2A8J30u9uEFm9qUomab9x/ey0KpB1wpv2D7KrRaqpRSKT
	IUXxlDAZttPe63P6uJmDGk1irD9pDvgqETVmOJDiP4z8UhBoaouO4SyqAKO+NnyQxUSkeHDfMAn
	wfr7qvv4WUx11Ml1eYedvyugg=
X-Received: by 2002:a05:620a:489b:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c52fb236e8mr46320385a.14.1768332510379;
        Tue, 13 Jan 2026 11:28:30 -0800 (PST)
X-Received: by 2002:a05:620a:489b:b0:8b2:ea2b:923c with SMTP id af79cd13be357-8c52fb236e8mr46316885a.14.1768332509815;
        Tue, 13 Jan 2026 11:28:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b669418b6sm5769427e87.20.2026.01.13.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 11:28:29 -0800 (PST)
Date: Tue, 13 Jan 2026 21:28:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yedaya.ka@gmail.com
Cc: SzczurekYT <szczurek@szczurek.yt>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <o4eu2db3y3wrxaxtxcbxupdc2tzemqvb4fupwfkjfjqmy5qudd@v4umeav2oib2>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
 <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE2MiBTYWx0ZWRfX7IGFiPkqfSig
 hQullRtkEGuAscdif3YFuwBTxXc5AqJpYEtsMXFbElHKS1J7ARgcFu/xy8P92h3pEhc0io+UMqp
 u6loGD3bHM0zrdXQ+MD/LSLTo1a43t4mrP392tP8zG6F0or5dJsLhDpmCXOU3/36HDEHlsR9Gx1
 IBmtacumDndwbm3h2S3BnEE7XUN26HtX1mgfmQaOGjHFU1QaeAVXtpk0T2U4maqFPrTj4GpMeEz
 sShSVPIz8HHWfKETphxauw7I1a+QH/YVJYPGGChGGy4YEaBLUty770ucL+sHSBGFHfpkWpPC68x
 sa89DaGqrQOKBFAyuFNhXjMVc8EKI2AwPm55F8EJTRiWKSrEuT2WBDeuYLSMmbhDuOL68IR1gQO
 aC3Jr0MEQDgAgUYWyAzx++OadGBSaiSuNr7YfwzFjaTX5RwPODeDMUcKEt/A7XdIo8kyTviSH10
 iSeeNbfLZ9rwKErNw3A==
X-Proofpoint-ORIG-GUID: zwfsLxk5xKP883a_0fNY5gQxlSau_sUS
X-Proofpoint-GUID: zwfsLxk5xKP883a_0fNY5gQxlSau_sUS
X-Authority-Analysis: v=2.4 cv=EujfbCcA c=1 sm=1 tr=0 ts=69669ce0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=ECEyCYeL1hbWFqLZ0VkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130162

On Tue, Jan 13, 2026 at 09:12:36PM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> The driver also works with FT3518, which supports up to 10 touch points.
>  Add compatible data for it.
> 
> Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
> Signed-off-by: SzczurekYT <szczurek@szczurek.yt>

This doesn't look like a name.

> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

-- 
With best wishes
Dmitry

