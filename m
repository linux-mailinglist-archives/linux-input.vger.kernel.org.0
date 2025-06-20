Return-Path: <linux-input+bounces-12978-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF360AE1482
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 09:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5960A4A0CD3
	for <lists+linux-input@lfdr.de>; Fri, 20 Jun 2025 07:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87BEC22539C;
	Fri, 20 Jun 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7uOevqk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7561EB18E;
	Fri, 20 Jun 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750403176; cv=none; b=iWaYvIvj85WMhoFPLuVxhhsb/P2UFSSGVqAlUCjNN+hr0P2LdWVwkWG45WgNkHmRHL3p3Rupyk/O8iUJ+KLe8ekm9uJTkBbnv2KfhyqJYRUsa2N4PMqGani1CfiDSQthsiFGSCyi2KR4XhjTe9jwfQSeKby6gSO7qNIyueB05vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750403176; c=relaxed/simple;
	bh=ZmB94+BK+h98Qmw+z0cuJ6eJYYzymY16nocCy++VYes=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Srx2l86hChQA+eVeVaoSQag+fJY6/hlKBni/1Bj+KMWntoGYx4V54g9+Eeq7c7mU86EbRUV9uw1hiL28hXRVQCwOOlg48Bsq9YU209dPK1MKtjsxOi1gL7zFToUA86ckGrERoCSzSbMByifgAGujzFLkE5vYoiEw8RXu2INjnIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7uOevqk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8C7C4CEE3;
	Fri, 20 Jun 2025 07:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750403175;
	bh=ZmB94+BK+h98Qmw+z0cuJ6eJYYzymY16nocCy++VYes=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R7uOevqkD6qzeZa5eKtIDiIlf4AKih7NaLWiGfJnLBJi7/FPdpWAvoDIY4xdZOTgg
	 t4Uifb+9++bpYKkk2K8NreD1qoLEZAMBQ0FtH/RuJAeN4DwOSJzv4OS6spJIF8osnP
	 4b4BDiaPYdF+uYLh9ZI81GuV1cy5EQEIKut+l6url33qb1ePdCBu9OCPzs6aQZuNuZ
	 M/r8NzqWgBWdolSCwBHx8HqVufbFrizIjabw/ccNH8wAFBWZBTXl6ySSbm2RHzx8BP
	 JYt1MKmv8rnWhLXrBF7pSKtvfNYj5tjYsB48iYRx1wSeurZQoGulpqIi2y0Joq83fW
	 IK+W0/PX3Q5Xw==
Date: Fri, 20 Jun 2025 09:06:12 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] HID: uclogic: make read-only array reconnect_event
 static const
In-Reply-To: <20250619083456.1835598-1-colin.i.king@gmail.com>
Message-ID: <r9n8r361-231r-5p3n-5377-83pp55662312@xreary.bet>
References: <20250619083456.1835598-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Jun 2025, Colin Ian King wrote:

> Don't populate the read-only array reconnect_event on the stack
> at run time, instead make it static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/hid/hid-uclogic-params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-uclogic-params.c b/drivers/hid/hid-uclogic-params.c
> index a6044996abf2..b3d56057cec9 100644
> --- a/drivers/hid/hid-uclogic-params.c
> +++ b/drivers/hid/hid-uclogic-params.c
> @@ -1341,7 +1341,7 @@ static int uclogic_params_ugee_v2_init_event_hooks(struct hid_device *hdev,
>  						   struct uclogic_params *p)
>  {
>  	struct uclogic_raw_event_hook *event_hook;
> -	__u8 reconnect_event[] = {
> +	static const __u8 reconnect_event[] = {
>  		/* Event received on wireless tablet reconnection */
>  		0x02, 0xF8, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

Good catch. Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


