Return-Path: <linux-input+bounces-7278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259F5999497
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 23:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 538741C22C58
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 21:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0110B1E1C15;
	Thu, 10 Oct 2024 21:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="rkVATVo2"
X-Original-To: linux-input@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A068F6A;
	Thu, 10 Oct 2024 21:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728596638; cv=none; b=eNSwq0xR2Cz25julH8S9zWwuFOkM4JlhH9aQcj4SHdQIT9yLixfXEMntXhYCWWgQeJRageSoiQrFYGbJG5q2Y9cKZAa8GfP6Mrdz4heu3bg1kapCq/7iVbun/zI8BSPFLYxYY9sgYBCPniFdVTE8N7Z3dsj1AVEWSDANR5Gqsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728596638; c=relaxed/simple;
	bh=qmJE+zI7QtpwT0cE99Cnl9iEZqZgilAzBRBG2z3fNLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tg1ByEYN/Ycw4biNWeOaUTiIDckd2q6I8yLTbiIJRxkqXBfo7JLenYauNrdpUsREoP1dm009KMFokPNSURaCuVApotillsrZU5b50BskKKM/eiu5PQnjSke7dAzwe2+5Ru0HkM9JjOaLXV41JFNcvS0AA46n+5hpCOxz4Ebx6U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=rkVATVo2; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=r3Nkp9Gj8T8WfCYEFphv8Ya8jzzbRgFqfm2KPRDOTH8=; b=rkVATVo2UmA8nQ2+t7XJgA+aG/
	nt5HcvlQlbiQL6mis0rnaJqY0PzW5cmZdBm5z/rBxDdWOckL+WqoNCwRVj3frX8yh7glg/9LZrmRu
	N9gWduCWmFEovGevkwwJRL7rpUO2JWRxwt33kbtTblOChoRt5im7x4bSCxOgRXOYD5I7kYyiLF3fL
	zrKR4CldEM7wgSit2LdDBGxy8FjFgMiS5iPCQ4WOu/ZqXB8X/A1lmXm2L6JuU/VOuuWao8JoW7Atd
	PSmL+byx8oERgJ2uPGPEeoOCnkDjwzOMBPmqGt6jWosc2kvpsRfjbUhVoOOOwa9Qw0HFCTz8sKXV/
	9N63mb0Q==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0wm-00000002YMT-4BoE;
	Thu, 10 Oct 2024 21:43:49 +0000
Date: Thu, 10 Oct 2024 22:43:48 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
Message-ID: <20241010214348.GD4017910@ZenIV>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Thu, Oct 10, 2024 at 11:25:56PM +0200, Javier Carrasco wrote:
> 
> diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
> index 20020cbc0752..bb1c732c8f95 100644
> --- a/drivers/input/misc/sparcspkr.c
> +++ b/drivers/input/misc/sparcspkr.c
> @@ -188,7 +188,6 @@ static int bbc_beep_probe(struct platform_device *op)
>  {
>  	struct sparcspkr_state *state;
>  	struct bbc_beep_info *info;
> -	struct device_node *dp;
>  	int err = -ENOMEM;
>  
>  	state = kzalloc(sizeof(*state), GFP_KERNEL);
> @@ -199,14 +198,13 @@ static int bbc_beep_probe(struct platform_device *op)
>  	state->event = bbc_spkr_event;
>  	spin_lock_init(&state->lock);
>  
> -	dp = of_find_node_by_path("/");
>  	err = -ENODEV;
> +	struct device_node *dp __free(device_node) = of_find_node_by_path("/");
>  	if (!dp)
>  		goto out_free;

Sigh...  See that
        state = kzalloc(sizeof(*state), GFP_KERNEL);
	if (!state)
		goto out_err;
above?

IOW, this will quietly generate broken code if built with gcc (and refuse to
compile with clang).  Yeah, this one is trivially fixed (return -ENOMEM instead
of a goto), but...

__cleanup() can be useful, but it's really *not* safe for blind use; you
need to watch out for changed scopes (harmless in case of device_node)
and for gotos (broken here).

