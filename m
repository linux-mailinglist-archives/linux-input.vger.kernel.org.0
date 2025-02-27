Return-Path: <linux-input+bounces-10404-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D63D7A47029
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 01:25:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C09FD7A7313
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 00:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7251DA47;
	Thu, 27 Feb 2025 00:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOpgoAD/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE944A24
	for <linux-input@vger.kernel.org>; Thu, 27 Feb 2025 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615899; cv=none; b=T8e8zTWZE6ndoSLzN2XqIWAIxcZD7p3Js22SGOAXgZqc+vW4hombroaavW91xy6flOI1ws30PbEOEGxT30keuZfgHyk1DOORgBSbsgggSib8/zJmuu/iIU8vjHwA1YPVMsEhmkWCJQsdw3aOl4Dl5m6e8BfKD/w8RDnKZ+2eBuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615899; c=relaxed/simple;
	bh=Au8tru+Gz0jodoFSVF4YX68/96EGLDQWoF/YDUhYVbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ITRwTxKU2NR4kT5KA4dD6zdtm/sY2QyQj+qjc952I/+aj/9LXBH/qJhoVhejUS3TkSgapxzdtD/eBRX6QR87mZvI6SPitM3bnL/axgIPmnG/7rQUOCnGLVBUosR7YfE2fI/OQn2gL0C1ZxItaMy4hmJmUHBD4/0Bo371ILmGBHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOpgoAD/; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2234bec7192so8464425ad.2
        for <linux-input@vger.kernel.org>; Wed, 26 Feb 2025 16:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740615897; x=1741220697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+i/baOCq+ObGuAYT7WXOxMxNIVpNdT/cir/+OF7LiAk=;
        b=ZOpgoAD/xs5YIWishmzyQR7NNczKyrYEhpMfHSzYArlLeIEO12D/60ns3JiYUb1SgE
         jkMQChI1qTG6pbHWNmAGSaUzpQcGmc3xmGzvyqwihcPN1ZYQVJx7IxKKsgk3RLOgVUg/
         1jL9JH49wi3q/m3bN9a1G0o72sL/FDEovIqSiE6cXC67I9xXjj2SN9s4pbtjwOPRs2eD
         DoCLeHD/s1t4vGrAmC8zFBmP4Y2kKgzDaUDhkOMqhvGS3hVs2EW3dWoDjeB18ks8q5Mg
         ap7cUHkULja9Pc0I/SevwO67N8sO1qrddc+7oPl2hwvIBpMEw642suV9pkYE8PD00n3Z
         13eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740615897; x=1741220697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+i/baOCq+ObGuAYT7WXOxMxNIVpNdT/cir/+OF7LiAk=;
        b=h/yVO7veC/6BOwI4GlWSVFFRpaSBcdQvz/oMMTym24bQml91oBpQl//4M8r+pvCnM8
         MNtU7xLHAB+Rw7D73WLA04Z7k8YFJZVAt/hRGg25I2VtuSXHyb+S8PIfbXa/GshoOQPT
         Aei1g6+X6+GFmQWEfRwuWLWjEG/x8Y46h8wlz9u2DKCLptYKJOcWKoYOMoGo6NzARNph
         SWZ0hjNEU8p1ni2LkFioQEWeKge7MxRpwJAPtg5XCJowC+0h8qKhtWmUML392b+soqJ1
         b14fWLdO/OgJC3u51dYXDQDjs4YzXlKPw8TklgG0d4nGEZIMgvBQTyW1IPKVVBMWbXGI
         I4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVrZhTKNnvDHkuWaJMVbSVRQ7rNlN6q+iTyrAO0TnSf27vv0PsaikJSJ+BRw8a2vd3SR0RrFtBUE1JYfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs6HOt9TWqQ5ktddOI710Rot9z3JlRY4Jju4evyW0d9cBttA93
	Tvpd/ALESnDYX6sstLs6kMAC1XbpTRg7AFZA/QdsH6NriWbpiF4/
X-Gm-Gg: ASbGncsiTFRvfAHWu9oAudUMH4gNKf0SSe2wLSfYJbGA1DR0Gur+OXA2hdKxFb3lz3P
	jfNvf1nM82ufXjnpKcXJTEH4LzyM+qhDddl4F3NJ/LbsIQAjZTA3DrPne/8O2OXSoqMrW4GQPCl
	r3GydMFOWySvJzD+kKLhMsvAyyBEOkk+YoQBWVaRE+EbgJGkXp62tHTQHNy5Hyv4azIIBNY19ra
	X3m01/PJ2lpl0wWWZlj7+fbtiJ0OOm4/7CS2tb8lOBRMWlI5fpwX7wk+7YMwLhzGzUrNHES8MwV
	kfmIw97rEx9wg8bg7rfeYoNKJB4=
X-Google-Smtp-Source: AGHT+IF+fZiwX+0IEaJzB+4gZbHk8ApooNDGyi+QcSPuLbmZMHXIQUAOH6AtdhblGhXTXspRAyaWTw==
X-Received: by 2002:a05:6a00:a1a:b0:731:737c:3224 with SMTP id d2e1a72fcca58-7348bdb4540mr7272974b3a.10.1740615896773;
        Wed, 26 Feb 2025 16:24:56 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:1985:668b:1f60:e500])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2b537sm208340b3a.27.2025.02.26.16.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 16:24:56 -0800 (PST)
Date: Wed, 26 Feb 2025 16:24:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vicki Pfau <vi@endrift.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] hid-steam: Move hidraw input (un)registering to work
Message-ID: <Z7-w1fO4H0oOt8MP@google.com>
References: <20250205035529.1022143-1-vi@endrift.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205035529.1022143-1-vi@endrift.com>

Hi Vicki,

On Tue, Feb 04, 2025 at 07:55:27PM -0800, Vicki Pfau wrote:
> Due to an interplay between locking in the input and hid transport subsystems,
> attempting to register or deregister the relevant input devices during the
> hidraw open/close events can lead to a lock ordering issue. Though this
> shouldn't cause a deadlock, this commit moves the input device manipulation to
> deferred work to sidestep the issue.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-steam.c | 38 +++++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/hid/hid-steam.c b/drivers/hid/hid-steam.c
> index af38fc8eb34f..395dbe642f00 100644
> --- a/drivers/hid/hid-steam.c
> +++ b/drivers/hid/hid-steam.c
> @@ -313,6 +313,7 @@ struct steam_device {
>  	u16 rumble_left;
>  	u16 rumble_right;
>  	unsigned int sensor_timestamp_us;
> +	struct work_struct unregister_work;
>  };
>  
>  static int steam_recv_report(struct steam_device *steam,
> @@ -1072,6 +1073,31 @@ static void steam_mode_switch_cb(struct work_struct *work)
>  	}
>  }
>  
> +static void steam_work_unregister_cb(struct work_struct *work)
> +{
> +	struct steam_device *steam = container_of(work, struct steam_device,
> +							unregister_work);
> +	unsigned long flags;
> +	bool connected;
> +	bool opened;
> +
> +	spin_lock_irqsave(&steam->lock, flags);
> +	opened = steam->client_opened;
> +	connected = steam->connected;
> +	spin_unlock_irqrestore(&steam->lock, flags);
> +
> +	if (connected) {
> +		if (opened) {
> +			steam_sensors_unregister(steam);
> +			steam_input_unregister(steam);
> +		} else {
> +			steam_set_lizard_mode(steam, lizard_mode);
> +			steam_input_register(steam);
> +			steam_sensors_register(steam);
> +		}
> +	}
> +}
> +
>  static bool steam_is_valve_interface(struct hid_device *hdev)
>  {
>  	struct hid_report_enum *rep_enum;
> @@ -1117,8 +1143,7 @@ static int steam_client_ll_open(struct hid_device *hdev)
>  	steam->client_opened++;
>  	spin_unlock_irqrestore(&steam->lock, flags);
>  
> -	steam_sensors_unregister(steam);
> -	steam_input_unregister(steam);
> +	schedule_work(&steam->unregister_work);
>  
>  	return 0;
>  }
> @@ -1135,11 +1160,7 @@ static void steam_client_ll_close(struct hid_device *hdev)
>  	connected = steam->connected && !steam->client_opened;
>  	spin_unlock_irqrestore(&steam->lock, flags);
>  
> -	if (connected) {
> -		steam_set_lizard_mode(steam, lizard_mode);
> -		steam_input_register(steam);
> -		steam_sensors_register(steam);
> -	}
> +	schedule_work(&steam->unregister_work);
>  }
>  
>  static int steam_client_ll_raw_request(struct hid_device *hdev,
> @@ -1231,6 +1252,7 @@ static int steam_probe(struct hid_device *hdev,
>  	INIT_LIST_HEAD(&steam->list);
>  	INIT_WORK(&steam->rumble_work, steam_haptic_rumble_cb);
>  	steam->sensor_timestamp_us = 0;
> +	INIT_WORK(&steam->unregister_work, steam_work_unregister_cb);
>  
>  	/*
>  	 * With the real steam controller interface, do not connect hidraw.
> @@ -1291,6 +1313,7 @@ static int steam_probe(struct hid_device *hdev,
>  	cancel_work_sync(&steam->work_connect);
>  	cancel_delayed_work_sync(&steam->mode_switch);
>  	cancel_work_sync(&steam->rumble_work);
> +	cancel_work_sync(&steam->unregister_work);
>  
>  	return ret;
>  }
> @@ -1307,6 +1330,7 @@ static void steam_remove(struct hid_device *hdev)
>  	cancel_delayed_work_sync(&steam->mode_switch);
>  	cancel_work_sync(&steam->work_connect);
>  	cancel_work_sync(&steam->rumble_work);
> +	cancel_work_sync(&steam->unregister_work);

So what happens if you actually cancel the work here? Will you be
leaking input device?

And bigger question - do you actually need to unregister devices? Or it
is just a matter of not delivering data through them when device is in
the different mode?

Thanks.

-- 
Dmitry

