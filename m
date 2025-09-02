Return-Path: <linux-input+bounces-14437-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5286B40EC6
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 22:48:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952EF17CC51
	for <lists+linux-input@lfdr.de>; Tue,  2 Sep 2025 20:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B43F234964;
	Tue,  2 Sep 2025 20:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgwxF5eb"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D01E5724;
	Tue,  2 Sep 2025 20:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756846105; cv=none; b=Oaa11fS3578+OF5y5Mi0DOR56stvQQDcMdEapgrBqsQU5KkyO26l7BWX65PjM9+eiYCQHtQp7CfqNaok0ItR3LiyJiPgRwW0lr8KLzROo4sP7o9oH8Flkwsl3DyNkuCJtAsxl5El1iay5Or7jB8/2LFmmGjUj35YNNxOe6sIp0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756846105; c=relaxed/simple;
	bh=BF1UlRBfAXJ+COkhQanN4akh+w1lkpAsK5URZNqoz6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT7D8JtIgVpUk9mR85BtkjsZ78jQ8SvTZaZU0ExnmPyUE/MeBmst0oXIVfQgXBT+2D3HakXfbfM9jaN3bBxNTB+ONMapdH+H4t/kqTjXRzuS3L/kTElcaHFN7AxDtcuA4A3h7+vU6wRZPt7mTpEvOpGVc0oKAV5hOaW5tOETzzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgwxF5eb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0E2C4CEED;
	Tue,  2 Sep 2025 20:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756846104;
	bh=BF1UlRBfAXJ+COkhQanN4akh+w1lkpAsK5URZNqoz6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hgwxF5eb1fMVlEEoLgJpaDREc/OBP7rjPjhpXHZ7pLVodPfhUQMfemaA/kPiZD636
	 AAeJCFMFQzvgBVSR3+CccixPKOjmqEmzbD4Sj+sJUW3zZAUnJyLNr24nicevgYTM6+
	 UoCgqcGo38y5Q+u7/fc4ZwtotWShbGm+E3bRbRVlvyPJGqYicyELtxMz0/RKEybzS0
	 RAkB0BB+6NswY0W7yN4X7NhOkpTgzEHtWMPoW490tdW1f4TJiBY0j2ttM19eMp/lce
	 6fDLeOeTJP7I8XonSnxnH2zZ0cVvP6Q5xrtdMxh5YDAPNohbhL9IrnZPoTcE0XIEMT
	 SSp+AZOpRP8+w==
Date: Tue, 2 Sep 2025 15:48:23 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v3 5/7] dt-bindings: mfd: fsl,mc13xxx: convert txt to DT
 schema
Message-ID: <175684610314.1158432.9313523448163469756.robh@kernel.org>
References: <20250829201517.15374-1-akurz@blala.de>
 <20250829201517.15374-6-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829201517.15374-6-akurz@blala.de>


On Fri, 29 Aug 2025 20:15:15 +0000, Alexander Kurz wrote:
> Convert the txt mc13xxx bindings to DT schema attempting to keep most
> information. The nodes codec and touchscreen are not part of the new
> schema since it was only briefly mentioned before.
> Following the convention, rename led-control to fsl,led-control.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 218 ++++++++++++++++++
>  .../devicetree/bindings/mfd/mc13xxx.txt       | 156 -------------
>  2 files changed, 218 insertions(+), 156 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mc13xxx.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


