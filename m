Return-Path: <linux-input+bounces-1722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128384C909
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 11:56:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615A91C20DE2
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 10:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A73AB171B4;
	Wed,  7 Feb 2024 10:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YDPs4PBf"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845017582;
	Wed,  7 Feb 2024 10:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303399; cv=none; b=KdgB+GFE0rhnYC56mzX24FLNl4CFSjbrXsin2qRXso5bTohiA3Ksa1wov7e+7sWBPZLLCoA2J3TLhV/Ne86P23uSD2Jmq4lAuvTTIkRhh/u/HAMMdj0XmVpu+6dlpVaQxQtr6DEGA36bf2XCQGsltQ5UZ5jQXqrfpdhxSOdl5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303399; c=relaxed/simple;
	bh=cHuBJa3fwwSWWb95cRYPTGvmcJXWGVt/IdQMW89YmOk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ytgjbz+2AO4/f2heOJpqeRoN3o8uja4ed5fRA+oR0XuO6LIuCj/hdT4yo8MVIE977SMn4C+RxlGhtnawJBrpWxxqNYASiAo2W27iA/TTUqa6g09MiTM2zqJFASp5Fh2WHFbqQscLb4wFHGXD30fAKLUpyWKNGXsjvRy0OcBP7u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YDPs4PBf; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4177gWj8022130;
	Wed, 7 Feb 2024 04:56:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=WE5OOMkdDmTnFTR
	5yFILUIuNO0lM6ppMfWaP+TqmU0E=; b=YDPs4PBf8XdBxnK1oqzc0SG/b2d1Uee
	iZSRkxO6Nq87Pgp8jFB76aVngFAO/0lz79iboDe6lXGfqqiQKydPAmetLe6ZN5d3
	x3WPfyijB2qfoTt9eF7tSVpoQknkUKOne1ma7hfi9KVEEhnKg6o6/nx2qnO8IxL+
	kcg3IBdE/kkFqxyxToE6kpJH4BD9snBkaLxhuycqSPzFrXN6U2uOH/QhTMb7hdx/
	g/CiZIikBqm/vpsmBW7yowZ7qnTmqgGwaVlA6Odwo7vt7LTg6BRTyqPt5SB++tZk
	S8oeCXH7Zn7axVEnSvwcChfpDFtmDbPHcBP07RJnTQnYsmwXXoeU4Lg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w1ks2cxha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 04:56:30 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 10:56:28 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 10:56:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 39633820243;
	Wed,  7 Feb 2024 10:56:28 +0000 (UTC)
Date: Wed, 7 Feb 2024 10:56:27 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
CC: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <ZcNh2y35OWEdQPDm@ediswmail9.ad.cirrus.com>
References: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
 <20240207003612.4187370-2-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240207003612.4187370-2-jogletre@opensource.cirrus.com>
X-Proofpoint-GUID: iL-g1Bw9r9WRT8_6cI6jiksdglvi2rGg
X-Proofpoint-ORIG-GUID: iL-g1Bw9r9WRT8_6cI6jiksdglvi2rGg
X-Proofpoint-Spam-Reason: safe

On Wed, Feb 07, 2024 at 12:36:08AM +0000, James Ogletree wrote:
> A write sequencer is a sequence of register addresses
> and values executed by some Cirrus DSPs following
> power state transitions.
> 
> Add support for Cirrus drivers to update or add to a
> write sequencer present in firmware.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---

Mostly down to some very minor nit picks from me on this one,
only one comment on the list order.

> +	ret = cs_dsp_coeff_read_ctrl(wseq->ctl, 0, words, wseq->ctl->len);
> +	if (ret) {
> +		cs_dsp_err(dsp, "Failed to read %s: %d\n", wseq->name, ret);

Use wseq->ctl->subname here should be the same string.

> +		switch (op->operation) {
> +		case CS_DSP_WSEQ_END:
> +			op->data = WSEQ_END_OF_SCRIPT;
> +			break;
> +		case CS_DSP_WSEQ_UNLOCK:
> +			op->data = cs_dsp_chunk_read(&ch, 16);
> +			break;
> +		case CS_DSP_WSEQ_ADDR8:
> +			op->address = cs_dsp_chunk_read(&ch, 8);
> +			op->data = cs_dsp_chunk_read(&ch, 32);
> +			break;
> +		case CS_DSP_WSEQ_H16:
> +		case CS_DSP_WSEQ_L16:
> +			op->address = cs_dsp_chunk_read(&ch, 24);
> +			op->data = cs_dsp_chunk_read(&ch, 16);
> +			break;
> +		case CS_DSP_WSEQ_FULL:
> +			op->address = cs_dsp_chunk_read(&ch, 32);
> +			op->data = cs_dsp_chunk_read(&ch, 32);
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			cs_dsp_err(dsp, "Unsupported op: %X\n", op->operation);
> +			goto err_free;
> +		}
> +
> +		list_add(&op->list, &wseq->ops);

Unless I am mistaken, would be better to use list_add_tail
here. Which would keep the order of writes in the list matching
the order in the write sequence. Currently I think the list
holds the writes in reverse order, so your search for the
first write will actually find the last write.

> +EXPORT_SYMBOL_GPL(cs_dsp_wseq_init);

These should all be EXPORT_SYMBOL_NS_GPL(..., FW_CS_DSP).

> + * cs_dsp_wseq_write() - Add or update an entry in a write sequence
> + * @dsp: Pointer to a DSP structure
> + * @wseq: Write sequence to write to
> + * @addr: Address of the register to be written to
> + * @data: Data to be written
> + * @op_code: The type of operation of the new entry
> + * @update: If true, searches for the first entry in the write sequence with
> + * the same address and op_code, and replaces it. If false, creates a new entry
> + * at the tail.

This should now be expanded to note that it will also add a new
entry if no matching entry is found even when update is set to
true. The comment below says it but good to have it in the docs
too.

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
> +		list_add(&op_new->list, &wseq->ops);

I think if you use list_add_tail(&op_new->list, &op_end->list),
that will also keep the list order matching the hardware order
here.

> +/**
> + * struct cs_dsp_wseq - Describes a write sequence
> + * @name:	Name of cs_dsp control
> + * @ctl:	Write sequence cs_dsp control
> + * @ops:	Operations contained within this write sequence
> + */
> +struct cs_dsp_wseq {
> +	const char *name;

Drop name from the struct here it is redundant the ctl pointer
precisely identifies a control.

Thanks,
Charles

