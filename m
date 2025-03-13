Return-Path: <linux-input+bounces-10798-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D145A60427
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 23:18:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D4CE8801A6
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 22:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA921F540F;
	Thu, 13 Mar 2025 22:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hx2eAp6N"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87731547F5;
	Thu, 13 Mar 2025 22:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741904284; cv=none; b=Mimmq+EZ+BvVTN5sy6K0uRKvHS1waEtWcIibAfc+/BihOBq4Ml1q94S1vudS6/AxiDEOXoMZ5rYpdxq99nOWaQim7e3ap1+WA1AT4aQvOOi0pbKHNV8BgnyY17EF6Vx3rtHBZeWtvHBBoLm89CrAO0JZzSzizJA9B2eJ9JStltU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741904284; c=relaxed/simple;
	bh=G+k8W9zHeHYSSW0OTIii1tmsp+qGg3JGhVpRtDetg3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSsN8vFUJ+Kseee4fWpQtSBVYXveYYj3a/siYlF7fRGOkppsQHOr7gkhn7l5MYJvtj8wqvhLr7CKDAeUhavTqJqExhLNTP0+IAYO9/zWuiwjGopgB7Uoh7m5ef9KO2kbjnQ7MnC4uPXQLUbOqeTZCgNdf6kdiU3EoX9Xxt/b7L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hx2eAp6N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA32C4CEDD;
	Thu, 13 Mar 2025 22:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741904283;
	bh=G+k8W9zHeHYSSW0OTIii1tmsp+qGg3JGhVpRtDetg3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hx2eAp6NNP9d3ITlUGVdDDOc+WumwlIBAQIQpQJ5Ym3WjjAfE0BfmK24E06yD6twA
	 pNZUu/5TZA1YWj+dpabluNYTmaLndzDH1H+0IZUxlONIlKBrxcEUMQ8+1xBnNfl49m
	 bA84F00SJC5gd7dafCpkbHeyKDmb0tls2Kf82Eq8aTrLgJKpFdZXKzVFHINUBucJGP
	 E0qxRYNaC4gOOFTHK1gJRWcf6C93Q9Ag9XIrQGpaYVfhcYbkPx7PqcixrrcV36eoFM
	 lP3TR2+2UeVT8annfLAJEg1qbSxHbWhJ+Tg1VhyBeKsKhyGYyZ5fwqSK+m/AvvxEz7
	 WlZMhLT0LSGCw==
Date: Thu, 13 Mar 2025 17:18:00 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: foss@joelselvaraj.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: input: touchscreen: edt-ft5x06: use
 unevaluatedProperties
Message-ID: <lrgjgfupvtceac54tag7rn2hgglgaogic2n33q6vshbvv5exgq@eqefsbvvdkdz>
References: <20250303-pocof1-touchscreen-support-v4-0-cdc3bebc3942@joelselvaraj.com>
 <20250303-pocof1-touchscreen-support-v4-1-cdc3bebc3942@joelselvaraj.com>
 <Z8fzD-aF-hN0PeyD@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8fzD-aF-hN0PeyD@google.com>

On Tue, Mar 04, 2025 at 10:45:35PM -0800, Dmitry Torokhov wrote:
> On Mon, Mar 03, 2025 at 04:36:55PM -0600, Joel Selvaraj via B4 Relay wrote:
> > From: Joel Selvaraj <foss@joelselvaraj.com>
> > 
> > In Xiaomi Poco F1 (qcom/sdm845-xiaomi-beryllium-ebbg.dts), the FocalTech
> > FT8719 touchscreen is integrally connected to the display panel
> > (EBBG FT8719) and thus should be power sequenced together with display
> > panel using the panel property. Since the edt-ft5x06 touchscreen binding
> > uses almost all the properties present in touchscreen.yaml, let's remove
> > additionalProperties: false and use unevaluatedProperties to include all
> > the properties, including the needed panel property.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> 
> I believe this is better be merged through the arch tree together with
> the dts changes.
> 

Then I will have to come up with a motivation to why it needed to go
together with the dts change ;)

Please pick the binding change through the input tree and I'll pick the
dts changes once the binding has landed in linux-next.

> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 

Thank you,
Bjorn

> Thanks.
> 
> -- 
> Dmitry

