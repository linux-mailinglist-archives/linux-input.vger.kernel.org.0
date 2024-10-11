Return-Path: <linux-input+bounces-7356-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 234F199A187
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 12:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA92028151F
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2024 10:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFC9213EC2;
	Fri, 11 Oct 2024 10:36:47 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D442C213EC6;
	Fri, 11 Oct 2024 10:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728643007; cv=none; b=WJdDf7LATvmw+jDgkUgW7ngzw8eaiNu7xYXzbGfvo2itKkQWcCMtHt/XYhab6MHD9TYHKVa/XjqmRfi82cHYt/Y7HDRJ0uAcGgkAo9jaxW2zuawpZqnOt8cPuokQd0wK/cburnb4YfyxYkYnMVK3QsXzmAm/oSrrLKUle84JLO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728643007; c=relaxed/simple;
	bh=TU9LHxHjqn8IKiN109A3+LdONcDZtKY1Xv79JyQ6/O4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHXArJ0vcMfccDZQp4oj7JCOJUJSPuD+VBYDQzSgpje3hpTeS+gYZ2Us0HWR/ZIb6Jm+sT2qmXeRTQSpbf+LDo6B3mWH3HIIFcZZFcEr+0vA6cEMhO8a4p7C9k7i+vwNrooEPBlf3LldQJMVE/m9VN71dGzuMWg0mexUZdkHmGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBBCE497;
	Fri, 11 Oct 2024 03:37:14 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0EC3F73F;
	Fri, 11 Oct 2024 03:36:42 -0700 (PDT)
Date: Fri, 11 Oct 2024 11:36:32 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Hans de Goede
 <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Broadcom internal kernel review
 list <bcm-kernel-feedback-list@broadcom.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 03/10] Input: sun4i-lradc-keys - switch to
 for_each_child_of_node_scoped
Message-ID: <20241011113632.2eee613c@donnerap.manchester.arm.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
	<20241010-input_automate_of_node_put-v1-3-ebc62138fbf8@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Oct 2024 23:25:53 +0200
Javier Carrasco <javier.carrasco.cruz@gmail.com> wrote:

Hi,

> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Looks good to me:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/input/keyboard/sun4i-lradc-keys.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/input/keyboard/sun4i-lradc-keys.c b/drivers/input/keyboard/sun4i-lradc-keys.c
> index f304cab0ebdb..f1e269605f05 100644
> --- a/drivers/input/keyboard/sun4i-lradc-keys.c
> +++ b/drivers/input/keyboard/sun4i-lradc-keys.c
> @@ -202,7 +202,7 @@ static void sun4i_lradc_close(struct input_dev *dev)
>  static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  				      struct sun4i_lradc_data *lradc)
>  {
> -	struct device_node *np, *pp;
> +	struct device_node *np;
>  	int i;
>  	int error;
>  
> @@ -223,28 +223,25 @@ static int sun4i_lradc_load_dt_keymap(struct device *dev,
>  		return -ENOMEM;
>  
>  	i = 0;
> -	for_each_child_of_node(np, pp) {
> +	for_each_child_of_node_scoped(np, pp) {
>  		struct sun4i_lradc_keymap *map = &lradc->chan0_map[i];
>  		u32 channel;
>  
>  		error = of_property_read_u32(pp, "channel", &channel);
>  		if (error || channel != 0) {
>  			dev_err(dev, "%pOFn: Inval channel prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "voltage", &map->voltage);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval voltage prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
>  		error = of_property_read_u32(pp, "linux,code", &map->keycode);
>  		if (error) {
>  			dev_err(dev, "%pOFn: Inval linux,code prop\n", pp);
> -			of_node_put(pp);
>  			return -EINVAL;
>  		}
>  
> 


