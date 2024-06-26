Return-Path: <linux-input+bounces-4650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3D918839
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 19:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B38E8B22D87
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 17:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07AA418FDCD;
	Wed, 26 Jun 2024 17:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GwG5ktoo"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AC618FDCF;
	Wed, 26 Jun 2024 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719421701; cv=none; b=UYijYfnSHR6kL+v3h2dxFPgMaoFvAPa6Iv62kliMW6Q4HMdWgxCQGrvytieBHOyHq7vagqNorl4UYeNDSER/YmkUG2mmF22ExQV4aBksY7tgo/yX6rQ0x+V+a0aSqt2plArTBzgKgzyj9YfQ+8IK5lAAj7UgM/1EUbO04oPJA6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719421701; c=relaxed/simple;
	bh=SGevvtZtHXSqfwa5O6Io/8z9OukBGsmljDRlsnxtBz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ABcEytpqW+JoA3+9QGA/aQYUcSyNhmqw177n11DYEEJVBTjZkGHK7+T04N0OdUeYzC/YI/G75RQII2OZEve4B5mbnIu2h+/AWc8C+92a79qKl09vMBxlScaIkcZGATJzl2nP18iS87+PA9WDX1uG9BrsDOAYjOdm8+aXNwwnSK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GwG5ktoo; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QF6dtB020557;
	Wed, 26 Jun 2024 11:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=SGevvtZtHXSqfwa5O6Io/8z9OukBGsmljDRlsnxtBz0=; b=
	GwG5ktooOqmPiqXtmcUv+jm6iTvBlPIRanFeX9fkyGizzgWS3ZOL2nJJLnQUwAgo
	4Gf9G19fowwlsM95wALwsGdc8Oa8XWXFhJK6jxdUufGhTc9zB6j5TLJYwOsfBUdj
	aQsFUK4Loothmx/iyTdct5KOqJzH2YfUIeLIxykLM2AkQcdKitHE3e0DUICQfnX3
	7KeWGOoqqxy7t+92N45fasWcsS1w1OgygpgZISKCBoNhcWrvK2/oLd9hQWZQBoe4
	irQ3PQc1v4bKqg77cti7rYTT9snx9bX1Dc8TWavwThytugTEm11RYnP1Zt8XhKAn
	65iWwvGKtsqeQ7LXjykxOw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 400nbdr4ky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 11:55:48 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 17:55:46 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 26 Jun 2024 17:55:46 +0100
Received: from [141.131.156.204] (macC02FN0GLMD6T.ad.cirrus.com [141.131.156.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 08D67820257;
	Wed, 26 Jun 2024 16:55:43 +0000 (UTC)
Message-ID: <9ece1e49-1753-4841-b8ed-252fdc8792c4@opensource.cirrus.com>
Date: Wed, 26 Jun 2024 11:55:43 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v11 5/5] ASoC: cs40l50: Support I2S streaming to
 CS40L50
To: James Ogletree <jogletre@opensource.cirrus.com>,
        <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>
CC: <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        David Rhodes
	<drhodes@opensource.cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-6-jogletre@opensource.cirrus.com>
Content-Language: en-US
From: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>
In-Reply-To: <20240620161745.2312359-6-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: CdsLy3u3iXcBr8woWieeWVjkOpUNpx4p
X-Proofpoint-GUID: CdsLy3u3iXcBr8woWieeWVjkOpUNpx4p
X-Proofpoint-Spam-Reason: safe

James,

On 6/20/24 11:17 AM, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
>
> The ASoC driver enables I2S streaming to the device.
>
> Reviewed-by: David Rhodes <drhodes@opensource.cirrus.com>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Reviewed-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>


Thanks for your contribution,

Ricardo


