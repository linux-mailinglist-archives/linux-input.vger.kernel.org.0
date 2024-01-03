Return-Path: <linux-input+bounces-1093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5C823959
	for <lists+linux-input@lfdr.de>; Thu,  4 Jan 2024 00:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD009287E2E
	for <lists+linux-input@lfdr.de>; Wed,  3 Jan 2024 23:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D331F934;
	Wed,  3 Jan 2024 23:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="np0VSpLy"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646311F926;
	Wed,  3 Jan 2024 23:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11688C433C7;
	Wed,  3 Jan 2024 23:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704326048;
	bh=9s5fRqM0KzWJlTNCi03Aajq+x1qza5AvN+8XNuHKzsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=np0VSpLywC4tkowlFzakP5ZavO4x7mpGN7zx/fblF+e8/RTcUSmSb/gItQajT7Gn5
	 6qMvLN8aQajjL+fX/OfWineJ9Q6f1TCWF/KmVyh/SQwYESqNoEFYqn30IlMIZQZ5Cw
	 YByhPnnJgQSerxV6ZuHRjBYVesvU+WZqDQGmJTrMOBb7Vr/OCrwb9pQuOR+DQopjn7
	 ZOlWh6Ua1jW2pYZ/UhllYKJbvXcSgPYTU8DscugKS2vHjo2VJYdg4PzfPeT+ktZGRA
	 wWXBEFjS+Te1ec0f2Q/YwyAyGZtqIYmjTsK4J4hkt6j//oYpXHfS1sq9TRCzkwzwiA
	 88w3v8K06JSig==
Received: (nullmailer pid 2037330 invoked by uid 1000);
	Wed, 03 Jan 2024 23:54:07 -0000
Date: Wed, 3 Jan 2024 16:54:07 -0700
From: Rob Herring <robh@kernel.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, Bastian Hecht <hechtb@gmail.com>, Michael Riesch <michael.riesch@wolfvision.net>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/4] dt-bindings: touchscreen: add touch-overlay
 property
Message-ID: <20240103235407.GA2036885-robh@kernel.org>
References: <20230510-feature-ts_virtobj_patch-v6-0-d8a605975153@wolfvision.net>
 <20230510-feature-ts_virtobj_patch-v6-1-d8a605975153@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510-feature-ts_virtobj_patch-v6-1-d8a605975153@wolfvision.net>

On Wed, Dec 20, 2023 at 09:39:43AM +0100, Javier Carrasco wrote:
> The touch-overlay encompasses a number of touch areas that define a
> clipped touchscreen area and/or buttons with a specific functionality.
> 
> A clipped touchscreen area avoids getting events from regions that are
> physically hidden by overlay frames.
> 
> For touchscreens with printed overlay buttons, sub-nodes with a suitable
> key code can be defined to report key events instead of the original
> touch events.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> ---
>  .../bindings/input/touchscreen/touchscreen.yaml    | 119 +++++++++++++++++++++
>  1 file changed, 119 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

