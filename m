Return-Path: <linux-input+bounces-14001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681BFB26015
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 11:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 062E55C6566
	for <lists+linux-input@lfdr.de>; Thu, 14 Aug 2025 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2E72F1FCF;
	Thu, 14 Aug 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rPSIh2Ku"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5115E2EAB9F;
	Thu, 14 Aug 2025 08:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755161899; cv=none; b=Yg3DEK/izOAKAo9/PtwFrnZaT3jKAKvDhwW4VzwQx6CJCW3HGamGt+ycjvhqhUmCNaLYw34cVWFZvBrvzQUSJwkCoRKNu9WayrD0VaqXKUTgxwLlkplKcaQl2DLOJl2CWCilLMBB9eqf58o3HN/UnJZeWIIu6lYOwkSNsYPP6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755161899; c=relaxed/simple;
	bh=GuL1Hse2Ki00iXfGuSOwPw/XtYWtBN7xjmr/UregXvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBGcI9lOprYmYss0lfGXfTKsvJ7D1sgylzMGdlcwei0fs1xnS9NRSBYljp3d5DmcRBW9HdNd9WdFhQssXfpqHnANCCgLtpvWMADNqprhq+9HAyLUyxorU4wio+NNoJJKPRi9m5vh9pKjT+P7ESEyFgdzgYfZ22qwqtkQLbpwFMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rPSIh2Ku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44569C4CEED;
	Thu, 14 Aug 2025 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755161897;
	bh=GuL1Hse2Ki00iXfGuSOwPw/XtYWtBN7xjmr/UregXvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPSIh2KuNhmXneqY9TqE16P/N2RZMKYjt2h0b4AoLN9uuoU8iosTCRdrcQXqryaN7
	 2f8lJzPNVNe8WclayI1eRlcif8y1J1Ip/r4zXyefQE+4Q5c37ZOyZ4lkpSVkFwSiLa
	 DvJUnkyHCxmQ7qZxUyRqSsUK2JJbLeA9aQIL1qTvWhPOvlwflLyurfZBP6ECXPDa8Q
	 nUuZx+LlAmuyBclwOJpnkglt5BzL8eCz1+5yjApYgth+a0MW/JGGWYL6kKzfqWYGT2
	 iHwgicg5ksQJNfkxeAEESLZeqknyQP9JlEUjGIzO5kp+KLJ81O5pmXsUtEdF1kYFcS
	 S2DP32bXYTQ8g==
Date: Thu, 14 Aug 2025 10:58:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: input: Add bindings for Awinic
 AW86927
Message-ID: <20250814-towering-rough-raptor-f4dc2d@kuoka>
References: <20250811-aw86927-v2-0-64be8f3da560@fairphone.com>
 <20250811-aw86927-v2-1-64be8f3da560@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250811-aw86927-v2-1-64be8f3da560@fairphone.com>

On Mon, Aug 11, 2025 at 01:12:01PM +0200, Griffin Kroah-Hartman wrote:
> Add bindings for the Awinic AW86927 haptic chip which can be found in
> smartphones.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

If you are going to send new version, then also:

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18

Best regards,
Krzysztof


