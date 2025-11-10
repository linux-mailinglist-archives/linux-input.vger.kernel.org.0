Return-Path: <linux-input+bounces-15968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C428BC44C3A
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 03:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70C62188C37E
	for <lists+linux-input@lfdr.de>; Mon, 10 Nov 2025 02:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD9C22173D;
	Mon, 10 Nov 2025 02:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jJPHt+UR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816C61A9FB3
	for <linux-input@vger.kernel.org>; Mon, 10 Nov 2025 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762741222; cv=none; b=RmUGrGq6WPwHQwUhvztrtAksT2N8YKNKm1pXFwCcSzzT/076lGtFYTJa97t+uv8+EDm3DiZnG5H5ZzhR1fiyD1ZYYvOyENDx4r2rzQOyVzZJ0tiB88OIkuaTLcXqRtnsxCP5Q5C47ZxhWgqXovTn7UdofGrabUPBZILYeaQbFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762741222; c=relaxed/simple;
	bh=7Pja3650GiAPvVsUOYd4tHJmk2Ih7XhAG5SdtB1zeQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlZusAsuNMrdLga00JDz5HNwZhZ2BJEJWkqLw4bJfKIImxFN6ikcDNM5aWyLgRePIO/FsBEnciUzD6EI0Bq08wJGS7W/CBnVVW848QRg1ijfSZFirRTpoOtGz3vr5RGs88K5eGNrzJ3WpmXCGxSBqIR2PXrxjcg/qFgjIkf5Xgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jJPHt+UR; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ed82ee9e57so38054671cf.0
        for <linux-input@vger.kernel.org>; Sun, 09 Nov 2025 18:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762741219; x=1763346019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMt06zAomplKqdeZIvWBTvQ6NVxA37OWYo/eottY/jI=;
        b=jJPHt+URh/OA2rOV1qaKccqrXFBfSUMcrufGFeLoLMWiGpy/ugh6MxWV/GYeSJqSMf
         PqF9rMpOuht2bg+aif/fEj49Uxe15Q+2w+n9QH7ZYxxhbseBcYaObOBi/N/Gt5P85hGX
         JXC7KWhZ8h76N4xv5rfEuy/HhjrM6q/gd8YUnMTISOZMCpI9L61mSh3PaxbSA5KmGuqt
         ed26xlJhlTAyt276APHdhBfJUc0+CcVN3/I6ZblqvcsTet88UxcuPHEC+/n1JjRTcz4g
         m8vd3bJWZIMh90vliLMVFn6gfrNZ3xVJOUBlr/IaHFBpc9XiKagJ3BNENdKsJ8cc3X0E
         ljdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762741219; x=1763346019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DMt06zAomplKqdeZIvWBTvQ6NVxA37OWYo/eottY/jI=;
        b=TB6bU2a8xdYcSe0RxllPMw5maBB+hpgq0hsXh/smiHqrt40lQQ+LPuC/9el14PIWZG
         P31UmHFHOfBuBN0NcM/Ikvuinn+RXrq2NBSiy7wWBoj/V8/vMQL0a8iwiVc0asHxEBgu
         oCpm5nGbRNOzvp8b2OKh8kh0N1TyTlslphW53rypil+Z1xhE7j/j+bn956letoJxqBun
         LdAB+29XJsuUYXa3lS9xQz0rjKkBbuSrsE+B2jrkSdmN/iZ8h/eAx9CqAZJiGc3X2FTV
         wJaHO94Db7OsSvdNy8Iu6MUp4RZ8WKWQ0qz8yrhznjQ+wLnoB8lKX83YDqrKexB6aAb/
         sFSg==
X-Forwarded-Encrypted: i=1; AJvYcCVwlsIw0KFs+Gh/nUWFjLmit21hCfPg8ealeXqYHdl/GZLocSWUSz9O2Bkuzxlt6KD1VOf/tDI5xImXhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk6X9TSYZIUS/pxpHq/cQqiGOaDiYQKKDg1COar2LbFEKNSV3x
	3IaCUtJE4839V3rpMHBVg7JrDBOyjFYBT+Yn0qR1hE1sw3Br7xaZr3R+TtPhGd2/pQ==
X-Gm-Gg: ASbGncuxczKxJ+cDpTSsZ0VnKp8/T5M/464MC2kbsXPidY12CD9lgI39pqhGIBgHC+t
	jZGgcW5VcDWYAak7wLbmcEs4fzvp+tuchY4MP+bexCeUrfkdmDdOZezlLyAC1k8dpLQCrATmnlI
	fKGuHtBtYYYasUkYZKP7B6/1o/dBPPdD3z2vAR2JcCCcpDn7Ep9HG+GXIwyIWKvQ6AQ7TRGXySy
	IixgNgQoenAUMWMrzKJVZmkW09mbSxuvVwX8u/hlC1kgjPxJl2gcjLUuZfKVu0DkZ3Y9Ttj8MUj
	BP4XaV2rZtLFwDk8xfUUPOhUARm4XMBg5rlv/ocaD9bVy8/zdeVoREnCoDE6srViiZ2mAk1MR27
	N+fbYFAAmWmR0UgBPVCaNmNa+YpwLJtDOhaFGWMqmUh0H7pIEwgPGD+AdpgGOr8bxA48jupg2md
	tLGcSjYAtNYkZp/bdRpJlqgfc=
X-Google-Smtp-Source: AGHT+IERUJ5jFsOoCQARyH376JfWdQ9MhJaP9u4eNYQzRoidsnyeEWkydlLvDYSob3XPrfK34N5a4Q==
X-Received: by 2002:a05:622a:1212:b0:4eb:9cf0:60a5 with SMTP id d75a77b69052e-4eda4ead572mr88572781cf.21.1762741219315;
        Sun, 09 Nov 2025 18:20:19 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::db9a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8823896a091sm44351606d6.19.2025.11.09.18.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 18:20:18 -0800 (PST)
Date: Sun, 9 Nov 2025 21:20:15 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: The-Luga <lugathe2@gmail.com>, Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
References: <CALvgqED=rBkNYGkFdOXjUi1g_vbLac5Z38Z9xCRfpF-Vmy4Mww@mail.gmail.com>
 <c5c863f0-1c68-4d49-ba9b-b55c0f71d30c@rowland.harvard.edu>
 <CALvgqEAo8-MhE3ievoDkq4AOxRZ2E52kcko+GxYyf+WZE2H0=g@mail.gmail.com>
 <20251109092450.693bcbe5.michal.pecio@gmail.com>
 <CALvgqEC1EpJy58LhppgLYkCyaZL+qv34b8PmvTvJV8DYfp=gzA@mail.gmail.com>
 <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>

On Sun, Nov 09, 2025 at 02:49:23PM -0800, Terry Junge wrote:
> 
> 
> On 11/9/2025 2:17 PM, The-Luga wrote:
> >> But never mind that.  Try using the usbhid-dump program instead of
> >> lsusb.  usbhid-dump does not require you to unbind anything or change
> >> bConfigurationValue, so it's easier to use anyway.
> > 
> >> sudo usbhid-dump -d 2d99:a101
> > 003:002:003:DESCRIPTOR         1762723663.045959
> > 06 13 FF 09 01 A1 01 15 00 26 FF 00 85 06 09 00
> > 75 08 95 3D 91 02 85 07 09 00 75 08 95 3D 81 02
> > C0 06 14 FF 09 01 A1 01 15 00 26 FF 00 85 2E 09
> > 00 75 08 95 3F 91 02 85 2F 09 00 75 08 95 3F 81
> > 02 C0
> 
> Second HID Interface (Interface 3)
> 
> 06 13 ff Vendor Page ff13
> 09 01    Usage 1
> a1 01    Application Collection
> 15 00    Logical Min 0
> 26 ff 00 Logical Max 255
> 85 06    Report ID 6
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3d    Report Count 61
> 91 02    Output
> 85 07    Report ID 7
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3d    Report Count 61
> 81 02    Input
> c0       End Collection
> 06 14 ff Vendor Page ff14
> 09 01    Usage 1
> a1 01    Application Collection
> 15 00    Logical Min 0
> 26 ff 00 Logical Max 255
> 85 2e    Report Id 2E
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3f    Report Count 63
> 91 02    Output
> 85 2f    Report Id 2F
> 09 00    Usage 0
> 75 08    Report Size 8
> 95 3f    Report Count 63
> 81 02    Input
> c0       End Collection
> 
> Two collections, both vendor unique.
> Basically HID 'pipes' to transport vendor unique data.
> We have only seen traces with input report ID 2F so far.
> If we could get traces of output report ID 2E from Windows running the 
> vendor's software (TempoHub) it might help.
> 
> I wonder if suspend/resume would be a problem. Maybe the device crashes 
> when it attempts to resume?
> Windows will not suspend this device because it has a Consumer Control
> application collection.
> 
> Is there a USB quirk to stop the kernel from suspending the device?

There is.  More simply, The-Luga can do:

	echo on >/sys/bus/usb/devices/3-2/power/control

to prevent the device from going into runtime suspend.

However, I doubt that suspend/resume is the problem because the 
disconnects occur whenever the brightness knob is moved, not at times 
when the system might decide to suspend the device.

Also, I suspect that the computer doesn't really have to do anything 
with the HID report data from interface 3, just accept it.  At least, 
that's what the packet capture from the Windows guest seemed to show.  
By contrast, the usbmon trace under Linux showed no traffic on that 
endpoint.  Without being able to send the data, the speaker's firmware 
could just overflow an internal buffer and crash, who knows?

It would be nice to get some suggestions from someone who is familiar 
with the input subsystem.  Dmitry, can you offer anything?  For example, 
is there a program the user can run to collect the report data that 
currently isn't being requested?

Alan Stern

