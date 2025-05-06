Return-Path: <linux-input+bounces-12163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91DAAB8C6
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 08:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5353177B65
	for <lists+linux-input@lfdr.de>; Tue,  6 May 2025 06:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239D9299509;
	Tue,  6 May 2025 03:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ll0a7fzP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E722299AAF
	for <linux-input@vger.kernel.org>; Tue,  6 May 2025 01:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746493946; cv=none; b=OkvK0ZRm6onQtms7OzBzHzNx7FHmOas3oegk3HUEqq0HxvWwuZgwtWMCTur43JWA+xDAtg0GSPnThWHappnYT0WAUFOj8E6qCGH6uEUcWOOf6Sp2ZxoCrzl7fR/9OciU6vswrJVgrzx4iE98dfMzMVj0tmS6MGe+UfrJDPN2DXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746493946; c=relaxed/simple;
	bh=xT4t7DNOvUe1TrpLC9ryYT6lAnlUKgCtnFp/cEyiEEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gchZJfy0QsdHiiyFgLXH2DE56iHNUpcK9d//hjoMHP0Vtvz8lGlz8ATEsL2M/e/VctwMViwC/Iwso7aHdei8vcbH13wGe+CiJ6iExfCMcqptM3hv+eBTz392vbV7hF8wa8ZAHSzVmlwanA/Vl61wf7gHLKOfMX0etYgH6piEeuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ll0a7fzP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7369ce5d323so4603140b3a.1
        for <linux-input@vger.kernel.org>; Mon, 05 May 2025 18:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746493944; x=1747098744; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m4x8L7HeXBOxH97DE5JZv5YhxfF586O81CMJRigMZK0=;
        b=Ll0a7fzPP/TLSoKm+MmubFWfHf0aJfJTdEhm3t7WWOyZAzf/JjXUzWLqAX6WuU3xCR
         BodHh6LHbqS3SoTclegt5YIwvUhv3wqYqgxicYyGkoYV54jJLbepMSiLZcsXXQWT+z5e
         qLb6s1+4G4g7AxjpogbkkW2wAbRoGu+X9DN8bfzeKgPbgJEEoDIWZXpuO3//0yJvbbBx
         MrTRCJ6fEfNYynJpmhrsO9jA+NMEivqI7NfBhsTYjeeLYH0JoUgWO9S0mejYLIKGMyo1
         XeNc72nIfMGp8R3UjIy4/Z6NOCSUEr/IDXZ9Qi5yc0tQeAQmhksLSmGlUky0IeDMG+5m
         ezIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746493944; x=1747098744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m4x8L7HeXBOxH97DE5JZv5YhxfF586O81CMJRigMZK0=;
        b=mNlQ+uDKvSPJNDprKxdU5y2LKuFVET0HgbYPjA1eroUovmRF3a2Ts0b5xFmQ8t8ZvU
         SkDe3T3z5V9X9HSVR9yhMsfKb2SQae7PkfsoKp95FoMokbG+9shPhYeAFXHXEpMAn8dv
         iyhSUVbtwqhZxjkM3wXrMQ1Px+11n3eus/pi3uIhpy4RZAZas5/QI3lNsH/QnRWZD+VF
         5CAGC9whG2HbobFG20tQSUtjMt0xWyYsDD8/8ks3cXz7a2YNyCJOfrSuOYpuWpWLGcya
         /NuOBbB9SBk5BTJPbUiFilVL0O7TUOaUz0rX6dGlUhRoSdN94sMDrgSOHlBuJBykmFBZ
         /1Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW+acIQZpf7Ffo00UG7kjTQb9DLUroltn7ahlDVbpv/+aCw765JZHYsGdmSX7yYXHTky+dX4rTa91ZpVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw97U+NbfxPI98wfyFdkpyWCE24y0pULjecJvoWtgOI5BvY90JM
	JrXeMlvu+9N2Vp5YHEA+Hp2LZvF1sBgNmTztlGIXbkqIk/Ydt+krQmxl7A==
X-Gm-Gg: ASbGncuWRvaAF3JKzQDUOW+j9htzByS/uc7TdAqfuMxq2hYRAPbZimxHFIq0XdbqgRm
	b3BETuRp9K3fDjgXIA1zHJgIatoTCwCyDjLNoGRTnMiVDfU4hrcbeP5XtYKBz0FdQYfLkYS9mGe
	KX9jTi3yHej9Tt4vsZX5q2js/49UmkzU4V01DpgK8PdZbTmIYcUync2NIY0txkU7BMofuML34FM
	CndTqh7iAv+wbRZG43wCsKnO/p4oW0De5mrVGaSwIUy+js2250DyVcG5uMm460QN4VGrCqLQsx9
	glQh9kQid8qDMD3rxv+ZdoFVgKOqN/k/1ZpVlmdADw==
X-Google-Smtp-Source: AGHT+IE4yROY8WWGRi3lgxF3Kp5yYzXMBnTwsRIzyszVXo+t70mR8xag1l/C0f1WUSgtSdaGUj+phQ==
X-Received: by 2002:a05:6a00:808e:b0:739:4a30:b902 with SMTP id d2e1a72fcca58-7406f08b5ccmr12566081b3a.2.1746493944220;
        Mon, 05 May 2025 18:12:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:17ab:9e47:29ba:57e6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405909ca59sm7575008b3a.162.2025.05.05.18.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 18:12:23 -0700 (PDT)
Date: Mon, 5 May 2025 18:12:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: jt <enopatch@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <hr6d45iekjdral43mbjhtxxde4bl4yu2lxj44lm7zur6qrhdkm@m5t5i6hhthks>
References: <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
 <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
 <CAAbCkm+0PwSB+1OFQ1fOZQf=eMbrefxgtjzfpcS0hq0_HveZBw@mail.gmail.com>
 <PN3PR01MB95978E9FFAF83A03A8C8FCB4B8822@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB95978E9FFAF83A03A8C8FCB4B8822@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

Hi Aditya,

On Thu, May 01, 2025 at 09:00:39AM +0000, Aditya Garg wrote:
> 
> 
> > On 1 May 2025, at 2:23 PM, jt <enopatch@gmail.com> wrote:
> > 
> > ﻿On Tue, 29 Apr 2025 at 02:19, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >> Would you like to be
> >> credited as "reported by"? If so what should I use as name/email?
> > 
> > If I have not already missed this opportunity, then yes please. As per
> > this email, "jt" and "enopatch@gmail.com". Thank you for kindly
> > considering me.
> 
> Is jt your legal name? AFAIK, anonymous contributions are not allowed
> in the kernel for legal reasons. Not sure if reported by is included.

The requirement regarding legal names in "Signed-off-by" was relaxed.
See:

d4563201f33a ("Documentation: simplify and clarify DCO contribution example language")

And for "Reviewed-by" etc there was never a requirement as far as I
know.

Thanks.

-- 
Dmitry

