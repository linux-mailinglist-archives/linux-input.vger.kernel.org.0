Return-Path: <linux-input+bounces-2383-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FC787CAB8
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 10:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BB941C221F9
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 09:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D2517C60;
	Fri, 15 Mar 2024 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KQRkhWDp"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AECB17BCF;
	Fri, 15 Mar 2024 09:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710494994; cv=none; b=px93weN12d2DiYRXQPTONUvVqAdt36rxFEEFWGxaokZMAS3yG0jJrONT6dBlRmfGgi+2Ez8YyNvHHfrbzob28VLrQXFd879B1OvYDANl1lMo5vhOXMIdAFbNJKG1yc+WNamXdymjG0JpNpe5K4PWtteYe72/mmA2gTWNaNs9Vso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710494994; c=relaxed/simple;
	bh=s/rsVNseMI89dvpT4qv6LnO86oQ4MzaZCUsE1z5nD0M=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBFLTUAjArtL7axkW5ojknCZDwQgVq+/+Xr5LkeD2WOei4ecThQsKhpZ+2m17mkPC53t4qC0IHH+gMKTZtj/UAGcPBATRrHT9Ok4Q5sqvKAOVOtaXJpqcZ8IxfiaPg4CGeq79ZRi1N5fiVsyLB0JIbxdiGlBGLmocIHj+02tvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KQRkhWDp; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42F5lrmp008795;
	Fri, 15 Mar 2024 04:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=XW5ng7VNfl6tWdU
	EwvI/Ce8NzNIDaOkKmr9AemVDb1c=; b=KQRkhWDp73COJy1kFBCYzBVx9Ku1PH4
	LuK5O5hi+XUuK54zrEVti24dJcRiKPtAU8oN4mfUbx+VysCbToT5IuNClvHPZKaM
	T1sk9aHZw7iB7xUgNxacAUKyFuBgNFF8KRYD0qJGYMJAmtgTT4U6nneI9TGRJ3lz
	ARMEu+1g1INR1BnygubP6CzGzD/uo3VU4JqfmlEK1iTKyBbRyWOP5eJOucwLk2SG
	f+IJefyopYrAuG1+BkxI+l/BEIlEtQRPktbSyylsM2JmK2jMPG2/rA8ADi17wPbp
	jXOwPxsZDV372bo8DtEAiTb9m63PMoqDQJfNw3yaLkjZ/gYYoRiqeZw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wv9xp8eag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 04:29:32 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 15 Mar
 2024 09:29:30 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Fri, 15 Mar 2024 09:29:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 31050820243;
	Fri, 15 Mar 2024 09:29:30 +0000 (UTC)
Date: Fri, 15 Mar 2024 09:29:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <ZfQU+Za34tYHzYgx@ediswmail9.ad.cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-2-jogletre@opensource.cirrus.com>
 <Ze4GEKkXoRA/4Sga@nixie71>
 <Ze7ZeY+FTPuk0zyE@ediswmail9.ad.cirrus.com>
 <ZfMMYm1k7qP7Uqm8@nixie71>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZfMMYm1k7qP7Uqm8@nixie71>
X-Proofpoint-ORIG-GUID: fBmu2HAOHoYGTVPgPhFQv1o6PpgsLM8U
X-Proofpoint-GUID: fBmu2HAOHoYGTVPgPhFQv1o6PpgsLM8U
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 14, 2024 at 09:40:34AM -0500, Jeff LaBundy wrote:
> On Mon, Mar 11, 2024 at 10:14:17AM +0000, Charles Keepax wrote:
> > On Sun, Mar 10, 2024 at 02:12:16PM -0500, Jeff LaBundy wrote:
> > > On Fri, Mar 08, 2024 at 10:24:17PM +0000, James Ogletree wrote:
> > I disagree here. This is the write function, there is no guarantee
> > this is even called at probe time. This is generic code going
> > into the DSP library and will presumably get re-used for different
> > purposes and on different parts in the future. Freeing on the error
> > path is much safer here.
> 
> Agreed that this won't be called during probe; all I mean to say is
> that I don't see any issue in hanging on to a bit of memory while the
> device is in an error state, before the module is unloaded and devres
> unrolls all of the device-managed resources.

I think that's the problem the assumption that all users will
completely bork the device if this operation fails. Likely but
far from certain.

> It's also perfectly fine to leave this as-is; the existing method is
> functionally correct, and I understand the perspective of having the
> generic library clean up immediately. If that's the intent however,
> the same error handling needs to be applied in cs_dsp_populate_wseq();
> currently only cs_dsp_wseq_write() calls devm_kfree() on error. Since
> L50 uses asynchronous FW loading, neither are called until after the
> device probes.
> 

Hmm... yes I guess in my head I wasn't thinking so much about
populate being called at runtime, but I am inclined to agree. We
should probably update populate to also free on the error path.

Thanks,
Charles

