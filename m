Return-Path: <linux-input+bounces-16702-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB1ACDFC9D
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 14:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06EC13004F5B
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 13:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA3A217F55;
	Sat, 27 Dec 2025 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5duHaeO"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AFF20DD48;
	Sat, 27 Dec 2025 13:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840654; cv=none; b=sIG12uHn+4Tq07N4Fl1TFQ3fdoJCTYYZs45MRBL/szOPza4wCylTswa/2VsKWhm0nZ8a3iJEqKbzMnuMfXQ661IDgDgYuY6OlIc4/8jU3SuEqV+FLcq1/I0U5hgkTtTwhuEQVBIh0fIS8P6RwE06qp0fcmLjQFWhx+dKSQwMO60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840654; c=relaxed/simple;
	bh=Z1kcZGRyt20iQgSjAx3zYm9EN6LDAbyS0WUMqu67fas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOpxVJyy7EPi0PyoVvKbMtZej2DjWb/VDuLgE9VG6OGa9YhW3VxEFUF68ego3Md89/GRb1rD/BZaTf/nuBdoVoFZ4jcTdEXdfh/ntTqaadt6e/olMV/CL7Tc+mZpiotiKDsDq9H6Gbf5id9NoJ48e8IotRHnsdOwxEA/6n2FgIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5duHaeO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B3EC4CEF1;
	Sat, 27 Dec 2025 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840652;
	bh=Z1kcZGRyt20iQgSjAx3zYm9EN6LDAbyS0WUMqu67fas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5duHaeO30JORRORz3Qx2RLTHZVod5XqCn5PIoxISe+slk72Wg/XtQpiQqdhKU8mE
	 1fmlx2CS7BYzH74cI7Ont6xv0pqf1Z221t5vtxr4oN2zfYlIaN7O515lbwKYSv7tAv
	 DPyd6O+bQOYXxHmMsjs9MZtwj7ev7qyc0wzwtJtVSQDc3TZ7WB4MQc+DQBu266Hnlq
	 48o0NojCZ8GZ0oPCTt1jwRY6sbjq4OGPpzwZyHVdhMavVu0t9RdLfotzEbfb7WYIyo
	 nlxRD4cmjRDGqL9WdcEf7Eg73/UnTwTM06DbUdq+Zo53sCm8MTHoTPXo6km4jLOT3w
	 9akZ8PSSBu9uA==
Date: Sat, 27 Dec 2025 14:04:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raymond Hackley <raymondhackley@protonmail.com>
Cc: linux-kernel@vger.kernel.org, Markuss Broks <markuss.broks@gmail.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: input: touchscreen: imagis: allow
 linux,keycodes for ist3038
Message-ID: <20251227-serious-ultramarine-puffin-fba17c@quoll>
References: <20251224100941.3356201-1-raymondhackley@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251224100941.3356201-1-raymondhackley@protonmail.com>

On Wed, Dec 24, 2025 at 10:10:48AM +0000, Raymond Hackley wrote:
> Imagis IST3038 provides touch keys. Allow linux,keycodes for ist3038.
> 
> Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
> ---
>  .../bindings/input/touchscreen/imagis,ist3038c.yaml           | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


