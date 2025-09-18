Return-Path: <linux-input+bounces-14868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A66B86D54
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 22:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25FBD7B92C0
	for <lists+linux-input@lfdr.de>; Thu, 18 Sep 2025 20:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65073305E28;
	Thu, 18 Sep 2025 20:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWsj0GhW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26E2E4247;
	Thu, 18 Sep 2025 20:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758226050; cv=none; b=NLUl7wbCMfuxYPMJOEp++MnrLHoinaDY03RCK0xEXKW0O37OsvzoWz0wLv5U/KF58NI/+m8kGZilcNWpHUZXqWVvSQHcbVu3nFioZpl4VjLhVPfpK1J+jUQ25KtVjery5Jvz5Vsml/HNcUGdbTf458vPMXFymYZcOuD8enUkJ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758226050; c=relaxed/simple;
	bh=9H/BmCbdny9Zk674F9G3jClnzY1O/2SdIwHGSQpnP+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UupdAC501lcqhm+c2n1UtRhFQpsDHp4qqPtlfE5g9T+xO4zS+37wkbjErxuC5Cg7q6DeYTkOr1UL2Kvbz+zjP1frRgF/Gs5nHrKNJ+BRqHskXqjobokG4KnZadQGfGFxj5lV0hy21s6+cd9YRmx2h3ay78btP/KOZkMhM3YCMYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWsj0GhW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DFCC4CEE7;
	Thu, 18 Sep 2025 20:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758226049;
	bh=9H/BmCbdny9Zk674F9G3jClnzY1O/2SdIwHGSQpnP+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWsj0GhWOrIgm/E0IZpDMlaJ/Jjgu8VfZLNKxsi7AmX8Ul4GUmQ2/nzO0qt9S5wev
	 FarlE0mmqK7BaTR2glas5DmTdj8K0+1HHl3w2XniAVw8uZZ22gcZCB4p9pr1Mmksqf
	 4Gx0wzNZbtbVPswYuCLY/Lfumw67RdYR7p8TDpRyHJDV+z2werqYKXWNhsQa2RqmIM
	 CrVaHzNh3rIfHxjq+gyBYxHNH1hOPaTcyRPTTVUWxaLWEriqMM5ksQ0x/Fvu9tSbWF
	 hz7L4JnT1pb97a3JdawezEkJhf/EfiEwfVJxajbWPrbhDXt0e2nhf6zBW+m1ZXxDHl
	 pO2EHoKMRANrQ==
Date: Thu, 18 Sep 2025 15:07:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-amarula@amarulasolutions.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: touchscreen: convert bu21013
 bindings to json schema
Message-ID: <175822604690.2540982.15927446834671643783.robh@kernel.org>
References: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918153630.2535208-1-dario.binacchi@amarulasolutions.com>


On Thu, 18 Sep 2025 17:36:06 +0200, Dario Binacchi wrote:
> Convert Rohm BU21013 I2C touchscreen controller device tree binding to
> json-schema.
> 
> Additional changes:
> - Replace <supply_name>-supply with avdd-supply to match example and
>   existing DTS.
> - Add reset-gpios in the example because it is required.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> - Drop description from reset-gpios
> - Re-work description of avdd-supply
> - Rename the file to rohm,bu21013.yaml
> - Add Reviewed-by tag of Krzysztof Kozlowski
> 
> Changes in v2:
> - Added in v2
> 
>  .../bindings/input/touchscreen/bu21013.txt    | 43 ---------
>  .../input/touchscreen/rohm,bu21013.yaml       | 95 +++++++++++++++++++
>  2 files changed, 95 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/rohm,bu21013.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


