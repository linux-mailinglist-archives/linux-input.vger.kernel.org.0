Return-Path: <linux-input+bounces-15376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4EBD1BD3
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 09:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCB013A6F68
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 07:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF712E765E;
	Mon, 13 Oct 2025 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPd8AJ1+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926FA22D4E9
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760339326; cv=none; b=nsQ8LwLxC7i9rYyOx3kvnHyZ9I3OYf5fua8mM7Is+sq1VdybOZeCOKXJFyznpMZRFqm+37pUJDgJmhqLu9u5ZhmTGtsbdQDkN1NioRdqreD12a3UsPfljQVjbYGrVC67raZ38et9H/QqVeKl8YjBbeo6cXfWiiHSEC17ZVOOVZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760339326; c=relaxed/simple;
	bh=EXSGqGhcx0qA0mCe99DWII7ndXEYJ5l3+tgWWwgSXgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QXb6MzqUa3tYdcYV1stjl0/3JboUDmJNcAIyqjsWJilxZDfticwj4V9eK8Swm3r5A9JiuYkaBJiOqTf8TXavDjROpSPsSKy0AjepLZtwrV79yjxrVuhoGglS+U1k5L//c9NMt8hCf/NYz7uekLwG3BTLcM0vmIY30aaKYCUaHUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPd8AJ1+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e3af7889fso20653865e9.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 00:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760339323; x=1760944123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q73G+890UFAW8zpG9IZiGO239bC+EqQ7jfRlndkYTr8=;
        b=MPd8AJ1+ApYGdScPRFaPmp9mNHTRe6jwabjGgmkzWZpnrrZBVgWJp4kn5zL9+FhCkJ
         avMDAd9JNSx+0/PdIWPqHpr49KykzuwW4D59Fpi/nMjvIMUI4OzCiK0HBuWdEtTjZIzc
         1JoknmYvvDVd38jQZyh6O+wuO/6wk2w9lRwCYM9a83HUj1JYVu6AE93swWq0IBhSGahV
         x71qLNS34bLQqei2cm2ZtRiLd6mQF8SakhO3gUE0+gehUNapm/5RosZgWXJMuffQIi3J
         1oYjHeJmWb1GGc86fsHI+SETMz9sv/BX0E0EtnO4g6A3ii6N3bsZ2I/OyxR0dNYHlsYn
         SCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760339323; x=1760944123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q73G+890UFAW8zpG9IZiGO239bC+EqQ7jfRlndkYTr8=;
        b=sos2jIf9TflCZlmz4Igz5FMNLfdYCLHDAujRDFngVNz9jrjho2PHceH67kOM3f/mu3
         Uh1VhkjM3Rk/Q4mn8qLj7tCIxkzDImLP3XyFqgZjvOtfGUAl/lNZDO6uwVGnPFoHZMzK
         LYCcoZHvzkJhq27NpDVpjFUrUaNwAcOjKxEhuO+Z+QJ9TjpYiJ5rC2xmv0wqBZl/HjXP
         NX/ILBdjmsFZb+tgE3c5jEm0Mhp9oNQAbAYQy97oFd60tvwS9wcMQlgKyBO0cNilPUmZ
         Sp5kQqEI7L0u2v46yyUDIwbIh20EBEce2qxNYhYyJ9TEfALzNXOZsAY43cx4lhr0+1y2
         gxPw==
X-Forwarded-Encrypted: i=1; AJvYcCUUtLQFOltA+c+HgqxND1542WGnBq9v46eyFFzkYQprF49nG9ZU9ysvWA+QrKyPa8g/SWennHqiTnV5+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyveLuAV+7OZ3zebI2m+LjQmOTmNtDreQfFDukliudifcvKlhOj
	dsygMVsAOGj+5QGhY2r3UgmbU63ffBW8tD3mQ8Cb+z6vN9iNVZttVE4C
X-Gm-Gg: ASbGnctVRXUT/f1HK/w7Tr1aolTGdNxPbNRStGmZuIH8dTlC2hZqeEd6RxpMSq2t9VI
	rb7NBpT2wQeJdM4n+ai/M7JsQk816/r/YS6tlA9xNfc+PVy3mLFHQZ4gxCVf6skbQ4tMKnZRV+e
	l12TSz4MjxvSsol+u50jWIULkOX5MMzv2TUtkFlhvDppAQONlNSqWw5N6hpEdVvZW+lGBfsV9n+
	eow36MAImouY/K99C8ZKl2PHWgqtgZ5BRdQm1/ZTJdo5aF6EjGjM8b104BieNy6uCK+RBFw3rXn
	nGweGJwfBnM+7SN6fEcw3X/mG3hSUFRTwd3hS4lukSrpoxsqhqAad6ITdb7DaOTZ8wzj21I0nzK
	n3LTFS98cqOa0dJigFRQ+1jXjGRVucxMQg02DChWfBthvJceegaunZcCho7tCIDsbHkLGJ+pAVN
	c=
X-Google-Smtp-Source: AGHT+IGBQf5WfAQnt4odn+Dih9KpdOHpl0uzgnYj7ezJng23Hlwl5FAPDXpl3Fy1D1TvSkPSSqAKIw==
X-Received: by 2002:a05:600c:a148:b0:46f:c55a:5a8c with SMTP id 5b1f17b1804b1-46fc55a5bbamr20650895e9.4.1760339322745;
        Mon, 13 Oct 2025 00:08:42 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d447sm17161836f8f.9.2025.10.13.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 00:08:41 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id E0A3BBE2DE0; Mon, 13 Oct 2025 09:08:40 +0200 (CEST)
Date: Mon, 13 Oct 2025 09:08:40 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Weikang Guo <guoweikang.kernel@gmail.com>,
	Bastien Nocera <hadess@hadess.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	Raphael La Greca <raphael.la.greca@gmail.com>
Subject: Re: [QUESTION] Plans for GDIX1003 Support in Goodix Touchscreen
 Driver
Message-ID: <aOyleKvZe336pSSx@eldamar.lan>
References: <CAOm6qnnhR9++REgtjhZpqNXkBbBAZsGAY8Oy89cXUF9S=Vy-9Q@mail.gmail.com>
 <8c7b5560-27d0-42bc-8f25-0797500fb889@redhat.com>
 <CAOm6qnmYSQz_YVaWw1c-fMm3NCVV9MoQhLQ0XGzK9o2RybLHmw@mail.gmail.com>
 <72619870-bf83-47f9-9b66-6678e245364c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72619870-bf83-47f9-9b66-6678e245364c@redhat.com>

Hi,

On Sat, Mar 01, 2025 at 12:36:40PM +0100, Hans de Goede wrote:
> Hi WeiKang,
> 
> On 27-Feb-25 12:36 PM, Weikang Guo wrote:
> > Hi, Hans
> > 
> > On Tue, 25 Feb 2025 at 20:09, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi WeiKang,
> >>
> >> On 25-Feb-25 3:04 AM, Weikang Guo wrote:
> >>> Hi Bastien, Hans, Dmitry,
> >>>
> >>> I am currently working on the Ayaneo Flip DS device, which I installed Kali
> >>> Linux with kernel version 6.8.11-amd. This device has two touchscreens,
> >>> but only one is functional. After investigating, I found that the second
> >>> touchscreen has the device ID GDIX1003(confirmed by exporting the results
> >>> through acpidump), and upon comparing with the current driver, I noticed
> >>> that only GDIX1001, GDIX1002, and GDX9110 are supported.
> >>>
> >>> I have also reviewed the ACPI description and can provide the details if
> >>> needed. Any guidance or updates on this would be greatly appreciated.
> >>
> >> I think this might just work with the existing goodix driver, just
> >> add the new GDIX1003 HID to the goodix_acpi_match table:
> >>
> >> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> >> index a3e8a51c9144..4b497540ed2d 100644
> >> --- a/drivers/input/touchscreen/goodix.c
> >> +++ b/drivers/input/touchscreen/goodix.c
> >> @@ -1519,6 +1519,7 @@ MODULE_DEVICE_TABLE(i2c, goodix_ts_id);
> >>  static const struct acpi_device_id goodix_acpi_match[] = {
> >>         { "GDIX1001", 0 },
> >>         { "GDIX1002", 0 },
> >> +       { "GDIX1003", 0 },
> >>         { "GDX9110", 0 },
> >>         { }
> >>  };
> >>
> >> Note I'm not sure this will work, but is worth a try.
> >>
> > 
> > It works, thank you very much.
> 
> Thank you for testing.
> 
> I've submitted a patch upstream to add this new hardware-ID
> to the kernel:
> 
> https://lore.kernel.org/linux-input/20250301113525.6997-1-hdegoede@redhat.com/

Raphael La Greca has reported this issue as well in Debian at
https://lists.debian.org/debian-kernel/2025/10/msg00013.html an
confirmed the change to work.

Any chance this can be applied as proposed? Did the patch submission
felt trought the cracks?

Regards,
Salvatore

