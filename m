Return-Path: <linux-input+bounces-2224-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BACC871B5C
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 11:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBC2628236D
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 10:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16EAF5C5F6;
	Tue,  5 Mar 2024 10:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cP1rZN7L"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E15C5E6;
	Tue,  5 Mar 2024 10:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709634078; cv=none; b=efNn7/VrxB3lTyPkNxcDsYI2SkdkpInfwcR0Tcv/Oq0QnpqwDtdBtLnfSPEHQ8a0YDNwBbAS2gOYn6zilyE5ERwNdJxZBihFH60itV6LLfQ6UTkPxSM+XxhXG3HtnnoepEkW3znEu7+5frInxSApNigfOjSzDUPFbxU5PBpUssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709634078; c=relaxed/simple;
	bh=n72dDew20y7994V2+hnoQoi6Vg1X8GC5NXpODsYrIpA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCEHWJBo9e6suXbb1zI7RYGEwv4Q4rlu8yQv+WH5Di0cjXE2K9svPDqhGm8Msq9brJUe3Hh0AFGGJTL9vP4ggMxshCjWN5RpLxeAQj4AgSGnWXR3xa1OhlD7qraluHU9luSxCvqRGqNoG4uOSnM0Sz3hzAvOVe9MLJmu0s+/7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cP1rZN7L; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4256TO1Q023852;
	Tue, 5 Mar 2024 04:21:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=8BA+MG5Csg/jTiJ
	cMFScN745OQtvINqONdRSslihdK4=; b=cP1rZN7LD1W/jSyVUoeTlVWKZR7+RCS
	6q//s5jbp6I0CNuLrCgk+esfXeXVo119RNTNohdJQIJBoBICyhxyTisjPGrzsq//
	mnTw5kA2kbLjZR8Dy6RT3nycuy02TBqiRf5YH8gQHC7in5b+fpV753KgfqxVgpnj
	trLZLWWgeiimVnryjp9xgdmv4STEsnoIqtPzSFukswe9llmMdFv7I0dP5grXd1p0
	TuW8y8JvAOMEMc1rINIUI0c2RTel9SmYBamqXxUpROSJiiVgzANLj1opxPV5DheM
	yxl2xsXdr/ZeBjS+TVZQUAqdO4dHImtOuVohUSBEvB5MINV0YlSakMA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wm2d2k115-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Mar 2024 04:21:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 5 Mar 2024
 10:21:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Tue, 5 Mar 2024 10:20:56 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 20B95820243;
	Tue,  5 Mar 2024 10:20:56 +0000 (UTC)
Date: Tue, 5 Mar 2024 10:20:55 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: James Ogletree <James.Ogletree@cirrus.com>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <ZebyByQnYkaRiudv@ediswmail9.ad.cirrus.com>
References: <20240221003630.2535938-1-jogletre@opensource.cirrus.com>
 <20240221003630.2535938-4-jogletre@opensource.cirrus.com>
 <20240301091716.GA1688857@google.com>
 <6DD14CBC-FAE2-4768-AD77-347229FE9AC7@cirrus.com>
 <20240305095818.GF5206@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240305095818.GF5206@google.com>
X-Proofpoint-ORIG-GUID: CkbPeniqX1Btz60b2MEQMlUS5z9UiKoG
X-Proofpoint-GUID: CkbPeniqX1Btz60b2MEQMlUS5z9UiKoG
X-Proofpoint-Spam-Reason: safe

On Tue, Mar 05, 2024 at 09:58:18AM +0000, Lee Jones wrote:
> On Fri, 01 Mar 2024, James Ogletree wrote:
> > >> +static const struct cs_dsp_client_ops cs40l50_client_ops;
> > > 
> > > What's this for?  Where is it used?
> > > 
> > > In general, I'm not a fan of empty struct definitions like this.
> > 
> > From the same cs_dsp module as mentioned above, it is a structure containing
> > callbacks that gives the client driver an opportunity to respond to certain events
> > during the DSP's lifecycle. It just so happens that this driver does not need to do
> > anything. However, no struct definition will result in a null pointer dereference by
> > cs_dsp when it checks for the callbacks.
> 
> Then check for NULL before dereferencing it?

It would probably make sense to move the cs40l50_stop_core writes
into the pre_run callback, and the CLOCK_ENABLE /
cs40l50_configure_dsp stuff into the post_run callback. Which is
probably a slightly more idiomatic way to use the API of cs_dsp
and would mean some of the callbacks are initialised, thus
dodging this problem.

We could check for there being no client_ops in the cs_dsp core,
but it feels kinda redundant since there really should generally
be client ops.

Thanks,
Charles

