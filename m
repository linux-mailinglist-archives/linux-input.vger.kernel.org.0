Return-Path: <linux-input+bounces-9994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BBEA3271F
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 14:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 280BB1882452
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 13:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C0C1F94D;
	Wed, 12 Feb 2025 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2o7GEuq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7453205AA7;
	Wed, 12 Feb 2025 13:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739367023; cv=none; b=tHFQL1Nbi4rWcPAdR0fAZJ2yUuXyTpLFTZNVXsV3DU8Bx2LunS52hStMK6KctS7qWtqtvHqN8r+Ff30XTdheidUl2gWRjf6O1TufSGYbaOvJfyxJCpkUKJs53LUSfQqnLji+UyXgv8dIl0Up9CGcoXkpqMI3FWtik+Sc/jh63GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739367023; c=relaxed/simple;
	bh=8OarCyi/2sBPTXHgjyXYueHQFxb9Vqk/YkPHGmY0XbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swvcMW/UvT0dyfcz4ncMfkB+jO6XofRoGKCLoj3wlL6JU39uuwvD1/JH/JVaQKTsmVsghBlIHMv0EK6ZNJLHYhYYd/Aod6l+gPlW5PPpiqnZ/ZdB24pQ9kqTloCUz/hQ71U3QmKYZ5ANSVd1eUl1e3dVeHiu9jp44fD3L1bR7xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2o7GEuq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so3587419f8f.2;
        Wed, 12 Feb 2025 05:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739367020; x=1739971820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OarCyi/2sBPTXHgjyXYueHQFxb9Vqk/YkPHGmY0XbQ=;
        b=C2o7GEuqzsfHT39dEX/2/J9EMiXxE8tNLzVd03uX8FmzuVURnN4WS2APlLNiMiV5vX
         SPw6OlUUcNCPIwmDbMdC/Z8jEHXa9APinFLHsm6Jbs1lcugHDX3amd4ZDoUcTTZ7IrWO
         o2o/J87gcFwX1HWy5d9Jqf29VPD1IyeJ/EijF3KgFv8WBILLiVZPER0oryQlLmh9OZeX
         iL4s365x5jOLeFWU/6ctw8BQwyjMNgncn0xgUyPKX3tKbWe5dDDyrnT/EEBreNBiXpt6
         JIXWvf+AOiqboDd0UuO9WJ6dAgOqpLRZS7nOnz3lIbsz7+7MGvBQ85eDELHhmJdwUVwl
         KB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739367020; x=1739971820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8OarCyi/2sBPTXHgjyXYueHQFxb9Vqk/YkPHGmY0XbQ=;
        b=n+oZmBydoaQvzK+uVfCToI1qOre/qwB1Suc9ShJ9KsRDbOotBs5xU4KbsdwmMV1esw
         OSyrz3QQJBBsbcQrlK6KHuo4scICD3UNx9GKVO1iX1pSNpzWO11TXLKIEBaRY1gbOXs1
         UsSH+JKDtkLrZiAy2XMWXD1yMcQfQTrQbUhxdULGBep/hjRrP7nrELf7LVkLWtysIeM1
         6YY5PWZY9UyagTde7W7+B1dyRB8vOvwB0eK5cJq1lKBCQy35r7lysWZIhOtRSNFoDjAU
         +MQs5xYYm5ks9TpXpPZnTLQ843DLBxpYtf5Hxd3GOR1aVdVdnIbZTFnPleEQBZKTUrTQ
         0CfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBDIW9ibMLtIWMEf7sMCVPD1h7h6idcEuBxTDp71S3AC5NKujIg03pJrCxFXSClmMEWaMy0ZQX@vger.kernel.org, AJvYcCVBILCrGTHXm9DHmyLKqbum7vMim+jnBgEJfRfqGfaHzdCba4lsElK/lNH84/bs80SrMN8paTZmK/JYaqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIK6YxHg3suKTMsuIL3vkZnf7rbDpGCk42q0UAceV1f0wlwtf5
	JTp7yY0MaSPgCkEt4HYjknTed572WtVNL7DtkF32GqaOE57gx+x7jpRZtnAcf9CHcPZCU7Y/azQ
	zpggXWoHB9UI5bHzkGkcZ3cWw3euWmbQflCk=
X-Gm-Gg: ASbGnctj7nTNiXETQro7ttM4FH0KoE4fI/cfFC5VY/Qcl0YAwEEUNegFr70ERgW8uFc
	kh/LLD5fj2j8rGrUjFSej8njjywaMxN19bcKHsoGePcfHpYsrCylbwnG3LItDM40K6i0LjRkZ7A
	==
X-Google-Smtp-Source: AGHT+IFHhh5oqpyH/D2cfy7b78tMJZ2mZRqa66iVfEVT5BzSiqHsS6yyRfF8NNzh1IUfxIUwZEPDfOysfmKOXL8O0Yo=
X-Received: by 2002:a5d:6dac:0:b0:38d:c433:a97 with SMTP id
 ffacd0b85a97d-38dea2ece71mr2616786f8f.47.1739367019588; Wed, 12 Feb 2025
 05:30:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211224705.13576-3-stuart.a.hayhurst@gmail.com> <49bc1a59-1f5b-456b-aba4-be056d091e26@kernel.org>
In-Reply-To: <49bc1a59-1f5b-456b-aba4-be056d091e26@kernel.org>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Wed, 12 Feb 2025 13:30:08 +0000
X-Gm-Features: AWEUYZkEXnEYq6yzKdSaRoeVNiAFAPbvzkfeEth-6I9Rr5PKawyR8ob7sDkBRfw
Message-ID: <CALTg27=ZNv5taGCXChRtW90WXfS8iz10koQcSScLJaTHbXwfYg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: corsair-void: Update power supply values with a
 unified work handler
To: Jiri Slaby <jirislaby@kernel.org>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> No \n ^^ here.

Thanks, corrected that

> I would do an enum, but it's a matter of taste/preference.

I suppose that makes more sense since they're related, applied

> What is to skip a battery? Anyway, the comments here seem to be
> superfluous as the code is obvious=E2=84=A2.

It was supposed to indicate doing nothing if there was a request to remove =
a
battery and another to add the battery, what would you suggest?

> Perhaps '&& drvdata->battery' instead of the nested 'if'?

Sure, what about corsair_void_add_battery()? It's got an equivalent
condition inside it, should I leave it there or move it to the
'add_battery && !remove_battery' for consistency?

Thanks for the review,

Stuart

