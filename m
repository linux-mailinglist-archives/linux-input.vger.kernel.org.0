Return-Path: <linux-input+bounces-15347-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC42ABCA89E
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 20:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A8233A97BB
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 18:09:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64BBE23B638;
	Thu,  9 Oct 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pvMKkk1i"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F821CC79;
	Thu,  9 Oct 2025 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760033385; cv=none; b=AmGem3CU+IwXdegALc+635/RGqpWtU6oeKQBvd+e/EfXYSgsbqJ499viKPvXWn1foa0Pas4CMBu9l8q8jD54s0dvP3h+Aw8K98ZqTWCbA5MdlErVknMdEiRP0MDnGfLIWTUPk6Bu89aA1tdVZQq/X83hDumVyCh/SPz8mtc26ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760033385; c=relaxed/simple;
	bh=psvimf+4cjW7hPjOn60sEi/4pOZWektq7cE4LAxD4zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC7x/i5BZ2irjCGy3bKrgaXIPg3EdNRfreb6jTEHOd+VmueLyEbJSfMux+kUNMCqCcV1iNpCwT+R5hg2s3kMdVv3SBgSeYWrPD/Ul4Twxaz2H1lEfNJDAkdpq8ZdJaFreuNu2I+b7CHCSIlQ/4Por0tym3cGfRIxBExiwLmQWwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pvMKkk1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 766FDC4CEE7;
	Thu,  9 Oct 2025 18:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760033384;
	bh=psvimf+4cjW7hPjOn60sEi/4pOZWektq7cE4LAxD4zg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvMKkk1iRErlySrdUlHzDpptMFJ1onkO5o9WXKMiKn3BbQ+xfvWuQSTSF7FphQQqQ
	 8nnGsXp/RqZ4vQqnU8i0fPVVAjt9QSXGSYmENGs2MJWYlqjuLIBQYVG/Cuv182+tFP
	 cAlmugZqnyyTqLp2MwQKx3+4CebkqPu6+q4IZ0boN78QSQwg60gWuiLJVbsE6Ce1VE
	 LSwao3E2U933Rt2far7sdABZHIJ6nLDaa6uiRdD5BgvLThPCPGfvZR7UIa+k4alPb7
	 w1yf/RQVAhcidJC3wKm+0umGbeVgI5y3Qy0GtrZJD6wJZpagBkC/z6drAS1R4mbmnn
	 fRsQR94YuuDlQ==
Date: Thu, 9 Oct 2025 13:09:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>, imx@lists.linux.dev,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: touchscreen: consolidate simple
 touch controller to trivial-touch.yaml
Message-ID: <176003338269.2947376.2853814079058891968.robh@kernel.org>
References: <20251002164413.1112136-1-Frank.Li@nxp.com>
 <20251002164413.1112136-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002164413.1112136-2-Frank.Li@nxp.com>


On Thu, 02 Oct 2025 12:44:05 -0400, Frank Li wrote:
> Move ar1021.txt, azoteq,iqs5xx.yaml, himax,hx83112b.yaml,
> hynitron,cstxxx.yaml, ilitek_ts_i2c.yaml, semtech,sx8654.yaml, ar1021.txt
> to trivial-touch.yaml to consolidate simple touch yaml binding to one file.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
>  move more files into trivial-touch.yaml
>  don't add rob's review by because big change
>  prevous discussion at
>  https://lore.kernel.org/imx/175937443731.2982292.3723741722041625819.robh@kernel.org/T/#m35cfaaee8239b7a9aad3354b80de5f44d267c2e9
> 
> change in v2
>  move to trivial-touch.yaml
> 
> previous discussion
>     https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
> ---
>  .../bindings/input/touchscreen/ar1021.txt     | 15 ----
>  .../input/touchscreen/azoteq,iqs5xx.yaml      | 75 ------------------
>  .../input/touchscreen/himax,hx83112b.yaml     | 64 ----------------
>  .../input/touchscreen/hynitron,cstxxx.yaml    | 65 ----------------
>  .../input/touchscreen/ilitek_ts_i2c.yaml      | 76 -------------------
>  .../input/touchscreen/semtech,sx8654.yaml     | 52 -------------
>  .../input/touchscreen/trivial-touch.yaml      | 31 ++++++++
>  7 files changed, 31 insertions(+), 347 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


