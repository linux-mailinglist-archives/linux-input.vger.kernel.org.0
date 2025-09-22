Return-Path: <linux-input+bounces-14988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD62B932F9
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 22:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2387B2A44D3
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 20:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C050D3128A2;
	Mon, 22 Sep 2025 20:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVF7eqJ+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C40262D14;
	Mon, 22 Sep 2025 20:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571732; cv=none; b=RDjgALipyPpTuu6C+I+v3s9BW84iKhz9w+iD2X0Y8HyO2OfCTnz0Fv6SM0LGtVtOGAClNBRiEJNkJH38NrPgC0CS3BewTsVVdB/F9g4WhqSOKUiURzmIQhGGK5Acc3eTYNLnGtqqI67dwPD3FtaraCMu93J3Xn0fq5OCA5rL4wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571732; c=relaxed/simple;
	bh=vXR+SIgyngi5FXjFNHccDxieq20zbxVdVlrY1LjG2Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPfVgUQkgcOQGJ6UYxDXuDsEMrYfQqQqOzBAYP0BS/0IzN0B9Y7I1/C4iNUgR8m52xMX+HLyAYWPC8g3Q778tnxNbG9UE4hZjWfMeVylyGVLC5SgqfWStqUr8Sgv8MbCKTkQpnHBwPZqy26Po+UrigX2kM4ffyY7I/ChlkIcsmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVF7eqJ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D0CC4CEF0;
	Mon, 22 Sep 2025 20:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758571732;
	bh=vXR+SIgyngi5FXjFNHccDxieq20zbxVdVlrY1LjG2Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bVF7eqJ+qdlxxcKkZZyAYYtKX/E/7mkdO8rdzoam/9qBm1TSUwtStwp8isiMELHS0
	 O1ABJPtwoNpPkZNTCfqGlIcpssjW6NsTu/MCG4RUg/yrS+gcHoPlJg/HACjFf/C04v
	 bMAwnoiQ+i42AWkm4qew3U9pJyHRiiK0Sv24NiqWStEdTjZIzyFzT4HRluKpp/n5OX
	 Rqljz6LUifu4gEyKcXOSgX1U5KrcYBageExTSlJ5ovQ7Tvv8/H5Pe5ItWP1M46vEEG
	 EM2lQe96q0OPHjMjAbwyd9nY1D1QST/+FJ7SNE2pXfZsXjO1idd2pmb07TS9zNwAjN
	 t2EondxmRZN4Q==
Date: Mon, 22 Sep 2025 15:08:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eric =?iso-8859-1?Q?Gon=E7alves?= <ghatto404@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: input: Add ST-Microelectronics
 FTS2BA61Y touchscreen
Message-ID: <175857172963.1202003.18384257147106622567.robh@kernel.org>
References: <20250920014450.37787-1-ghatto404@gmail.com>
 <20250920014450.37787-2-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250920014450.37787-2-ghatto404@gmail.com>


On Sat, 20 Sep 2025 01:44:49 +0000, Eric Gonçalves wrote:
> Add the bindings for ST-Microelectronics FTS2BA61Y capacitive touchscreen.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  .../input/touchscreen/st,fts2ba61y.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100755 Documentation/devicetree/bindings/input/touchscreen/st,fts2ba61y.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


