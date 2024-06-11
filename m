Return-Path: <linux-input+bounces-4311-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4D290433A
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 20:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0CD41C2243E
	for <lists+linux-input@lfdr.de>; Tue, 11 Jun 2024 18:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4038971B30;
	Tue, 11 Jun 2024 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfbDL/sC"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04356F301;
	Tue, 11 Jun 2024 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718129466; cv=none; b=fySkpygTHB90phzCdU/vEOpYje5VUW+P3WWYjRjZjyTq1XBPPYFi+1Wk1HIMtf2FkNVya6ZMmLunJkp2GrtHNEM2x8rU53YgZ9AMNGykprvo+9mVaseTmI/GzwS8HhT+oOn5+Lyqs642ZzLMzMwpqIS06Q7mtHc8q4QL645KzbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718129466; c=relaxed/simple;
	bh=/xKGhKlVtckIy/7F23998tEUprsrx5eNTrMKCF2kraE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UD8P4WRudq0qg6Ss616OJIapaxG65Q/bieHZIfhFG6VxHjgAJIPLqgUrc/8i7J0l1lT4HxPRqT9wGpB9oBeb8UWBGTlE+bkP2LN0O78OaS9dzix1bvZedgBbO6pTYpMUtmqjf9ldUaVLj44V7K6ymYaHqVrI3ZTonW0BEUpE4hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfbDL/sC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f480624d0fso11486855ad.1;
        Tue, 11 Jun 2024 11:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718129464; x=1718734264; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6yx/QSwtRUfzJxtU0mEMF/+Zp84UMg5zsjelSYKknQk=;
        b=MfbDL/sCQptPLKB1qjR5CHtcba1aJHmifFXazh1NnlqUE502ROiOgqDAvBX/bGV0tX
         fMV8kSKFWkKa58okiGqz0cljaVVkVCTvtby55vCFK1XpBMzApZFk6AqIvba5eBhfm6RV
         OmkgyYaRhgLGsIJf14SbUixDexr/wM1DMtnYOriRLJoaF8P7wXwhi/S+utt/UAMzfN/v
         QYdManooHChT/vDS5EqE6mwI48m+4cG8uRydRLh4ZWAOQ9Ks9ui1qxDUiD2y1qjuSs+4
         d+dqGMuGn9OBRMsN0J8kbAjW0vjIRonHC2BC3LVL2xfkcsEjg6neS2IYhGR5qpPCXDE6
         deAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129464; x=1718734264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yx/QSwtRUfzJxtU0mEMF/+Zp84UMg5zsjelSYKknQk=;
        b=o7/cHQMt95j58dOWctLOcQ44RFgrcU9tulGOZlTF1QhiOr6ztbDxOqCxy+yF/BQfjF
         FD9NbS7Y9b+3mO8KttG0W/b/p30uyPuScvTYX1hgzNfu+RdJnbRGGDzzh0nK0SLOrPtv
         I39zS4ASnX3nayfWfNX0e4NObFDwYzO9wOMUQumDhhEr/99lNUFGXuK2JRvHSuDDoS11
         YL0vsp6CfDNdOsTm8DnGpCdCl1bONfh+Mg+KnEzvPskNYexReIGOBrafRbOqNDcuKHIc
         xGoJrcymobHPc7hPH1v5K8AfEljw85bFbEtWYUAh5f9ezSHuik10DKeXpTs3aCD7IHF7
         UDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQPZa7WWKVgTI1qPsXRD5f4HhaFiyd9S8XgLWEQIEB8ng+RvUnyzf5+8WueWNUA7+upohtXGppoqmpcW7M6puUBgEIill7E5zCwTY5oFhp5IHc6ushaYcao1/rtnlfSjspXGgUaxQ7nWjX4p1A/rMuRRy4OTJ4RWt8bNgdu+DX4YoAoNOa
X-Gm-Message-State: AOJu0YwOGbVWkLcSl19DYizL67YuSftXwKZOfkmYYlm7hphIoDSDakdY
	zmp/Gk1tifYYtzeHfIGuVnnZk1r5XLtO4huQXdv49Q4ZhVcUsTTLwzHllg==
X-Google-Smtp-Source: AGHT+IGCIHAzQY/mnDlVo5lnk26RTRbDcrjvObXR8MxjwovVfl11tONs9+ylnI51Lr9jyeCjcjK5IQ==
X-Received: by 2002:a17:902:ea0e:b0:1f7:2dca:ea42 with SMTP id d9443c01a7336-1f72dcaf4acmr29493525ad.60.1718129463715;
        Tue, 11 Jun 2024 11:11:03 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d73f:b49c:626c:fac7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ed8ee0f1sm71482315ad.124.2024.06.11.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:11:03 -0700 (PDT)
Date: Tue, 11 Jun 2024 11:11:00 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Daisuke Nojiri <dnojiri@chromium.org>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reka Norman <rekanorman@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Pavan Holla <pholla@chromium.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	Lukasz Majczak <lma@chromium.org>,
	Ching-Kang Yen <chingkang@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/3] platform/chrome: Add struct
 ec_response_get_next_event_v3
Message-ID: <ZmiTNEjxE-ZCotNu@google.com>
References: <cover.1717779167.git.dnojiri@chromium.org>
 <979b1fdaa5b3d3165e53f5429470c42581394d14.1717779167.git.dnojiri@chromium.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <979b1fdaa5b3d3165e53f5429470c42581394d14.1717779167.git.dnojiri@chromium.org>

Hi Daisuke,

On Fri, Jun 07, 2024 at 10:02:56AM -0700, Daisuke Nojiri wrote:
> Add struct ec_response_get_next_event_v3 to upgrade
> EC_CMD_GET_NEXT_EVENT to version 3.
> 
> Signed-off-by: Daisuke Nojiri <dnojiri@chromium.org>
> ---
>  .../linux/platform_data/cros_ec_commands.h    | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> index 070e49c5381e..fff191a8d413 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -3527,6 +3527,34 @@ union __ec_align_offset1 ec_response_get_next_data_v1 {
>  };
>  BUILD_ASSERT(sizeof(union ec_response_get_next_data_v1) == 16);
>  
> +union __ec_align_offset1 ec_response_get_next_data_v3 {
> +	uint8_t key_matrix[18];
> +
> +	/* Unaligned */
> +	uint32_t host_event;
> +	uint64_t host_event64;
> +
> +	struct __ec_todo_unpacked {
> +		/* For aligning the fifo_info */
> +		uint8_t reserved[3];
> +		struct ec_response_motion_sense_fifo_info info;
> +	} sensor_fifo;
> +
> +	uint32_t buttons;
> +
> +	uint32_t switches;
> +
> +	uint32_t fp_events;
> +
> +	uint32_t sysrq;
> +
> +	/* CEC events from enum mkbp_cec_event */
> +	uint32_t cec_events;
> +
> +	uint8_t cec_message[16];
> +};
> +BUILD_ASSERT(sizeof(union ec_response_get_next_data_v3) == 18);
> +
>  struct ec_response_get_next_event {
>  	uint8_t event_type;
>  	/* Followed by event data if any */
> @@ -3539,6 +3567,12 @@ struct ec_response_get_next_event_v1 {
>  	union ec_response_get_next_data_v1 data;
>  } __ec_align1;
>  
> +struct ec_response_get_next_event_v3 {
> +	uint8_t event_type;
> +	/* Followed by event data if any */
> +	union ec_response_get_next_data_v3 data;
> +} __ec_align1;
> +

It is not really obvious that ec_response_get_next_event and
ec_response_get_next_event_v3 are layout compatible. I would simply
extend the union and add key_matrix_v3 field instead of defining
a brand new union.

And I would drop ec_response_get_next_event_v1 and added missing fields
to the original union as well...

Thanks.

-- 
Dmitry

