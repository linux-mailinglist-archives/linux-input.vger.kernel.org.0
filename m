Return-Path: <linux-input+bounces-1723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0E684C91D
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 12:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E92B0B257FD
	for <lists+linux-input@lfdr.de>; Wed,  7 Feb 2024 11:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D384A179AF;
	Wed,  7 Feb 2024 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qaB1mCzE"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027711B7E3;
	Wed,  7 Feb 2024 11:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707303634; cv=none; b=lHiaKMINzXOzxAIlDjM3thErkx4HGPB5CNCKd25RW8hQX8kEtTaFbqPytZDnHFbQFShCsK8C6qJPm+KSBcWWGawZWca+YuI8sZZE+e3Zzscsw6X/HYv8/Ow3GWfyGAxvvcWZ9ny2uCQb57LCsw6HYahec+RiXXbsVjcJyvcb1Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707303634; c=relaxed/simple;
	bh=6++bpD8V91vCcFWebpFAaeWS55AiwI68c6fRZEYKVU4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1YdNCXoUjBiRU1ETKNJccRIqZXOGzs0/FspWlWxaGCVuCpVGpYFyNdiQ+7l6WUSUjQ2fsbHnxCRuwuynWJTw36GSDKqQ+e5WtZ3cuyntAzxq5MKww4fBewsiW7Jkj3RtS3jsHiQaQKYrnEiqQ6SBbagqmJcTHJouErSenIUZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qaB1mCzE; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4178mf3b013204;
	Wed, 7 Feb 2024 05:00:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=q4ig0oZM1f9Oh45
	sQfWzMwwuwAekYfgDroCc6/vHaeY=; b=qaB1mCzEFw/rjL4ax+jPjeke/IpAUFW
	qVCT5dkPINS56Yd7Ywaoo1EzTYt3WdKcJhnLrFAR2PLXQ99b7P1qLH+WQpW+paDe
	Nk37Z+7tqCwS4XwCQdKdzVbHn5jIcKWnXwGcTClMI/6zL4L1w+VVPkIdel7mtKkv
	RVckuQTWheKrV677odBfl6jzwiPNDnscpWml5avKbRwLM6GCeAniQrLK9iBJcWY+
	F84YtufRg7MrAf6En2sOpGtckyFpKG7k/EOa0VPCaUIHkYvDod7NaDl5C1dZ5JXA
	Ot+EEDuK+xCd4fxiqQJmdydzzAbcW0lFGhDdiOrierHxVwMM5gk+ksg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w46p784dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Feb 2024 05:00:15 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 7 Feb
 2024 11:00:14 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 7 Feb 2024 11:00:14 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 18172820243;
	Wed,  7 Feb 2024 11:00:14 +0000 (UTC)
Date: Wed, 7 Feb 2024 11:00:13 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
CC: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v6 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <ZcNivQ9hg4m5BawG@ediswmail9.ad.cirrus.com>
References: <20240207003612.4187370-1-jogletre@opensource.cirrus.com>
 <20240207003612.4187370-4-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240207003612.4187370-4-jogletre@opensource.cirrus.com>
X-Proofpoint-ORIG-GUID: __BRkTfwGWCQaBZj5SSERPJA5naxGMtu
X-Proofpoint-GUID: __BRkTfwGWCQaBZj5SSERPJA5naxGMtu
X-Proofpoint-Spam-Reason: safe

On Wed, Feb 07, 2024 at 12:36:10AM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The MFD component registers and initializes the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---
> +static struct cs_dsp_wseq cs40l50_wseqs[] = {
> +	{ "PM_PWR_ON_SEQ" },
> +};
> +
> +static int cs40l50_configure_dsp(struct cs40l50 *cs40l50)
> +{
> +	u32 nwaves;
> +	int err, i;
> +
> +	if (cs40l50->bin) {
> +		/* Log number of effects if wavetable was loaded */
> +		err = regmap_read(cs40l50->regmap, CS40L50_NUM_WAVES, &nwaves);
> +		if (err)
> +			return err;
> +
> +		dev_info(cs40l50->dev, "Loaded with %u effects\n", nwaves);
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(cs40l50_wseqs); i++) {
> +		mutex_lock(&cs40l50->dsp.pwr_lock);
> +		cs40l50_wseqs[i].ctl = cs_dsp_get_ctl(&cs40l50->dsp,
> +						      cs40l50_wseqs[i].name,
> +						      WMFW_ADSP2_XM,
> +						      CS40L50_PM_ALGO_ID);
> +		mutex_unlock(&cs40l50->dsp.pwr_lock);
> +		if (!cs40l50_wseqs[i].ctl) {
> +			dev_err(cs40l50->dev, "No control: %s\n", cs40l50_wseqs[i].name);
> +			return -ENOENT;
> +		}
> +	}

In general this is a bad pattern to use, don't have global
structs that hold anything other than const data. Here if a
system with two cs40l50's was made they would end up over writing
each others ctl pointers. If the data is modified by the driver
put it in a private struct that is allocated during probe.

Thanks,
Charles

