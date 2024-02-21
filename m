Return-Path: <linux-input+bounces-1995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C614A85D35F
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 10:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E102F1C21DF8
	for <lists+linux-input@lfdr.de>; Wed, 21 Feb 2024 09:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BCB23D0B6;
	Wed, 21 Feb 2024 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="OmOdepO6"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D113D3B8;
	Wed, 21 Feb 2024 09:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507377; cv=none; b=IGq3I0eHCobLdFxEURgYdrZA0RfRdDq98nUyqlENpWyeepOERgTvgIA9bg6XxbQpeuW+45ckdiohonq9o6bcWY02SYy+AEsfWWu7LTS0BZWTi6sOhgCZUlL8tGeO4nHpTjoksalOExfngWUtEkJaLWvTs6QdDqTk7nrgzAaE1BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507377; c=relaxed/simple;
	bh=xIf/au/9NhubwKmMHmZZdLTDwXFfPoXGSwzESI0C9a4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRD+OsY0Enj/MUieOGvbFUqBBP1GPgDt29unguNchLYP8jreNAO1NfUEPBdGOQTQ/lp0CPKeX8kMy+qMnJAje2AEUySRiUErUdTrVj6AU44SXhzTSl/yH0OeW6zvjqgswDAQaPq6yZSNX3CiaOw1SVjbAZ1PtZXQ2TRNvUe2VI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=OmOdepO6; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41L6dxZj023747;
	Wed, 21 Feb 2024 03:22:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=R6mowYBz3PTNIEc
	LjqKSH0kC4MBHuU3YHPxD8CCuIdM=; b=OmOdepO6+jJZxuwBNqN+zYI0+GxJmc+
	V+yLpt3pFeGSndGXHiVGYBmQ9REr+cTwRaTXngrvsfVEE+IfqsHdRL9/Adqwmsij
	P6chxJLeBUVfOsdNWwfYGyp9e+RtmkY/gMepf9t5aaidWGeuBgK6g1AJRnwq05OQ
	FyA0Ey2LMKGEpIR7Owlto8yDg+81a1Vhnp/2I7Ery2axIcSZyiSdEIAoHiVUJpS7
	nnCLczkKtUyNtjEpDoGcEpDq7pxIRf+uqfTfUBbT5d3qsGE8gWN7TuWp5Kb41J7B
	GOOJxClbXXkmHPj796PR758J1LRYD6p3eiutGxuRl384Kl9x9KmylWw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wd207grsk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 03:22:48 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 09:22:46 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Wed, 21 Feb 2024 09:22:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 96F58820246;
	Wed, 21 Feb 2024 09:22:46 +0000 (UTC)
Date: Wed, 21 Feb 2024 09:22:45 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
CC: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 1/5] firmware: cs_dsp: Add write sequencer interface
Message-ID: <ZdXA5cNFd+hvw//F@ediswmail9.ad.cirrus.com>
References: <20240221003630.2535938-1-jogletre@opensource.cirrus.com>
 <20240221003630.2535938-2-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240221003630.2535938-2-jogletre@opensource.cirrus.com>
X-Proofpoint-GUID: 9gIjqvAJ_zbDyiqVeROZ2A_urHKZXvOn
X-Proofpoint-ORIG-GUID: 9gIjqvAJ_zbDyiqVeROZ2A_urHKZXvOn
X-Proofpoint-Spam-Reason: safe

On Wed, Feb 21, 2024 at 12:36:26AM +0000, James Ogletree wrote:
> A write sequencer is a sequence of register addresses
> and values executed by some Cirrus DSPs following
> power state transitions.
> 
> Add support for Cirrus drivers to update or add to a
> write sequencer present in firmware.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---

Think this one looks good to me:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

