Return-Path: <linux-input+bounces-2332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B1B877DDD
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 11:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88A731C20843
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 10:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935FA2209F;
	Mon, 11 Mar 2024 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mIgTpckY"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78C217999;
	Mon, 11 Mar 2024 10:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710152082; cv=none; b=aTojxJfkHsL5A4igmXdqb5XKVk8ipnFg6edhJRHz0OVdhTUXee962VurwiA80zfQPy5IV56TO0aWhsoHoXcAw2S1ujnpaoj1E7/HUsowlcl5kVb+YArVt/mY+me/edUDNzbr3P/Nuw7yHvw7VUmgkeeGEh08gClCXflhhuF7Q74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710152082; c=relaxed/simple;
	bh=NJ15PA7RZlbmnmArC4fnfSy4/v7wcKLjhs2bbWriqRo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvH8nmiU/fxednJCsvjjqRDFVkG6lNPVkv4ANbCY/4q7JQ9gRzU372S1lFg2uNNhHeC+XL587EHCxONSXSSrw0nuh8kG1qzjs1YxtUNSiiv0nN9SD/gYZ8osksDmwavTuDMigZ/asewjZrCmHfnI+t9nqRfInr8xz/s0tuOWTg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mIgTpckY; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B6urf2014292;
	Mon, 11 Mar 2024 05:14:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=MeyE9CPwcBniBLq
	ToRElUJW1aTRcibz70UI55MTwDPU=; b=mIgTpckYcIRZ3sRZ5f2jvxQf/L7UNkQ
	TDFQ9fmGqkwtXRcbOgt84tbYjQ71OibtRVI2xgGCbUT+NvxkZrNsmXfR32PYjgSy
	iijm0qB4zDLPfUwzni9od8oakqkMX34IzxGcFrmrtGlf9vX/vDanaeO/n1xB9gM8
	v1O3GQ8YOQXkGvwKDHVSldazGE3BKsDNB2e8Brgc/fyqqmpNQhcfqqpsKHjLzXT9
	7Euu2vbxaJ+d2Fj+PQFEKFEopcCadksrlPv+c8Iq0U2+yNSU7Fph7W4iuIgr1WaH
	Nb4tgb3bG5Wx25CPx4dk4VVFMZsup7ICvJ5F1oBH8+eAZ8oqLY3T1Tw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wrp22sqyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 05:14:21 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 11 Mar
 2024 10:14:19 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Mon, 11 Mar 2024 10:14:19 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 0A65D820241;
	Mon, 11 Mar 2024 10:14:19 +0000 (UTC)
Date: Mon, 11 Mar 2024 10:14:17 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <Ze7ZeY+FTPuk0zyE@ediswmail9.ad.cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-2-jogletre@opensource.cirrus.com>
 <Ze4GEKkXoRA/4Sga@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Ze4GEKkXoRA/4Sga@nixie71>
X-Proofpoint-GUID: u7JIgzHDWMTPP6IGr17hIFuHqyTQ2WbS
X-Proofpoint-ORIG-GUID: u7JIgzHDWMTPP6IGr17hIFuHqyTQ2WbS
X-Proofpoint-Spam-Reason: safe

On Sun, Mar 10, 2024 at 02:12:16PM -0500, Jeff LaBundy wrote:
> On Fri, Mar 08, 2024 at 10:24:17PM +0000, James Ogletree wrote:
> > +	switch (op_code) {
> > +	case CS_DSP_WSEQ_FULL:
> > +		cs_dsp_chunk_write(&ch, 32, op_new->address);
> > +		cs_dsp_chunk_write(&ch, 32, op_new->data);
> > +		break;
> > +	case CS_DSP_WSEQ_L16:
> > +	case CS_DSP_WSEQ_H16:
> > +		cs_dsp_chunk_write(&ch, 24, op_new->address);
> > +		cs_dsp_chunk_write(&ch, 16, op_new->data);
> > +		break;
> > +	default:
> > +		ret = -EINVAL;
> > +		cs_dsp_err(dsp, "Op code not supported: %X\n", op_code);
> > +		goto op_new_free;
> 
> There is no need to drop down and call devm_kfree() here; it's sufficient
> to simply return -EINVAL. The devres core will free any instances of
> cs_dsp_wseq_op when the driver is unbound.
> 
> I imagine you're calling devm_kfree() to protect against the case where
> the driver successfully probes, but the contents of the firmware are found
> to be invalid later. In that case, yes, this newly allocated memory will
> persist throughout the length of the driver's life.
> 
> That's an error condition though; if it happens, the customer will surely
> remove the module, correct the .wmfw or .bin file, then insert the module
> again. All we need to do here is make sure that memory does not leak after
> the module is removed, and device-managed allocation already handles this.
> 

I disagree here. This is the write function, there is no guarantee
this is even called at probe time. This is generic code going
into the DSP library and will presumably get re-used for different
purposes and on different parts in the future. Freeing on the error
path is much safer here.

> > +int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
> > +			    const struct reg_sequence *reg_seq, int num_regs,
> > +			    u8 op_code, bool update)
> > +{
> > +	int ret, i;
> > +
> > +	for (i = 0; i < num_regs; i++) {
> > +		ret = cs_dsp_wseq_write(dsp, wseq, reg_seq[i].reg,
> > +					reg_seq[i].def, update, op_code);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> 
> This is absolutely a nit-pick, but in cs_dsp_wseq_init(), you use the pattern
> of breaking on error and always returning ret; here you return on error. Both
> are functionally equivalent but it would be nice to be consistent in terms of
> style.
> 
> If you do opt to match cs_dsp_wseq_multi_write() to cs_dsp_wseq_init(), I do
> think you'll need to initialize ret to zero here as well to avoid a compiler
> warning for the num_regs = 0 case.

I would be inclined to make cs_dsp_wseq_init function like this
one personally, rather than the other way around. Generally best
to return if there is no clean up to do.

Thanks,
Charles

