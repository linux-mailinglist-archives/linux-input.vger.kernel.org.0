Return-Path: <linux-input+bounces-7141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF89941A0
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 10:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EB2B1F291AB
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 08:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72601E1A12;
	Tue,  8 Oct 2024 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V1Q0lJ7L"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027DBB676;
	Tue,  8 Oct 2024 07:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728374096; cv=none; b=cqYXvTu3Bws5FFrrineWmOFvVjbKbSnpTIEJZwwJqWOy4nKF4z8V10yMfvg+RYdQfafaQ8NgQAjvkEwY0KVYmOU3L8Tex1vspyZXWg3prIFa7AFZiouECbJT2QOxD403453ervpU8UhpYwanwqHsQyF4gXDlrBJkOZbtTmJRSlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728374096; c=relaxed/simple;
	bh=VrF1q7zWvOdIrui1K846OMV4YcYqHE1YinVSqUMGPw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MxAGti2d8QR+iniUJgWdK9+OLd4sjCTXXWBe7nIZQS3eFo9THhS1B70wO/Dt8Gno29DisEfO1PUMo+03IuIqmV1N9Kq7kAFZBqSgxNqhPk7+15g0ZXPXiez54YFiUncf0DXI2VHWsKDq5J7e4zttCTrrxK/na2e7pEFzihAbnYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=V1Q0lJ7L; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 966554bc854a11ef8b96093e013ec31c-20241008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=VsFPi8az/OyA/IN+aGhSiXgEaCG9NxZV5cOQ19PcFbA=;
	b=V1Q0lJ7Lbf7xdTkBN5EccHZnIjKIGksvmEO+szXZI7xE51kPyPXQvZYdwHFQiUSl4jdip1L2pGGxnRdMI7LKBzy/DOIvcci6RZIXRDueM6cSh2lZx5kKlBZ8mFvVYSFX6gYWUnPwAQXso5MKvSlJvH4M/ZDZow6KnBWgjQijruo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:dc5fc39d-c217-4f5a-819a-2c9ef00fe150,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:3c58ed40-8751-41b2-98dd-475503d45150,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 966554bc854a11ef8b96093e013ec31c-20241008
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1997441089; Tue, 08 Oct 2024 15:54:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 8 Oct 2024 15:54:45 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 8 Oct 2024 15:54:45 +0800
Message-ID: <b1e37466-bfe8-cf26-fafa-e8556c15788b@mediatek.com>
Date: Tue, 8 Oct 2024 15:54:43 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] dt-bindings: input: mediatek,pmic-keys: Add compatible
 for MT6359 keys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dmitry.torokhov@gmail.com>, Sen Chu <sen.chu@mediatek.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <chen.zhong@mediatek.com>,
	<linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <kernel@collabora.com>, Pablo Sun
	<pablo.sun@mediatek.com>, Bear Wang <bear.wang@mediatek.com>
References: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 15:41, AngeloGioacchino Del Regno wrote:
> Add a compatible for the keys found on the MT6359 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> index 70567d92c746..bba55a81e6cc 100644
> --- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> +++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
> @@ -28,6 +28,7 @@ properties:
>         - mediatek,mt6331-keys
>         - mediatek,mt6357-keys
>         - mediatek,mt6358-keys
> +      - mediatek,mt6359-keys
>         - mediatek,mt6397-keys
>   
>     power-off-time-sec: true

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Thanks!
Macpaul Lin

