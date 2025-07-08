Return-Path: <linux-input+bounces-13425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 210CDAFCFFB
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 18:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7F9D1C20D83
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 16:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475472E0B58;
	Tue,  8 Jul 2025 16:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgFHf4Yk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180BB2DAFCE;
	Tue,  8 Jul 2025 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751990527; cv=none; b=g5vFpbwZ06KoaIUH0zz0rx6vWijj108p3qvHu2X1NcpHKd7vuijXwG6WvYzn1DvgxVcDfiLlcl1R2JFkhqX6771feTGfA6JWKFQ6eCB4oGp7mj8DQwmsgF88HQD/B5K9xOZqpKe+w4NIIQQNso5Dzpn8ZVzsxliZBO8g+EKVEjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751990527; c=relaxed/simple;
	bh=GNssoeP2Eso0gHBb8ybVVDWbqf17VrAwWGD5GrJmy6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q42vinRfrUmakxqULwuIPKX+evSoJe18hp5byPdJi/5wbfDN+JH2ybEwLhSDu9VQkDDP3t1MyRZsG0bBfEfiFelUrsDHe6DbHYlgYpScxoa3f9msnqMNKDGthlhFHbXWO7DgrapebVXbs6BRP56NsVpFhtXZn7ip2eebrWGNtz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgFHf4Yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED3EC4CEED;
	Tue,  8 Jul 2025 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751990526;
	bh=GNssoeP2Eso0gHBb8ybVVDWbqf17VrAwWGD5GrJmy6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgFHf4YkTtH7jJRKpaadTtG8MfzhmmyzbI6KBFyBYEKq2PZqG+lO9LdAhSQtgRfj2
	 cIXlU9PoqkKgjEB/bVrnUnERYfWu+rFhZvvOdDa8bwLvsqwUuOsgR9qlOVtzpVdKki
	 rsVwSBbMxHArKhaLO/FmM6Y3WPbDjrzG9oyl4ZPA8jwxV0byIqz6m8258b/NiOm115
	 SsGtlepgoMPPixVBnk8Y3Dp+T4Lf10VwB3tXF45P627YUhyf/blh3km8lUJ1GNURyj
	 7BrZ4SoHO0/bLQcnp5Pfzv/o7+rH3ejyCNGjM1QjKwNY/fumYSMqqiC+/Uenl6SZn6
	 b9Ij2dPC0+UhA==
Date: Tue, 8 Jul 2025 11:02:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, imx@lists.linux.dev,
	Vladimir Zapolskiy <vz@mleia.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: convert lpc32xx-key.txt to
 yaml format
Message-ID: <175199052372.494550.3218968445396297857.robh@kernel.org>
References: <20250630163232.2839067-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630163232.2839067-1-Frank.Li@nxp.com>


On Mon, 30 Jun 2025 12:32:31 -0400, Frank Li wrote:
> Convert lpc32xx-key.txt to yaml format.
> 
> Additional changes:
> - set maximum of key-row(column) to 4.
> - add ref to matrix-keymap.yaml.
> 
> Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add ref to matrix-keymap.yaml.
> - remove properties, which already defined in matrix-keymap.yaml.
> - Add Vladimir Zapolskiy review tag
> ---
>  .../devicetree/bindings/input/lpc32xx-key.txt | 34 -----------
>  .../bindings/input/nxp,lpc3220-key.yaml       | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/lpc32xx-key.txt
>  create mode 100644 Documentation/devicetree/bindings/input/nxp,lpc3220-key.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


