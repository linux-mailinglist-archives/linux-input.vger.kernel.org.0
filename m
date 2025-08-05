Return-Path: <linux-input+bounces-13825-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C85B1BB20
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 21:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E591418A7E22
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 19:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC59237704;
	Tue,  5 Aug 2025 19:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqJf7+az"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2D19258E;
	Tue,  5 Aug 2025 19:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754422977; cv=none; b=WjT6KzIE4vWBbar7+IjJldDgkbpJoRNXo8TT7HAaiAWsrmPzUlqAyayuO0Uek7GP85U3HtXrKZVNiyCzvZLUk4n3KWYIgU1o/yWnhKwXK0vbduqFgfX7TEGrqBnHvPRenQKeECL+ZJKi1JI1vC3ABMK8px3oVolAHY2XbgcBq/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754422977; c=relaxed/simple;
	bh=kLs87WW2SMVWwYZE+OZT7eawLAhQQ1BZVADC8cwhPWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHc/7hVO4A6u+ajmeM4vJ2PjHRCemMiCGs6S3DGKxNztUj+mh43Ji757r3/UgES5oWoIkjL/WZ3jXyIy6rGoMU9G/weRFQlm/mi9DApqTsLbpx0VfNqszqnS1dB7ZDNDcOVQRFPYaV8FpqXVF7WNfHEVfdslPbUKpXObbw63L1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqJf7+az; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b390136ed88so4323818a12.2;
        Tue, 05 Aug 2025 12:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754422975; x=1755027775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/84FN0lCtL+yVEoD5dY9mi3r9WEEAKxtGWaGfvdRV8=;
        b=AqJf7+azrc+Xa6CoJdQhNDIgI9YfkugmXI7Jvi8ebPM7y/jckYLwwM+0Sy8SzGYtB5
         jzBAGTkQINDE668/dBXY65xbd2JLu0oJ6beziPuSyyGlF6u0hktWbszJifBkjCHfqk7h
         iTNh0brgRV2otASxbRUT8iCNw0dWUevlaZ80S3QOGQIFYkF6iXCs8kBR4jBQZksVXex0
         OxZZ1h3aSgfQ5PIHOA808yOjMmlpfsMgVJDtXRCDAbztdRsz8iN7/gW8L1FIcQUtCvr/
         rh2DDRNKizKOXvtmMoDLX2Y694uEDpwjkt4BflRjYkG9AW0GffEQ0sDnzXdBIeTLobtU
         fCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754422975; x=1755027775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/84FN0lCtL+yVEoD5dY9mi3r9WEEAKxtGWaGfvdRV8=;
        b=C33NI4EzE8+FM83AH8yj0u5Q0X/yLSaA8fNGOrGh9Dw57rJlzzx2NVioFaWD8NYUEr
         lbgHmxvukjTeTCNPUNQR47c7B2943obTQKYSzFMaXseD7xpbRcZtVabnt1h2Nn/3KoHc
         hw4eum+qcNtCIt0waA4Yfdol0xi45/04TJvzR3dcBclqb9bdkN60TyF0/RKpaZaYIFJS
         izGOCyzfCsxg9ACx42+ERhQoba/LRLnEAHmF9NJXsUumsm3OVa9coG9xQMfUWLtcNo6x
         MyUWJLchbSwIBbh17DN/1B9mYiQ3g+A9HOMVnwM+v1NoXw8pghjjIBNSIqGQfEbTuLOy
         Gg0A==
X-Forwarded-Encrypted: i=1; AJvYcCUICT5/EE/QgzGRtwFb74ObAB/NhgeZBltlSv4vI9UfMrHtcdcSu10N66VHwhy17d/0ZTve1ZXNjjr2dQ==@vger.kernel.org, AJvYcCUpTjooO79MH1LvNBUXQ5tXI1b8xnli5fv6ABxe6q6cpVj9z/H/iXKc7AFcnD1GqITlwdBelBbfcWhuYAsduNXe0UdYZA==@vger.kernel.org, AJvYcCWsNsWTi8M7IwSKL3n3ZkCdfSRCAkLIQrM9gQezZErjf1iTQPz22hkG1Vd5x/7ymlA2mNb/JVIv3uDHKTuO@vger.kernel.org
X-Gm-Message-State: AOJu0YwjD7+g9cyOnR1GObh1cAKLd1csmeSRBCP/T0YN8S6guN4Y1NOW
	asRpzePADlpE3VkDO7ZpwjQ+MUK+0CQFV2D/ViCXe31+oy/v0DxYiDXQ
X-Gm-Gg: ASbGncv6kWIruBb3Pbx1PSTDPvp/z3hNeUqGF0PIOs+i+f+EhuweiAEgvu77IYnRVyw
	5nfCALbouyMvTlJTLP7QPdiZjBilHA1GSmCPwXc7kstiIiSSGxvq+mkvErkjACQbal1hm8zfXo0
	AXgZkkOPyZpyf1s4mT33q+GEPVVYbBEd+k7ySX/xFWNe877O+3iqPyJThl+vzfFZmi+sb87WOWz
	y2HjZnmddRhDF/v1WHZx/IC5aLkqjcbv1uYnC9ZaIRWae3AAtrAR1bJik4uKE8LXsZUP0Xjctod
	KlszYVP0SGTk9qVgozGO0eXManLb0gPwj6mdEzzCUHXeTFKv/EQF/imFKBbNcW38LUQWMCHVyz4
	V4zc0trzsGjvD5flaRjgia8U=
X-Google-Smtp-Source: AGHT+IHwDgUbEeMEFWdNmOEMhZvWF2cWYbUvCz4fgrfhF/bG/IDYM6bA+UzkX2dEh5rPTgjY9k0jrQ==
X-Received: by 2002:a17:90b:3c8b:b0:31f:7160:df4b with SMTP id 98e67ed59e1d1-32166c339d7mr101323a91.15.1754422974941;
        Tue, 05 Aug 2025 12:42:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7365:6457:e1c0:7ff1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63ee0d77sm17475525a91.20.2025.08.05.12.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 12:42:54 -0700 (PDT)
Date: Tue, 5 Aug 2025 12:42:51 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: w_armin@gmx.de, linux-input@vger.kernel.org, 
	nikita.nikita.krasnov@gmail.com, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: Add WMI driver for Redmibook keyboard.
Message-ID: <5e32uo4suh3mtib4tohtekwvycxgfzqcem3wwc6k6wwdxyjhpc@bt57y7vyvpmz>
References: <20250729190528.8446-1-foxido@foxido.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729190528.8446-1-foxido@foxido.dev>

On Tue, Jul 29, 2025 at 10:05:21PM +0300, Gladyshev Ilya wrote:
> +static void redmi_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
> +{
> +	struct redmi_wmi *data = dev_get_drvdata(&wdev->dev);
> +	int value = 1;
> +	bool autorelease = true;
> +
> +	if (obj->type != ACPI_TYPE_BUFFER) {
> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
> +		return;
> +	}
> +
> +	if (obj->buffer.length != 32) {
> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
> +		return;
> +	}
> +
> +	/* For linearizability */
> +	guard(mutex)(&data->key_lock);

What is the exact purpose of this mutex? What does it protect? 

> +
> +	u32 payload = get_unaligned_le32(obj->buffer.pointer);
> +	struct key_entry *entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
> +
> +	if (!entry) {
> +		dev_dbg(&wdev->dev, "Unknown WMI event with payload %u", payload);
> +		return;
> +	}
> +
> +	/* AI key quirk */
> +	if (entry->keycode == KEY_ASSISTANT) {
> +		value = !(payload & AI_KEY_VALUE_MASK);
> +		autorelease = false;
> +	}
> +
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
> +}


Thanks.

-- 
Dmitry

