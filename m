Return-Path: <linux-input+bounces-15631-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02882BF6C97
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 15:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E225541E48
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 13:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88F6337B81;
	Tue, 21 Oct 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7Ebn+76"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BFC1494A8;
	Tue, 21 Oct 2025 13:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053454; cv=none; b=qeZ6fXhqaZgzm37JRgPbCj0CxiwJ5ZQpx3jL226kJvu6WlOOiLS/Ipz5jnnFTf2Ho3INzJsTb3fgbmQu8X5sPPknMHhsJTMEKWYvpj4xFkEY6XMLY/+kS4I6Up+lFuiCdLv697o0jWUsRZjhhg1Or+cx61JYwvhHF5rSzLY6Lzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053454; c=relaxed/simple;
	bh=hriMGMMC3RvKp1nHkklwY4nn4L/Il49ifIsSMYBa0Eg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XNhnWicLp5bMTH98TwlvmsLehrLN9x/a8yY5qiMBpCX2OffRkNSyYdfn1f96pEhXtRYIBktucIYc+aCVn3woJBg8su2uWUMNvdL8kDdof5OmRz/jE1oxlUBRjoPfAPJ6knwV/uknS44PNQQkXN1ZqhUrcylqV3V0g3rCiiSnZgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7Ebn+76; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD4EC4CEF1;
	Tue, 21 Oct 2025 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761053453;
	bh=hriMGMMC3RvKp1nHkklwY4nn4L/Il49ifIsSMYBa0Eg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7Ebn+766/nJF4hc97qZmJNwX6GMK+R5MgeSt+6Ci4qXPtAu4D60iXZWIANcEoswt
	 hhzPYH71zFcwWsOd5nAyh9zk96iHKmDdtYWqD7+zIeNXYJcKGi/9/o14/2Pleyh8u+
	 mbjp4fpY/qP2QNjQqs20NQ6pRt9NswYIhiY45/w/3SJdsiD3y+VrtQglyC0hKVvgPS
	 FQufaXtvRm+81kxopFSZ9OPwAyL9qUUtFI4pi0eyBpBkrh6Dhc4afHmnaYtyye7JXs
	 wj/2jE1L+bTSPGUlJu+HVkC4X/yxwCKEOvhADz3RT38gQdIirU+Bk8K/tgLuL98gPW
	 k4jK0GJVqnsyg==
Date: Tue, 21 Oct 2025 08:30:51 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: dlg,da9063: Allow wakeup-source
 property
Message-ID: <176105345091.18369.608771207114804594.robh@kernel.org>
References: <20251014184531.2353879-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014184531.2353879-1-Frank.Li@nxp.com>


On Tue, 14 Oct 2025 14:45:31 -0400, Frank Li wrote:
> Allow wakeup-source property to fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


