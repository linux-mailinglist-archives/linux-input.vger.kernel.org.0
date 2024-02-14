Return-Path: <linux-input+bounces-1897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D3E85471B
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 11:26:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8551F21463
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 10:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7713318045;
	Wed, 14 Feb 2024 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MPX0uB6F"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4511757A;
	Wed, 14 Feb 2024 10:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707906307; cv=none; b=SSUMNiw0QAOTwotTGVAXycKwrlgc1HLEU9ODbFVnNc3iNOt6JaBLiKR2igcZk/l88S5zu01wF2aziJjLligi0iVcvcYC9/Zde5edxzQiq7E1FphrkDC2+qMxXNx5H837vnm7XyBxq6dnegsXEn9Alb50cyj6WIeobm2DHpFZFxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707906307; c=relaxed/simple;
	bh=L815oFbIeIuu/nPLWPfmkBBD824MSDUKPhdjuYMkxoI=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMyHAwhaFUodgwotEWdyCEPWXTH8sZIfqxVr1tT1FbXKhFtmtepCsUR3+yaVTrZat9pNF7Ihh9+VEc52I4pUk/f0jOnp+S4vMzIexmCon+mA6i4A8kN65602JZ5kEsLomZk5J7mM9ujckoctWsHYP/7w2esNIi/W3Ng9Meq7/Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=MPX0uB6F; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41E8556f007521;
	Wed, 14 Feb 2024 04:24:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=C43+mmqH+ywn9It
	Rt2YS6FoSpdQ9++9eC/aPhwewHIU=; b=MPX0uB6FLeKx3sWOtpEJkE3BiC8DscE
	3nc2VahgvcSQWAlhvC/cg1R/Hbgfe/KdKRX/jgmqh2aT+qr1+ogANqDWpe4nJwi/
	SAyHztTQAEPlN80Fmgh9ifiBGQzS6TlQSFkNr9pxdzBq1+zOC7e1qs0utqowSiiJ
	OKraYH3pwN6n4Xaro73nwALeDXsts/EsjYlYZFKt5llqjg7QNxO+TOAnT1lBUQEH
	bllzg2MFhC81rYlxh0rE2JsH3L5jh8bi9FZZMrHfGTCNh10tLZPWl6qEPJRdrCMY
	YyqJV3EU3Gk9xFDr0o1nQvonmCkWjIh14z84f0dOkdjmFgj5eiekqCg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w8sp4g329-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 04:24:46 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 14 Feb
 2024 10:24:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 14 Feb 2024 10:24:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 7B6B3820242;
	Wed, 14 Feb 2024 10:24:44 +0000 (UTC)
Date: Wed, 14 Feb 2024 10:24:43 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
CC: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <ZcyU6xgpOvrhX57D@ediswmail9.ad.cirrus.com>
References: <20240212173111.771107-1-jogletre@opensource.cirrus.com>
 <20240212173111.771107-2-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240212173111.771107-2-jogletre@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: saAm5YBNWf7RG7dsp8C3pW95M6OB6FDH
X-Proofpoint-GUID: saAm5YBNWf7RG7dsp8C3pW95M6OB6FDH
X-Proofpoint-Spam-Reason: safe

On Mon, Feb 12, 2024 at 05:31:07PM +0000, James Ogletree wrote:
> A write sequencer is a sequence of register addresses
> and values executed by some Cirrus DSPs following
> power state transitions.
> 
> Add support for Cirrus drivers to update or add to a
> write sequencer present in firmware.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
> +	if (!update) {
> +		if (wseq->ctl->len - op_end->offset < new_op_size) {
> +			cs_dsp_err(dsp, "Not enough memory in write sequence for entry\n");
> +			ret = -ENOMEM;
> +			goto op_new_free;
> +		}
> +
> +		op_end->offset += new_op_size;
> +
> +		ret = cs_dsp_coeff_write_ctrl(wseq->ctl, op_end->offset / sizeof(u32),
> +					      &op_end->data, sizeof(u32));
> +		if (ret)
> +			goto op_new_free;
> +
> +		list_add_tail(&op_new->list, &wseq->ops);

This means the new write will be after the terminator in the
list. Whilst I think the code will work this way it would be
much cleaner if we kept the list ordered to match the writes,
by inserting the new element just before op_end.

Thanks,
Charles

