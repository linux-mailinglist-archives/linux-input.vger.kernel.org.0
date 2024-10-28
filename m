Return-Path: <linux-input+bounces-7744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DD9B353D
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 16:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF78028316B
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 15:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE58A1DD9A6;
	Mon, 28 Oct 2024 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEtRS9Fj"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C547E189913;
	Mon, 28 Oct 2024 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730130479; cv=none; b=YS/Zmgj/9Q/221DCXc+pm5zjq0h5MUBTqEqT2iigU2UHfhosmfFwHbo3m9Rsg4wS/jBG26tQrctxS5iR1i2+8Wj2axuqRcPAEfQ9BW2QSNe3h2w40OIe3OztZ4R9GnHiqeAj6G8vCZIl3i9W7nPPqGYRLJQw2JMsuYSOtUAw4Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730130479; c=relaxed/simple;
	bh=V26oUTnrhdOV6ch6VbSJmCvaGYoUVTbD/8XP0Iar1sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gY7TD9FIQkHcEAHRcTxd6mMbfncvGQkG3CZiZ1BupPCNZfNvCrjbPxSSMUlL2yZDior+ro3vqc8UZWi+G4ske/z6oUXvSuuPBji0UmuEpFPbuPR4arzzdgLG+qQ88HUOxdEM7Zdbu3+kVb+JPhNbfk/3ip22Z1WZ2/jquB0Yx5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEtRS9Fj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB12C4CEC3;
	Mon, 28 Oct 2024 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730130479;
	bh=V26oUTnrhdOV6ch6VbSJmCvaGYoUVTbD/8XP0Iar1sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GEtRS9Fj8c1s4XAli3FnoVY/FLjUH7WU+ZPveiEfLN506r77qlqjxmosp01KnddiF
	 3N7gq63V7mk2NI8giEtuzFddnAdfXaGJVNQc6TTnHwlM567MhHOOB71t7RGIsR/wy9
	 Lc3FPgcDF8jtcn1aEpj4PAl3BFnmhQIjZvKBU3tWFiI9Q/49tORMH9ESkuk8w+lU3R
	 8ZA6ifcz6dpfc/OJVb7Y0UqtBpKC2bcceUdPp0r4EsUt+qowMq7JIDCQno7pfUbPal
	 IebEyT4XI8rnPbpT0NuTEuFoW/9rOgZkPMJsPABgZZ1vLGc0bN1DU4mZgBg+LObmW3
	 Ro8RvX8gDhq4Q==
Date: Mon, 28 Oct 2024 16:47:55 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: make mt_set_mode() less cryptic
Message-ID: <nqj6hx3yhw3q5e5qtyqdxwpxt2xe3u45vibjcjqmpmsvs7opq3@snxzjynjpwyp>
References: <ZxwciG6YeVFgfDRU@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxwciG6YeVFgfDRU@google.com>

On Oct 25 2024, Dmitry Torokhov wrote:
> mt_set_mode() accepts 2 boolean switches indicating whether the device
> (if it follows Windows Precision Touchpad specification) should report
> hardware buttons and/or surface contacts. For a casual reader it is
> completely not clear, as they look at the call site, which exact mode
> is being requested.
> 
> Define report_mode enum and change mt_set_mode() to accept is as
> an argument instead. This allows to write:
> 
> 	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
> 
> or
> 
> 	mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_BUTTONS);
> 
> which makes intent much more clear.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/hid-multitouch.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 99812c0f830b..e4bb2fb5596d 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -83,6 +83,13 @@ enum latency_mode {
>  	HID_LATENCY_HIGH = 1,
>  };
>  
> +enum report_mode {
> +	TOUCHPAD_REPORT_NONE = 0,
> +	TOUCHPAD_REPORT_BUTTONS = 1,
> +	TOUCHPAD_REPORT_CONTACTS = 2,

Maybe to be more obvious, BIT(0) and BIT(1) for the 2 values above?

I'm just concerned that someone adds "3" if we ever need to add a new
value.

> +	TOUCHPAD_REPORT_ALL = TOUCHPAD_REPORT_BUTTONS | TOUCHPAD_REPORT_CONTACTS,
> +};
> +
>  #define MT_IO_FLAGS_RUNNING		0
>  #define MT_IO_FLAGS_ACTIVE_SLOTS	1
>  #define MT_IO_FLAGS_PENDING_SLOTS	2
> @@ -1486,8 +1493,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
>  				     struct hid_field *field,
>  				     struct hid_usage *usage,
>  				     enum latency_mode latency,
> -				     bool surface_switch,
> -				     bool button_switch,
> +				     enum report_mode report_mode,
>  				     bool *inputmode_found)
>  {
>  	struct mt_device *td = hid_get_drvdata(hdev);
> @@ -1542,11 +1548,11 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
>  		return true;
>  
>  	case HID_DG_SURFACESWITCH:
> -		field->value[index] = surface_switch;
> +		field->value[index] = report_mode & TOUCHPAD_REPORT_CONTACTS;

Just to be on the safe side:
!!(report_mode & TOUCHPAD_REPORT_CONTACTS);

>  		return true;
>  
>  	case HID_DG_BUTTONSWITCH:
> -		field->value[index] = button_switch;
> +		field->value[index] = report_mode & TOUCHPAD_REPORT_BUTTONS;

same here.

>  		return true;
>  	}
>  
> @@ -1554,7 +1560,7 @@ static bool mt_need_to_apply_feature(struct hid_device *hdev,
>  }
>  
>  static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
> -			 bool surface_switch, bool button_switch)
> +			 enum report_mode report_mode)
>  {
>  	struct hid_report_enum *rep_enum;
>  	struct hid_report *rep;
> @@ -1579,8 +1585,7 @@ static void mt_set_modes(struct hid_device *hdev, enum latency_mode latency,
>  							     rep->field[i],
>  							     usage,
>  							     latency,
> -							     surface_switch,
> -							     button_switch,
> +							     report_mode,
>  							     &inputmode_found))
>  					update_report = true;
>  			}
> @@ -1820,7 +1825,7 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		dev_warn(&hdev->dev, "Cannot allocate sysfs group for %s\n",
>  				hdev->name);
>  
> -	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
>  
>  	return 0;
>  }
> @@ -1832,9 +1837,9 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
>  	/* High latency is desirable for power savings during S3/S0ix */
>  	if ((td->mtclass.quirks & MT_QUIRK_DISABLE_WAKEUP) ||
>  	    !hid_hw_may_wakeup(hdev))
> -		mt_set_modes(hdev, HID_LATENCY_HIGH, false, false);
> +		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_NONE);
>  	else
> -		mt_set_modes(hdev, HID_LATENCY_HIGH, true, true);
> +		mt_set_modes(hdev, HID_LATENCY_HIGH, TOUCHPAD_REPORT_ALL);
>  
>  	return 0;
>  }
> @@ -1842,7 +1847,7 @@ static int mt_suspend(struct hid_device *hdev, pm_message_t state)
>  static int mt_reset_resume(struct hid_device *hdev)
>  {
>  	mt_release_contacts(hdev);
> -	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);

heh, I wonder if we actually need the split buttons/touches, because in
all cases, we are either reporting None or All.

Anyway, with the couple of nitpicks:
Reviewed-by: Benjamin Tissoires <bentiss@kernel.org>

Cheers,
Benjamin

>  	return 0;
>  }
>  
> @@ -1854,7 +1859,7 @@ static int mt_resume(struct hid_device *hdev)
>  
>  	hid_hw_idle(hdev, 0, 0, HID_REQ_SET_IDLE);
>  
> -	mt_set_modes(hdev, HID_LATENCY_NORMAL, true, true);
> +	mt_set_modes(hdev, HID_LATENCY_NORMAL, TOUCHPAD_REPORT_ALL);
>  
>  	return 0;
>  }
> -- 
> 2.47.0.163.g1226f6d8fa-goog
> 
> 
> -- 
> Dmitry

