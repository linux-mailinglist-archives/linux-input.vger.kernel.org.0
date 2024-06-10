Return-Path: <linux-input+bounces-4295-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2F690250E
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 17:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21D4A1C22AD1
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF269136E2E;
	Mon, 10 Jun 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Qgnpjarw"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F441E4A0;
	Mon, 10 Jun 2024 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718032297; cv=none; b=HH+GptyEkAb1JqcQVvwYq5EUiNe10ZN/Au+/KsSXbfSidZkOpeLdj78cCThD5CIdmHvLWX/0b3dULN9/2mAtO5YDOJvNKE9U1CupPPOYYqqLNOdBdMLnWo9IC1iECDPNp2jPB0ZYukma8YK2Tsw52qnKy7XjdzkLbgrcWHY0F7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718032297; c=relaxed/simple;
	bh=2MRFIZHEDXMO59T2YYB546qg4m19ZfuyPNpaTj4oPmE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXZ2USSKWzzm9/+k2IkKLVgkzjUORQ3mgR6ZMy3Iw5oOmpfnNSoCSzpSy7/QK/m7wqpupZ0AfWZ99PQ/ywBOuWq0oOqnQvkIV403Xa51MrGPV9pMfAOlWAWCUUZnWcr5nGzDOSBo54LLeBT+Ginoh0r18xxZSGZaERwndTLf6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Qgnpjarw; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45AEOOUb020276;
	Mon, 10 Jun 2024 10:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=Aeq3fpVnqki4diYYjp
	/uVIFurTx413cN+qB6SABonpY=; b=QgnpjarwJEnP2pQylyOrlsymbCi58E5Vqc
	uTZD90SX6ft/6q5NHGths6YwJlMcqJLvWl9MaGYaaOJtt2IW3cJTGpqfuCW5p/5M
	gefX7/wV5ZX/OppUCR7IBlw6GzBy1fepy2ZTBF0pabfsuCeTgRZpO5FZ9GShKvIq
	JJj1lLMxneOxYO4blvZ7FmRIWtyOH2UztlZCPik0EypX/DuULtY5NlEaX78n8OZ+
	Hdti3LRZjdVCyD57J9risGdGNaH84VSvtcjGnxxMD2b8uPbg3eol0RUk9ppJdSva
	PAupBNEyaDorIfa9FntPHa8JAWDJcUBnXtYPMKrvwIwJjAC2Q+oQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ymmq09n4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jun 2024 10:11:27 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 16:11:25 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 10 Jun 2024 16:11:25 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 7EA9E820249;
	Mon, 10 Jun 2024 15:11:25 +0000 (UTC)
Date: Mon, 10 Jun 2024 15:11:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
CC: <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <lee@kernel.org>, <broonie@kernel.org>, <jeff@labundy.com>,
        <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v11 1/5] firmware: cs_dsp: Add write sequence interface
Message-ID: <ZmcXnL3xQ0IyJ6TF@opensource.cirrus.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-2-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240605135249.361082-2-jogletre@opensource.cirrus.com>
X-Proofpoint-GUID: cpT-NqtVu1njgP8mEQQqgX7w6pof0QqB
X-Proofpoint-ORIG-GUID: cpT-NqtVu1njgP8mEQQqgX7w6pof0QqB
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 05, 2024 at 01:52:45PM +0000, James Ogletree wrote:
> A write sequence is a sequence of register addresses
> and values executed by some Cirrus DSPs following
> certain power state transitions.
> 
> Add support for Cirrus drivers to update or add to a
> write sequence present in firmware.
> 
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>
> ---

I would suggest we just apply this patch, it is unlikely to
change from review comments on the rest of the series and could
well be useful to other parts in the meantime. It would also
mean less traffic each time this series is sent up.

Thanks,
Charles

