Return-Path: <linux-input+bounces-17072-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8277D1BAE1
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 00:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE1E4302D5E7
	for <lists+linux-input@lfdr.de>; Tue, 13 Jan 2026 23:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9C036923C;
	Tue, 13 Jan 2026 23:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UlE5wPS0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8+o4agr"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5E4271471
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 23:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768346385; cv=none; b=gqer02v6bC33GIeRKABqwb7U8GhhVf4M7eXbAaYVzdo+MBOc97vOch+nhsJkWZd0tbuYqyQ5QA9OMhNrmDekv21bXNAK+2zhBrtxUDCQQn02Z9gAUmT/fhHKQM1p4ayvmFBAR6jKKrOrzgAPsA6L6sDUduUCerYYcVAYdFfoXrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768346385; c=relaxed/simple;
	bh=9q9qgttNgcSZ4M2VYUR8G0nYA0yg7Zyr1X0XF5XlyJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKHg3MSZoRSEgJ/WjzNvP0jXovaRZHnZM1o0MRjg6Op1ps17fHKXwch+l5Sg0uFw9FvJPd5i8COJXDQGQSxj3b2jNj7abEhpXFkk6uqBa4h+jZPhjn9WlfU/4zmfwJJmP9Zr/UyHcgU+KR/u5f0Q/qA4fMPCau8VZe/II2d0cb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UlE5wPS0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8+o4agr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60DNHZIL832994
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 23:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GRAPG/2Y5xWBXtn21fCdvmrE5cZd2b+EUZ60zKqPxFY=; b=UlE5wPS0f70Rmc8I
	4ZaYTJDUl34fB7bD+I4BhoKQcx+c4RHb5OqcYVDLgc7//c0oozUTdTIPf15wYvur
	XZNR7rzeWs/zoiq2z2l6oxF2nerr7R1ey+uOEoEG+O/A5+H+oTh/NaiNcrNL5hPQ
	ldVfr4sxFw1GGDZMG8jvArStoH9CVBrT2pb3fbSlGNf3vwJJwmOKJOPMI5FJW2q2
	gLRQWCcdR//t7G+rJGqu4l/HE4UH3Blc9PN1ZGsDLFAnARgPrHajwoKgcoZ6KDYC
	ulzM2RTg5qEiMLVuduKJcsPhxKNO1CSPqhuqkt/5TxB109BHIJNheEujITj61Fty
	jYXGFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnsyb949h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 23:19:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so149561185a.2
        for <linux-input@vger.kernel.org>; Tue, 13 Jan 2026 15:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768346381; x=1768951181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GRAPG/2Y5xWBXtn21fCdvmrE5cZd2b+EUZ60zKqPxFY=;
        b=S8+o4agr9Et6d9kHWMl+4FtycAj0ZUhKRyNHupgpsGeoUcKM0/AbkNgpoDwwGK29G2
         sHRLK1sR4Co1RIE+9IriJMQh7WNSRLOZg+8rtSS/P736iM8UzZb9wKLgkrqf7rJmzIzs
         WBaJaSr1jNotkrEsBAuCHOJ09+kDkXQrOEa+UeYtRv04ysl1UoRIDzamvqfq9MgFBn+x
         vKZcinKZcyfGnqEAsIL+FJEgbty2bes9hgzM6h71EC2VQkE4PuQshpa0rORG1vkdZCGA
         0uQdepRQEV+ipfzhIKc7C0/Am9cJafEOWgRadxIR1ikfqFu9JHkfaxek4w4kb9It+/Y9
         qtew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768346381; x=1768951181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRAPG/2Y5xWBXtn21fCdvmrE5cZd2b+EUZ60zKqPxFY=;
        b=VIg+bpjcYRGo6+VKp7ThvK4Ttg5ntqQ3/8GGtvCaHD7E/OTGHjfBSeTG2h3Him3lYd
         Y8nfcMv1DAYvAZAjYY2U4l2TRrWKsuCAqh/F06E+2r6nuVOvKWBmwDrtWd4vSVjZLfCX
         JemGlKbayuybkcPJfOqd0d7+8CIO1Wo1ocLwKamHW8a6aEJwrI64G3bIferTtizRfE7m
         KOJQz5ed+syT9nck+Z7cb7jhdRsgBMvpfIygkJal5wODZwO2ngdo11aQ/X6bTQGMIJBl
         CG1y9krzYS6rlxZw4XUnaMrtcMx8i6KymWiM0Mlo6/yyWeb9es+tut0xiiBgKmXNs+YO
         rmMw==
X-Forwarded-Encrypted: i=1; AJvYcCVXKhqjpmiF8orW4+VACQ45GGNLcpnGNW8hWChyp6WXZvl4OySihswIBWintCMCnD1rfynaOdzcZiImxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMajviOWpVlGSfbfJhubvivTUANFqg+wPRu9Ij+HI/ie+p5Hf3
	4PldzfoVze3IMspAkTQN9CD/B34lc+tuQMsW3QD6ArcZep2SD0iZzIgosWNMnf9XLeRMskJOthF
	WPTPZGG/sMA4hp9rldDWXaCrRrxDbxpKY60b/+yS8ATwzLJMhDnmzN9UMOt3NBLKK3H+aWZ7I7g
	==
X-Gm-Gg: AY/fxX5aXqsQJd87Lou3esWoQhAl836nDr618bouciVC1WNsVzGX3B35+wbfUXcXmez
	H7tpm3BZc9TKKVgufTfv533n3aGZWejRzuxPv+uWl1i24lJOugiXzkMozLGTLaiJuUTfoubc7rr
	vFbJu+Vwk8salV5Ua3DydP5MRetljsed0reVOI3Yl2S7o3tI5BzPtNUXr4Lfu+BeWO3vexpKBGC
	/svgcu77hHNW92RhP+ccpvRnEK9iy2Rck/a5ywd6T+8RyNVyOeEbGFnJ+2EfoZpQ9FkzGIe4/Uv
	sqtdVwmtgLNz46bhguEmZOThk/FS6fPS9UuGK3nwjlREwOHB6NEbpz0Kv0aluKhqIoCc54A0VyP
	4mO8NApBwz5cNp+u7Go+ubdVCUkIYNHiOUXdRE5IWXNjybf7+/ftUy+2lLMkIu0ak2LHHevU/8y
	Q9M579MMYvEqqhk/6ygydkU68=
X-Received: by 2002:a05:620a:4089:b0:8b2:e284:1bd6 with SMTP id af79cd13be357-8c52fc0cf03mr140249285a.76.1768346381443;
        Tue, 13 Jan 2026 15:19:41 -0800 (PST)
X-Received: by 2002:a05:620a:4089:b0:8b2:e284:1bd6 with SMTP id af79cd13be357-8c52fc0cf03mr140246685a.76.1768346381022;
        Tue, 13 Jan 2026 15:19:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb8e0e29sm48548611fa.35.2026.01.13.15.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 15:19:38 -0800 (PST)
Date: Wed, 14 Jan 2026 01:19:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Szczurek <szczurek@szczurek.yt>
Cc: "yedaya.ka" <yedaya.ka@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <wg6j47rwgca2pyruxlidnidjfb3fkepxngfp5c3xilfs332z2y@s7dpbiq6ft3k>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
 <20260113-touchscreen-patches-v1-2-a10957f32dd8@gmail.com>
 <o4eu2db3y3wrxaxtxcbxupdc2tzemqvb4fupwfkjfjqmy5qudd@v4umeav2oib2>
 <19bb972b9d3.12a7d3da3105717.8521466650832407846@szczurek.yt>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19bb972b9d3.12a7d3da3105717.8521466650832407846@szczurek.yt>
X-Proofpoint-ORIG-GUID: 9gRvgKtTcxh9ChzpG8iYlEdO_sCz_rBp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE4OCBTYWx0ZWRfXxrmccxQRdspm
 9DYiJL5UGiv5MVzg3a+ldrLg2OH7DfcRdZzX3l0LR0rlMOhVS+3f9vKtmmrG24ix+/jDiJTEJIQ
 /w5O4KTPBs6nRo4pqcx/hd02nOEdHQV4i4ZEWAexPDGQwaSwzGOYzgiezZ3RggAC/NIPVEbIar+
 swAZ1JO14DcVKwTuFXv8X3KD1xMlv9L8AgZnN0KOJi/bE0PLrBOzQKdSdmNoeQv8N98XlQlBP3c
 Z25C1s67KbWno7T3NlSUhQUIQefHhT4tGQfDSS7GOdlDAOEDDo/2/PtaD0VqvmJXUHY4DWhEfiL
 REV688Zxiz49BMxPYWe+00OGYB3PXh5u1w/SDBvyhy1hiO1+I6KPd6OpYxRxtdwUuAlZYLoniDZ
 NOEF6i2zdXi/QU48cXybzXg+ju6j6nEjQrREjwnPjPYCkfpLP9RrL90wXN8Rq3wLICQqz0ZWt/U
 OojtdKyAxujYB5vV2GQ==
X-Proofpoint-GUID: 9gRvgKtTcxh9ChzpG8iYlEdO_sCz_rBp
X-Authority-Analysis: v=2.4 cv=IpETsb/g c=1 sm=1 tr=0 ts=6966d30e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8 a=vU_bf3juDL7YJUi8oSkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130188

On Tue, Jan 13, 2026 at 11:21:02PM +0100, Szczurek wrote:
> On Tue, Jan 13, 2026 at 20:28:27 +0100 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> 
> >On Tue, Jan 13, 2026 at 09:12:36PM +0200, Yedaya Katsman via B4 Relay wrote: 
> > From: Yedaya Katsman <yedaya.ka@gmail.com> 
> > 
> > The driver also works with FT3518, which supports up to 10 touch points. 
> >  Add compatible data for it. 
> > 
> > Co-developed-by: SzczurekYT <szczurek@szczurek.yt> 
> > Signed-off-by: SzczurekYT <szczurek@szczurek.yt> 
>  
> >This doesn't look like a name.
> 
> Hello
> Yes, it isn't a real name.
> Yedaya Katsman is upstreaming those patches by me, under my permission,
> and I forgot to tell him my name, so he took it from gitlab, which is just a nickname.
> All of "SzczurekYT <szczurek@szczurek.yt>" should be replaced with "Kamil Gołda <kamil.golda@protonmail.com>",
> this is my name and the e-mail I would like this to be under.
> Excuse me for the chaos.

No worries, thank you for providing necessary information.

>  
> > Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com> 
> > --- 
> >  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++ 
> >  1 file changed, 6 insertions(+) 
> > 
>  
> >-- 
> >With best wishes 
> >Dmitry
> 
> Regards
> Kamil Gołda
> 
> 

-- 
With best wishes
Dmitry

