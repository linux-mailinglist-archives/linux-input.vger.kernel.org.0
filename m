Return-Path: <linux-input+bounces-2535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B6288C88B
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 17:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD8F1C2C335
	for <lists+linux-input@lfdr.de>; Tue, 26 Mar 2024 16:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE99B13C918;
	Tue, 26 Mar 2024 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pA0tYaz3"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF97B13C90A;
	Tue, 26 Mar 2024 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711469202; cv=none; b=oXc16BktvjQ170fXoTe4NEI9HkwKAqnvPlk76AAK9NFCFbFVUezkZUXT8aHxbU8WsFMx+oOX+U61UE+ClaTxtJvEXJpQy57Gw69IaG5L6kSqFhz2bF7bwK34uQOTV+WrEHJ4Y1tQllxIi0kgKviqzYmeUVa8jzZjpESPMupz+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711469202; c=relaxed/simple;
	bh=gZ7Oihytq6S7XooG8zMKvfOIFdioJ8AxamtfaSSQ1MY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=r8zy0Y2mzNg0Mq6c4NBxgdKnh3AiAcIcmNMGrbYct7jRYiW92fTzQ9jf6pQzZDDiZlaBnbIL6KyEIfNLFlC4BE2KXAdAso9gX6tNP8RtVo7GhjKY0BYB8XJXqHKvYtPHCFbAkVq4ZjlKD+4PX7wBzNtYrOZaSepn/RpepMnCvU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pA0tYaz3; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42Q7fAtd005126;
	Tue, 26 Mar 2024 11:06:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=1HACJMPhmlTWowKJzBV1O8J9MaCLq8HycvFnllubDKc=; b=
	pA0tYaz3U2FivdNdIPwlgSUagBJ+5mngy5LzOYPoWOt9a9Vsh6wjRNRVxPkb1sQm
	XIDxj46NwehH3WcETDqFPKPE8kzWB8EFlkhNGi17HCltyrOv0+NY9sv8lQdpJYps
	B5ctVqQl9uRv279+Oi0V/Qek9hXGxGOLiPDO1Ts6glSyZ3ngb6jXKqjR6JiUQqlI
	yOWtTiss/OtxBAgAZO3U4SVhkRMrqHjSL10ulw1ZFgGUWN94NVoHQT7ik7RmtJJ/
	PRmMxH/QbeS1Pmktt/PnWDRxs//XysCtwbWzYBjeCK0O+H/+d0tlzB+aDO7kRhM5
	FQmQ9y819rGp/AtYf6/8bg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3x1ugm5j9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 11:06:28 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 26 Mar
 2024 16:06:26 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Tue, 26 Mar 2024 16:06:26 +0000
Received: from [141.131.79.41] (unknown [141.131.79.41])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 8C335820241;
	Tue, 26 Mar 2024 16:06:24 +0000 (UTC)
Message-ID: <853901e0-2fa4-4673-8461-63e40d6ca48a@opensource.cirrus.com>
Date: Tue, 26 Mar 2024 11:06:23 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Content-Language: en-US
To: James Ogletree <jogletre@opensource.cirrus.com>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20240320192956.2395731-1-jogletre@opensource.cirrus.com>
 <20240320192956.2395731-6-jogletre@opensource.cirrus.com>
From: "Rhodes, David" <drhodes@opensource.cirrus.com>
In-Reply-To: <20240320192956.2395731-6-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9TiNycXSLdrCH4LheZRKKMb-6IrtjRNr
X-Proofpoint-GUID: 9TiNycXSLdrCH4LheZRKKMb-6IrtjRNr
X-Proofpoint-Spam-Reason: safe

On 3/20/24 2:29 PM, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The ASoC driver enables I2S streaming to the device.
> 
> Signed-off-by: James Ogletree<jogletre@opensource.cirrus.com>
> ---

Reviewed-by: David Rhodes <drhodes@opensource.cirrus.com>

Thanks,
David

