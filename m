Return-Path: <linux-input+bounces-15883-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F82FC33F7C
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 06:09:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF61234A604
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 05:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE17523ABA9;
	Wed,  5 Nov 2025 05:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zh97NCMp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9B225A3D
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 05:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762319354; cv=none; b=Q4KvkKcKpBJoeb1BKmJWUrCU6Iw3oDrWHyMKyuCxbCtp4qdDmJMxZlAkngErfvHF1b7ss0ea8z9ZpD4qXMUp6UP30h/5EppmRIOy8JE7gihV+R0jNNqu7yh/x6uNEQ5UStCcIS63VIrdo+mkdj63W5geZZYCAHzvAfNgdANJsYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762319354; c=relaxed/simple;
	bh=ybZ89ka7wGDINL+cQOZrFSb4b+fijqyUProWsGPBleQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zozv07LKKDX0mdKusfOjAeqA0MOQv8qn94InUh7wfNwfRrALfIpgzZXbG0iieytepxvxjuZAesyH9YBUIgtJYj808kjoRxeiL1RCm9Is1Mati24KMZnfQQkZxKaKxtsTQzjcqDDrwsgOpAd045nsF8Wmj01cwgx1qolHCwMDmnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zh97NCMp; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so491698b3a.1
        for <linux-input@vger.kernel.org>; Tue, 04 Nov 2025 21:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762319353; x=1762924153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4jMs5y2tALWypfJmfBRbWA98qIJqfeZbOrWjS2kNYg=;
        b=Zh97NCMpsXcF82FLlFBC+RV/2yzgdrQBS5+t66RJ4W+uUt3GEidnLL3fkbHzYFXiLK
         OF5FLIqLA9ZGqsk6tam+Ui8F6crhCw2TnlTmuPO5lUBVQhbVlP4me5/3G5jTZ1njrhCF
         AHms37BJ/Za+fUT0cg6I/J+R2VuP/+WflbGPF/LmPGurXYnNmXiJlqftkbZUD0tE+9o6
         qzhsyf8OQEXI48WjXM4bpplcT6ge1hO6PJZAK5ArKK5AGWhyYfYWnuw3YkFgjc57+xeV
         X/+EkZV9aHcXEhFpG34/lO0AXE0pX+k2MWpFZ+hsSXVeRypmw0rFGV8TSSx87yvZ5tc2
         xcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762319353; x=1762924153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4jMs5y2tALWypfJmfBRbWA98qIJqfeZbOrWjS2kNYg=;
        b=jevFMUqXB7KdDROk7fgvFbunE8v2JoedmSfESHldNia8PlsHojtEbVZq+cOkGcqCax
         bn7+s8g5iCs0y9XSZyh5drF1SUy6dSWYlV2mU+Zx1iMT5QrKXO1MI7fpSR3yTXSGP6jK
         RTjmTuWj0kkiNHkbcu8rW1ZHgKYhzPAqCk5W7fs3eQ+GKZ58/8X3Oi9r+TdJzFAXVqv9
         pm+6inPrtbFYidI4rWgsisp6pt6uzxx0kA4waqdJLkio8DuVft3Wjg2OqPDp+6J5SHd4
         iaNaWemjmnRWLt88w4PMVfQHaYf/ohptmmmymVsSI7jaKsh/6a193OkkMzWb6sH3pnj8
         1ZXw==
X-Forwarded-Encrypted: i=1; AJvYcCVo/IFD7Mej3R1Xb2RtAfeuR5Jjdfgw9XGIWeneCiIQvcVoqX9o80vnUIlrS/JAt9JOI2RHFCqhJfQOUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2SZTFGQEhiGlmMoyiNrtk+dr3PTWTMpQ/8TV3OGq/J9KlChAs
	kdmxWRQkNG6dAqky146aJb6L9ZKLCMjfi+OtjQMezs4ksnRwHXZQxVYy
X-Gm-Gg: ASbGncu6F9d05HQdlfoYK8JpIjfihJgNkUSeoh1O+0tIodUija8jn5GB3DentUfnSYv
	HHFAs6QCx045o92jqLP/d547krRTYfi6QJW77np/nNlbOCFMnEx6BYcsLXam6NPt10jFKmVVDOB
	m+DPv3/ayenmQv0vR6mfjk4z+op0Pdq4h5EJNhf8+ZoInEkhcRLcph63zMe9s7Y3tEmd9skf2mF
	JqjhvjFP0Wejm60oVNzpitqBMemXW/AF+ZwGhSnF1NYs0nbyHTamNDk0P1OTVQntlWxsesRABgG
	5yR0T1FFbZ4XWvmgErc4chXaUnLh67/kn6LlrkdoaB8a/CjzHYA7qJd7s919NZkjUq8Nv9x2Kx1
	x1Ek9X2X2y2MaGMTkm0cJh1EOa/AQDqBUWbQmUKBMVWyUqR7TUXDxN95VvsGl4J+oZwlE5jqR1/
	rtGW/PiS4h39nUyVruBtqOLbayTMcUbQ2ZkD5VYJ3EZw==
X-Google-Smtp-Source: AGHT+IEr5MKnCuWVOr8OEra4PZxiRaRvqfcFqibr+fC/r+4cxI7Bcc7xaonLIv80+FULlN3GIHRogw==
X-Received: by 2002:a05:6a20:734b:b0:342:1d16:80e with SMTP id adf61e73a8af0-34f6f7d100cmr2761252637.4.1762319352618;
        Tue, 04 Nov 2025 21:09:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86b3:15ed:c006:18d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd5d57827sm4777076b3a.51.2025.11.04.21.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 21:09:12 -0800 (PST)
Date: Tue, 4 Nov 2025 21:09:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peter Hutterer <peter.hutterer@who-t.net>
Cc: Jonathan Denose <jdenose@google.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	Sean O'Brien <seobrien@google.com>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: input: expand
 INPUT_PROP_HAPTIC_TOUCHPAD to all pressure pads
Message-ID: <ueksimssfw7eqxa5mfmxruj2ghtuncznhbgdxvoorjf6jhjfhk@hsuapbn3kie3>
References: <20251030011735.GA969565@quokka>
 <20251031041245.GA1316325@quokka>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031041245.GA1316325@quokka>

Hi Peter,

On Fri, Oct 31, 2025 at 02:12:45PM +1000, Peter Hutterer wrote:
> Definition: "pressure pad" used here as all touchpads that use physical
> pressure to convert to click without physical hinges. Also called haptic
> touchpads in general parlance, Synaptics calls them ForcePads.
> 
> Most (all?) pressure pads are currently advertised as
> INPUT_PROP_BUTTONPAD. The suggestion to identify them as pressure pads
> by defining the resolution on ABS_MT_PRESSURE has been in the docs since
> commit 20ccc8dd38a3 ("Documentation: input: define
> ABS_PRESSURE/ABS_MT_PRESSURE resolution as grams") but few devices
> provide this information.
> 
> In userspace it's thus impossible to determine whether a device is a
> true pressure pad (pressure equals pressure) or a normal clickpad with
> (pressure equals finger size).
> 
> Commit 7075ae4ac9db ("Input: add INPUT_PROP_HAPTIC_TOUCHPAD") introduces
> INPUT_PROP_HAPTIC_TOUCHPAD but restricted it to those touchpads that
> have support for userspace-controlled effects. Let's expand that
> definition to include all haptic touchpads (pressure pads) since those
> that do support FF effects can be identified by the presence of the
> FF_HAPTIC bit.
> 
> This means:
> - clickpad: INPUT_PROP_BUTTONPAD
> - pressurepad: INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD
> - pressurepad with haptics:
>   INPUT_PROP_BUTTONPAD + INPUT_PROP_HAPTIC_TOUCHPAD + FF_HAPTIC

Should we maybe rename it to INPUT_PROP_PRESSURE_TOUCHPAD? We are within
a release of introducing it, so we should be able to rename it without
much fallout.

Thanks.

-- 
Dmitry

