Return-Path: <linux-input+bounces-16537-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C111CB4EF1
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 07:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A77BB3046981
	for <lists+linux-input@lfdr.de>; Thu, 11 Dec 2025 06:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770902BDC3F;
	Thu, 11 Dec 2025 06:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ux3Boi1R"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400FF29E11B
	for <linux-input@vger.kernel.org>; Thu, 11 Dec 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765435773; cv=none; b=i2T8mpCNaZSqHlgR20yIIjN5LcZwXD4AdTS+EDhWc/ccuG+dl0XJvOq8CcF33OGWBamz1fZS2MbzZml9VbYkvOt7S1dBrz4wx6bUgq/FMP37flD3cOyj/gaY9t7hAqlV5PxjPToMLq345KDuA4LIz6eZn9en5yXtUQM4vMYQHss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765435773; c=relaxed/simple;
	bh=St5P/dKbzDpzDcZYqoy/Tl1MQ0rf5fYQKRZAJ31LVaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9je6qFQ2o9W9MRMOj0d3X1vD9ZyuLOTLAK1QcIY9AY26DnGyeRNoizPLWnoeDPx7/dpt6A4TNZuHzLNhCp04XUvORg9e6yundoL6gpc2wo/lxBDDlNFJ3ti+FTKQdN5J2fu6KEBF8YVFzw2UvZSydFw4zkxFqQ6aP+ET7RX46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ux3Boi1R; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-34a4078f669so718819a91.1
        for <linux-input@vger.kernel.org>; Wed, 10 Dec 2025 22:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765435769; x=1766040569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvqvRKg6Dvm4JYTqbcpJmcxvj5YVSJwC2ID5rS1kYns=;
        b=Ux3Boi1RJtJkm4EKbwkd1TdKIUlssLr03nVEJpWhDJi/DHdIulpYzI1rLQL/kolX++
         zWjmIPlSHeTL3sPm8RPn8la+UTd71tOooPd0mdXQ0sADyMStR83wynd9RZ0vTYmyyeBb
         M9lYT1dRZMLzucoPWjiG2kOIDNpSsYSoI8coZq6PK+OtAsCW3jHAA9emiRs0LjXEAZMt
         n58YEgbsx9U69XvTfQ0MvmU+wpNRujfS/tGiszkUpK8+AEpyBlEqFn4/WkNW25rZlra4
         UwmzgU89xhfM02rHCb2zmq30AbU19IlQlr+vVoMkt/CZSfMIrx5rPdTEArXPc6pbn1Rs
         /nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765435769; x=1766040569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvqvRKg6Dvm4JYTqbcpJmcxvj5YVSJwC2ID5rS1kYns=;
        b=d+P93Ysmp85onqOape8eimNZFvFnDnqCNB5rUYFIT2S11ez7KgBhPoQiUW6vIExLS4
         c9jyAO96F7hNcN+U6jN13QO3qrA9nUJJJYHeRe+g9zHQa0iAq2lyAJAFh/1chsIFeZN6
         BhHgfder90/ZPikVnxQp1MuLfVmh09VXt2CWUEP62uwjQ6NlOmDwE0S6lhS8KvWCz5k7
         aRWPFZpa0SKMN6FKgyaO3ZDDCt0JsgHrFim+nyUDzkErJ3w7w89/Gj45QJCXuSaJMBrn
         tGRvYHsA3fg/deCbPRIBwMaFAhpSEymgVO8zbOXx3DQE/2/edeBP/CocM9w2T/bs9EVa
         wNSA==
X-Forwarded-Encrypted: i=1; AJvYcCUiYzXP4UmVexfaeGkRfN5evHxIUq3AtTImiK0q43mxa8aD87ci3RHox4zXQtJ0FYmuP2HkpMt3AG3IVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPL9pn8itPEHV8O0hrCB1IlifW59SjPn7ZjR8nr4KGQEAToaI
	gBIxhG+9nFI07ITd+EH7NiDW82wvLkAvQ9J/cz61GIkilgeJWSyIEz/u
X-Gm-Gg: AY/fxX5v3riWAuzANHszpdUgwSsAvz9jZv2aT900Z5yOecpa+kMU8wUd0FSYPb3hLr2
	sfqma42Yq02kkbFNMmpEzlNX60G3JbAli0vBJVBc2mIiiLHhaGxr/NOfDAHAa9FrQ5+PYG5tNgr
	xz5JaR1yks9kfEYwqD6e3AOiFA4Wcib+fdv/mW74Wf+JiyCOvcOLnWnVCb70aSaHEb2G9BoR5DF
	Xx25OpY5jLCM6V2N1BvqWhRsUMtyoV9UmqEuFy0DXJeE/kc9hZ6OYk9SR0Dk5pzTlG0DAF/DzJ1
	UK7qK3aDyzTxWtchfd8kWNbIkZQdU0jOlcpCNRrftgkExa42+dM3bf732pJZy9udXvEc8Mv62IA
	/5jgUXdVcGcNgugMeTWAuaaRG2Pw6A2gZeV61mNzkSdYdf8coOcUSdxffYmMSLvT3GDDzXPcQlT
	H9Gq2hTr9YqbhDo9/rhzMtN1/ZFcQTJYnBXsh+izdEAc7RlRwwUdk1
X-Google-Smtp-Source: AGHT+IEyDtd0oe3IAE6MkIRcuPF1XAaex7O+UXkzSJ582FShFldjGqeQBlos3z7LrpPfpvFbd/RWdg==
X-Received: by 2002:a05:7022:985:b0:119:e569:f25f with SMTP id a92af1059eb24-11f2966bd00mr4273471c88.8.1765435768924;
        Wed, 10 Dec 2025 22:49:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:8720:58cb:6770:779f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4bb8sm4156046c88.7.2025.12.10.22.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:49:28 -0800 (PST)
Date: Wed, 10 Dec 2025 22:49:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vishnu Sankar <vishnuocv@gmail.com>
Cc: corbet@lwn.net, hmh@hmh.eng.br, derekjohn.clark@gmail.com, 
	hansg@kernel.org, ilpo.jarvinen@linux.intel.com, mpearson-lenovo@squebb.ca, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Subject: Re: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default
 on capable devices
Message-ID: <he73fiwxso45ykidteqz2s2gjklezsyd47xwxtwlfes27kxuq3@ucwhmacbtsn4>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
 <20251129002533.9070-2-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251129002533.9070-2-vishnuocv@gmail.com>

Hi Vishnu,

On Sat, Nov 29, 2025 at 09:25:31AM +0900, Vishnu Sankar wrote:
> Enable doubletap functionality by default on TrackPoint devices that
> support it. The feature is detected using firmware ID pattern matching
> (PNP: LEN03xxx) with a deny list of incompatible devices.
> 
> This provides immediate doubletap functionality without requiring
> userspace configuration. The hardware is enabled during device
> detection, while event filtering continues to be handled by the
> thinkpad_acpi driver as before.
> 
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> ---
> Changes in v4:
> - Simplified approach: removed all sysfs attributes and user interface
> - Enable doubletap by default during device detection
> - Removed global variables and complex attribute infrastructure
> - Uses minimal firmware ID detection with deny list
> - Follows KISS principle as suggested by reviewers
> 
> Changes in v3:
> - No changes
> 
> Changes in v2:
> - Improve commit messages
> - Sysfs attributes moved to trackpoint.c
> - Removed unnecessary comments
> - Removed unnecessary debug messages
> - Using strstarts() instead of strcmp()
> - is_trackpoint_dt_capable() modified
> - Removed _BIT suffix and used BIT() define
> - Reverse the trackpoint_doubletap_status() logic to return error first
> - Removed export functions as a result of the design change
> - Changed trackpoint_dev->psmouse to parent_psmouse
> - The path of trackpoint.h is not changed
> ---
>  drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
>  drivers/input/mouse/trackpoint.h |  5 ++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> index 5f6643b69a2c..67144c27bccd 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
>  	return 0;
>  }
>  
> +/* List of known incapable device PNP IDs */
> +static const char * const dt_incompatible_devices[] = {
> +	"LEN0304",
> +	"LEN0306",
> +	"LEN0317",
> +	"LEN031A",
> +	"LEN031B",
> +	"LEN031C",
> +	"LEN031D",
> +};
> +
> +/*
> + * Checks if it's a doubletap capable device

Please finish the sentence with a period.

> + * The PNP ID format is "PNP: LEN030d PNP0f13".
> + */
> +static bool is_trackpoint_dt_capable(const char *pnp_id)

Let's call it trackpoint_is_dt_capable() to keep with common
"trackpoint_" prefix in the file.

> +{
> +	const char *id_start;
> +	char id[8];
> +	size_t i;
> +
> +	if (!strstarts(pnp_id, "PNP: LEN03"))
> +		return false;
> +
> +	/* Points to "LEN03xxxx" */
> +	id_start = pnp_id + 5;
> +	if (sscanf(id_start, "%7s", id) != 1)
> +		return false;
> +
> +	/* Check if it's in the deny list */
> +	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
> +		if (strcmp(id, dt_incompatible_devices[i]) == 0)

Why can't we use strncmp(pnp_id + 5, dt_incompatible_devices[i], 7) here
(after ensuring that pnp_id is of sufficient length to begin with) and
avoid sscanf()?

> +			return false;
> +	}
> +	return true;
> +}
> +
> +static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable)
> +{
> +	return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE);
> +}

This wrapper seems an overkill given that it is called only once and
always to enable the doubletap.

Thanks.

-- 
Dmitry

