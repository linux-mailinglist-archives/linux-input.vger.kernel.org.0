Return-Path: <linux-input+bounces-6027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A89665DF
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 17:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC33B1C23C74
	for <lists+linux-input@lfdr.de>; Fri, 30 Aug 2024 15:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038B01B790D;
	Fri, 30 Aug 2024 15:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcNUeDk4"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C81B790A;
	Fri, 30 Aug 2024 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725032369; cv=none; b=SGkx5NEJLSkO5rBudM+/DZHvWDQK5ZoEDxIyyFtb6giB49QozXc9PkfylwUz2kf+2C/f/hSaYF40mdceLeTNRjBM+vvKrrSbFoAqb/Rk3yJOXxd5Zmqio9XFQVJAKxedSpFkN9EbF3C3791firGP8n/kmFyfd2/6ykXvw8tJH5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725032369; c=relaxed/simple;
	bh=9vHiUqg3ApyNG+2sA25nvEMVkVkFkPbc2lr9nngHSZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghKy1O/+DrbFbxAxIf8/lcB8Thsph60TJfXF0Ya+WnTeiS73eDtOIsBgOJtY5McwXiKcVLenGyYsdjIVfZqIp7gH36YlkbjEdEeykVSWROZnu51+GHc7xve3ecr8CNqtXCMMwB1xdMn0HZvZRnrfqx16uk2uDUF8JqFuiKhFA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcNUeDk4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CACCC4CEC2;
	Fri, 30 Aug 2024 15:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725032369;
	bh=9vHiUqg3ApyNG+2sA25nvEMVkVkFkPbc2lr9nngHSZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcNUeDk4etZAwFjcxBBZl6FfmF6vg6QUcnkNUqcn9r1msToyyqhM0gqGu+fZqs21s
	 p4VXv1okuGY6JJr4FTTaTU2wNuCh7qXXcETjkIrrEu+VzA2dqEXIph2w5iCA/rGLgE
	 OeeCXrooVUJCK7t3oVvAFaGmGq1vq4cb/QM+Gh8QJrH7Ld7TOYCp5AWiXFbXl7paSk
	 4OOdx6W4eYeuME8N6kY5LsKZo6JqYI3kz4Y+PXElQ4Br7YKpVZ9TFV+gJ+8UFaD0xq
	 GwjUN3mW2lkC411pXMLL3AuebrmgmkgTErlkUYPTMht6Rbh4ofYmnrNEhR0Wi9YdS5
	 HplRsKeCIWgEA==
Date: Fri, 30 Aug 2024 10:39:27 -0500
From: Rob Herring <robh@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: dmitry.torokhov@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] dt-bindings: input: touchscreen: goodix: Use generic
 node name
Message-ID: <20240830153927.GA36571-robh@kernel.org>
References: <20240829183051.3392443-1-festevam@gmail.com>
 <20240829183051.3392443-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829183051.3392443-2-festevam@gmail.com>

On Thu, Aug 29, 2024 at 03:30:51PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>

Why 2 different subjects for the same change?

Really, both of these go to the same maintainer, so they can be 1 patch.

> 
> Node names should be generic.
> 
> Improve the binding example by using 'touchscreen' as the node name.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> index 2a2d86cfd104..eb4992f708b7 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> @@ -69,7 +69,7 @@ examples:
>      i2c {
>        #address-cells = <1>;
>        #size-cells = <0>;
> -      gt928@5d {
> +      touchscreen@5d {
>          compatible = "goodix,gt928";
>          reg = <0x5d>;
>          interrupt-parent = <&gpio>;
> -- 
> 2.34.1
> 

