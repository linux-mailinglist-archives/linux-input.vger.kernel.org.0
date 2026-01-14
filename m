Return-Path: <linux-input+bounces-17094-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB1DD1EF3A
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 14:04:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AEE033004502
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 13:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EFE37C0FA;
	Wed, 14 Jan 2026 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GucrZAKY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ahgv7t0u"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA4F4233721
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768395731; cv=none; b=ZmrbMDF9mh6EQraLsckmBRevyE0Davk5EDMTPoRMYzg4oDQG08MXqTyhbwYFbYjdOZTHuPgYnzEYh1h4AJI+iP09INlU2TqcvOAEJLDY70hx094Y0vtMrEg2w2YH96/+3iDPo6tKVzz7y1KB2f4eaNnh/xpwT2SL2U1SsET1fEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768395731; c=relaxed/simple;
	bh=sD9lD5wb4oL54obmEZfcsV72oWhEv7t1KvFAr0Lh+I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qq1dL314SrvqrwZ84kboAwmGqNKXWjU38ukhly2BE1AygCNN/BT21p4fOABDU/qinvUHt4FO/pilApePswRQmn+ejuVxnAPgdXxFOAUOMF3B3pj5dy3f3sfTuTnHdfJdGNPhntzZQqqMe+6dkUJ9CCtvvSjqhlDkb7XlIwdI6nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GucrZAKY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ahgv7t0u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ECrqEq2736174
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 13:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7AVkdAwzTz15AVGc6zGzqmSVEPx7IpTdFQTllaA8Exc=; b=GucrZAKY+oSiaDfn
	f/ihbNSu476xRKUei314nWlb7mJlzMi9jMnRryjguOFOyTN+ZC4GUjU3lfwaZlSP
	xLh2JnVrJI1rPGA6xmJXP5GF5Gyw3N0mXQMH+hDmM4o7CZh6AyqrwoiezpQPZLCl
	MV7DIj70gKgrzzjO7nKwhRJ38GlpxZJa8SnOp0m3oQai1C2y0K1NoXMyMlexDt7B
	O44ud8ZbWeUYHpt5kLoKfobjkSN59cg37qzZtsLPDJYL9PQa/7lwphvmnFmWuqaQ
	OCl4bwzwLbXjXy7Vq36lY72JiMkbXI5uGHopUhaPCT6THxHJrHYV1F/Y/+/PVRnL
	AJ5/Kg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5g0rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 13:02:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56345323f29so1017640e0c.0
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 05:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768395729; x=1769000529; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7AVkdAwzTz15AVGc6zGzqmSVEPx7IpTdFQTllaA8Exc=;
        b=Ahgv7t0utTCGqX3//hijZohVVLyMDZCN/nSKzilXHSQuUPXV73E3lXzCztGc5VQLIZ
         bnuFWHnpeNFSQqMmlVoE0yv8bYIOdiBdKmV0lj+jdumCr7pdiyxJH3Dd1mnyqSuEVFgG
         2fygiau7WtKuI+aexJPLbNwjNATgbt9DSLTIg4XBtlUNP75pHAIlEBWfigF5cntZxYV9
         KyrRcYpDn9/7rvJqkBeZhXVD5E350xYytfe7Jmkho5w+Z1MKx9PrIpFayj63DDUK5DkO
         97arMcqKeaq1a9g72unszDS9owmpAjqDnDxvmnMtiGJ+Gjx2cGyadeO2sQGeVsE0OMId
         td8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395729; x=1769000529;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7AVkdAwzTz15AVGc6zGzqmSVEPx7IpTdFQTllaA8Exc=;
        b=XzjFORQ2VjhqKDX0cblZeDDgnfxBSN4bSFd0US2wA1TkZK8ahfnCzwoxOlq2T3Lvfd
         2A1eO1jnigWHr6L56ZzUZ3lFaOpuEnh8eZy9pTojE01rmFe1pisCK2i6gmTOdaSmfML5
         6ElbEt6dgXtCq2wpnFfOgC0UI8wi1zcAtcAj9g4QYs7HfRfBUtnradN+IoMnoo1DlKJE
         e9/kBm3unLcnaiZd+HorJqvq6h+RDqDGNh4dAo9vAywyAd14HyAlgQgh7hPesZwYwkKc
         agzsmI7z41rki+NbOIbrBloOFCM8f/eQGbzUd4vO3IrofUYFfS3T8Or3AgYq6ghrXvzw
         ncWA==
X-Forwarded-Encrypted: i=1; AJvYcCVFRTF/mOoihukSHG9tExw6589QFzB3q329PWAMgps1MODiv7qR68fOonaq8ybxD7itHkaT4hTf4mHHFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybSs29tZhDeLMQBU/RvTDfwORbRbBdEb86fsrjalKya54HMKJI
	W9uDF7DIPIS3xCPWZ8U/onhD6LDre6HCUQ/Z7a2x+q4lv81bQNTNSBWQ9LoVBa0HI+NP8DjWZnX
	lB3DcZ9OpRemBC2WHMjbewe0tKYB3pnFZrnfx1IgLPl7kKV51FjvpeEfJ2pkmYUZnjQ==
X-Gm-Gg: AY/fxX4eIdbOdlY/iAevHMUOzIQmxA350PuZAkUGzxAHt+V4STiqmk15rFm+Uf901AC
	2vTCtW8xnOUgBFEd1APjGohgDr8QW2ebIcqmd+mgIIDm95zVFapvAVBOxfVv7Wjlu+lnPF8LZ4w
	M5HNGKP5a4uUpSzh5tS5FVzU2URGSPl0DZPViy1ege2+DzKc3M38T8zmg/D+czWdXySDrLSqqSu
	/jDRm5GG9ns5Xfi+YKz4/UPmAjiKgq6fFjVAaEOHW8a3qdtabtBzItXjd5QmIl8+m5h+8MuqHs8
	wonXGZpbqKt6Kj5bZkcCDmtgKjL/lvU2DhU5tKGZ4Y5+hmIWIbXqMlRF4+Urz0saqg+V5maYILW
	yyhQV06BkkXCXtwiocAUP9ExyURmhpQYQjqPq/VWk3cJ6Y4yFzYt24hhKYzSPi3frBI5nRr5l1J
	hr4PKT85rvkCyS7kbUa9VabXU=
X-Received: by 2002:a05:6122:3c84:b0:563:5b70:3707 with SMTP id 71dfb90a1353d-56395c89911mr2454753e0c.9.1768395727486;
        Wed, 14 Jan 2026 05:02:07 -0800 (PST)
X-Received: by 2002:a05:6122:3c84:b0:563:5b70:3707 with SMTP id 71dfb90a1353d-56395c89911mr2454683e0c.9.1768395726881;
        Wed, 14 Jan 2026 05:02:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ba101bcb3sm676215e87.21.2026.01.14.05.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:02:05 -0800 (PST)
Date: Wed, 14 Jan 2026 15:02:03 +0200
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
        linux-arm-msm@vger.kernel.org,
        Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>
Subject: Re: [PATCH v2 2/3] drivers: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <bqlwe7fx4kzj3eie6hmffxbr3zqezxsdbnswg3i5bpnz22pf4e@n6ogchhf7cdv>
References: <20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com>
 <20260114-touchscreen-patches-v2-2-4215f94c8aba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114-touchscreen-patches-v2-2-4215f94c8aba@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEwNyBTYWx0ZWRfXxXBj/Ex2yQSV
 XMIKho4D4NBv1vRg4OtYAa1LjAH+EK53qIN0Utody/2hqX/P7fdFCsNj5KvBO6zqc5/fNVzMous
 T2BOmmEHNPRd+vBTHsEcSPvEv9f1pkX5+8Axf0FkZiZoPgqMRK+7MBIpxrSZZ5kF66fOyJRnmip
 2/FPDqKkJCUrErn/iz36WbMe3drlb3+P36f2vcC1ps+mA8KDqJ7O9RMHqLU3kIWmBoGIwP4yXSf
 AM4utnRBIAkdi1RbDVIMF8k4lMQhrBo6RVPeopfgUZPe2GF+8pqkblBAxJByNXxuJ248M0Rc7rK
 Lefcmt/yBVgFa9fA3dlPiHH1wi8Ggd8SxixJDFFJskzWZOvnFdRz13WxmoEzEWTyzHmE2UeJWCh
 lIfz5ViuK7ihz+GsuZB4ljG+cCDVU3XdLCIcNHwvbgbmu6OzXTBFa5Y8NnOa8qt8IwFLiIn/SbT
 V80oirxW+Bi2qKz6Hkw==
X-Proofpoint-ORIG-GUID: x7l4j1vQWbVccqoJ7FqNHG7dJJxqF9Fw
X-Proofpoint-GUID: x7l4j1vQWbVccqoJ7FqNHG7dJJxqF9Fw
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=696793d1 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=ECEyCYeL1hbWFqLZ0VkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140107

On Wed, Jan 14, 2026 at 11:31:07AM +0200, Yedaya Katsman via B4 Relay wrote:
> From: Yedaya Katsman <yedaya.ka@gmail.com>
> 
> The driver also works with FT3518, which supports up to 10 touch points.
>  Add compatible data for it.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  drivers/input/touchscreen/edt-ft5x06.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

