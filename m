Return-Path: <linux-input+bounces-2334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187B0877E1E
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 11:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 238AFB215DF
	for <lists+linux-input@lfdr.de>; Mon, 11 Mar 2024 10:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B45C51171D;
	Mon, 11 Mar 2024 10:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dJ5EMeXi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA95A199AD;
	Mon, 11 Mar 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710153076; cv=none; b=PfHsuh0XsJVLkof41BQbCwI+qWW7wymAzbIALUywJzTzkWRzzFyueSd+Wd+ZoEBNpAxyB5YQAxm2pA9RzIv76zS0pKewPOtP0fEKiE+Cm8nHB74Yk7A2q6wh2h4Kpb5L/9uhddzjpEqWlTdBuniXYNK0qV0iNIB24ZcL1gD22WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710153076; c=relaxed/simple;
	bh=ROM8u02ulj+6GgxMOFICDIH13jkRS/ukhT10cHRTAQk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=enYADPKS2q4wtP7e5GLe+PUZXl9Nm5kTOp9kC84NJS5/G6bn8sXjGF2VLXR8x3ZZeSo3qghTZMK8DrCFudSHYTVPGIDK+pJeOk6Ea1bHdbV8BO0kv3meIygnq1fz+3baI+2ZZvmNGrUsWHSJ/t4XQ1hpYfhvlCg17i1hF9Uvk9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dJ5EMeXi; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42B8e4DZ029365;
	Mon, 11 Mar 2024 05:30:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=X0n+FAY2KSoMu8/
	rx3UrzPFXr+wA9US6Ysi24zxAD6s=; b=dJ5EMeXiRwMM0GwheiEybmAgpqfJaJ4
	a3o0vntUhoiaokWTZfnuXhGkz4FvuxawcwVwmeGiRFmujBfmLct7zejjUGoC3rnN
	6Fb7RVwuRflFW/4knJc6jKlCGdZQzYlRAppSwBQ+aTfUNOVtHAtxp5q9USfdOpAB
	9lXWJI7DFNnZCYqosY9n6FPOVvlpTQqTQpOCiMjgXiK0y6ScGj4Hig0zxCZI4Fze
	nh4zU1VR53i6A63nlQZ39LrULtLUWCplZ8BzgY6GuITIahEzB8Q9RS4Gj6U6AQQV
	nd+aELMRqwI0l7lyGQ5aKX5Gb7/Pxkq+eSRUHvIGtoffpk+Fq9m9ZtQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wrn2pstae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 05:30:56 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 11 Mar
 2024 10:30:54 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 11 Mar 2024 10:30:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 388DA82024D;
	Mon, 11 Mar 2024 10:30:54 +0000 (UTC)
Date: Mon, 11 Mar 2024 10:30:53 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <Ze7dXdVdZKN5Kmv/@ediswmail9.ad.cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-4-jogletre@opensource.cirrus.com>
 <Ze5E1KxRltUTX4R6@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Ze5E1KxRltUTX4R6@nixie71>
X-Proofpoint-GUID: FzPbxAW0jqaNKHpzaKRz0xz3Y1-3YvWs
X-Proofpoint-ORIG-GUID: FzPbxAW0jqaNKHpzaKRz0xz3Y1-3YvWs
X-Proofpoint-Spam-Reason: safe

On Sun, Mar 10, 2024 at 06:40:04PM -0500, Jeff LaBundy wrote:
> On Fri, Mar 08, 2024 at 10:24:19PM +0000, James Ogletree wrote:
> > +static void cs40l50_start_dsp(const struct firmware *bin, void *context)
> > +{
> > +	struct cs40l50 *cs40l50 = context;
> > +	int err;
> > +
> > +	/* Wavetable is optional; start DSP regardless */
> > +	cs40l50->bin = bin;
> > +
> > +	mutex_lock(&cs40l50->lock);
> 
> It seems the mutex is used only to prevent interrupt handling while the DSP
> is being configured; can't we just call disable_irq() and enable_irq() here?
> 

The trouble with diabling the IRQ is it masks the IRQ line. That
means if the IRQ is shared with other devices you will be
silencing their IRQs for the duration as well, which is slightly
rude. Especially given the driver requests the IRQ with the
SHARED flag I would be inclinded to stick with the mutex unless
there are other reasons not to.

> > +static int cs40l50_irq_init(struct cs40l50 *cs40l50)
> > +{
> > +	struct device *dev = cs40l50->dev;
> > +	int err, i, virq;
> > +
> > +	err = devm_regmap_add_irq_chip(dev, cs40l50->regmap, cs40l50->irq,
> > +				       IRQF_ONESHOT | IRQF_SHARED, 0,
> > +				       &cs40l50_irq_chip, &cs40l50->irq_data);
> > +	if (err) {
> > +		dev_err(dev, "Failed adding IRQ chip\n");
> 
> I don't see any need for individual prints in this function, since the call
> to cs40l50_irq_init() is already followed by a call to dev_err_probe().

I would probably suggest keeping these individual prints here and
removing the one in cs40l50_probe, it is nicer to know exactly
what failed when something goes wrong. That said at least the
devm_request_threaded_irq can probe defer so that print should be
a dev_err_probe since this function is only called on the probe
path.

> > +	dev_info(cs40l50->dev, "Cirrus Logic CS40L50 rev. %02X\n", cs40l50->revid);
> 
> This should be dev_dbg().
> 

Not sure what the concenus is on this, but personally I greatly
prefer these device ID prints being infos. Nice to always have
some indication of the device and its version.

Thanks,
Charles

