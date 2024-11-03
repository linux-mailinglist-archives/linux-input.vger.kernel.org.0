Return-Path: <linux-input+bounces-7842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0314F9BA50D
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 11:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DDA61C21013
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2024 10:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA8915E5B5;
	Sun,  3 Nov 2024 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h0zlCWnO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ACD2572;
	Sun,  3 Nov 2024 10:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730629176; cv=none; b=fcUaPVbBi11QoP7EutCu1GBDrj19FSYYGh6m98TGbXT7/sEL2bT6wfAftmW2HwTS5iXX0tCNhYZlO5s+pNvBJjek75DnDme6s0qbpBM1PKr9MrOe1AKcgksIGNkYAIFgNDy/PAM41lD04axPqtcW0LCJIfRLhDjNC+f2n3E6Wgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730629176; c=relaxed/simple;
	bh=KZEPncbdeJpOluPb98MVocV46aYGZn03YSDa5Qrqj9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzqeR/QGpah2iUvYdOgunp7wJS+2kiukHQOVftoyDp9QxRy6ni/7bQLysrpSr0yQyljOWbJuw5hcM/BGlG8lvKreN7HW4j0jF/RQaOI4XILLQUI/fgN6DiQU0DSWUcvAcybkw/sItbgvLkBL2AYv3E775kYhB5RQqcK3z8woiXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h0zlCWnO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0B4C4CECD;
	Sun,  3 Nov 2024 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730629176;
	bh=KZEPncbdeJpOluPb98MVocV46aYGZn03YSDa5Qrqj9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0zlCWnOzPD7y5gzayyvwgxLvJn6OSEK4BquBWyMjmS1m1KSffX8z4jDsDAdJrxgA
	 sNUVMybmWJ0SqIaehFpERP3BoJ4mmKeES93OznYxtVlhx3qamVqBhPhgYNX2BDvWnS
	 kkH2E7yz0SdFb2grVtayrM6qKu9yCKc+aKP/QKAKWuvAHmycJwZYWsgPOPbL/ZNo2M
	 3zE+7VfJwLPQCO7EA6zY34aHbTXZP75cJd3b6Myt78OJVH9hxyOhgSlFdHuDzs0RVR
	 GU7LHmohG5jXJO7/9N4r+ozDyHUnDesmMX3HBGsh0bpCca2fGboUBB0IT67LlOd+Hs
	 CNMjFqPJJ9Ztg==
Date: Sun, 3 Nov 2024 11:19:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: rotary-encoder: Fix
 "rotary-encoder,rollover" type
Message-ID: <vn6j22m6lq7yo2k3meliiwwh6d4n2cs3psx34zpbnfvnelv64l@f2ugf6ytqxle>
References: <20241101211304.20886-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101211304.20886-1-robh@kernel.org>

On Fri, Nov 01, 2024 at 04:13:03PM -0500, Rob Herring (Arm) wrote:
> The user and driver both indicate this property is a boolean, not int32.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/input/rotary-encoder.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


