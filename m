Return-Path: <linux-input+bounces-6156-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D632396B9B4
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 13:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7CD1F22A66
	for <lists+linux-input@lfdr.de>; Wed,  4 Sep 2024 11:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D1771CF5E3;
	Wed,  4 Sep 2024 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxHYQY7y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E4D1CEEAB;
	Wed,  4 Sep 2024 11:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725448263; cv=none; b=YxRuiUZAwiU/4j1r+7iDe0Aa+/DwT9d9OaKTCnulY9meEuBP//Ts1C3kJ5EmAngP05aZHTVxq/WZy87pjO5Whfl5lz+1Wp2VC5Mb8esO9A4cWr31Eh1VV4661VmG8BmV3jbl9HF5zh8HJ2UMxV1dyRqJHX6/uFZHe/AAT5d3+QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725448263; c=relaxed/simple;
	bh=NKEq8XhZ7MaYWZM8MXJ0Je3CCuv5tsKk4At77OIPvMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e/tG3yGsddsgYDbjEE1W9O3Bte+221mPiAztE4CdYm0B4/wX8kLX0RmCQCJ0jZOQTazAL2sJ7WP+MqSxc+ZcX/BvRYR1DUjtZyPbzjO/p6jifP/d3Dr5+LuV4rUfvzzO5yjJ3x7yq96ViSdJG4vzasd3z6CTWnB3/+npxkouhGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxHYQY7y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c26311c6f0so759130a12.3;
        Wed, 04 Sep 2024 04:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725448260; x=1726053060; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I+g7avfDXekwBeG37JBkylbv4FigxY18bGF1cg0gIXU=;
        b=DxHYQY7yPXczLXhviwrizSWifP5iHvj1Swe3Clh46eQXn4IGFr+hIRSsIO/cz+glvd
         B93ORR6okGmyWgbdZPly7gdFp4L0UAVSKLFNP7h6Fb/HjQ5+DaK0FsNH0KLMTYBAMETk
         K/P6sTeFpkiAQSDO4uGfVMInkv3EJLWPIivZmHZBhn210YUOFWc+Mk9mU6erzeFwN116
         mcl1+qDUm4TnxEVwUA8LrRMmbJj8AcQ10HvpsnZj7dtHqHqdTggMlfLlRoKQNmcrajlh
         W4geV+NsSB+hdQigNo/lOu4WJJrzMjZtE6wlR42u2fN8OprDZYJagAdIBKwEUQ4UuTdU
         Mehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725448260; x=1726053060;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I+g7avfDXekwBeG37JBkylbv4FigxY18bGF1cg0gIXU=;
        b=QJ9XkIi+ix+WQziwKM8xGSTNSNsKuSutlpnanoy5zRmmb6WTSNf8lFaXw0RUn+G0y3
         xw7SejggQIkK11VDP606F+VDa+hfjJFbZ33TKj0mPt7bAY+D9cfK3F3MH843i8CNgeHy
         Ht5QFEKH6b7Fop+baT4jImI1sAiXsibrjzYyazrm+ToWU82X+AuiEarksPUPmVWHngea
         mTtv5wCfHEOePsN16VLVyyTxRu0Wypp79Wn4ICJlFgbrB/l1ZXkvOPTO6t3EhUIf+i/i
         rmo5Yutj7yvTbmaFtqmrTsjmLMuxDil5qCaQw0L8xKGjRthi9STfwvsUMul79vpFXjAM
         0M1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzgc1N9N2g1biKm9VPENytMpkUgmibzA6nBRRJpj4JoU+16CJKRwzYWWGLAAnEjT7QmyeJLK6UOZoYNA==@vger.kernel.org, AJvYcCXzLTuajG31+f+sprfq3YWDaiMY+bAipwjd1SIhD8bpHnkPQoDu4H8fH3cvNrXwbji+ocVGkQpBZcu/5Ni5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3dQEEUBdSHeDFKq5uhkhmCRMQMh00bndW8RG/pd/xwU+U7Rc
	PDy77xi6bvQyXLjrNMRM5JQ2FGfkGsRYH9ZZ4SqwERaYxGdwHqG5514H4s9V
X-Google-Smtp-Source: AGHT+IFT7oyy7AxcyvFRtiR4ng1sSDkTDs97Vi0ERWK0jcQClaKeZAYdbp2/6cMJiFRhwmHTX5eR1w==
X-Received: by 2002:a17:906:6a28:b0:a77:b516:3023 with SMTP id a640c23a62f3a-a8a3f0efb0dmr164572966b.4.1725448259948;
        Wed, 04 Sep 2024 04:10:59 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6f4esm793554766b.161.2024.09.04.04.10.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 04:10:59 -0700 (PDT)
Message-ID: <e491af84-db7c-4a32-87f9-c89fc7e2c576@gmail.com>
Date: Wed, 4 Sep 2024 13:10:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] Input: iqs626a - use cleanup facility for fwnodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
 Ville Syrjala <syrjala@sci.fi>,
 Support Opensource <support.opensource@diasemi.com>,
 Eddie James <eajames@linux.ibm.com>, Andrey Moiseev <o2g.org.ru@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Jeff LaBundy <jeff@labundy.com>,
 linux-kernel@vger.kernel.org,
 Javier Carrasco Cruz <javier.carrasco.cruz@gmail.com>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240904044814.1048062-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2024 06:48, Dmitry Torokhov wrote:
> Use __free(fwnode_handle) cleanup facility to ensure that references to
> acquired fwnodes are dropped at appropriate times automatically.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/iqs626a.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs626a.c b/drivers/input/misc/iqs626a.c
> index 0dab54d3a060..7a6e6927f331 100644
> --- a/drivers/input/misc/iqs626a.c
> +++ b/drivers/input/misc/iqs626a.c
> @@ -462,7 +462,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> -	struct fwnode_handle *ev_node;
>  	const char *ev_name;
>  	u8 *thresh, *hyst;
>  	unsigned int val;
> @@ -501,6 +500,7 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  		if (!iqs626_channels[ch_id].events[i])
>  			continue;
>  
> +		struct fwnode_handle *ev_node __free(fwnode_handle) = NULL;
>  		if (ch_id == IQS626_CH_TP_2 || ch_id == IQS626_CH_TP_3) {
>  			/*
>  			 * Trackpad touch events are simply described under the
> @@ -530,7 +530,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  					dev_err(&client->dev,
>  						"Invalid input type: %u\n",
>  						val);
> -					fwnode_handle_put(ev_node);
>  					return -EINVAL;
>  				}
>  
> @@ -545,7 +544,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s channel hysteresis: %u\n",
>  					fwnode_get_name(ch_node), val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -566,7 +564,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s channel threshold: %u\n",
>  					fwnode_get_name(ch_node), val);
> -				fwnode_handle_put(ev_node);
>  				return -EINVAL;
>  			}
>  
> @@ -575,8 +572,6 @@ iqs626_parse_events(struct iqs626_private *iqs626,
>  			else
>  				*(thresh + iqs626_events[i].th_offs) = val;
>  		}
> -
> -		fwnode_handle_put(ev_node);
>  	}
>  
>  	return 0;
> @@ -774,12 +769,12 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  	for (i = 0; i < iqs626_channels[ch_id].num_ch; i++) {
>  		u8 *ati_base = &sys_reg->tp_grp_reg.ch_reg_tp[i].ati_base;
>  		u8 *thresh = &sys_reg->tp_grp_reg.ch_reg_tp[i].thresh;
> -		struct fwnode_handle *tc_node;
>  		char tc_name[10];
>  
>  		snprintf(tc_name, sizeof(tc_name), "channel-%d", i);
>  
> -		tc_node = fwnode_get_named_child_node(ch_node, tc_name);
> +		struct fwnode_handle *tc_node __free(fwnode_handle) =
> +				fwnode_get_named_child_node(ch_node, tc_name);
>  		if (!tc_node)
>  			continue;
>  
> @@ -790,7 +785,6 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s %s ATI base: %u\n",
>  					fwnode_get_name(ch_node), tc_name, val);
> -				fwnode_handle_put(tc_node);
>  				return -EINVAL;
>  			}
>  
> @@ -803,14 +797,11 @@ static int iqs626_parse_trackpad(struct iqs626_private *iqs626,
>  				dev_err(&client->dev,
>  					"Invalid %s %s threshold: %u\n",
>  					fwnode_get_name(ch_node), tc_name, val);
> -				fwnode_handle_put(tc_node);
>  				return -EINVAL;
>  			}
>  
>  			*thresh = val;
>  		}
> -
> -		fwnode_handle_put(tc_node);
>  	}
>  
>  	if (!fwnode_property_present(ch_node, "linux,keycodes"))
> @@ -1233,7 +1224,6 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
>  {
>  	struct iqs626_sys_reg *sys_reg = &iqs626->sys_reg;
>  	struct i2c_client *client = iqs626->client;
> -	struct fwnode_handle *ch_node;
>  	unsigned int val;
>  	int error, i;
>  	u16 general;
> @@ -1375,13 +1365,13 @@ static int iqs626_parse_prop(struct iqs626_private *iqs626)
>  	sys_reg->active = 0;
>  
>  	for (i = 0; i < ARRAY_SIZE(iqs626_channels); i++) {
> -		ch_node = device_get_named_child_node(&client->dev,
> -						      iqs626_channels[i].name);
> +		struct fwnode_handle *ch_node __free(fwnode_handle) =
> +			device_get_named_child_node(&client->dev,
> +						    iqs626_channels[i].name);
>  		if (!ch_node)
>  			continue;
>  
>  		error = iqs626_parse_channel(iqs626, ch_node, i);
> -		fwnode_handle_put(ch_node);
>  		if (error)
>  			return error;
>  

Reviewed-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

