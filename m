Return-Path: <linux-input+bounces-2078-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1D862457
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 11:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAD651F22B50
	for <lists+linux-input@lfdr.de>; Sat, 24 Feb 2024 10:52:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C7A2233A;
	Sat, 24 Feb 2024 10:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="REN/GaEB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8935210EE;
	Sat, 24 Feb 2024 10:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708771954; cv=none; b=fg8lyGqVdLwUS6UGhU/4TlEdJb9g9MMhfl3RTg+uJMf++ZZ0UmAu7zItTdpu7nPCgdX4CQOfK0F7tuljENVHGFUUuPeXjWUynQ8lowAjDlLyw1FaCPcJCRv5fdmVrGzYZ1hTljGOibqPD6JdpQLAy8XEV/1KSJ/o4094dzfye0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708771954; c=relaxed/simple;
	bh=0k3/nGZrh/QALQA7+HOmttuf+3IP0rQ8bBJceAsm0qk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CvUpad3Di6sGwOKeb5tH8g01eq76EzNUuMMHSTWR4K5bqoOK6O2B9lBXmoVzDXI7HhktgvQvW8BvHnUJ/eobg0XMeNSGc5ihyBQjM7oRyYJvPNlvD2qbScSK+BVDwUBRUMZSme0m9iQtbv7hpZTJW0UhuF+v6IsvPzYyOr7FE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=REN/GaEB; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4129833e069so5749985e9.2;
        Sat, 24 Feb 2024 02:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708771951; x=1709376751; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PFHvI52rZ7NR82hfrk6VkeRtnJk4GPE9i93zfA1rObY=;
        b=REN/GaEBhSQkNBR+APwiWJFML7q/Hr/d/L/7EKmeGinWvKUjFDf0ybM/gk1jd1cHLM
         JjFcIqVxKhAn60ckv3pbs6hQripTlndKYnCVuInpe140XBg3LtXfBzpLGXwNXw6iy+Q1
         oyXHl3EMkEF8zcXNSAjqgygFrk68ds+Uh3zLpQnGqmGC3VBLp9ZhAXo/2ep4EzpMWoFZ
         knfr35f46B6yc8BIMOEQWAmcsw0MjTxwqB0yJIGCU0GnP+c8w+OntxLmURD0LmsIRr9A
         Qj6nU1wxfWbBzbIEbSBp7iGlZv2iJ6AgiV/4T9wBM70oukGc26E3fItMdfdXDdLYjW8J
         PklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708771951; x=1709376751;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFHvI52rZ7NR82hfrk6VkeRtnJk4GPE9i93zfA1rObY=;
        b=cDuxsKM2MS2H28NjnF6xrk+l0Kn1MAQg4zHC9yPlRm825+b6Gs5GZhsE42Kf4VTpiQ
         hRzGXDslsRJBYFPTwOMbxqNmldpki11bqY1pzDEX2vOFpz6WCH8DM5lqq/BhzQXq5tJV
         qfJV/q1ozQvi55kHifk/KMSyA7UlgbXXQl2wcvN/zOfOWZfPxvMGnlgrARbBniXKexoS
         rDakU42PraNO1hvAgh2FXwMBBlZysC2YvtCgNF7iGaYJCzHWYE7gAUWEXpCMYCeVmtvG
         RrVgrslPljGoGippxpXqpY/pzqir5KHhorZ8cZma42D/z3ZXo1PX9g6KxmEc/LblqRIo
         vISw==
X-Forwarded-Encrypted: i=1; AJvYcCWFNdZTu67Wkt5+nqGsmYaS8dySkRRuxtW7WeJhGvGGkBKFkATQ+LJ5Ao4y51jsTSXJ7dSFOP8fhq3AoxuraWilN18lgMfnORRLxBg=
X-Gm-Message-State: AOJu0YzeK9HW60j9nTAh3jyxPhhW4EQbVjeM0uLDGQL8qEwiJgZvE7VF
	uYOLSVxkmHfDncgxJer70jmReRFc4oEwDL0MEuH7dZId4TVwQK+ec+csH6XHTP0=
X-Google-Smtp-Source: AGHT+IFvTDGIpVm2wEcxTcg7ZaAGLDhW7U23IpI7szazhrw+KQnArT+AlO7+JOBOntTkPBXtFU4euw==
X-Received: by 2002:a05:600c:1389:b0:412:952d:3c6a with SMTP id u9-20020a05600c138900b00412952d3c6amr1671834wmf.13.1708771950919;
        Sat, 24 Feb 2024 02:52:30 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec5f:c111:ab46:ec03:bf48:53f1? ([2a01:e34:ec5f:c111:ab46:ec03:bf48:53f1])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004129f7aff27sm379771wmo.10.2024.02.24.02.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 02:52:30 -0800 (PST)
Message-ID: <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
Date: Sat, 24 Feb 2024 11:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: fr-FR, en-US
From: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>
To: Linux Stable Mailing List <stable@vger.kernel.org>
Cc: Linux Regressions Mailing List <regressions@lists.linux.dev>,
 Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
Autocrypt: addr=raphael.halimi@gmail.com; keydata=
 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
 Wxcwwn0N
In-Reply-To: <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/02/2024 à 19:12, Raphaël Halimi a écrit :
> I'll let a few days pass (remember, the bug doesn't happen immediately 
> but only after a varying amount of time) and I'll report here if the 
> spurious middle-clicks happened again or not.

As promised, here's my report: using the recompiled hid-lenvo module 
without those three patches for more than three days, I didn't 
experience a single spurious middle-click, whereas the in-tree module 
triggered the bug several times a day, and I had to unplug/replug the 
keyboard (or simulate it with a software trick) to get back to a normal 
state.

So those three patches did introduce this regression after all (as I 
correctly guessed).

Regards,

-- 
Raphaël Halimi

