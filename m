Return-Path: <linux-input+bounces-5294-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E26DA946790
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 07:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 568DE1F21957
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 05:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4928762F7;
	Sat,  3 Aug 2024 05:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRj1Q33E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4026286;
	Sat,  3 Aug 2024 05:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722663955; cv=none; b=ndeql7S0lLTo9iQfFW5z+CLdbbCwTwxIej4tUtG0EyovqubIglt2UiX5W8KhTAGltfWphFh7xlvYpJ1ylTKAg4d/i6B6X/kkV9/qkHctNG2ORxr1kptjHzbKT9FCG5T7XDTU2Se/bKPpJx0gsm0XClbGTK5TP98Cq4uW/X5E4pQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722663955; c=relaxed/simple;
	bh=RBfFvfbPCPm01SrtKpQZgeYH9BLl1ij6j4BwUyCiDAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trplsIDJ+RjJBa7PGeEyPF7RssGA9jdFRPYsU4DrwgTuXcnN4zu7W5XxY9eVAgKHMpjvkcHNsSpveCisKLjbUi6sh34Fq5iTJ3f9XrgG3Z7a/B3HDZRVsME5bBr8rb0Yog5c4LHfZJskh70N1LyiliEjpp/ZechIjzxatx7PCwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRj1Q33E; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d2b921cdfso7734756b3a.0;
        Fri, 02 Aug 2024 22:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722663954; x=1723268754; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TEtfXZu34rcrVfcWsHzthDMMvdFQxX0pLIWrrd85WEk=;
        b=FRj1Q33EBKLS4EAdaC72EEA4Aw88Yiczzo/6VFzWBYrAg2tDx+WRLA298Hd+gGtJ47
         AIjFwY1IA4QFBc6Y1pus2/HQbdK8ja5VDXVTbWHjiE0TF17fQ9D/6hm9w4HdO3mLKXFH
         bs/cSjAh1wyiF+bdm9MhAif5xMbYDMXL/ztldQOaKwIlFdgct8HvAXa6OeaDbOGU9Iye
         jLlUurXjF7zAlHhPn92sbmiDm+ffYFOxIVJPgSPZT8xgUEzhCJpcar3559AGd3u/MeyU
         cDwcEJ1iDSNo5sPxsLDDS2OsjKknH3M+qwFxOVcis1QfSC7TBQ9TKmn/Dvr0QfJSduJD
         GqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722663954; x=1723268754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TEtfXZu34rcrVfcWsHzthDMMvdFQxX0pLIWrrd85WEk=;
        b=v+d+6HvZ5LMfuKU0JI2W8oe5PvsUWQ/7KRKBuI8ks23RRC7Vup1t/2JRJ9MMlQ4BuK
         yjpoTWEg4RIyuQig72fOID99V0BanGUh7HV5JPwCsjjxQHrprvEEAT9kNZ1DN6S1ruCz
         Uyrfr87/XTVwAdYNEb2xhf2gr3uA8tfR/Wa5A2AhctF+DXN3UuU3PXwkPKykFBI/28vE
         lDMiYH8MgXh+dSAhItaLM9zq7/u6/lkJ5FkZC7pRZdr8jm/CxE5pKYgBVGg354pwlmRJ
         UKNIepmgE6wgHKdObcRO0ej22ZnOtOW22uZFLqc+Ipzmfxdf8XW614z0s/BcDHzThjQa
         +jXg==
X-Forwarded-Encrypted: i=1; AJvYcCU6s288Tk4Jvl+9J+G3Noh/XfeI5l73TPfgFVovZ9+6PYHswYv9fx6ammbDQGGsc10FM5uO1r6RQ3y1a8+9/sxzR4lapXvb5d3hciGs1rO9lMBUUmOm3iC7JoJCknZJ18kZ/9JbMGf7yZw=
X-Gm-Message-State: AOJu0Yz4N717iBwGjGkv2iY0aoYWXFjm6hmtP5mMqpwIKUZWJCs8muaV
	1CAzI8mS6LY46BJD0cMK9lX9nyzA40ws3w5o4C7/Atv/l6mHm8gz
X-Google-Smtp-Source: AGHT+IFrTN12PyLuvsTj5ZiWMFpgJNEWP92AzukNhj3DbMnBdYNGSvSivhUvyg5BIXuz69PlDyCaXw==
X-Received: by 2002:a05:6a20:7f8b:b0:1c4:23f0:9665 with SMTP id adf61e73a8af0-1c6995ab0d9mr7245895637.29.1722663953448;
        Fri, 02 Aug 2024 22:45:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b76346a9absm1782881a12.29.2024.08.02.22.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 22:45:53 -0700 (PDT)
Date: Fri, 2 Aug 2024 22:45:50 -0700
From: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To: Marge Yang <Marge.Yang@tw.synaptics.com>
Cc: Kevin Chu <kevin.chu@tw.synaptics.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Derek Cheng <derek.cheng@tw.synaptics.com>,
	David Chiu <David.Chiu@tw.synaptics.com>,
	Vincent Huang <Vincent.huang@tw.synaptics.com>,
	Sam Tsai <Sam.Tsai@synaptics.com>,
	Vincent Tang <Vincent.Tang@synaptics.com>
Subject: Re: [PATCH V1] Input: synaptics-rmi4 - Supports to query DPM value.
Message-ID: <Zq3EDpH2Wcd6TCl9@google.com>
References: <20240320111058.601156-1-marge.yang@tw.synaptics.com>
 <MW4PR03MB6651C14EBEE7D8B56C82F1EFA3B12@MW4PR03MB6651.namprd03.prod.outlook.com>
 <DM4PR03MB599884A63173E935FAF7EE7FCFB12@DM4PR03MB5998.namprd03.prod.outlook.com>
 <ZqqIL6cmqT4ZrqBO@google.com>
 <MW4PR03MB6651CCE6D296062CFAE20845A3B22@MW4PR03MB6651.namprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR03MB6651CCE6D296062CFAE20845A3B22@MW4PR03MB6651.namprd03.prod.outlook.com>

Hi Marge,

On Thu, Aug 01, 2024 at 09:52:48AM +0000, Marge Yang wrote:
> >
> > RMI4 F12 will support to query DPM value on Touchpad.
> > When TP firmware doesn't support to report logical and physical value within the Touchpad's HID report, We can directly query the DPM value through RMI.
> 
> It seems to me the logic is inverted, if there is resolution register the new code will query it directly, otherwise it will try to get it from the subpacket data. Is it intentional? Or did I parse it incorrectly?
> [Marge 08/01]
> Previously, we obtained this information by querying subpacket data. However, when the "Query DPM" feature is present, querying subpacket data may become unreliable, leading to inconsistencies in the pointing speed.
> 
> This also does not appear to be tied to the HID transport but rather generic RMI4 code. Did I miss the connection?
> [Marge 08/01]
> This change applies to generic RMI4 code and is not related to HID transport.

OK, so how about this patch description then:

"Newer firmware allows to query touchpad resolution information by
reading from resolution register. Presence of resolution register
is signalled via bit 29 of the "register presence" register.

On devices that lack this resolution register we fall back to using
pitch and number of receivers data to calculate size of the sensor."


> >
> > Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
> > Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>
> > ---
> >  drivers/input/rmi4/rmi_f12.c | 41 
> > +++++++++++++++++++++++++++++++----------
> >  1 file changed, 31 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/input/rmi4/rmi_f12.c 
> > b/drivers/input/rmi4/rmi_f12.c index 7e97944..6a7a17d 100644
> > --- a/drivers/input/rmi4/rmi_f12.c
> > +++ b/drivers/input/rmi4/rmi_f12.c
> > @@ -24,6 +24,7 @@ enum rmi_f12_object_type {  };
> >
> >  #define F12_DATA1_BYTES_PER_OBJ                      8
> > +#define RMI_QUERY_DPM_IN_PRESENSE_BIT          29
> 
> Why "BIT"? Should it be called RMI_F12_RESOLUTION_REG or similar?
> [Marge 08/01]
> The "QUERY DPM" feature is the 29th bit in the F12 2D QUERY Presence register. 
> By checking this bit, we can determine whether certain features are supported. 
> I will rename it from "RMI_QUERY_DPM_IN_PRESENCE_BIT" to "RMI_F12_QUERY_RESOLUTION_REG".

OK, I see. I think since you are checking presence of a register either
RMI_F12_QUERY_RESOLUTION_REG or simply RMI_F12_QUERY_RESOLUTION is
better than "_BIT" variant.

> 
> >
> >  struct f12_data {
> >       struct rmi_2d_sensor sensor;
> > @@ -73,6 +74,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
> >       int pitch_y = 0;
> >       int rx_receivers = 0;
> >       int tx_receivers = 0;
> > +     u16 query_dpm_addr = 0;
> > +     int dpm_resolution = 0;
> >
> >       item = rmi_get_register_desc_item(&f12->control_reg_desc, 8);
> >       if (!item) {
> > @@ -122,18 +125,36 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
> >               offset += 4;
> >       }
> >
> > -     if (rmi_register_desc_has_subpacket(item, 3)) {
> > -             rx_receivers = buf[offset];
> > -             tx_receivers = buf[offset + 1];
> > -             offset += 2;
> > -     }
> > +     // Only supports to query DPM value on RMI F12.
> 
> I am unsure what this comment means... We are in F12 code, so what does "only" mean here?
> [Marge 08/01]
> The main point is to emphasize the new approach that applies when the "query DPM" feature is present.
> New comment:
> Use the Query DPM feature when the "query resolution register" exists.

Sounds good to me.

Thanks.

-- 
Dmitry

