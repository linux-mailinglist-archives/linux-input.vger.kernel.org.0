Return-Path: <linux-input+bounces-2855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE889C176
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 15:21:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08E32B24EED
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 13:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63EA512B14F;
	Mon,  8 Apr 2024 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XKFzZ8fn"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B380B7FBB2
	for <linux-input@vger.kernel.org>; Mon,  8 Apr 2024 13:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581993; cv=none; b=ZRlA2laNF8rNRwfcWZNoz8chVjiw9pN4Aarllhh8aFz3mkJGa9jxy1aF/yt5zdqB/X+4A1qdZgD9ReaBnwXNO97S4WCe4YJz53RNpedzYWX8Lqq1EQ0d4dOfljSEcDOP9YfIJlM4+76p+8UMYUaMxeP7c7RTnffv6yRyNBjgU/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581993; c=relaxed/simple;
	bh=cws8BVNEPRn5vqjkb25rCS0YNKXfJAj1B9nMxiEmNto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4nbQ6J77jrkHzwYBN3pUYXkXM1IXNYT2+s6vLIf05i/zLq16CzseicZR6n0beUh/Eh1l5JcYN7DkIqrPYOYSPJTDLPrqqvCMYQalLeM653dzSBy84Fq0g0iznnDidgrNGzd0lMDijGkYVZTGbLM65OKTpl+v8eEvcqoqeXMEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XKFzZ8fn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712581990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ck6h7oGqY5cwfuLDZYTXRLzHj6mfJjTZhLoQldbd3c=;
	b=XKFzZ8fnUZUhkuARkEN5b1gXdrKeYtlcetscR9Skcbb1TyciZAbzBWzORBoxdUKFTkymEk
	ibw2Nz6FFKinjFNCLxGHdfjHOtuBP4+O2aH9fG+9b4EDUY6CTCPXnHE7niFbuG6Lj5xTA9
	i/de27xuKPp9fOF8k3kAKBpQdyWZ8xY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-H-ANP4d_MYOfX-5yvaRqYg-1; Mon, 08 Apr 2024 09:13:08 -0400
X-MC-Unique: H-ANP4d_MYOfX-5yvaRqYg-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78d475004b6so509288185a.0
        for <linux-input@vger.kernel.org>; Mon, 08 Apr 2024 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581988; x=1713186788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ck6h7oGqY5cwfuLDZYTXRLzHj6mfJjTZhLoQldbd3c=;
        b=OWy2ibYHUjilN4Dc2ifnNIhDNowTUaCLD/eqqTlFFvyw/d+TslgISmCKoVcpVFKQdK
         lVLrRA2A4pOFgVJi3RIDmOheDuX9mCRdfHRaeGJtAO9QqgLqIdh6boXI6hcI+xDJj2PC
         tsdCrEMp44/ldrPOQKh6AyKnMN7FpyIgIKc7Ofht6Z0YzUbal3Na1zPjZX6y17Y86mnc
         /wfPWM5woh5fNTxpaFniDIiCqcGf4nJY842W8mhAUTlqMK3YaxJyaMa1v5TIwIjTtyZN
         rEcEwbGMPvmgIviWkfEqS+lLlm1tDwaNiamIvRC0o7YQP0UcKsyC6OSBE5JJMVm/MkqL
         8yUg==
X-Forwarded-Encrypted: i=1; AJvYcCXpGiIqFHZ178kDajC/pvMe7PEmKX/PHNsAhn6YAHjYwguaoPTN/MDdF4dQemH+xPOWZGWbk2cYSc7uO1WTiWtPU4GJr8uT6PgQX4o=
X-Gm-Message-State: AOJu0Yy0Mux6LqRz79SfzY2u1+qiXCEAc3qOwUvZ/lycerescO7U9xZG
	B9f5toNoyY7oZSfWYB/TsWGg1fSAzIpXzzfwhqtHedJzzWQxND6lt3WFOch8nywZPK+MqitTEDw
	jBJSX7rlm5N4cyNdeHp3lEhjj+4hqpP55RBlSM0CL0OQRGDP0Qf7PpkT6F1HA2nAjnE7r6aY=
X-Received: by 2002:a05:620a:4d14:b0:78d:6b3d:9a34 with SMTP id wa20-20020a05620a4d1400b0078d6b3d9a34mr314382qkn.43.1712581987914;
        Mon, 08 Apr 2024 06:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaaNdf0+aehQaiEaOUOB91zwM2iwnImBi5etNoZRMALgRd/jitUy/yEBySE/LqXxJmVF3lrQ==
X-Received: by 2002:a05:620a:4d14:b0:78d:6b3d:9a34 with SMTP id wa20-20020a05620a4d1400b0078d6b3d9a34mr314361qkn.43.1712581987632;
        Mon, 08 Apr 2024 06:13:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y27-20020a05620a09db00b0078d623428c5sm1471784qky.88.2024.04.08.06.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:13:07 -0700 (PDT)
Message-ID: <3f49d41e-649d-4a07-9a1a-301a2f52613c@redhat.com>
Date: Mon, 8 Apr 2024 15:13:05 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] platform/x86: thinkpad_acpi: Support hotkey to
 disable trackpoint doubletap
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br, dmitry.torokhov@gmail.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com, peter.hutterer@redhat.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-5-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240324210817.192033-5-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/24/24 10:08 PM, Mark Pearson wrote:
> The hotkey combination FN+G can be used to disable the trackpoint
> doubletap feature on Windows.
> Add matching functionality for Linux.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 854ce971bde2..21756aa3d28d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -167,6 +167,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
>  	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard on/off */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile */
>  
>  	/* Reasons for waking up from S3/S4 */
> @@ -354,6 +355,7 @@ static struct {
>  	u32 hotkey_poll_active:1;
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
> +	u32 trackpoint_doubletap:1;
>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -3598,6 +3600,9 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  
>  	hotkey_poll_setup_safe(true);
>  
> +	/* Enable doubletap by default */
> +	tp_features.trackpoint_doubletap = 1;
> +
>  	return 0;
>  }
>  
> @@ -3739,6 +3744,7 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
>  	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
>  	case TP_HKEY_EV_AMT_TOGGLE:
>  	case TP_HKEY_EV_PROFILE_TOGGLE:
> +	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>  		tpacpi_driver_event(hkey);
>  		return true;
>  	}
> @@ -4092,13 +4098,15 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  				send_acpi_ev = true;
>  				ignore_acpi_ev = false;
>  				known_ev = true;
> -				/* Send to user space */
> -				mutex_lock(&tpacpi_inputdev_send_mutex);
> -				input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 1);
> -				input_sync(tpacpi_inputdev);
> -				input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 0);
> -				input_sync(tpacpi_inputdev);
> -				mutex_unlock(&tpacpi_inputdev_send_mutex);
> +				if (tp_features.trackpoint_doubletap) {
> +					/* Send to user space */
> +					mutex_lock(&tpacpi_inputdev_send_mutex);
> +					input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 1);
> +					input_sync(tpacpi_inputdev);
> +					input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 0);
> +					input_sync(tpacpi_inputdev);
> +					mutex_unlock(&tpacpi_inputdev_send_mutex);
> +				}
>  				break;
>  			}
>  			fallthrough;	/* to default */

This chunk will need to change after incorporating my review comments into
patch 2/4. With that said this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> @@ -11228,6 +11236,8 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>  		/* Notify user space the profile changed */
>  		platform_profile_notify();
>  	}
> +	if (hkey_event == TP_HKEY_EV_DOUBLETAP_TOGGLE)
> +		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
>  }
>  
>  static void hotkey_driver_event(const unsigned int scancode)


